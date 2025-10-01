# 🏦 Financial Data Analysis Portfolio: Multi-Platform Deep Dive

This repository showcases a comprehensive data analytics project on bank financial data, utilizing a full stack of popular industry tools (SQL, Excel, Power BI, Tableau) to cover two distinct, in-depth analysis areas.

---

## 🎯 Project Objectives & Focus Areas

### 1. Bank Data Analysis (Focus: Operational Health & Metrics)
* **Goal:** To analyze key bank metrics like total loan amounts, loan disbursement, interest collection, and late fees to assess overall operational health and loan portfolio performance.
* **Key Insight:** Analyzed **$751M in total loan amount** to find that the **26-35 age group** represents the largest segment of borrowers (**34.75%**), while the portfolio shows an **Average Loan Interest Rate of 12.03%** and **$82K in Late Fees Collected**. This data pinpoints the most valuable customer segment for marketing and establishes a clear baseline for monitoring collection efficiency.

### 2. Credit & Debit Transaction Analysis (Focus: Customer Behavior & Risk)
* **Goal:** To dissect customer spending patterns, transaction volumes, and flag high-risk or unusual credit/debit activity to improve fraud detection and inform branch performance strategy.
* **Key Insight:** Dissected **$254.89M in transaction volume** to reveal that **Debit Card transactions (33.41%)** are slightly higher than Credit Card transactions (33.32%) and are the largest method category. The analysis confirms the **City Center Branch** as the highest volume location ($42.91M$), and shows a sharp drop in total credit/debit activity in December, informing staff allocation and year-end fraud monitoring priorities.

---

## 🛠️ Technologies & Deliverables

| Tool/Language | Purpose | Files Located In |
| :--- | :--- | :--- |
| **SQL** | Data cleaning, merging two datasets, calculating key financial metrics, and aggregation, serving as the data foundation for all dashboards. | `04_SQL_Scripts/` |
| **Microsoft Excel** | Created two static dashboards for executive summary and quick reporting. | `01_Excel_Dashboards/` |
| **Power BI** | Created two interactive dashboards featuring **drill-through functionality** for deep-dive analysis. | `02_PowerBI_Dashboards/` |
| **Tableau** | Created two visually compelling dashboards focused on data storytelling and geographical analysis. | `03_Tableau_Dashboards/` |

---

## 📂 Repository Structure

The project is organized into clear, easy-to-navigate modules:

* **`data/`**: Anonymized sample datasets used for the analysis.
* **`visualizations_preview/`**: Contains **8 high-quality screenshots** of all main and drill-through dashboards. *Review these for a quick visual summary.*
* **`01_Excel_Dashboards/`**: Excel workbook files (two dashboards).
* **`02_PowerBI_Dashboards/`**: Power BI PBIX files (two dashboards with drill-through).
* **`03_Tableau_Dashboards/`**: Tableau TWBX files (two dashboards).
* **`04_SQL_Scripts/`**: Commented SQL files showing data preparation steps.

---

## 🖼️ Dashboard Previews

| Analysis Focus | Excel View | Power BI Main View | Tableau View |
| :--- | :--- | :--- | :--- |
| **Bank Data** | ![](/visualizations_preview/excel_bank_data_preview.png) | ![](/visualizations_preview/powerbi_bank_data_main.png) | ![](/visualizations_preview/tableau_bank_data_preview.png) |
| **Credit/Debit** | ![](/visualizations_preview/excel_credit_debit_preview.png) | ![](/visualizations_preview/powerbi_credit_debit_main.png) | ![](/visualizations_preview/tableau_credit_debit_preview.png) |
| **Power BI Drill-through**| | ![](/visualizations_preview/powerbi_bank_data_drillthrough.png) | |
| **Power BI Drill-through**| | ![](/visualizations_preview/powerbi_credit_debit_drillthrough.png) | |