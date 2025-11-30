import '../models/news_article.dart';
import '../models/publisher.dart';
import '../models/user.dart';
import '../data/v4.dart';

class NewsService {
  static Map<String, dynamic> _getData() {
    return newsAppJson;
  }

  static Map<String, dynamic> _getDetailsData() {
    return newsAppDetails;
  }

  static Future<List<NewsArticle>> getTrendingNews() async {
    final data = _getData();
    final List<dynamic> trending = data['trending_news'];
    return trending.map((json) => NewsArticle.fromJson(json)).toList();
  }

  static Future<List<NewsArticle>> getRecommendedNews() async {
    final data = _getData();
    final List<dynamic> recommended = data['recommendations'];
    return recommended.map((json) => NewsArticle.fromJson(json)).toList();
  }

  static Future<Publisher?> getPublisher(String name) async {
    // For now, we only have Forbes in newsAppDetails
    if (name.toLowerCase() == 'forbes') {
      final data = _getDetailsData();
      final publisherData = data['publisher'];
      if (publisherData != null) {
        return Publisher.fromJson(publisherData);
      }
    }
    return null;
  }

  static Future<List<NewsArticle>> getPublisherNews(String publisherName) async {
    // Check if we have details for this publisher
    if (publisherName.toLowerCase() == 'forbes') {
      final data = _getDetailsData();
      final List<dynamic> news = data['news'];
      final publisherData = data['publisher'];
      final String publisherIcon = publisherData['logo'] as String? ?? '';
      
      // Add publisher_icon to each news item if missing
      return news.map((json) {
        final newsMap = Map<String, dynamic>.from(json);
        if (!newsMap.containsKey('publisher_icon') || newsMap['publisher_icon'] == null) {
          newsMap['publisher_icon'] = publisherIcon;
        }
        return NewsArticle.fromJson(newsMap);
      }).toList();
    }
    
    // Otherwise, search in trending and recommendations
    final data = _getData();
    final List<dynamic> allNews = [
      ...data['trending_news'],
      ...data['recommendations'],
    ];
    
    return allNews
        .where((article) => article['publisher'].toString().toLowerCase() == publisherName.toLowerCase())
        .map((json) => NewsArticle.fromJson(json))
        .toList();
  }

  static Future<User?> getUser() async {
    final data = _getData();
    final userData = data['user'];
    if (userData != null) {
      return User.fromJson(userData);
    }
    return null;
  }
}
