import pandas as pd
import random
from datetime import datetime, timedelta

# 1. Setup baseline products and prices
menu = {
    "Gourmet Burger": 8.50,
    "Cheeseburger": 9.50,
    "Vegan Burger": 9.00,
    "Regular Fries": 3.00,
    "Sweet Potato Fries": 4.00,
    "Chocolate Milkshake": 4.50,
    "Soft Drink": 2.50
}

items = list(menu.keys())

def generate_random_time(start_hour=11, end_hour=23):
    # Generates a random time over a 30-day period
    days_ago = random.randint(0, 30)
    hour = random.randint(start_hour, end_hour)
    minute = random.randint(0, 59)
    second = random.randint(0, 59)
    base_date = datetime.now() - timedelta(days=days_ago)
    return base_date.replace(hour=hour, minute=minute, second=second)

print("Generating datasets")

# --- DATASET 1: IN-STORE TILL DATA (Clean format) ---
instore_data = []
for i in range(1, 101):
    item = random.choice(items)
    qty = random.randint(1, 3)
    price = menu[item]
    instore_data.append({
        "Order_ID": f"TXN-{1000 + i}",
        "Timestamp": generate_random_time().strftime("%Y-%m-%d %H:%M:%S"),
        "Item_Name": item,
        "Quantity": qty,
        "Price_Paid": price * qty
    })
df_instore = pd.DataFrame(instore_data)
df_instore.to_csv("C:/Users/YawOM/OneDrive/Desktop/Data Science/Takeaway project/instore_till.csv", index=False)


# --- DATASET 2: UBEREATS ORDERS (Mismatched headers, lowercase, column shifts) ---
ubereats_data = []
for i in range(1, 101):
    item = random.choice(items)
    qty = random.randint(1, 2)
    price = menu[item]
    ubereats_data.append({
        "order_ref": f"UBR-{random.randint(100000, 999999)}",
        "date_time": generate_random_time().strftime("%d/%m/%Y %H:%M"), # Different date format
        "product_title": item.lower(), # Lowercase names
        "qty": qty,
        "subtotal": price * qty # Note: This is GROSS. The 30% cut isn't calculated yet!
    })
df_uber = pd.DataFrame(ubereats_data)
df_uber.to_csv("C:/Users/YawOM/OneDrive/Desktop/Data Science/Takeaway project/ubereats_orders.csv", index=False)


# --- DATASET 3: DELIVEROO ORDERS (Completely different headers with spaces) ---
deliveroo_data = []
for i in range(1, 101):
    item = random.choice(items)
    qty = random.randint(1, 2)
    price = menu[item]
    deliveroo_data.append({
        "Order Reference": f"DLV-{random.randint(5000, 9000)}",
        "Order Date & Time": generate_random_time().strftime("%b %d, %Y, %I:%M %p"), # "May 12, 2026, 07:15 PM" format
        "Item Description": item,
        "Quantity Ordered": qty,
        "Gross Amount": price * qty
    })
df_del = pd.DataFrame(deliveroo_data)
df_del.to_csv("C:/Users/YawOM/OneDrive/Desktop/Data Science/Takeaway project/deliveroo_orders.csv", index=False)

print("Success.")
