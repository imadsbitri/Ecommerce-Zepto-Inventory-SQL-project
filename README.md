# 🛒 Zepto E-commerce SQL  Project

This is a hands-on, real-world SQL project simulating the workflow of a data analyst in an **e-commerce/retail environment**, based on Zepto’s product inventory dataset — one of India’s fastest-growing quick-commerce platforms. It demonstrates **data modeling, cleaning, exploration, and business-driven analysis** using SQL, and is designed to showcase practical skills for recruiters and hiring managers.

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
```
---

## 🔍 Data Exploration

Before analyzing the dataset, I performed **exploratory data analysis (EDA)** to understand its structure and content:

1. **Counted total records** – verified how many SKUs were in the inventory.  
2. **Viewed sample rows** – checked how product names, categories, and prices are structured.  
3. **Checked for null values** – identified missing data across key columns such as `name`, `category`, `mrp`, and `availableQuantity`.  
4. **Distinct product categories** – listed all categories to understand inventory distribution.  
5. **Stock analysis** – compared in-stock vs out-of-stock products.  
6. **Duplicate detection** – identified product names appearing multiple times due to different SKUs or packaging variations.  

These steps helped uncover inconsistencies, patterns, and potential issues that needed cleaning before analysis.

---

## 🧹 Data Cleaning

After exploring the dataset, I performed **data cleaning** to ensure accurate analysis:

1. **Removed invalid entries** – deleted products where `mrp` or `discountSellingPrice` was zero.  
2. **Converted pricing** – changed `mrp` and `discountSellingPrice` from paise to rupees for consistency and readability.  
3. **Handled missing values** – verified that remaining null values in key columns were addressed or accounted for during analysis.  

This preparation ensured the dataset was ready for **business-driven SQL queries and insights**, simulating real-world e-commerce data cleaning workflows.

---

## 📊 Business Analysis Queries

After cleaning the data, I executed a set of **business-focused SQL queries** to generate actionable insights:

- **Top 10 best-value products** by discount percentage.  
- **High-MRP products currently out of stock** to identify potential inventory issues.  
- **Estimated revenue per category** based on available stock and discounted selling price.  
- **Expensive products (MRP > ₹500) with minimal discounts** for pricing analysis.  
- **Top 5 categories offering highest average discount** to evaluate promotions.  
- **Price-per-gram calculation** to identify value-for-money products.  
- **Weight-based categorization**: Low (<1kg), Medium (1–5kg), Bulk (>5kg).  
- **Total inventory weight per category** to evaluate stock volume distribution.  

These queries simulate real-world e-commerce analytics that a data analyst would perform to support decision-making.


