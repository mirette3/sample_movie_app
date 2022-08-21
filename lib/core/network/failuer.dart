abstract class Failure{
  final String message;

 const Failure({required this.message});
}

class ServerFailure extends Failure{
  ServerFailure({required super.message});
}

class DataBaseFailure extends Failure{
  DataBaseFailure({required super.message});
}