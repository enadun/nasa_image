class AppConstants {
  static const apiKey = 'API_KEY';
  static const baseUrl = 'https://api.nasa.gov/mars-photos';
  static Endpoints get endPoints => Endpoints();
}

class Endpoints {
  final roverPhotos = '/api/v1/rovers/curiosity/photos';
}
