import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteInitialState());
  static DeleteCubit get(context)=>BlocProvider.of<DeleteCubit>(context);

  Future<void>deleteTask(int id)async {
    emit(DeleteTaskLoadingState());
    await DioHelper.delete(
      endPoint: '${EndPoints.tasks}/$id',
      token: LocalData.get(key: SharedKeys.token),
    ).then((value) {
      emit(DeleteTaskSuccessState());
    }).catchError((error){
      emit(DeleteTaskErrorState());
      throw error;
    });
  }
}
