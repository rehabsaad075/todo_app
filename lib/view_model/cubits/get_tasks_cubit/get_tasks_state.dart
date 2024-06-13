part of 'get_tasks_cubit.dart';

abstract class GetTasksState {}

class GetTasksInitialState extends GetTasksState {}

class GetTasksLoadingState extends GetTasksState {}
class GetTasksSuccessState extends GetTasksState {}
class GetTasksErrorState extends GetTasksState {}
