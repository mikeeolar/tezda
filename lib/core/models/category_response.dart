class CategoryResponse {
  int? id;
  String? name;
  String? image;
  String? creationAt;
  String? updatedAt;

  CategoryResponse(
      {this.id, this.name, this.image, this.creationAt, this.updatedAt});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    creationAt = json['creationAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['creationAt'] = creationAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
