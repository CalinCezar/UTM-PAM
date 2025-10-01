class NewsArticle {
  final String id;
  final String title;
  final String publisher;
  final String publisherLogo;
  final String date;
  final String category;
  final String imageUrl;
  final bool isVerified;

  NewsArticle({
    required this.id,
    required this.title,
    required this.publisher,
    required this.publisherLogo,
    required this.date,
    required this.category,
    required this.imageUrl,
    this.isVerified = false,
  });
}
