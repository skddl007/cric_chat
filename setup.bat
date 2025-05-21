@echo off
REM Setup script for Cricket Image Chatbot on Windows
REM This script helps set up the environment for local development

echo Creating virtual environment...
python -m venv venv

echo Activating virtual environment...
call venv\Scripts\activate.bat

echo Installing Python dependencies...
pip install -r requirements.txt

echo Downloading NLTK data...
python -c "import nltk; nltk.download('punkt'); nltk.download('wordnet'); nltk.download('omw-1.4'); nltk.download('averaged_perceptron_tagger')"

echo Creating cache directory...
mkdir cache

echo Initializing database...
python init_db.py

echo Setup complete! You can now run the app with: streamlit run streamlit_app.py