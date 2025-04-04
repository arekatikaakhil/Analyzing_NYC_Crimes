#Cleaning and transforming the dataset.

# Loading required library
library(dplyr)
library(data.table)

#Setting the Working Directory to get the file
setwd("E:/AKHIL/AIT580")
crime_data <- read.csv("Prison_Releases__Beginning_2008.csv")

# Checking the column names
colnames(crime_data)

# Select specific columns requried for my research questions
selected_data <- crime_data %>%
select(`RELEASE.YEAR`, `RELEASE.MONTH`, `RELEASE.TYPE`, `COUNTY.OF.COMMITMENT`, SEX, `AGE.AT.RELEASE`, `MOST.SERIOUS.CRIME`)

# Specify the new column names
new_column_names <- c(
  "Year", 
  "Month", 
  "Release_Type", 
  "County_of_Commitment", 
  "Sex", 
  "Age_at_Release", 
  "Most_Serious_Crime"
)

# Assuming your dataset is a data.table named 'your_dataset'
setnames(selected_data, c("RELEASE.YEAR", "RELEASE.MONTH", "RELEASE.TYPE",
                         "COUNTY.OF.COMMITMENT", "SEX", "AGE.AT.RELEASE",
                         "MOST.SERIOUS.CRIME"), new_column_names)

# Remove duplicates
my_data <- distinct(selected_data)


# Re-Checking the column names
colnames(my_data)

# Print missing values column-wise
print(colSums(is.na(my_data)))

# Display the cleaned and transformed dataset
head(my_data)

my_data$`Year` <- as.numeric(my_data$`Year`)

cleaned_data <- my_data %>%
  filter(`Year` %in% c(2013,2014,2015,2016,2017,2018,2019,2020,2021,2022)) %>%
  select(`Year`, `Month`, `Release_Type`, `County_of_Commitment`,
         `Sex`, `Age_at_Release`, `Most_Serious_Crime`)

# Display the cleaned data
print(cleaned_data)

# Creating new dataset by removing unwanted columns and duplicates 
write.csv(cleaned_data, "crime_data_Last_decade.csv", row.names = FALSE)

# Summary and statistics of given data
summary(cleaned_data)


str(cleaned_data)


##############################################################################
# Research Question: To what extent does the distribution of male and female offenders vary across different counties based on crime rates? 

# Load necessary libraries
library(dplyr)  # Data manipulation
library(plotly)  # Interactive plotting
library(tidyr)  # Data tidying

# Load the dataset
crime_data <- read.csv('E:/AKHIL/AIT580/crime_data_Last_decade.csv')

# Convert 'Sex' column to factor for better representation
crime_data$Sex <- as.factor(crime_data$Sex)

# View the structure of the dataframe and check column names
str(crime_data)

# Group by County of Commitment and Sex, then count occurrences
county_sex_counts <- crime_data %>%
  filter(!is.na(Sex)) %>%  # Remove rows with missing gender values, if any
  group_by(County_of_Commitment, Sex) %>%
  summarise(count = n()) %>%
  spread(key = Sex, value = count, fill = 0) %>%
  arrange(desc(MALE))  # Arrange data by count of male criminals in descending order

# Get the top 10 counties based on the count of male criminals
top_10_counties <- county_sex_counts %>%
  group_by(County_of_Commitment) %>%
  summarise(MALE = sum(MALE)) %>%
  top_n(10) %>%
  arrange(desc(MALE))

# Filter county_sex_counts to retain only the top 10 counties
county_sex_counts <- county_sex_counts %>%
  filter(County_of_Commitment %in% top_10_counties$County_of_Commitment)

# Create an interactive bar plot for the count of males and females in each of the top 10 counties
plot_ly(data = county_sex_counts, x = ~MALE, y = ~County_of_Commitment, type = 'bar', orientation = 'h', 
        text = ~paste("Male:", MALE, "<br>Female:", FEMALE), hoverinfo = "text", name = "Male") %>%
  add_trace(x = ~FEMALE, y = ~County_of_Commitment, type = 'bar', orientation = 'h',
            text = ~paste("Male:", MALE, "<br>Female:", FEMALE), hoverinfo = "text", name = "Female") %>%
  layout(title = "Gender Breakdown of Crime in Top 10 NY Counties",
         xaxis = list(title = "Count"),
         yaxis = list(title = "County/City"),
         barmode = 'stack')


# Assuming 'crime_data' is your dataset with columns 'County_of_Commitment' and 'Sex'

# Perform Chi-square Test of Independence
chisq_test <- chisq.test(table(crime_data$County_of_Commitment, crime_data$Sex))
chisq_test

