# 🌍 WorldQuiz

> A Flutter app to explore countries and test your geography knowledge. Browse 240+ countries, filter by continent, and challenge yourself with 4 quiz types — flags, capitals, population, and languages.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Riverpod](https://img.shields.io/badge/Riverpod-00BCD4?style=for-the-badge&logo=flutter&logoColor=white)
![REST API](https://img.shields.io/badge/REST_API-FF6B6B?style=for-the-badge&logo=api&logoColor=white)

---

## Screenshots

| Home | Detail | Quiz | Score |
|---|---|---|---|
|*<img width="200" height="450" alt="Screenshot_20260803-141327" src="https://github.com/user-attachments/assets/2fcb44ee-22bd-4636-8f66-cc3e06577b17" />* |*<img width="200" height="450" alt="Screenshot_20260803-141349" src="https://github.com/user-attachments/assets/00d067e9-14e8-4ba9-9bc7-982cce0521ce" />* |*<img width="200" height="450" alt="Screenshot_20260803-141407" src="https://github.com/user-attachments/assets/3d395e76-33c5-474a-9ef8-86c7428eb156" />* |*<img width="200" height="450" alt="Screenshot_20260803-141519" src="https://github.com/user-attachments/assets/544ee448-6dfe-49b6-90f8-bc3d06492950" />* |





---

## Features

| Feature | Description |
|---|---|
| Country Explorer | Browse 240+ countries with flag and name |
| Continent Filter | Filter countries by continent |
| Country Detail | View capital, continent, languages, currencies, and population |
| 4 Quiz Types | Flag, Capital, Population, and Language quizzes |
| Instant Feedback | Correct/wrong answer shown immediately after selection |
| Score Screen | See your score at the end of each quiz |
| Play Again | Start a new quiz type without leaving the screen |

---

## Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter |
| Language | Dart |
| State Management | Riverpod (StateNotifier) |
| HTTP Client | Dio |
| Data Source | REST Countries API v5 |

---

## Architecture
```
lib/
├── core/
│ └── assets
│ └── images
│ └── utils/
│ └── quiz_helper.dart # generateQuestions logic
├── models/
│ ├── country.dart # Country data class with fromJson
│ └── quiz_questions.dart # Quiz question model
├── repositories/
│ └── country.dart # All API calls — Dio setup, fetchAllCountries
├── providers/
│ ├── country.dart # Countries state — loading, error, data
│ └── quiz.dart # Quiz state — questions, index, score
├── screens/
│ ├── splash.dart
│ ├── country.dart
│ ├── country_detail.dart
│ └── quiz.dart
└── main.dart
```
The UI never calls the API directly — all data flows through the repository and provider layers.

---

## Getting Started

**Prerequisites:** Flutter SDK, REST Countries API key

**1. Clone the repo**
```bash
git clone https://github.com/MedaliSekri/worldquiz.git
cd worldquiz
```

**2. Install dependencies**
```bash
flutter pub get
```

**3. Add your API key**

Create a `.env` file in the project root:
API_KEY=your_api_key_here

Get a free API key at [restcountries.com](https://restcountries.com)

**4. Run the app**
```bash
flutter run
```

---

## Dependencies

```yaml
dependencies:
  flutter_riverpod:
  dio:
  flutter_dotenv:
  google_fonts:
```

---

## What I Learned

- REST API integration with Dio — BaseOptions, headers, interceptors
- JSON parsing from an external API with nested data structures
- Riverpod StateNotifier with loading/error/success states
- Generating dynamic quiz questions from fetched data using pure Dart logic
- Pagination handling — fetching all countries across multiple API requests
- Environment variables with flutter_dotenv — keeping API keys out of source control
