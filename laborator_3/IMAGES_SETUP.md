# Image Assets Setup Guide

## Directory Structure

Place your images in the following directory:
```
laborator_3/
└── assets/
    └── images/
        ├── forbes_logo.png
        ├── espn_logo.png
        ├── bbc_logo.png
        ├── nyt_logo.png
        ├── climate_news.jpg
        ├── tech_news.jpg
        ├── business_news.jpg
        ├── sports_news.jpg
        └── placeholder.png
```

## Required Images

### Publisher Logos (Small - 36x36 to 108x108 pixels recommended)
- **forbes_logo.png** - Forbes publisher logo
- **espn_logo.png** - ESPN publisher logo
- **bbc_logo.png** - BBC News publisher logo
- **nyt_logo.png** - The New York Times publisher logo

### News Images (Larger - at least 360x198 pixels recommended)
- **climate_news.jpg** - Image for climate/environment news article
- **tech_news.jpg** - Image for technology news article
- **business_news.jpg** - Image for business/funding news article
- **sports_news.jpg** - Image for sports news article

### Placeholder
- **placeholder.png** - Default placeholder image for missing content

## Image Specifications

### Logo Images
- **Format**: PNG (for transparency support)
- **Recommended sizes**: 
  - Small logos: 36x36 or 48x48 pixels
  - Large logos: 108x108 pixels
- **Background**: Transparent or white

### News Article Images
- **Format**: JPG or PNG
- **Recommended size**: 360x198 pixels or larger (maintain 16:9 aspect ratio)
- **Quality**: Medium to high quality (not too compressed)

## After Adding Images

1. Place all your images in the `assets/images/` folder
2. Make sure the file names match exactly as listed above (case-sensitive)
3. Run the following command to ensure Flutter recognizes the new assets:
   ```bash
   flutter pub get
   ```
4. Hot restart your app (not hot reload) with `r` in the terminal or restart the app

## Alternative: Using Your Own Images

If you want to use different images or filenames, update the paths in:
```
lib/utils/app_assets.dart
```

Example:
```dart
class AppAssets {
  static const String forbesLogo = 'assets/images/your_forbes_image.png';
  // ... update other paths as needed
}
```

## Testing Without Images

If you want to test the app without adding images yet, you can temporarily use colored containers instead. The app is currently configured to use local assets, so you'll need to either:

1. Add the images as described above, OR
2. Modify the widgets to show colored containers/placeholders instead

## Troubleshooting

**Problem**: Images not showing after adding them
- **Solution**: Make sure you ran `flutter pub get` after adding images
- **Solution**: Restart the app completely (hot restart, not hot reload)
- **Solution**: Check that filenames match exactly (case-sensitive)

**Problem**: "Unable to load asset" error
- **Solution**: Verify the file exists in `assets/images/` folder
- **Solution**: Check `pubspec.yaml` has the correct assets configuration
- **Solution**: Ensure there are no typos in filenames

**Problem**: Images look distorted
- **Solution**: Use images with appropriate dimensions (logos: square, news: 16:9 ratio)
- **Solution**: Adjust BoxFit property (cover, contain, fill) in the widget code
