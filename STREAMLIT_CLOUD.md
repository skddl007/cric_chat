# Cricket Image Chatbot - Streamlit Cloud Deployment Guide

## Project Structure for Streamlit Cloud

```
cricket-image-chatbot/
├── .streamlit/
│   └── secrets.toml       # Contains all secrets (don't commit this!)
├── data/                  # Contains all CSV data files
│   ├── Action.csv
│   ├── Event.csv
│   ├── finalTaggedData.csv
│   ├── Mood.csv
│   ├── Players.csv
│   └── Sublocation.csv
├── app.py                 # Main application
├── streamlit_app.py       # Entry point for Streamlit Cloud
├── requirements.txt       # Python dependencies with --only-binary flag
├── packages.txt           # System dependencies
└── ... (other application files)
```

## Deployment Steps

### 1. Prepare Your Repository

1. Ensure your repository has the correct structure as shown above
2. Make sure all data files are included in the `data/` directory
3. Verify that `requirements.txt` includes the `--only-binary=:all:` flag
4. Check that `packages.txt` includes necessary system dependencies

### 2. Set Up Streamlit Cloud

1. Log in to Streamlit Cloud (https://streamlit.io/cloud)
2. Connect your GitHub repository
3. Configure the app:
   - Set the main file path to `streamlit_app.py`
   - Add all secrets from your `.streamlit/secrets.toml` file to Streamlit Cloud secrets

### 3. Configure Secrets

In Streamlit Cloud, go to "Advanced settings" > "Secrets" and add:

```toml
# Aiven PostgreSQL credentials
DB_NAME = "defaultdb"
DB_USER = "avnadmin"
DB_PASSWORD = "your_password"
DB_HOST = "your_host.aivencloud.com"
DB_PORT = "24832"

# Groq API settings
GROQ_API_KEY = "your_groq_api_key"
GROQ_API_URL = "https://api.groq.com/openai/v1/chat/completions"
GROQ_MODEL = "llama-3.3-70b-versatile"

# Embedding model
EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"
```

### 4. Deploy Your App

1. Click "Deploy" to start the deployment process
2. Streamlit Cloud will install dependencies and start your app
3. The first run will initialize the database if needed

## Troubleshooting

### Package Installation Issues

If you encounter issues with package installation:

1. Make sure `--only-binary=:all:` is the first line in requirements.txt
2. Use older, more stable versions of packages (pandas 2.1.4 instead of 2.2.1)
3. Check Streamlit Cloud logs for specific error messages

### Database Connection Issues

If you have problems connecting to the database:

1. Verify database credentials in Streamlit secrets
2. Check if your database allows connections from Streamlit Cloud's IP range
3. Ensure pgvector extension is installed on your database

### Memory Issues

If your app crashes with memory errors:

1. The `TOKENIZERS_PARALLELISM=false` setting in streamlit_app.py helps reduce memory usage
2. Consider using smaller models or batch sizes
3. Initialize database in smaller chunks if needed

## Important Notes

- Never commit your `.streamlit/secrets.toml` file to GitHub
- Always use Streamlit Cloud's secrets management for production
- The database initialization process may take some time on first run
- Make sure your Aiven PostgreSQL database has the pgvector extension installed