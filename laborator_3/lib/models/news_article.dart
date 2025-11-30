class NewsArticle {
  final int id;
  final String title;
  final String publisher;
  final String publisherIcon;
  final bool publisherVerified;
  final String date;
  final String category;
  final String image;
  final bool? isFollowing;
  final bool? isBookmarked;

  NewsArticle({
    required this.id,
    required this.title,
    required this.publisher,
    required this.publisherIcon,
    required this.publisherVerified,
    required this.date,
    required this.category,
    required this.image,
    this.isFollowing,
    this.isBookmarked,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      id: json['id'] as int,
      title: json['title'] as String,
      publisher: json['publisher'] as String,
      publisherIcon: json['publisher_icon'] as String? ?? '',
      publisherVerified: json['publisher_verified'] as bool? ?? json['is_verified'] as bool? ?? false,
      date: json['date'] as String,
      category: json['category'] as String,
      image: json['image'] as String,
      isFollowing: json['is_following'] as bool?,
      isBookmarked: json['is_bookmarked'] as bool?,
    );
  }
}
