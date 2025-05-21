#!/bin/bash

# Setup script for Cricket Image Chatbot
# This script helps set up the environment for local development

# Create virtual environment
echo "Creating virtual environment..."
python -m venv venv

# Activate virtual environment
echo "Activating virtual environment..."
source venv/bin/activate

# Install dependencies
echo "Installing Python dependencies..."
pip install -r requirements.txt

# Download NLTK data
echo "Downloading NLTK data..."
python -c "import nltk; nltk.download('punkt'); nltk.download('wordnet'); nltk.download('omw-1.4'); nltk.download('averaged_perceptron_tagger')"

# Create cache directory
echo "Creating cache directory..."
mkdir -p cache

# Initialize database
echo "Initializing database..."
python init_db.py

echo "Setup complete! You can now run the app with: streamlit run streamlit_app.py"