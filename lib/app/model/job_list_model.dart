class JobListModel {
  bool? status;
  String? message;
  List<Joblist>? joblist;

  JobListModel({this.status, this.message, this.joblist});

  JobListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['joblist'] != null) {
      joblist = <Joblist>[];
      json['joblist'].forEach((v) {
        joblist!.add(new Joblist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.joblist != null) {
      data['joblist'] = this.joblist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Joblist {
  int? id;
  String? title;
  String? image;
  String? salary;
  String? location;
  String? company;
  String? dateline;
  int? categoryId;
  Category? category;

  Joblist(
      {this.id,
        this.title,
        this.image,
        this.salary,
        this.location,
        this.company,
        this.dateline,
        this.categoryId,
        this.category});

  Joblist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    salary = json['salary'];
    location = json['location'];
    company = json['company'];
    dateline = json['dateline'];
    categoryId = json['category_id'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['salary'] = this.salary;
    data['location'] = this.location;
    data['company'] = this.company;
    data['dateline'] = this.dateline;
    data['category_id'] = this.categoryId;
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    return data;
  }
}

class Category {
  int? id;
  String? name;

  Category({this.id, this.name});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}