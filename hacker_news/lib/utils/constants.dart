class Constant {
  static String topStoriesUrl =
      "https://hacker-news.firebaseio.com/v0/topstories.json?print=pretty";

  static String getStoryUrl(int storyId) {
    return "https://hacker-news.firebaseio.com/v0/item/$storyId.json?print=pretty";
  }
}
