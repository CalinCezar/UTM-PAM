import '../models/news_article.dart';
import '../models/publisher.dart';
import '../utils/app_assets.dart';

class NewsData {
  static List<NewsArticle> getTrendingNews() {
    return [
      NewsArticle(
        id: '1',
        title: 'Global Summit on Climate Change: Historic Agreement Reached',
        publisher: 'BBC News',
        publisherLogo: AppAssets.forbesLogo,
        date: 'Jun 9, 2023',
        category: 'Environment',
        imageUrl: AppAssets.news1,
        isVerified: true,
      ),
      NewsArticle(
        id: '2',
        title: 'Tech Giant Unveils Revolutionary AI-powered Device',
        publisher: 'The NYT',
        publisherLogo: AppAssets.forbesLogo,
        date: 'Jun 10, 2023',
        category: 'Technology',
        imageUrl: AppAssets.news2,
        isVerified: true,
      ),
    ];
  }

  static List<NewsArticle> getRecommendedNews() {
    return [
      NewsArticle(
        id: '3',
        title: 'Tech Startup Secures \$50 Million Funding for Expansion',
        publisher: 'Forbes',
        publisherLogo: AppAssets.forbesLogo,
        date: 'Jun 11, 2023',
        category: 'Business',
        imageUrl: AppAssets.recommendation,
        isVerified: true,
      ),
      NewsArticle(
        id: '4',
        title: 'Star Athlete Breaks World Record in Olympic Event',
        publisher: 'ESPN',
        publisherLogo: AppAssets.forbesLogo,
        date: 'Jun 10, 2023',
        category: 'Sports',
        imageUrl: AppAssets.recommendation,
        isVerified: true,
      ),
    ];
  }

  static Publisher getPublisher(String name) {
    if (name == 'Forbes') {
      return Publisher(
        id: 'forbes',
        name: 'Forbes',
        logo: AppAssets.forbesLogo,
        newsCount: '6.8k',
        followersCount: '2.5k',
        followingCount: '100',
        description: 'Empowering your business journey with expert insights and influential perspectives.',
        isVerified: true,
        isFollowing: false,
      );
    }
    return Publisher(
      id: 'default',
      name: 'Default Publisher',
      logo: AppAssets.forbesLogo,
      newsCount: '0',
      followersCount: '0',
      followingCount: '0',
      description: 'No description available.',
      isVerified: false,
      isFollowing: false,
    );
  }

  static List<NewsArticle> getPublisherNews(String publisherName) {
    return [
      NewsArticle(
        id: '5',
        title: 'Tech Startup Secures \$50 Million Funding for Expansion',
        publisher: publisherName,
        publisherLogo: AppAssets.forbesLogo,
        date: 'Jun 11, 2023',
        category: 'Business',
        imageUrl: AppAssets.recommendation,
        isVerified: true,
      ),
    ];
  }
}
