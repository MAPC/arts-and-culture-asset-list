import sys
import pandas as pd

file_name = "CFF-LWP-CSR-SF-combined-deduplicated.csv"

df = pd.read_csv(file_name, sep=",")

# Notes:
# - the `subset=None` means that every column is used
#    to determine if two rows are different; to change that specify
#    the columns as an array
# - the `inplace=True` means that the data structure is changed and
#   the duplicate rows are gone
df.drop_duplicates(subset=["Cluster ID"], inplace=True)
df.drop_duplicates(subset=["Name", "Municipality"], inplace=True)

# Write the results to a different file
df.to_csv(sys.stdout)
