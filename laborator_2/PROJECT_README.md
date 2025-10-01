# News App - Flutter

A modern news application built with Flutter, featuring a clean design inspired by Figma mockups.

## Features

- **Home Screen**: Browse trending news and personalized recommendations
- **Publisher Screen**: View publisher profiles with their news articles
- **Trending News**: Horizontal scrollable list of trending articles
- **Recommendation Feed**: Vertical list of recommended news articles
- **Follow System**: Follow your favorite publishers
- **Search**: Search within publisher news
- **Sort & Filter**: Sort news by newest/oldest

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── news_article.dart     # News article model
│   └── publisher.dart        # Publisher model
├── data/
│   └── news_data.dart        # Mock data provider
├── screens/
│   ├── home_screen.dart      # Home page
│   └── publisher_screen.dart # Publisher profile page
└── widgets/
    ├── trending_news_card.dart      # Trending news card widget
    └── recommended_news_card.dart   # Recommended news card widget
```

## Screens

### Home Screen
- Welcome message
- Trending news horizontal scroll
- Recommended news feed
- Navigation to publisher profiles

### Publisher Screen
- Publisher information and stats
- Follow/Unfollow functionality
- Publisher's news articles
- Search and filter options
- Sort by newest/oldest

## Design Features

- Clean and modern UI
- Consistent color scheme
- Smooth navigation transitions
- Responsive layouts
- Custom fonts (Roboto, Source Sans Pro, SF Pro Text)

## Getting Started

### Prerequisites
- Flutter SDK (^3.5.3)
- Dart SDK

### Installation

1. Clone the repository
2. Navigate to the project directory:
   ```bash
   cd laborator_2
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Run the app:
   ```bash
   flutter run
   ```

## Color Palette

- Primary Background: `#FFFFFF` (White)
- Card Background: `#F9FCFE`
- Primary Text: `#191919`
- Secondary Text: `#999999`
- Accent Blue: `#2ABAFF`
- Border Color: `#EDEDED`

## Models

### NewsArticle
- `id`: Unique identifier
- `title`: Article title
- `publisher`: Publisher name
- `publisherLogo`: Publisher logo URL
- `date`: Publication date
- `category`: Article category
- `imageUrl`: Article image URL
- `isVerified`: Publisher verification status

### Publisher
- `id`: Unique identifier
- `name`: Publisher name
- `logo`: Publisher logo URL
- `newsCount`: Number of news articles
- `followersCount`: Number of followers
- `followingCount`: Number of accounts following
- `description`: Publisher description
- `isVerified`: Verification status
- `isFollowing`: Follow status

## Future Enhancements

- [ ] Implement actual API integration
- [ ] Add article detail screen
- [ ] Implement real-time search
- [ ] Add bookmarks/favorites feature
- [ ] Implement user authentication
- [ ] Add push notifications
- [ ] Dark mode support
- [ ] Offline reading capability
- [ ] Share articles functionality
- [ ] Filter by categories

## License

This project is for educational purposes.
