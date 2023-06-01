# QuizIT_Flutter

QuitIT is a Flutter app with the main goal of providing helpful information to certain IT topics in a quiz-like manner.
It was developed as a part of my bachelor thesis where I compared cross-platform and native Android app development.

The native app can be found [here](https://github.com/studAlexP/QuizIT_Android).

## Getting Started
These instructions will give you a copy of the project up and running on your local machine for development and testing purposes.


### Prerequisites
To fully use this app the following things are needed:

+ [Android Studio](https://developer.android.com/studio) (tested with Android Studio Dolphin | 2021.3.1 Patch 1)
+ [Flutter v3.7.7 or greater](https://docs.flutter.dev/get-started/install)
+ [QuizAPI API Key](https://quizapi.io/)

### Installing
From your command line:
```
# Clone this repository

$ git clone https://github.com/studAlexP/QuizIT_Flutter.git

# Change directory

$ cd QuizIT_Flutter

# Install the dependencies

$ flutter pub get
```
To run this project use the following command & select your device when prompted:
```
$ flutter run
```

In your root folder create a .env file & add the api key with the following syntax:
```
apiKey=YOUR_API_KEY
```

## Authors
+ **Alexande Pruka** - [studAlexP](https://github.com/studAlexP)

## Acknowledgments

A big thank you to [QuizAPI](https://quizapi.io/) for providing me the API