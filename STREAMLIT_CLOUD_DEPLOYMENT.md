# Deploying Cricket Image Chatbot on Streamlit Cloud

This guide provides instructions for deploying the Cricket Image Chatbot on Streamlit Cloud.

## Prerequisites

1. A Streamlit Cloud account (https://streamlit.io/cloud)
2. A GitHub repository containing your code
3. An Aiven PostgreSQL database (or any PostgreSQL database accessible from the internet)

## Deployment Steps

### 1. Prepare Your Repository

Ensure your repository has the following files:
- `streamlit_app.py` (entry point for Streamlit Cloud)
- `requirements.txt` (Python dependencies)
- `packages.txt` (System dependencies)
- `.streamlit/secrets.toml` (Configuration secrets - don't commit this to GitHub)

### 2. Set Up Secrets in Streamlit Cloud

1. Log in to Streamlit Cloud
2. Create a new app pointing to your GitHub repository
3. Go to "Advanced settings" > "Secrets"
4. Add the following secrets (copy from your local `.streamlit/secrets.toml`):

```toml
# Aiven PostgreSQL credentials
DB_NAME = "your_db_name"
DB_USER = "your_db_user"
DB_PASSWORD = "your_db_password"
DB_HOST = "your_db_host"
DB_PORT = "your_db_port"

# Groq API settings
GROQ_API_KEY = "your_groq_api_key"
GROQ_API_URL = "https://api.groq.com/openai/v1/chat/completions"
GROQ_MODEL = "llama-3.3-70b-versatile"

# Embedding model
EMBEDDING_MODEL = "sentence-transformers/all-MiniLM-L6-v2"
```

### 3. Configure Streamlit Cloud Settings

1. Set the "Main file path" to `streamlit_app.py`
2. Set Python version to 3.12 (or the version specified in your `runtime.txt`)
3. Enable "Private app" if you want to restrict access

### 4. Deploy Your App

1. Click "Deploy" to start the deployment process
2. Streamlit Cloud will install dependencies and start your app
3. Once deployed, you can access your app at the provided URL

### 5. Database Initialization

The first time your app runs, it will automatically initialize the database if needed. This includes:
- Creating necessary tables
- Loading reference data from CSV files
- Generating embeddings for vector search

## Troubleshooting

### Common Issues

1. **Database Connection Errors**:
   - Ensure your database is accessible from the internet
   - Check that your database credentials are correct in Streamlit secrets
   - Verify that your database has the pgvector extension installed

2. **Missing Data Files**:
   - Make sure all CSV files are included in your repository under the `data/` directory

3. **Memory Errors**:
   - Streamlit Cloud has memory limitations
   - Consider optimizing your code to use less memory
   - Split large operations into smaller chunks

4. **Timeout Errors**:
   - Initial database setup may take time
   - Consider pre-initializing your database before deployment

## Maintenance

- Regularly update your dependencies
- Monitor your app's performance
- Back up your database regularly