# News App - Two Pages Structure

## Your App Has 2 Pages! 🎉

### Page 1: Home Screen (`home_screen.dart`)
**What it shows:**
- Welcome message: "Welcome back, Tyler!"
- Trending news section (horizontal scroll)
  - Environment news (news1.png)
  - Technology news (news2.png)
- Recommendation section (vertical scroll)
  - Forbes article with recommendation image
  - ESPN article with recommendation image

**How to navigate to Page 2:**
- Tap on any article card in the "Recommendation" section
- This will take you to the Publisher Screen

---

### Page 2: Publisher Screen (`publisher_screen.dart`)
**What it shows:**
- Back button to return to Home
- Publisher name: "forbesnews"
- Publisher logo (logo_F.png)
- Publisher stats: 6.8k News, 2.5k Followers, 100 Following
- Follow button (toggles between Follow/Following)
- Forbes verified badge
- Description: "Empowering your business journey with expert insights and influential perspectives."
- "News by Forbes" section
- Sort by: Newest dropdown
- Search bar
- List of news articles from Forbes

**How to navigate back to Page 1:**
- Tap the back arrow button at top-left
- Or use system back button

---

## Your Images are Located Here:

```
assets/images/
├── logo_F.png          # Forbes logo (used on publisher page)
├── news1.png           # Environment/Climate news image
├── news2.png           # Technology news image
└── recomandation.png   # Business news image (used in recommendations)
```

---

## Navigation Flow:

```
┌─────────────────────┐
│   Home Screen       │
│  (Page 1)           │
│                     │
│  - Trending News    │
│  - Recommendations  │
└──────────┬──────────┘
           │
           │ Tap on recommended article
           ▼
┌─────────────────────┐
│ Publisher Screen    │
│  (Page 2)           │
│                     │
│  - Forbes Profile   │
│  - News List        │
└──────────┬──────────┘
           │
           │ Tap back button
           ▼
     Back to Page 1
```

---

## How to Test Navigation:

1. **Start on Home Screen** - You'll see "Welcome back, Tyler!" 
2. **Scroll down** to the "Recommendation" section
3. **Tap any article card** (e.g., "Tech Startup Secures $50 Million...")
4. **You'll navigate to the Publisher Screen** showing Forbes profile
5. **Tap the back arrow** at the top-left to return to Home Screen

---

## Key Features of Each Page:

### Home Screen Features:
✅ Menu and notification icons
✅ Welcome message
✅ Trending news horizontal scroll
✅ Recommendation cards
✅ Navigation to publisher profiles

### Publisher Screen Features:
✅ Back navigation
✅ Publisher profile with logo
✅ Stats (News, Followers, Following)
✅ Follow/Following toggle button
✅ Verified badge
✅ Description text
✅ Search functionality
✅ Sort options
✅ List of publisher's news articles

---

## Your App is Working! 

Both pages are fully functional and connected. Just tap on any recommended news article to see the navigation in action! 🚀
