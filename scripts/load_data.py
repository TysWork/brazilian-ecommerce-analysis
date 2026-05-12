import pandas as pd 
import MySQLdb as mysqldb
import MySQLdb.cursors
import sys
import os

SCRIPT_PATH = os.path.dirname(os.path.abspath( __file__ ))

DATASETS = {
        "olist_customers_dataset": "../data/raw/olist_customers_dataset.csv",
        "olist_geolocation_dataset": "../data/raw/olist_geolocation_dataset.csv",
        "olist_order_items_dataset": "../data/raw/olist_order_items_dataset.csv",
        "olist_order_payments_dataset": "../data/raw/olist_order_payments_dataset.csv",
        "olist_order_reviews_dataset": "../data/raw/olist_order_reviews_dataset.csv",
        "olist_products_dataset": "../data/raw/olist_products_dataset.csv",
        "olist_sellers_dataset": "../data/raw/olist_sellers_dataset.csv",
        "product_category_name_translation": "../data/raw/product_category_name_translation.csv"
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

def load_table():
    pass    
def create_tables():
    with mysqldb.connect(**DB_CONFIG, cursorclass=MySQLdb.cursors.DictCursor) as conn: 

        try:
            connect_db(conn)             
            print("\nconnected to db\n")
        except mysqldb.Error as e:
            print(f"mariadb connection error: {e}")
            sys.exit(1)

        for v in DATASETS.values():
            file_path = os.path.join(SCRIPT_PATH, v)
            df = pd.read_csv(file_path, encoding="utf-8")
            cur = conn.cursor()
            print(file_path)
            #cur.execute("SHOW TABLES")
            #rows = cur.fetchall()
            #print(rows)

            #conn.commit()

def main(): 
    create_tables()

if __name__ == "__main__":
    main()

