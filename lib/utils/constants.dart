

class Constants {
  static Uri TOP_HEADLINES_URL =  Uri.parse("https://newsapi.org/v2/top-headlines?country=us&apiKey=b7296da737a24219bdca7ad02669ba89");

  static Uri headlinesFor(String keyword) {
    return Uri.parse(
        "https://newsapi.org/v2/everything?q=$keyword&apiKey=b7296da737a24219bdca7ad02669ba89");
  }
}