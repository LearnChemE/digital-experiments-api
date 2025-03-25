# Use an official Python runtime as the base image
FROM python:3.13.2-bookworm

# Prevent Python from writing pyc files and buffering stdout/stderr.
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set working directory
WORKDIR /api

# Install dependencies
COPY requirements.txt /api/
RUN pip install --upgrade pip && pip install -r requirements.txt

# Copy project code
COPY . /api/