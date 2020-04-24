import pandas as pd
file_name = "CFF-LWP-CSR-SF-combined-deduplicated.csv"
file_name_output = "CFF-LWP-CSR-SF-combined-deduplicated-pandas.csv"

df = pd.read_csv(file_name, sep=",")

df.drop_duplicates(subset=["Cluster ID"], inplace=True)
df.drop_duplicates(subset=["Name", "Municipality"], inplace=True)

df.to_csv(file_name_output)
