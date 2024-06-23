part of 'update_task_cubit.dart';

abstract class UpdateTaskState {}

class UpdateTaskInitialState extends UpdateTaskState {}

class UpdateTaskLoadingState extends UpdateTaskState {}
class UpdateTaskSuccessState extends UpdateTaskState {}
class UpdateTaskErrorState extends UpdateTaskState {}

class ShowSingleTaskLoadingState extends UpdateTaskState {}
class ShowSingleTaskSuccessState extends UpdateTaskState {}
class ShowSingleTaskErrorState extends UpdateTaskState {}

class SelectedTaskTypeState extends UpdateTaskState {}

