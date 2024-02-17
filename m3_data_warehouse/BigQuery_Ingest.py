import requests
import pyarrow.parquet as pq
from io import BytesIO
import dlt

# Initialize your pipeline
pipeline = dlt.pipeline(
    pipeline_name='bigquery_ingest',
    destination='bigquery',
    dataset_name='green_tripdata'
)

def fetch_parquet_data(base_url, file_names):
    for file_name in file_names:
        api_url = f"{base_url}/{file_name}"
        response = requests.get(api_url)

        if response.status_code == 200:
            print("Request connection sucessfull!!")
            # Parse response content as a parquet file
            parquet_file = BytesIO(response.content)
            table = pq.read_table(parquet_file)
            yield table  # Yield the parquet file directly
        else:
            print(f"Unsuccessful request. Status code: {response.status_code}")

# List of file names
file_names = [f"green_tripdata_2022-{str(month).zfill(2)}.parquet" for month in range(1, 13)]

# Run the pipeline
info = pipeline.run(fetch_parquet_data('https://d37ci6vzurychx.cloudfront.net/trip-data', file_names), loader_file_format="parquet")