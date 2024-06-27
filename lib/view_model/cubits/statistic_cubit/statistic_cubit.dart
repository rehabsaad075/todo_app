import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/models/statistics_model.dart';
import 'package:todo_app/view_model/data/local/shared_keys.dart';
import 'package:todo_app/view_model/data/local/shared_preferences.dart';
import 'package:todo_app/view_model/data/network/diohelper.dart';
import 'package:todo_app/view_model/data/network/endPoints.dart';

part 'statistic_state.dart';

class StatisticCubit extends Cubit<StatisticState> {
  StatisticCubit() : super(StatisticInitialState());
  static StatisticCubit get(context)=>BlocProvider.of<StatisticCubit>(context);

  StatisticsModel? statisticsModel;
  int total=0;
  Future<void>showStatistics()async {
    emit(ShowStatisticsLoadingState());
    await DioHelper.get(
      endPoint: "${EndPoints.tasks}-${EndPoints.statistics}",
      token: LocalData.get(key: SharedKeys.token),
    ).then((value) {
      statisticsModel=StatisticsModel.fromJson(value.data);
      total= (statisticsModel?.data?.newTask??0)+(statisticsModel?.data?.outdated??0)+(statisticsModel?.data?.doing??0)+(statisticsModel?.data?.completed??0);
      emit(ShowStatisticsSuccessState());
    }).catchError((error){
      if(error is DioException){
        emit(ShowStatisticsErrorState());
        throw error;
      }
    });
  }
}
