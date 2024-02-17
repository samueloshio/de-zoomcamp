import pandas as pd
from google.cloud import bigquery
import logging

# Initialize a BigQuery client
client = bigquery.Client()

# Set up logging
logging.basicConfig(level=logging.INFO)


def construct_url(month):
    """Constructs the URL for a given month."""
    return f"https://d37ci6vzurychx.cloudfront.net/trip-data/green_tripdata_2022-{month:02d}.parquet"


def load_data_to_bigquery(url):
    """Loads data from a given URL into BigQuery."""
    try:
        # Log the URL being processed
        logging.info(f"Processing {url}")

        # Read the parquet file into a DataFrame
        df = pd.read_parquet(url)

        # Load the DataFrame into BigQuery
        df.to_gbq(destination_table="green_tripdata.ny_taxi_tripdata", project_id="dtc-de-414207",
                  if_exists="append", client=client)

        # Log success
        logging.info(f"Successfully loaded data from {url} into BigQuery")

    except Exception as e:
        # Log any errors that occur
        logging.error(f"An error occurred while processing {url}: {e}")


def main():
    """Main function to loop through the months and load data."""
    # Loop through the months
    for month in range(1, 13):
        url = construct_url(month)
        load_data_to_bigquery(url)


if __name__ == "__main__":
    main()
