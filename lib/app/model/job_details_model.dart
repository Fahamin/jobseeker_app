class JobDetailsModel {
  bool? status;
  String? message;
  Data? data;

  JobDetailsModel({this.status, this.message, this.data});

  JobDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? company;
  String? location;
  String? type;
  Category? category;
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

  Data(
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

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    company = json['company'];
    location = json['location'];
    type = json['type'];
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
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

class Category {
  int? id;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;

  Category(
      {this.id, this.name, this.description, this.createdAt, this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}