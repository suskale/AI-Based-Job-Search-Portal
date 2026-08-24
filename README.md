# AI-Based Job Search Portal

An AI-based Job Search Portal developed using **Flutter and Firebase** that connects job seekers with organizations. The application provides separate functionality for users and organizations, allowing organizations to post jobs and users to browse and apply for available opportunities.

## Features

### Job Seeker

* User registration and login
* Google Sign-In
* Browse available job opportunities
* View job details
* Apply for jobs
* View and manage user profile
* Track applied jobs
* AI chatbot integration for user assistance

### Organization

* Organization login
* Organization dashboard
* Post new job opportunities
* View posted jobs
* View job details
* Manage job-related information

## AI Chatbot

The application integrates **Kommunicate** to provide chatbot functionality and assist users while using the job search portal.

## Technologies Used

* **Flutter** – Cross-platform application development
* **Dart** – Programming language
* **Firebase Authentication** – User authentication
* **Cloud Firestore** – Database
* **Google Sign-In** – Google authentication
* **Provider** – State management
* **Kommunicate** – Chatbot integration

## Project Structure

```text
lib/
│
├── models/
│   ├── job.dart
│   ├── orgs.dart
│   └── user.dart
│
├── pages/
│   ├── job pages/
│   ├── org pages/
│   ├── user pages/
│   ├── login_page.dart
│   ├── signup_page.dart
│   └── welcome_page.dart
│
├── services/
│   ├── auth_services.dart
│   └── database_services.dart
│
├── shared/
│   ├── input_decoration_theme.dart
│   ├── profile_widget.dart
│   ├── rounded_buttons.dart
│   ├── text_field_widget.dart
│   └── validators.dart
│
├── main.dart
└── wrapper.dart
```

## Firebase Integration

The project uses Firebase for backend services.

### Firebase Authentication

Firebase Authentication is used for:

* User registration
* Email/password login
* Google Sign-In
* Authentication state management

### Cloud Firestore

Cloud Firestore stores application data using collections such as:

```text
users
orgs
jobs
```

These collections are used to manage users, organizations, job postings, and job-related information.

## Job Application Flow

```text
User Registration / Login
          ↓
      User Home
          ↓
   Browse Available Jobs
          ↓
     View Job Details
          ↓
       Apply Now
          ↓
 Application Information Stored
```

## Organization Flow

```text
Organization Login
        ↓
Organization Dashboard
        ↓
   Create Job Post
        ↓
Store Job in Firestore
        ↓
Job Available to Users
```

## Getting Started

### Prerequisites

Make sure you have installed:

* Flutter SDK
* Dart SDK
* Android Studio or VS Code
* Android Emulator or physical Android device
* Firebase project configuration

Check your Flutter installation:

```bash
flutter doctor
```

## Installation

Clone the repository:

```bash
git clone https://github.com/suskale/AI-Based-Job-Search-Portal.git
```

Navigate to the project:

```bash
cd AI-Based-Job-Search-Portal
```

Install dependencies:

```bash
flutter pub get
```

Run the application:

```bash
flutter run
```

## Main Dependencies

The project uses the following major Flutter packages:

```text
firebase_core
firebase_auth
cloud_firestore
google_sign_in
provider
kommunicate_flutter
flutter_native_splash
```

## Testing

The project contains tests for different parts of the application, including:

```text
integration_test.dart
unit_test.dart
user_widget_test.dart
org_widget_test.dart
```

Run tests using:

```bash
flutter test
```

## Future Enhancements

* AI-based job recommendations
* Resume analysis
* Advanced job filtering and search
* Job recommendation based on user skills
* Resume upload functionality
* Application status tracking
* Improved organization dashboard
* Push notifications for new job opportunities

## Purpose

The purpose of this project is to provide a single platform where job seekers can discover and apply for job opportunities while organizations can publish and manage job postings.

The project demonstrates the integration of **Flutter, Firebase Authentication, Cloud Firestore, Google Sign-In, state management, and chatbot functionality** in a cross-platform application.

## Author

**Sushant**

## Repository

**AI-Based Job Search Portal**
