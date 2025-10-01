class Publisher {
  final String id;
  final String name;
  final String logo;
  final String newsCount;
  final String followersCount;
  final String followingCount;
  final String description;
  final bool isVerified;
  final bool isFollowing;

  Publisher({
    required this.id,
    required this.name,
    required this.logo,
    required this.newsCount,
    required this.followersCount,
    required this.followingCount,
    required this.description,
    this.isVerified = false,
    this.isFollowing = false,
  });
}
