# Data Engineering Zoomcamp

- [Module 1: Containerization and Infrastructure as Code](#module-1-containerization-and-infrastructure-as-code)
- [Module 2: Workflow Orchestration](#module-2-workflow-orchestration)

### [Module 1: Containerization and Infrastructure as Code](m1_docker-terraform/)

- Introduction to GCP
- Docker and docker-compose
- Running Postgres locally with Docker
- Setting up infrastructure on GCP with Terraform
- Preparing the environment for the course

### [Module 2: Workflow Orchestration](m2_workflow_orchestration/)

- Data Lake
- Workflow orchestration
- Workflow orchestration with Mage

### [Module 3: Data Warehouse](m3_data_warehouse/)

Goal: Structuring data into a Data Warehouse

Instructor: Ankush

Data warehouse (BigQuery) (25 minutes) What is a data warehouse solution What is big query, why is it so fast, Cost of BQ, (5 min) Partitoning and clustering, Automatic re-clustering (10 min) Pointing to a location in google storage (5 min) Loading data to big query & PG (10 min) -- using Airflow operator? BQ best practices Misc: BQ Geo location, BQ ML Alternatives (Snowflake/Redshift)

### [Workshop](w1_data_ingestion/)

### [Module 4: Analytics engineering](m4_analytic_engineering/)

**Goal:** Transforming Data in DWH to Analytical Views

Basics (15 mins) What is DBT? ETL vs ELT Data modeling DBT fit of the tool in the tech stack Usage (Combination of coding + theory) (1:30-1:45 mins) Anatomy of a dbt model: written code vs compiled Sources Materialisations: table, view, incremental, ephemeral Seeds Sources and ref Jinja and Macros Tests Documentation Packages Deployment: local development vs production DBT cloud: scheduler, sources and data catalog (Airflow) Google data studio -> Dashboard Extra knowledge: DBT cli (local)

### [Module 5: Batch processing](/)

Distributed processing (Spark) (40 + ? minutes) What is Spark, spark cluster (5 mins) Explaining potential of Spark (10 mins) What is broadcast variables, partitioning, shuffle (10 mins) Pre-joining data (10 mins) use-case What else is out there (Flink) (5 mins) Extending Orchestration env (airflow) (30 minutes) Big query on airflow (10 mins) Spark on airflow (10 mins)

### [Module 6: Streaming](/)

Basics What is Kafka Internals of Kafka, broker Partitoning of Kafka topic Replication of Kafka topic Consumer-producer Schemas (avro) Streaming Kafka streams Kafka connect Alternatives (PubSub/Pulsar)

### [Module 7, 8 & 9: Project](/)

Putting everything we learned to practice Duration: 2-3 weeks

Upcoming buzzwords Delta Lake/Lakehouse Databricks Apache iceberg Apache hudi Data mesh KSQLDB Streaming analytics Mlops

### NY Trips Dataset

NY Green Taxi Trips Dataset:

```bash
wget https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz)
```

Datase with zones:

```bash
wget https://s3.amazonaws.com/nyc-tlc/misc/taxi+_zone_lookup.csv
```
