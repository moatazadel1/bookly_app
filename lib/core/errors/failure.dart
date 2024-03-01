import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure({required this.errMessage});
}

class ServerFailure extends Failure {
  ServerFailure({required super.errMessage});

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(errMessage: 'connection timeout with server');

      case DioExceptionType.sendTimeout:
        return ServerFailure(errMessage: 'send timeout send timeout');
      case DioExceptionType.receiveTimeout:
        return ServerFailure(errMessage: 'receive timeout send timeout');
      case DioExceptionType.badCertificate:
        return ServerFailure(errMessage: 'bad certificate');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode!, dioException.response!.data);
      case DioExceptionType.cancel:
        return ServerFailure(errMessage: 'request to server cancelled');
      case DioExceptionType.connectionError:
        // if (dioException.message!.contains('SocketExceptions')) {
        //   return ServerFailure(errMessage: 'No Internet Connection');
        // }

        return ServerFailure(errMessage: 'connection error');
      case DioExceptionType.unknown:
        return ServerFailure(errMessage: 'Opps there was an error, try again');
      default:
        return ServerFailure(errMessage: 'Opps there was an error, try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(errMessage: response['error']['message']);
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Your request not found, try later');
    } else if (statusCode == 500) {
      return ServerFailure(errMessage: 'Internet server error, try later');
    } else {
      return ServerFailure(errMessage: 'Opps there was an error, try again');
    }
  }
}
