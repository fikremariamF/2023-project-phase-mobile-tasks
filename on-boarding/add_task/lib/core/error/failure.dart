import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure([List properties= const <dynamic>[]]);
}

class ServerFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class CacheFailure extends Failure {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class UnknownFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class NetworkFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}

