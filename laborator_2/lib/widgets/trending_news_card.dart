import 'package:flutter/material.dart';
import '../models/news_article.dart';

class TrendingNewsCard extends StatelessWidget {
  final NewsArticle article;
  final VoidCallback? onTap;

  const TrendingNewsCard({
    super.key,
    required this.article,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 301,
        height: 305,
        decoration: BoxDecoration(
          color: const Color(0xFFF9FCFE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Stack(
          children: [
            // Image
            Positioned(
              left: 8,
              top: 8,
              child: Container(
                width: 285,
                height: 161,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(article.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Category badge
            Positioned(
              left: 18,
              top: 18,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFF2ABAFF),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  article.category,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontFamily: 'Source Sans Pro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            // Title
            Positioned(
              left: 16,
              top: 181,
              child: SizedBox(
                width: 269,
                child: Text(
                  article.title,
                  style: const TextStyle(
                    color: Color(0xFF191919),
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    height: 1.33,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            // Publisher info
            Positioned(
              left: 16,
              top: 265,
              child: Row(
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                        image: AssetImage(article.publisherLogo),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    article.publisher,
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(width: 90),
                  Text(
                    article.date,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0xFF999999),
                      fontSize: 16,
                      fontFamily: 'Source Sans Pro',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
