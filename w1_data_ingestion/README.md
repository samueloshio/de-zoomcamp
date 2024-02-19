# Data Ingestion

# **Homework**: Data talks club data engineering zoomcamp Data loading workshop

Hello folks, let's practice what we learned - Loading data with the best practices of data engineering.

Here are the exercises we will do

# 1. Use a generator

Remember the concept of generator? Let's practice using them to futher our understanding of how they work.

Let's define a generator and then run it as practice.

**Answer the following questions:**

- **Question 1: What is the sum of the outputs of the generator for limit = 5?**

```shell
def square_root_generator(limit):
    n = 1
    while n <= limit:
        yield n ** 0.5
        n += 1

# Example usage:
limit = 5
generator = square_root_generator(limit)

for sqrt_value in generator:
    print(sqrt_value)

```

- **Question 2: What is the 13th number yielded**

```shell
def square_root_generator(limit):
    n = 1
    while n <= limit:
        yield n ** 0.5
        n += 1

# Example usage:
limit = 13
generator = square_root_generator(limit)

for sqrt_value in generator:
    print(sqrt_value)

```

# 2. Append a generator to a table with existing data

Below you have 2 generators. You will be tasked to load them to duckdb and answer some questions from the data

1. Load the first generator and calculate the sum of ages of all people. Make sure to only load it once.
2. Append the second generator to the same table as the first.
3. **After correctly appending the data, calculate the sum of all ages of people.**

```shell
def people_1():
    for i in range(1, 6):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 25 + i, "City": "City_A"}

for person in people_1():
    print(person)


def people_2():
    for i in range(3, 9):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 30 + i, "City": "City_B", "Occupation": f"Job_{i}"}


for person in people_2():
    print(person)

# Combine the data from both generators.
combined_data = list(people_1()) + list(people_2())

# Calculate the sum of all ages.
total_age = sum(person['Age'] for person in combined_data)
print(f'Total age of all people: {total_age}')
```

# 3. Merge a generator

Re-use the generators from Exercise 2.

A table's primary key needs to be created from the start, so load your data to a new table with primary key ID.

Load your first generator first, and then load the second one with merge. Since they have overlapping IDs, some of the records from the first load should be replaced by the ones from the second load.

After loading, you should have a total of 8 records, and ID 3 should have age 33.

Question: **Calculate the sum of ages of all the people loaded as described above.**

# Solution: First make sure that the following modules are installed:

```shell
#Install the dependencies
%%capture
!pip install dlt[duckdb]
```

```shell
# to do: homework :)
import dlt

# Define your generators
def people_1():
    for i in range(1, 6):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 25 + i, "City": "City_A"}

def people_2():
    for i in range(3, 9):
        yield {"ID": i, "Name": f"Person_{i}", "Age": 30 + i, "City": "City_B", "Occupation": f"Job_{i}"}

# Create a pipeline
pipeline = dlt.pipeline(
    pipeline_name="people_data",
    destination="duckdb",  # or any other destination you prefer
    dataset_name="people"
)

# Load the first generator
@dlt.resource(primary_key="ID", write_disposition="replace")
def load_people_1():
    yield from people_1()

pipeline.run(load_people_1)

# Load the second generator with merge
@dlt.resource(primary_key="ID", write_disposition="merge")
def load_people_2():
    yield from people_2()

pipeline.run(load_people_2)

load_info = pipeline.run(load_people_2)

# Print general information
print(f"Pipeline: {load_info.pipeline}")
print(f"Destination: {load_info.destination_type}")
print(f"Dataset: {load_info.dataset_name}")

# Print information about each load package
for package in load_info.load_packages:
    print(f"Load ID: {package.load_id}")
    print(f"State: {package.state}")
    print(f"Schema: {package.schema}")
    print(f"Completed at: {package.completed_at}")

    # Print information about each job in the package
    for job in package.jobs['completed_jobs']:
        print(f"Job file path: {job.file_path}")
        print(f"State: {job.state}")
        print(f"Elapsed time: {job.elapsed}")
        print(f"Failed message: {job.failed_message}")

# Now you can query the loaded data to calculate the sum of ages
query = "SELECT SUM(Age) FROM load_people_2"
with pipeline.sql_client() as client:
    result = client.execute(query)
    sum_of_ages = result.fetchone()[0]

print(f"The sum of ages is {sum_of_ages}")
```
