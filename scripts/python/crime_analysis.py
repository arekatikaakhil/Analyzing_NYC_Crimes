#Research Question 2: Which location has the highest crime rate? 
import pandas as pd
import matplotlib.pyplot as plt


# Read the CSV file into a pandas DataFrame
uncleaned_crime_data = pd.read_csv('E:/AKHIL/AIT580/Prison_Releases__Beginning_2008.csv')
# Check the data types of columns
print(uncleaned_crime_data.dtypes)


# Read the CSV file into a pandas DataFrame
crime_data = pd.read_csv('E:\\AKHIL\\AIT580\\crime_data_Last_decade.csv')

# Check the data types of columns
print(crime_data.dtypes)
# Group the data by 'COUNTY OF COMMITMENT' and count the number of cities with most crimes
county_counts = crime_data['County_of_Commitment'].value_counts()

# Sort the counties for a better-organized bar plot
sorted_counties = county_counts.head(10)

# Plotting the horizontal bar chart with the highest crimes county at first
plt.figure(figsize=(10, 6))
sorted_counties[::-1].plot(kind='barh', color='skyblue')  # Reverse the order
plt.title('Top 10 Counties with the Most Crimes')
plt.xlabel('Number of Crimes')
plt.ylabel('County')
plt.grid(axis='x', linestyle='--', alpha=0.7)  # Use 'x' for grid on the horizontal axis
plt.show()


#Research Question 3: What is the most commonly occurring type of crime?

import pandas as pd
import matplotlib.pyplot as plt

# Read the CSV file into a pandas DataFrame
crime_data = pd.read_csv('E:\\AKHIL\\AIT580\\crime_data_Last_decade.csv')

# Group the data by 'MOST SERIOUS CRIME' and count the most happened crimes
crime_counts = crime_data['Most_Serious_Crime'].value_counts()

# Sort the crimes for a better-organized bar plot
crime_counts = crime_counts.head(10)

# Plotting the horizontal bar chart with the highest crimes county at first
plt.figure(figsize=(10, 6))
crime_counts[::-1].plot(kind='barh', color='skyblue')  # Reverse the order
plt.title('Top 10 Counties with the Most Crimes')
plt.xlabel('Number of Crimes')
plt.ylabel('County')
plt.grid(axis='x', linestyle='--', alpha=0.7)  # Use 'x' for grid on the horizontal axis
plt.show()



#Research Question 4: Is there a noticeable connection between the location and the nature of the crime?


import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt

# Read the CSV file into a pandas DataFrame
crime_data = pd.read_csv('E:\\AKHIL\\AIT580\\crime_data_Last_decade.csv')

# Selecting columns of interest for analysis
data = crime_data[['County_of_Commitment', 'Most_Serious_Crime']]

# Get the top 10 counties based on count
top_10_counties = data['County_of_Commitment'].value_counts().head(10).index.tolist()

# Filter data for top 10 counties
top_10_county_data = data[data['County_of_Commitment'].isin(top_10_counties)]

# Get the top 10 crimes in the top 10 counties
top_10_crimes = top_10_county_data['County_of_Commitment'].value_counts().head(10)

# Filter data to include only the top 10 crimes
top_10_crime_data = top_10_county_data[top_10_county_data['Most_Serious_Crime'].isin(top_10_crimes.index)]

# Create a cross-tabulation of crimes by county
cross_tab = pd.crosstab(top_10_crime_data['Most_Serious_Crime'], top_10_crime_data['County_of_Commitment'])


# Plotting the heatmap
plt.figure(figsize=(12, 8))
sns.heatmap(cross_tab, annot=True, cmap='YlGnBu', fmt='d')
plt.title('Relationship between Top 10 Crimes and Top 10 Counties')
plt.xlabel('County of Commitment')
plt.ylabel('Most Serious Crime')
plt.xticks(rotation=45)
plt.yticks(rotation=0)
plt.tight_layout()
plt.show()