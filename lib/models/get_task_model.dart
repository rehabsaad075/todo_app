class GetTaskModel {
  Data? data;
  String? message;
  int? status;

  GetTaskModel({this.data, this.message,this.status});

  GetTaskModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
    message = json['message'];
    status = json['status'];
  }

}

class Data {
  int? id;
  String? title;
  String? description;
  String? image;
  String? startDate;
  String? endDate;
  String? status;

  Data(
      {this.id,
        this.title,
        this.description,
        this.image,
        this.startDate,
        this.endDate,
        this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] =id;
    data['title'] =title;
    data['description'] =description;
    data['image'] =image;
    data['start_date'] =startDate;
    data['end_date'] =endDate;
    data['status'] =status;
    return data;
  }
}