part of 'statistic_cubit.dart';

abstract class StatisticState {}

class StatisticInitialState extends StatisticState {}

class ShowStatisticsLoadingState extends StatisticState {}
class ShowStatisticsSuccessState extends StatisticState {}
class ShowStatisticsErrorState extends StatisticState {}

