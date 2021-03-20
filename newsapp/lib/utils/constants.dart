class Constants {
  static String TOP_HEADLINES_URL =
      "https://newsapi.org/v2/top-headlines?country=in&apiKey=75f8bb3e82c746bb9c413ce214a83317";

  static String headlinesByKeywordURL(String keyword) {
    return "https://newsapi.org/v2/top-headlines?q=$keyword&apiKey=75f8bb3e82c746bb9c413ce214a83317";
  }
}
