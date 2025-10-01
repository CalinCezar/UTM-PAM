import 'package:flutter/material.dart';
import '../data/news_data.dart';
import '../models/publisher.dart';
import '../widgets/recommended_news_card.dart';

class PublisherScreen extends StatefulWidget {
  final String publisherName;

  const PublisherScreen({
    super.key,
    required this.publisherName,
  });

  @override
  State<PublisherScreen> createState() => _PublisherScreenState();
}

class _PublisherScreenState extends State<PublisherScreen> {
  late Publisher publisher;
  bool isFollowing = false;
  String sortBy = 'Newest';

  @override
  void initState() {
    super.initState();
    publisher = NewsData.getPublisher(widget.publisherName);
    isFollowing = publisher.isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    final publisherNews = NewsData.getPublisherNews(widget.publisherName);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xFFEDEDED),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.arrow_back,
                          size: 24,
                          color: Color(0xFF191919),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Text(
                      widget.publisherName.toLowerCase(),
                      style: const TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 22,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(0xFFEDEDED),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.more_vert,
                        size: 24,
                        color: Color(0xFF191919),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Publisher info section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Publisher logo
                    Container(
                      width: 108,
                      height: 108,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        image: DecorationImage(
                          image: AssetImage(publisher.logo),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 28),
                    // Stats
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatColumn(publisher.newsCount, 'News'),
                          _buildStatColumn(publisher.followersCount, 'Followers'),
                          _buildStatColumn(publisher.followingCount, 'Following'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Follow button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFollowing = !isFollowing;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isFollowing ? const Color(0x14121214) : const Color(0xFF121214),
                      padding: const EdgeInsets.symmetric(vertical: 11),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      isFollowing ? 'Following' : 'Follow',
                      style: TextStyle(
                        color: isFollowing ? const Color(0xFF121214) : Colors.white,
                        fontSize: 16,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Publisher name and description
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          publisher.name,
                          style: const TextStyle(
                            color: Color(0xFF191919),
                            fontSize: 24,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (publisher.isVerified) ...[
                          const SizedBox(width: 6),
                          const Icon(
                            Icons.verified,
                            size: 20,
                            color: Color(0xFF2ABAFF),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 12),
                    Text(
                      publisher.description,
                      style: const TextStyle(
                        color: Color(0xFF666666),
                        fontSize: 16,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                        height: 1.62,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // News by Publisher section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'News by Forbes',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Sort and filter controls
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Sort by',
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const Text(
                          ': ',
                          style: TextStyle(
                            color: Color(0xFF999999),
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          sortBy,
                          style: const TextStyle(
                            color: Color(0xFF191919),
                            fontSize: 18,
                            fontFamily: 'Source Sans Pro',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Icon(
                          Icons.keyboard_arrow_down,
                          size: 20,
                          color: Color(0xFF191919),
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.grid_view,
                      size: 24,
                      color: Color(0xFF999999),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.view_list,
                      size: 24,
                      color: Color(0xFF191919),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Search bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 17,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0x4CD9EEF9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 20,
                        color: Color(0xFF666666),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Search "News"',
                        style: TextStyle(
                          color: Color(0xFF666666),
                          fontSize: 18,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // News list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: publisherNews.map((article) {
                    return RecommendedNewsCard(
                      article: article,
                      onTap: () {
                        // Navigate to article details
                      },
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Color(0xFF191919),
            fontSize: 20,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF999999),
            fontSize: 16,
            fontFamily: 'Source Sans Pro',
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
