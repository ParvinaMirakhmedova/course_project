import pandas as pd
import plotly.express as px
import streamlit as st
import db


# Sidebar filter for Diabetes Type
selected_dm_type = st.sidebar.radio("Select Diabetes Type", ["NIDDM", "IDDM"])

# Dynamic title based on selection
st.title(f"{selected_dm_type} Patients Base Analysis")
st.write("---")

# Filter the DataFrame
filtered_df = df[df["dm_type"] == selected_dm_type]

if not filtered_df.empty:
    min_fbg, max_fbg = filtered_df["fbg"].dropna().agg(["min", "max"])
else:
    min_fbg, max_fbg = 70, 200  # Default FBG range if no data

st.write('---')
st.write('Main filter')

# Add a slider for FBG selection
selected_fbg = st.slider(
    label="Select fasting blood glucose level",
    min_value=min_fbg,
    max_value=max_fbg,
    value=(min_fbg, max_fbg)  # Default range
)

st.write(f"Selected FBG range: {selected_fbg[0]} - {selected_fbg[1]}")


patients_filtered = patients_df.query(filter)

unique_patients_number = patients_df['patient_ID'].nunique()

col1, col2, col3, col4, col5 = st.columns(5)
col1.metric(
    'Number of patients',
    unique_patients_number
)

col2.metric(
    'Average patient age',
    int(patients_filtered['age'].mean())
)

col3.metric(
    'Median patient bmi',
    int(patient_filtered['bmi'].median())
)



r2_col1, r2_col2 = st.columns(2)

genders_breakdown = patient_filtered['gender'].value_counts().to_frame().reset_index()
genders_pie = px.pie(
    data_frame=genders_breakdown,
    values='count',
    names='gender',
    title='Patients breakdown by gender'
)
r2_col1.plotly_chart(genders_pie)


marital_breakdown = patient_filtered['smoking'].value_counts().to_frame().reset_index()
marital_donut = px.pie(
    data_frame=smoking_breakdown,
    values='count',
    names='smoking',
    hole=.5,
    color='smoking',
    color_discrete_map={'yes': 'lightgreen', 'no': 'lightgray'},
    title='Patients breakdown by smoking'
)
r2_col2.plotly_chart(smoking_donut)

ages_hist = px.histogram(
    data_frame=patient_filtered,
    x = 'age',
    color='gender',
    title='Patient ages distribution'
)
st.plotly_chart(ages_hist)
