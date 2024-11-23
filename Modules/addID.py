import pandas as pd

# Read the CSV file into a DataFrame
df = pd.read_csv("./Data/PreprocessedData/PreprocessedData/10_state_aqi_2023.csv");
print(df);
df["ID"] = "";
year = 2023;
for i in range(len(df)):
    df.loc[i, "ID"] = f"{year}-{i}";
print(df);
# Save the DataFrame to a CSV file
df.to_csv('./Data/PreprocessedData/PreprocessedData/10_state_aqi_2023.csv', index=False);