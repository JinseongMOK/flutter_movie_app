# 🎬 Flutter Movie App

![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)

TMDB API를 활용한 영화 정보 앱입니다.

## 📱 주요 기능

- 현재 상영작 목록 보기
- 인기 영화 목록 보기
- 영화 상세 정보 확인
  - 영화 포스터
  - 제목 및 원제
  - 개봉일
  - 장르
  - 줄거리
  - 평점 및 인기도
  - 예산 및 수익 정보
  - 제작사 정보

## 🛠 사용 기술

- Flutter
- Riverpod (상태관리)
- Clean Architecture
- TMDB API

## 📦 주요 패키지

- flutter_riverpod
- dio (HTTP 통신)
- json_annotation
- build_runner

## 🏗 프로젝트 구조

```
lib
│   ├── core
│   │   ├── poster.dart
│   │   ├── tag.dart
│   │   └── title_text.dart
│   ├── data
│   │   ├── data_source
│   │   │   ├── movie_data_source.dart
│   │   │   └── movie_data_source_impl.dart
│   │   └── dto
│   │       ├── movie_detail_dto.dart
│   │       └── movie_response_dto.dart
│   ├── domain
│   │   ├── entity
│   │   │   ├── movie.dart
│   │   │   └── movie_detail.dart
│   │   ├── repository
│   │   │   ├── movie_repository.dart
│   │   │   └── movie_repository_impl.dart
│   │   └── usecase
│   │       ├── get_movie_detail_usecase.dart
│   │       ├── get_now_playing_movies_usecase.dart
│   │       ├── get_popular_movies_usecase.dart
│   │       ├── get_top_rated_movies_usecase.dart
│   │       └── get_upcoming_movies_usecase.dart
│   ├── main.dart
│   └── presentation
│       ├── pages
│       │   ├── detail_page.dart
│       │   └── home_page.dart
│       ├── provider
│       │   └── movie_provider.dart
│       ├── viewmodel
│       │   ├── detail_view_model.dart
│       │   └── home_view_model.dart
│       └── widgets
│           ├── coming_soon.dart
│           ├── highest_rating.dart
│           ├── most_popular.dart
│           ├── now_playing.dart
│           └── popular.dart
├── pubspec.lock
├── pubspec.yaml
```
