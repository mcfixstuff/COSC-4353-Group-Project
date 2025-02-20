#!/bin/bash

# Navigate to the project directory
cd ~/django_projects/Waterloo_Website

# Pull the latest changes from GitHub
git pull origin main

# Activate the virtual environment
source venv/bin/activate

# Install dependencies (in case they change)
pip install -r requirements.txt

# Apply database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --noinput

# Restart the Django server (or Gunicorn if used)
sudo systemctl restart gunicorn

# Restart Nginx (if using it)
sudo systemctl restart nginx

echo "Deployment completed successfully!"

