import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_task_state.dart';

class UpdateTaskCubit extends Cubit<UpdateTaskState> {
  UpdateTaskCubit() : super(UpdateTaskInitialState());

  static UpdateTaskCubit get(context) => BlocProvider.of<UpdateTaskCubit>(context);

  var titleUpdateController = TextEditingController();
  var taskUpdateController = TextEditingController();
  var startDateUpdateController = TextEditingController();
  var lastDateUpdateController = TextEditingController();

  var formKeyUpdate = GlobalKey<FormState>();
}
