import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:todo_app/view_model/data/local/shared_keys.dart';
// import 'package:todo_app/view_model/data/local/shared_preferences.dart';
// import 'package:todo_app/view_model/data/network/diohelper.dart';
// import 'package:todo_app/view_model/data/network/endPoints.dart';

part 'get_tasks_state.dart';

class GetTasksCubit extends Cubit<GetTasksState> {
  GetTasksCubit() : super(GetTasksInitialState());

  static GetTasksCubit get(context)=>BlocProvider.of<GetTasksCubit>(context);

  
}
