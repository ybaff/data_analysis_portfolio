# Multi-Channel Takeaway Margin & Performance Optimizer

An end-to-end data engineering and business intelligence pipeline that resolves multi channel data fragmentation for independent restaurants. This project extracts messy, mismatched sales data from an in-store till system, Uber Eats, and Deliveroo, transforms it using Python and Pandas, and loads it into an interactive Looker Studio dashboard to uncover true profit margins after third party commissions.

Live Dashboard Link: https://datastudio.google.com/reporting/c54dd374-fe50-45c5-a88b-d4fd22aafdad

---

## 📌 The Business Problem
Independent takeaway and restaurant owners face a major hurdle: **data fragmentation**. 
* Sales are split across in store point of sale systems and third party delivery apps (Uber Eats, Deliveroo).
* These platforms do not talk to each other, export data in wildly inconsistent formats (mismatched columns, chaotic date structures, etc), and blur financial realities behind heavy commissions.
* Because delivery platforms extract up to a 30% commission, tracking true cash in hand profit margins at the end of the month is nearly impossible without manual spreadsheet labor.

## 🛠️ The Solution
This project automates the entire consolidation workflow into a repeatable **ETL (Extract, Transform, Load) Pipeline**:

1. **Extract:** Ingests raw, mismatched monthly CSV exports from the Till, Uber Eats, and Deliveroo.
2. **Transform (Python & Pandas):** Normalises column structures, standardises chronological date/time schemas, cleans menu item string naming conventions, and applies accurate platform commission deductions.
3. **Load:** Vertically stack the normalised data layers into a unified enterpriseready master table and exports it for visualization.
4. **Visualize (Looker Studio):** Renders interactive, C-suite ready dashboards tracking true platform profitability, hourly operational volume for staff rotas, and product performance.

---

## 💻 Tech Stack & Tools
* **Language:** Python
* **Libraries:** Pandas (Data Manipulation & Cleansing)
* **Environment:** Jupyter Notebook (Pipeline Prototyping)
* **BI Platform:** Google Looker Studio (Data Visualization & Modeling)

---

## 📐 Data Pipeline Architecture (ETL)

### 1. Handling the "Messy" Raw Inputs
The raw input datasets perfectly mimic real-world system errors:
* **In-Store POS:** High-cleanliness data, tracking standard SQL date formatting (`YYYY-MM-DD HH:MM:SS`) and proper capitalisation (`Gourmet Burger`).
* **Uber Eats:** Fragmented schemas using UK-shorthand text timestamps (`DD/MM/YYYY HH:MM`), alternative headers (`order_ref`, `product_title`), and completely lowercase string values.
* **Deliveroo:** Complex text-based timestamps (`May 12, 2026, 07:15 PM`) with completely unique whitespace-separated headers (`Gross Amount`, `Item Description`).

### 2. Algorithmic Data Transformations
Key engineering tasks implemented inside the Jupyter Pipeline:
* **Schema Alignment:** Mapped all legacy, fragmented columns into a universal database naming standard (`Order_ID`, `Timestamp`, `Item_Name`, `Quantity`, `Price_paid`).
* **Chronological Normalization:** Parsed distinct string structures into unified, native Pandas `datetime64` data objects to secure time-series fidelity.
* **String Standardization:** Applied `.str.lower()` logic across data layers to prevent duplicated groupings (e.g., treating "gourmet burger" and "Gourmet Burger" as two separate products).
* **Margin Enrichment:** Applied specific backend financial logic to calculate actual takeaway profitability:
  * **Till:** Deducted a flat 2% card processing transaction fee (98% margin baseline).
  * **Uber Eats:** Subtracted a standard 30% platform commission fee (70% net revenue).
  * **Deliveroo:** Subtracted a standard 25% platform commission fee (75% net revenue).

```python
# Sample of the vertical stack logic utilizing double-bracket slicing
columns_to_keep = ["Order_ID", "Timestamp", "Item_Name", "Quantity", "Price_paid", "Source", "Estimated_Profit"]

df_master = pd.concat([
    df_roo[columns_to_keep], 
    df_instore[columns_to_keep], 
    df_uber[columns_to_keep]
], axis=0, ignore_index=True)
