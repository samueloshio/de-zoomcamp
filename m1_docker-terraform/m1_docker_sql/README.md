# Docker + Postgres

## Commands 

All the commands from the video

Downloading the data

```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz 
```
### Running Postgres with Docker

#### Windows

> Note: Ensure docker desktop is running before performing the commands below

Running Postgres on Windows (note the full path)

```bash
docker run -it \
  -e POSTGRES_USER="agent" \
  -e POSTGRES_PASSWORD="password1" \
  -e POSTGRES_DB="ny_taxi" \
  -v c:/Users/alexe/git/data-engineering-zoomcamp/week_1_basics_n_setup/2_docker_sql/ny_taxi_postgres_data:/var/lib/postgresql/data \
  -p 5432:5432 \
  postgres:16
```