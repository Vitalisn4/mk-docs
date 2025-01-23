# Step 1: Use a Python base image (you can choose any version)
#FROM python:3.9-slim

# Step 2: Set the working directory inside the container
#WORKDIR /app

# Step 3: Install system dependencies (e.g., build tools, and dependencies)
#RUN apt-get update && \
 #   apt-get install -y --no-install-recommends \
  #  gcc \
   # && rm -rf /var/lib/apt/lists/*

# Step 4: Install Python dependencies for MkDocs and Material theme
#COPY requirements.txt /app/requirements.txt
#RUN pip install --no-cache-dir -r requirements.txt

# Step 5: Copy the MkDocs project files into the container
#COPY . /app

# Step 6: Expose the default port MkDocs runs on
#EXPOSE 8000

# Step 7: Set the default command to serve the MkDocs site
#CMD ["mkdocs", "serve", "--dev-addr", "0.0.0.0:8000"]

# Use a Python base image
FROM python:3.11-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file (if you have one) or we can install dependencies directly
# Copy the entire project
COPY . .

# Install MkDocs and the Material theme
RUN pip install mkdocs mkdocs-material

# Expose port 8000 for the MkDocs development server
EXPOSE 8000

# Command to run MkDocs server
CMD ["mkdocs", "serve", "--dev-addr=0.0.0.0:8000"]

