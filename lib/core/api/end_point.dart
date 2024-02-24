class EndPoint {
  static const String baseUrl = 'https://www.googleapis.com/books/v1/';
  static const String bestSellerBooksUrl =
      'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science';
  static const String previewBooksUrl =
      'volumes?Filtering=free-ebooks&q=subject:programming';
  static const String similarBooksUrl =
      'volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming';
}
