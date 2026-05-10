import pandas as pd 
import MySQLdb as mysqldb
import sys 

datasets = dict(
CUSTOMERS = "../data/olist_customers_dataset.csv",
GEOLOCATION = "../data/olist_geolocation_dataset.csv",
ORDER_ITEMS = "../data/olist_order_items_dataset.csv",
ORDER_PAYMENTS = "../data/olist_order_payments_dataset.csv",
ORDER_REVIEWS = "../data/olist_reviews_dataset.csv",
PRODUCTS = "../data/olist_products_dataset.csv",
SELLERS = "../data/olist_sellers_dataset.csv",
PRODUCT_TRANSLATION = "../data/product_category_name_translation.csv",
)

DB_CONFIG = {

       "user": "olist_user",
       "password": "password", 
       "host": "localhost",
       "port": 3306,
       "database": "olist_ecommerce"
    }      
def connect_db(conn):

    with open("../database/user_setup.sql", "r") as f:
        user_setup = f.read()
    conn.executescript(user_setup)

    with open("../database/schema.sql", "r") as s:
        schema = f.read()
    conn.executescript(schema)


def load_data(datasets):
    try:
        conn = mysqldb.connect(**DB_CONFIG) 
        print("\n\nconnected to db")
    except mysqldb.Error as e:
        print(f"mariadb connection error: {e}")
        sys.exit(1)
    cur = conn.cursor()

    for v in datasets.values():
        print(v)
        
def create_tables():
    df = load_data(datasets)

def main(): 
    create_tables()

if __name__ == "__main__":
    main()

