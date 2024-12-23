
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable{}

class OfflineFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => []; //implement hash code for comparing objects for not rebuild the same in state

}
class ServerFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class EmptyCacheFailure extends Failure{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}