class DSBQueryException implements Exception {
  String error;
  DSBQueryException({ this.error = 'Unknown Error'});
}