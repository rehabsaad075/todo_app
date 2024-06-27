class StatisticsModel {
  Data? data;
  String? message;
  int? status;

  StatisticsModel({this.data, this.message, this.status});

  StatisticsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int ?newTask;
  int ?outdated;
  int ? doing;
  int? completed;
  Data.fromJson(Map<String, dynamic> json) {
    newTask = json['new'];
    outdated = json['outdated'];
    doing = json['doing'];
    completed = json['compeleted'];
  }


 }