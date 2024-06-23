part of 'get_tasks_cubit.dart';

abstract class GetTasksState {}

class GetTasksInitialState extends GetTasksState {}

class GetTasksLoadingState extends GetTasksState {}
class GetTasksSuccessState extends GetTasksState {}
class GetTasksErrorState extends GetTasksState {}

class GetMoreTasksLoadingState extends GetTasksState {}
class GetMoreTasksSuccessState extends GetTasksState {}
class GetMoreTasksErrorState extends GetTasksState {}

class ChangeTaskIndexState extends GetTasksState {}
