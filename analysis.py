import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('sales_data.csv', encoding='ISO-8859-1')

print(f"Строк: {len(df)}, Колонок: {len(df.columns)}")
print()

print("=== Выручка по категориям ===")
print(df.groupby('PRODUCTLINE')['SALES'].sum().sort_values(ascending=False))
print()

print("=== Выручка по месяцам ===")
df['ORDERDATE'] = pd.to_datetime(df['ORDERDATE'])
df.set_index('ORDERDATE', inplace=True)
monthly = df.resample('ME')['SALES'].sum()
print(monthly)

print()
print("=== Топ-10 клиентов ===")
print(df.groupby('CUSTOMERNAME')['SALES'].sum().sort_values(ascending=False).head(10))
