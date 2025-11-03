# 🛒 Zepto E-commerce SQL Portfolio Project

This is a hands-on, real-world SQL portfolio project simulating the workflow of a data analyst in an **e-commerce/retail environment**, based on Zepto’s product inventory dataset — one of India’s fastest-growing quick-commerce platforms. It demonstrates **data modeling, cleaning, exploration, and business-driven analysis** using SQL, and is designed to showcase practical skills for recruiters and hiring managers.

---

## 🎯 Project Objective

The goal of this project is to **replicate how a data analyst works with messy, real-world e-commerce data** to derive actionable insights. Key objectives include:

- Build a database from a raw inventory dataset  
- Explore and clean data for inconsistencies  
- Perform **business-focused SQL analysis** (pricing, inventory, discounts, revenue, stock trends)  
- Showcase SQL skills for portfolio and interview purposes  

---

## 🛠️ Skills & Concepts Demonstrated

- **Database Design & SQL**: Table creation with `SERIAL` primary key, proper data types, auto-increment sequence management  
- **Data Exploration (EDA)**: Count records, identify nulls, explore distinct categories, check stock availability, detect duplicate SKUs  
- **Data Cleaning & Transformation**: Remove invalid entries (zero pricing), convert prices from paise to rupees, handle nulls  
- **Business Analysis Queries**: Top 10 best-value products, high-MRP out-of-stock products, estimated revenue per category, price per gram, weight-based categorization, total inventory weight  

---

## 📁 Dataset Overview

The dataset **represents Zepto’s e-commerce inventory** and mimics real-world scenarios:

- Each row = unique SKU (Stock Keeping Unit)  
- Duplicate product names exist due to variations in packaging, weight, or discounts  

**Columns:**

| Column | Description |
|--------|-------------|
| `sku_id` | Unique synthetic primary key |
| `name` | Product name |
| `category` | Product category (Fruits, Snacks, Beverages, etc.) |
| `mrp` | Maximum Retail Price (converted from paise to ₹) |
| `discountPercent` | Discount applied on MRP |
| `discountSellingPrice` | Final selling price after discount |
| `availableQuantity` | Units available in inventory |
| `weightInGms` | Product weight in grams |
| `outofstock` | Boolean flag for stock availability |
| `quantity` | Units per package |

---

## 🔧 Project Workflow

### 1. Database & Table Creation
```sql
CREATE TABLE zepto (
  sku_id SERIAL PRIMARY KEY,
  category VARCHAR(120),
  name VARCHAR(150) NOT NULL,
  mrp NUMERIC(8,2),
  discountPercent NUMERIC(5,2),
  availableQuantity INTEGER,
  discountSellingPrice NUMERIC(8,2),
  weightInGms INTEGER,
  outofstock BOOLEAN,
  quantity INTEGER
);

ALTER SEQUENCE zepto_sku_id_seq RESTART WITH 1;
