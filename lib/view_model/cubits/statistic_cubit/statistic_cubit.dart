import 'package:flutter_bloc/flutter_bloc.dart';

part 'statistic_state.dart';

class StatisticCubit extends Cubit<StatisticState> {
  StatisticCubit() : super(StatisticInitialState());
  static StatisticCubit get(context)=>BlocProvider.of<StatisticCubit>(context);
}
