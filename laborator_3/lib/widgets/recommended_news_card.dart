import 'package:flutter/material.dart';
import '../models/news_article.dart';
import 'network_image_widget.dart';

class RecommendedNewsCard extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback? onTap;

  const RecommendedNewsCard({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20),
        decoration: BoxDecoration(
          color: const Color(0xFFF9FCFE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                // Header with publisher info
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Container(
                        width: 36,
                        height: 36,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: NetworkImageWidget(
                            imageUrl: article.publisherIcon,
                            width: 36,
                            height: 36,
                            fit: BoxFit.fill,
                            errorWidget: Container(
                              color: Colors.grey[300],
                              child: const Icon(Icons.newspaper, color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                article.publisher,
                                style: const TextStyle(
                                  color: Color(0xFF999999),
                                  fontSize: 18,
                                  fontFamily: 'Source Sans Pro',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              if (article.publisherVerified) ...[
                                const SizedBox(width: 4),
                                const Icon(
                                  Icons.verified,
                                  size: 18,
                                  color: Color(0xFF2ABAFF),
                                ),
                              ],
                            ],
                          ),
                          Text(
                            article.date,
                            style: const TextStyle(
                              color: Color(0xFF999999),
                              fontSize: 16,
                              fontFamily: 'Source Sans Pro',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 22,
                          vertical: 9,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0x14121214),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: const Text(
                          'Follow',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF121214),
                            fontSize: 16,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        Icons.more_vert,
                        color: Color(0xFF999999),
                      ),
                    ],
                  ),
                ),
                // Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    article.title,
                    style: const TextStyle(
                      color: Color(0xFF191919),
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w700,
                      height: 1.40,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Category badge
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF2ABAFF),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      article.category,
                      style: const TextStyle(
                        color: Color(0xFF2ABAFF),
                        fontSize: 14,
                        fontFamily: 'Source Sans Pro',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                // Image
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    width: double.infinity,
                    height: 198,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: NetworkImageWidget(
                        imageUrl: article.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
        ),
      ),
    );
  }
}
