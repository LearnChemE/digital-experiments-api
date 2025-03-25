# Digital Experiments API

## Overview

The [LearnChemE digital experiments](https://learncheme.com/virtual-laboratories/) platform is a free, open-source project designed at bringing a chemical engineering laboratory experience to the web. Our experiments eliminate the need for laboratory classroom funding and expenses, allowing for wide access to laboratory experiments at the undergraduate and graduate level.

This API is used for certain digital experiments, to persist data, allow for user login, and for instructors to view student progress.

## Technology Stack

- **Django**: Python web framework
- **PostgreSQL**: Database
- **Docker & Docker Compose**: Containerization and orchestration
- **Deployment**: Amazon Web Services

## Project Structure

    digital-experiments-api/
    ├── Dockerfile
    ├── docker-compose.yml
    ├── requirements.txt
    ├── .env
    └── api/
      ├── manage.py
      └── api/
        └── # API contents and logic

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/) (usually included with Docker Desktop)

## Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/LearnChemE/digital-experiments-api.git
cd digital-experiments-api
```

### 2. Create and Configure the .env File

In the root directory, create a file named .env with the following content:

POSTGRES_DB=mydatabase
POSTGRES_USER=myuser
POSTGRES_PASSWORD=mypassword
POSTGRES_HOST=db
POSTGRES_PORT=5432

### 3. Build and Run the Containers

From the root directory, run:

```bash
docker compose up --build
```

This command builds your Docker images and starts both the Django and PostgreSQL containers.

### 4. Run Database Migrations

Once the containers are up, open a new terminal window and execute:

```bash
docker compose exec web python manage.py migrate
```

### 5. Access the API

You can interact with the API using tools such as `curl` or [Postman](https://www.postman.com). The URL of the development application is http://localhost:8000.

The routes for this API are in /api/api/urls.py

## Development Environment

### Hot Reloading:

With the volume mount (./api:/api), changes made to your local code are reflected in the container immediately.

### Running Management Commands:

Use `docker compose exec web <command>` to run Django management commands inside the container. For example, to start the shell:

```bash
docker compose exec web python manage.py shell
```

### Environment Variables:

All sensitive credentials and configuration are stored in the .env file. Ensure this file is properly set up before running the project.

## Additional Information

### Dockerfile:

- Sets up a lightweight Python environment using python:3.12, installs dependencies from requirements.txt, and copies your project code.

- docker-compose.yml:
  - Orchestrates two services:
    - web: Your Django application
    - db: PostgreSQL database
- requirements.txt:
  - Lists all Python dependencies including Django and psycopg2-binary.

## License

This project is licensed under the MIT license, and is provided as free, open-source software available to anybody to copy, modify, and redistribute.