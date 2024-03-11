# Bus Ticket Management Application

This is a comprehensive Bus Ticket Management Application designed to streamline the process of ticket booking and management. The application is built with a frontend web interface, a Flutter mobile app for both iOS and Android platforms, and a backend server powered by Flask.
## Features

   - User-Friendly Interface: The frontend web application provides an intuitive user interface for easy ticket booking and management.

   - Cross-Platform Mobile App: The Flutter mobile app ensures a seamless experience for users on both iOS and Android devices.

   - Efficient Backend: The Flask backend handles data processing, user authentication, and communication with the database.
   - RESTful API: The flask backend handles the api definitions and endpoints for our resources.
   - OTP : In order to ensure user security and intergrity of data, we implement the one time password authentication to enable 2FA.
   
## Directory Structure

   - web: Contains the frontend web application.
   - flutter: Houses the Flutter mobile application for iOS and Android.
   - backend: The Flask backend server.

## Setup Instructions
### Frontend (Web)

    - Navigate to the web directory.
    - Install dependencies: `npm install` or `yarn`.
    - Run the development server: `npm start` or `yarn start`.

### Mobile App (Flutter)

    - Navigate to the flutter directory.
    - Install dependencies: flutter pub get.
    - Run the app on a simulator or physical device: flutter run.

### Backend (Flask)

    - Navigate to the backend directory.
    - Create a virtual environment: python -m venv venv.
    - Activate the virtual environment:
        On Windows: venv\Scripts\activate
        On macOS/Linux: source venv/bin/activate
    - Install dependencies: pip install -r requirements.txt.
    - Set up the database: flask db init, flask db migrate, flask db upgrade.
    - Run the Flask application: flask run.

## Technologies Used

   - Frontend: React (Javascript, Tailwind CSS, SCSS, REDUX)
   - Mobile App: Flutter (Dart)
   -  Backend: Flask (Python)
   -  Database: PostgreSQL(SQLAlchemy)

Contribution Guidelines

Feel free to contribute to this project by submitting issues or pull requests. Follow the CONTRIBUTING.md guidelines for more details.
