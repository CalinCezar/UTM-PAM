class User {
  final String name;
  final String profileImage;
  final int notificationCount;

  User({
    required this.name,
    required this.profileImage,
    required this.notificationCount,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'] as String,
      profileImage: json['profile_image'] as String,
      notificationCount: json['notification_count'] as int? ?? 0,
    );
  }
}
