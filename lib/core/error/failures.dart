import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final response;
  Failure([this.response]);
  @override
  List<Object> get props => [response];
}

class ServerFailure extends Failure {
  final error;
  ServerFailure([this.error]) : super(error);
}
