class Publisher {
  final int id;
  final String name;
  final String icon;
  final bool verified;
  final String newsCount;
  final String followersCount;
  final String followingCount;
  final String description;
  final bool isFollowing;

  Publisher({
    required this.id,
    required this.name,
    required this.icon,
    required this.verified,
    required this.newsCount,
    required this.followersCount,
    required this.followingCount,
    required this.description,
    required this.isFollowing,
  });

  factory Publisher.fromJson(Map<String, dynamic> json) {
    // Check if stats is nested (newsAppDetails format)
    if (json.containsKey('stats')) {
      final stats = json['stats'] as Map<String, dynamic>?;
      return Publisher(
        id: 1, // Default id for publishers from newsAppDetails
        name: json['name'] as String? ?? '',
        icon: json['logo'] as String? ?? '',
        verified: json['verified'] as bool? ?? false,
        newsCount: (stats?['news_count'] ?? '0').toString(),
        followersCount: (stats?['followers'] ?? '0').toString(),
        followingCount: (stats?['following'] ?? '0').toString(),
        description: json['bio'] as String? ?? '',
        isFollowing: json['is_following'] as bool? ?? false,
      );
    }
    // Standard format (if we add publishers array to newsAppJson)
    return Publisher(
      id: json['id'] as int,
      name: json['name'] as String,
      icon: json['icon'] as String,
      verified: json['verified'] as bool,
      newsCount: json['news_count'].toString(),
      followersCount: json['followers_count'].toString(),
      followingCount: json['following_count'].toString(),
      description: json['description'] as String,
      isFollowing: json['is_following'] as bool,
    );
  }
}
