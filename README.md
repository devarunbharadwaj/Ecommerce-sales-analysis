# 📊 E-commerce Sales & Customer Retention Analysis

## 🚀 Project Overview
This project analyzes an E-commerce dataset to uncover insights about **customer behavior, revenue trends, delivery performance, and retention**.

The goal is to move beyond basic reporting and identify **business-critical insights** such as:
- Customer retention vs acquisition
- Revenue concentration
- Delivery efficiency impact

## ❗ Business Problem

The company shows strong growth in revenue but extremely low customer retention.

This project investigates:
- Why customers are not returning
- Whether revenue is sustainable
- If delivery performance impacts customer behavior
---

## 🛠 Tools & Technologies
- **SQL (PostgreSQL)** → Data extraction & analysis
- **Python (Pandas, NumPy)** → Data cleaning & preprocessing
- **Power BI** → Dashboard & visualization

---

## 📂 Project Structure
Ecommerce-sales-analysis/
│
├── data/ # Cleaned datasets
├── sql/ # SQL queries
├── notebooks/ # Python analysis
├── powerbi/ # Power BI dashboard (.pbix)
├── images/ # Dashboard screenshots
└── README.md

---

## ⚙️ Data Processing Steps

- Removed null values and invalid timestamps
- Created delivery buckets from delivery time
- Aggregated revenue at customer and monthly level
- Joined customer and order datasets for analysis

## 📊 Key Insights

### Customer Behavior
- ~97% of customers are one-time buyers  
- Only ~3% are repeat customers  
→ Indicates extremely poor customer retention  

---

### Revenue Insights
- Revenue growth is driven mainly by new customer acquisition  
- A small group of customers contributes a large portion of revenue  

---

### Delivery Performance
- Most deliveries occur within 6–15 days  
- Slight variation in order value across delivery durations  

---

### Business Implication
- The business is heavily dependent on acquiring new customers  
- Lack of retention strategy poses long-term revenue risk  

---

## 📈 Dashboard Preview

### Main Dashboard
![Dashboard 1](images/Ecommerce_Dashboard1.png)

### Customer & Delivery Insights
![Dashboard 2](images/Ecommerce_Dashboard2.png)

---

## ⚙️ How to Use

1. Load datasets from the `data/` folder  
2. Run SQL queries from `sql/analysis.sql`  
3. Open `powerbi/Ecommerce_projectdb.pbix` in Power BI

## 💡 Recommendations

- Introduce loyalty programs to improve retention
- Target high-value customers with personalized offers
- Improve delivery efficiency to enhance customer experience
- Focus on retention instead of only acquisition

---

## 🧠 What I Learned
- End-to-end data workflow (SQL → Python → Power BI)  
- Data cleaning and transformation using Python  
- Writing analytical SQL queries for business insights  
- Building dashboards that communicate insights clearly  

---

## 🔗 Dataset Source
Olist Brazilian E-commerce Dataset (Public dataset)

---

## 📌 Future Improvements
- Cohort-based retention analysis  
- Customer segmentation (RFM analysis)  
- Predictive modeling for repeat customer behavior  
