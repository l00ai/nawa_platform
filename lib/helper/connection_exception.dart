
class ConnectionException implements Exception{
  final String message;
  ConnectionException({this.message = 'لا يوجد إتصال بالإنترنت'});
}