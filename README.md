# Cricket Image Chatbot

A Streamlit-based chatbot application that uses AI to analyze cricket images and provide insights.

## Features

- Upload and analyze cricket match images
- AI-powered image recognition for cricket scenarios
- Interactive chat interface
- PostgreSQL database integration for storing chat history
- Secure credential management

## Prerequisites

- Python 3.8 or higher
- PostgreSQL database (Aiven PostgreSQL)
- Streamlit
- Required Python packages (see requirements.txt)

## Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/cricket-image-chatbot.git
cd cricket-image-chatbot
```

2. Install required packages:
```bash
pip install -r requirements.txt
```

3. Set up environment variables:
Create a `.streamlit/secrets.toml` file with the following structure:
```toml
[postgresql]
host = "your-aiven-host"
port = "your-aiven-port"
database = "your-database-name"
user = "your-username"
password = "your-password"
```

## Database Setup

1. Initialize the database:
```bash
python init_db.py
```

2. Run data migration (if needed):
```bash
python migrate_data.py
```

## Running the Application

1. Start the Streamlit app:
```bash
streamlit run app.py
```

2. Open your browser and navigate to the provided local URL (typically http://localhost:8501)

## Security Notes

- Never commit sensitive credentials to version control
- Keep your `.streamlit/secrets.toml` file secure and local
- Regularly rotate database credentials
- Use environment variables for sensitive data in production

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details. "# cric_chat" 
