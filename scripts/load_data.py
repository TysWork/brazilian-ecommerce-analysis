import pandas as pd 
import MySQLdb as mysqldb

CUSTOMERS = "olist_customers_dataset.csv"
GEOLOCATION = "olist_geolocation_dataset.csv"
ORDER_ITEMS = "olist_order_items_dataset.csv"
ORDER_PAYMENTS = "olist_order_payments_dataset.csv"
ORDER_REVIEWS = "olist_reviews_dataset.csv"
PRODUCTS = "olist_products_dataset.csv"
SELLERS = "olist_sellers_dataset.csv"
PRODUCT_TRANSLATION = "product_category_name_translation.csv"

def connect_db():
    try: 
        conn = mysqldb.connect(
            user = "olist_user",
            password = "password", 
            host ="localhost",
            port = 3306,
            database = "olist_ecommerce"
        )
    except mariadb.Error as e:
        print(f"mariadb connection error: {e}")
        sys.exit(1)
    cur = con.cursor()


def main(): 
    pass

if __name__ == "__main__":
    main()

