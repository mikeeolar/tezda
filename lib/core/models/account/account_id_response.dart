class AccountIds {
  bool? success;
  String? message;
  List<AccountIdData>? data;

  AccountIds({this.success, this.message, this.data});

  AccountIds.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = <AccountIdData>[];
      json['data'].forEach((v) {
        data!.add(AccountIdData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AccountIdData {
  int? id;
  String? accountId;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  AccountIdData(
      {this.id,
      this.accountId,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  AccountIdData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountId = json['accountId'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['accountId'] = accountId;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}
