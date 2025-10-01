import 'package:flutter/material.dart';
import '../data/news_data.dart';
import '../widgets/trending_news_card.dart';
import '../widgets/recommended_news_card.dart';
import 'publisher_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final trendingNews = NewsData.getTrendingNews();
    final recommendedNews = NewsData.getRecommendedNews();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with menu and notification icons
              Padding(
                padding: const EdgeInsets.all(18),
                child: Row(
                  children: [
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
                        Icons.menu,
                        size: 24,
                        color: Color(0xFF191919),
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
                        Icons.notifications_outlined,
                        size: 24,
                        color: Color(0xFF191919),
                      ),
                    ),
                  ],
                ),
              ),
              // Welcome text
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome back, Tyler!',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 26,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Discover a world of news that matters to you',
                      style: TextStyle(
                        color: Color(0xFF999999),
                        fontSize: 18,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Trending news section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Trending news',
                      style: TextStyle(
                        color: Color(0xFF191919),
                        fontSize: 20,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'See all',
                        style: TextStyle(
                          color: Color(0xFF999999),
                          fontSize: 16,
                          fontFamily: 'Source Sans Pro',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              // Trending news horizontal list
              SizedBox(
                height: 305,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  scrollDirection: Axis.horizontal,
                  itemCount: trendingNews.length,
                  separatorBuilder: (context, index) => const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    return TrendingNewsCard(
                      article: trendingNews[index],
                      onTap: () {
                        // Navigate to article details
                      },
                    );
                  },
                ),
              ),
              const SizedBox(height: 32),
              // Recommendation section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  'Recommendation',
                  style: TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Recommended news list
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Column(
                  children: recommendedNews.map((article) {
                    return RecommendedNewsCard(
                      article: article,
                      onTap: () {
                        // Navigate to publisher screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PublisherScreen(
                              publisherName: article.publisher,
                            ),
                          ),
                        );
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
}
