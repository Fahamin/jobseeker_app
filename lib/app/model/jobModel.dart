class JobModel {
  bool? status;
  String? message;
  int? count;
  List<Jobcatlist>? jobcatlist;

  JobModel({this.status, this.message, this.count, this.jobcatlist});

  JobModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    count = json['count'];
    if (json['jobcatlist'] != null) {
      jobcatlist = <Jobcatlist>[];
      json['jobcatlist'].forEach((v) {
        jobcatlist!.add(new Jobcatlist.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.jobcatlist != null) {
      data['jobcatlist'] = this.jobcatlist!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Jobcatlist {
  int? id;
  String? title;
  String? company;
  String? location;
  String? type;
  String? category;
  String? salary;
  String? description;
  List<String>? requirements;
  String? image;
  String? pdf;
  String? publishdate;
  String? dateline;
  bool? isActive;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  Jobcatlist(
      {this.id,
        this.title,
        this.company,
        this.location,
        this.type,
        this.category,
        this.salary,
        this.description,
        this.requirements,
        this.image,
        this.pdf,
        this.publishdate,
        this.dateline,
        this.isActive,
        this.categoryId,
        this.createdAt,
        this.updatedAt});

  Jobcatlist.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    company = json['company'];
    location = json['location'];
    type = json['type'];
    category = json['category'];
    salary = json['salary'];
    description = json['description'];
    requirements = json['requirements'].cast<String>();
    image = json['image'];
    pdf = json['pdf'];
    publishdate = json['publishdate'];
    dateline = json['dateline'];
    isActive = json['is_active'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['company'] = this.company;
    data['location'] = this.location;
    data['type'] = this.type;
    data['category'] = this.category;
    data['salary'] = this.salary;
    data['description'] = this.description;
    data['requirements'] = this.requirements;
    data['image'] = this.image;
    data['pdf'] = this.pdf;
    data['publishdate'] = this.publishdate;
    data['dateline'] = this.dateline;
    data['is_active'] = this.isActive;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}