var newsAppJson = {
  "user": {
    "name": "Tyler",
    "profile_image": "https://randomuser.me/api/portraits/men/85.jpg",
    "notification_count": 3
  },
  "trending_news": [
    {
      "id": 1,
      "category": "Environment",
      "title": "Global Summit on Climate Change: Historic Agreement Reached",
      "publisher": "BBC News",
      "publisher_icon": "https://www.shutterstock.com/image-vector/isolated-vector-illustration-bbc-logo-600nw-2392143111.jpg",
      "image": "https://images.pexels.com/photos/572897/pexels-photo-572897.jpeg",
      "date": "Jun 9, 2023",
      "is_verified": true
    },
    {
      "id": 2,
      "category": "Technology",
      "title": "Tech Giant Unveils New AI-powered Smartphone",
      "publisher": "The New York Times",
      "publisher_icon": "https://hinsdalelibrary.info/wp-content/uploads/2022/10/nyt-app-logo-300x300-1.jpeg",
      "image": "https://images.pexels.com/photos/669619/pexels-photo-669619.jpeg",
      "date": "Jun 8, 2023",
      "is_verified": true
    }
  ],
  "recommendations": [
    {
      "id": 101,
      "publisher": "Forbes",
      "publisher_icon": "https://cdn.worldvectorlogo.com/logos/forbes-2.svg",
      "publisher_verified": true,
      "date": "Jun 11, 2023",
      "title": "Tech Startup Secures \$50 Million Funding for Expansion",
      "category": "Business",
      "is_following": false,
      "image": "https://www.investopedia.com/thmb/YX7JoE_w-rJeYmBO0eTTdu82m_k=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/FORBES-FINAL-resized-f0f05ea3f3ce49529c325fd4c720d41b.jpg"
    },
    {
      "id": 102,
      "publisher": "Bloomberg",
      "publisher_icon": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4qIR_ungfJBHja4c3qU-wG62W-lfU6t4NFA&s",
      "publisher_verified": true,
      "date": "Jun 10, 2023",
      "title": "Global Markets Rally as Inflation Shows Signs of Cooling",
      "category": "Finance",
      "is_following": true,
      "image": "https://images.pexels.com/photos/210607/pexels-photo-210607.jpeg"
    }
  ]
};

var newsAppDetails = {
  "publisher": {
    "username": "forbesnews",
    "name": "Forbes",
    "verified": true,
    "logo": "https://cdn.worldvectorlogo.com/logos/forbes-2.svg",
    "bio": "Empowering your business journey with expert insights and influential perspectives.",
    "stats": {
      "news_count": "6.8k",
      "followers": "2.5k",
      "following": 100
    },
    "is_following": false
  },
  "filters": {
    "sort_by": ["Newest", "Oldest", "Most Popular"],
    "active_sort": "Newest",
    "view_mode": "list"
  },
  "news": [
    {
      "id": 301,
      "title": "Tech Startup Secures \$50 Million Funding for Expansion",
      "category": "Business",
      "date": "Jun 11, 2023",
      "publisher": "Forbes",
      "publisher_verified": true,
      "image": "https://t4.ftcdn.net/jpg/03/00/14/39/360_F_300143961_8kJTPiTbWallCIBxO0GQzoxgwE9cIRGG.jpg",
      "stats": {
        "likes": 1240,
        "comments": 98,
        "shares": 56
      },
      "is_bookmarked": false
    },
    {
      "id": 302,
      "title": "Global CEOs Predict Market Growth in 2024",
      "category": "Finance",
      "date": "Jun 10, 2023",
      "publisher": "Forbes",
      "publisher_verified": true,
      "image": "https://cdn.pixabay.com/photo/2018/02/08/10/22/desk-3139127_1280.jpg",
      "stats": {
        "likes": 980,
        "comments": 76,
        "shares": 40
      },
      "is_bookmarked": true
    }
  ]
}
;