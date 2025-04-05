```markdown
# Analyzing New York State Crimes Over the Last Decade

📊 A data-driven research project analyzing crime patterns in New York State (2008–2022), using Python, R, SQL, and AWS.  
📍 Author: Akhil Arekatika | George Mason University | AIT-580-001

---

## 📌 Project Overview

This project investigates crime trends across New York State over the past decade, focusing on:

- Gender distribution of offenders across counties
- Locations with the highest crime rates
- Most frequently committed crimes
- The relationship between geography and the nature of crimes

The goal is to support law enforcement, policymakers, and community programs with actionable insights through data visualization and statistical analysis.

---

## 📁 Repository Structure

```bash
Analyzing_NYC_Crimes/
├── README.md                  # Project documentation
├── docs/                      # Research paper and images
│   └── Akhil_Arekatika_AIT580_Research_Paper.pdf
├── data/                      # Dataset(s)
│   └── NYS_Crime_2008_2022.csv
├── scripts/
│   ├── python/                # Python scripts
│   │   └── crime_analysis.py
│   ├── r/                     # R scripts
│   │   └── crime_visuals.R
│   └── sql/                   # SQL queries
│       └── crime_queries.sql
├── aws_deployment/           # AWS EC2/RDS instructions
│   └── README.md
└── requirements.txt          # Python dependencies
```

---

## 🧰 Tools & Technologies

- **Python** (data wrangling, plotting, SQL + AWS integration)
- **R (ggplot2)** (EDA, chi-squared tests, bar plots)
- **SQL** (queries on structured crime data)
- **AWS** (EC2 + RDS for data querying & visualization)

---

## 🔍 Key Research Questions

1. How do male and female crime rates differ by county?
2. Which location has the highest crime rate?
3. What are the most common crimes in NY State?
4. Is there a geographic pattern to crime types?

---

## 📈 Key Findings

- **New York City** has the highest crime rate for both genders.
- **Drug-related offenses** and **burglary** are the most common crime types.
- **Heatmaps and bar charts** revealed strong location-based patterns in crime types.

Visuals and statistical evidence are provided in the research paper and notebooks.

---

## 📊 Data Source

- [NYS Department of Corrections - Data.gov](https://data.ny.gov/Public-Safety/Prison-Releases-Beginning-2008/vcp4-2eiu)

The dataset covers **3.1 million records** from **2008 to 2022**, including release details, crime types, gender, and geography.

---

## 🚀 How to Use

1. Clone the repo:
   ```bash
   git clone https://github.com/<your-username>/Analyzing_NYC_Crimes.git
   cd Analyzing_NYC_Crimes
   ```

2. (Optional) Create a virtual environment:
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   pip install -r requirements.txt
   ```

3. Explore:
   - Run notebooks in `/notebooks`
   - View cleaned data in `/data`
   - Explore SQL logic in `/scripts/sql`

---

## 📜 License

MIT License – feel free to use and adapt with credit.

---

## 📬 Contact

**Akhil Arekatika**  
George Mason University  
📧 aarekati@gmu.edu

```
