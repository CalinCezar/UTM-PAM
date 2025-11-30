import 'package:get/get.dart';
import '../models/news_article.dart';
import '../models/publisher.dart';
import '../models/user.dart';
import '../services/news_service.dart';

class NewsController extends GetxController {
  // Observable variables
  final _user = Rx<User?>(null);
  final _trendingNews = <NewsArticle>[].obs;
  final _recommendedNews = <NewsArticle>[].obs;
  final _publisherDetails = Rx<Publisher?>(null);
  final _publisherNews = <NewsArticle>[].obs;
  final _isLoading = false.obs;

  // Getters
  User? get user => _user.value;
  List<NewsArticle> get trendingNews => _trendingNews;
  List<NewsArticle> get recommendedNews => _recommendedNews;
  Publisher? get publisherDetails => _publisherDetails.value;
  List<NewsArticle> get publisherNews => _publisherNews;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    try {
      _isLoading.value = true;

      // Load user data
      _user.value = await NewsService.getUser();

      // Load trending news
      _trendingNews.value = await NewsService.getTrendingNews();

      // Load recommended news
      _recommendedNews.value = await NewsService.getRecommendedNews();

      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      print('Error loading data: $e');
    }
  }

  Future<void> loadPublisher(String publisherName) async {
    try {
      _isLoading.value = true;

      // Load publisher details
      _publisherDetails.value = await NewsService.getPublisher(publisherName);

      // Load publisher news
      _publisherNews.value = await NewsService.getPublisherNews(publisherName);

      _isLoading.value = false;
    } catch (e) {
      _isLoading.value = false;
      print('Error loading publisher: $e');
    }
  }


  // Method to toggle bookmark
  void toggleBookmark(int newsId) {
    final index = _publisherNews.indexWhere((news) => news.id == newsId);
    if (index != -1) {
      // Since NewsArticle is immutable, we need to recreate the list
      // For now, just refresh the data
      loadData();
    }
  }

  // Method to toggle following
  void toggleFollowing() {
    if (_publisherDetails.value != null) {
      final currentPublisher = _publisherDetails.value!;
      _publisherDetails.value = Publisher(
        id: currentPublisher.id,
        name: currentPublisher.name,
        icon: currentPublisher.icon,
        newsCount: currentPublisher.newsCount,
        followersCount: currentPublisher.followersCount,
        followingCount: currentPublisher.followingCount,
        description: currentPublisher.description,
        verified: currentPublisher.verified,
        isFollowing: !currentPublisher.isFollowing,
      );
    }
  }
}
