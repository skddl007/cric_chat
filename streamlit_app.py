"""
Streamlit entry point for the Cricket Image Chatbot
This file is used as the entry point for Streamlit Cloud deployment.
"""

import os
import streamlit as st
import nltk
from pathlib import Path

# Download NLTK data
@st.cache_resource
def download_nltk_data():
    nltk.download('punkt')
    nltk.download('wordnet')
    nltk.download('omw-1.4')
    nltk.download('averaged_perceptron_tagger')

# Create necessary directories
def setup_directories():
    # Create cache directory if it doesn't exist
    cache_dir = Path("cache")
    os.makedirs(cache_dir, exist_ok=True)

# Initialize the app
def initialize():
    download_nltk_data()
    setup_directories()
    
    # Check if database needs initialization
    try:
        import db_store
        if not db_store.database_exists():
            st.warning("Database not initialized. Initializing now...")
            import init_db
            init_db.main()
            st.success("Database initialized successfully!")
    except Exception as e:
        st.error(f"Error initializing database: {str(e)}")

# Run the main app
def main():
    initialize()
    
    # Import app.py and run it
    import app
    
if __name__ == "__main__":
    main()