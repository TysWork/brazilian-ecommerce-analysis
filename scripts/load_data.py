import pandas as pd 
import MySQLdb as mysqldb
import MySQLdb.cursors
import sys
import os

SCRIPT_PATH = os.path.dirname(os.path.abspath( __file__ ))

DATASETS = {
    "geolocation":         "olist_geolocation_dataset.csv",
    "sellers":             "olist_sellers_dataset.csv",
    "product_translation": "product_category_name_translation.csv",
    "products":            "olist_products_dataset.csv",
    "customers":           "olist_customers_dataset.csv",
    "orders":              "olist_orders_dataset.csv",
    "order_items":         "olist_order_items_dataset.csv",
    "order_payments":      "olist_order_payments_dataset.csv",
    "order_reviews":       "olist_order_reviews_dataset.csv",
    }

DB_CONFIG = {
    "user": "olist_user",
    "password": "password",
    "host": "localhost",
    "port": 3306,
    "database": "olist_ecommerce"
}

def connect_db(conn):
    cur = conn.cursor()

    with open(os.path.join(SCRIPT_PATH,"../database/schema.sql"), "r") as s:
        schema = s.read()
    for statement in schema.split(";"):
        stmt = statement.strip()
        if stmt:
            cur.execute(stmt)

def load_table(conn, table, csv_path):
    cursor = conn.cursor(MySQLdb.cursors.Cursor)
    
    cursor.execute(f"DESCRIBE {table}")
    db_cols = [row[0] for row in cursor.fetchall()]
    
    df = pd.read_csv(csv_path)
    df = df[[col for col in df.columns if col in db_cols]]
    df = df.where(pd.notna(df), None) 
    rows = [
        [None if (v != v) else v for v in row]
        for row in df.values.tolist() 
    ]
    cols = ", ".join(df.columns)
    placeholders = ", ".join(["%s"] * len(df.columns))
    sql = f"INSERT IGNORE INTO {table} ({cols}) VALUES ({placeholders})"
    cursor.executemany(sql, rows)
    conn.commit()
    print(f"filled {len(df)} rows into `{table}`")

def main(): 
    with mysqldb.connect(**DB_CONFIG, cursorclass=MySQLdb.cursors.DictCursor) as conn: 
        try:
            connect_db(conn)             
            print("\nconnected to db\n")
        except mysqldb.Error as e:
            print(f"mariadb connection error: {e}")
            sys.exit(1)
        data_dir = os.path.join(SCRIPT_PATH, "../data/raw/")
        for table, csv_file in DATASETS.items():
            load_table(conn, table,os.path.join(data_dir, csv_file)) 

if __name__ == "__main__":
    main()

