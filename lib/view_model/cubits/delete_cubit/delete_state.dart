part of 'delete_cubit.dart';


abstract class DeleteState {}

class DeleteInitialState extends DeleteState {}

class DeleteTaskLoadingState extends DeleteState {}
class DeleteTaskSuccessState extends DeleteState {}
class DeleteTaskErrorState extends DeleteState {}

