class AccountTransactions {
  bool? success;
  String? message;
  AccountTransactionData? data;

  AccountTransactions({this.success, this.message, this.data});

  AccountTransactions.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    data = json['data'] != null ? AccountTransactionData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class AccountTransactionData {
  Paging? paging;
  List<AccountTrans>? data;

  AccountTransactionData({this.paging, this.data});

  AccountTransactionData.fromJson(Map<String, dynamic> json) {
    paging =
        json['paging'] != null ? Paging.fromJson(json['paging']) : null;
    if (json['data'] != null) {
      data = <AccountTrans>[];
      json['data'].forEach((v) {
        data!.add(AccountTrans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (paging != null) {
      data['paging'] = paging!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Paging {
  int? total;
  int? page;
  dynamic previous;
  String? next;

  Paging({this.total, this.page, this.previous, this.next});

  Paging.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    page = json['page'];
    previous = json['previous'];
    next = json['next'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total'] = total;
    data['page'] = page;
    data['previous'] = previous;
    data['next'] = next;
    return data;
  }
}

class AccountTrans {
  String? sId;
  String? type;
  int? amount;
  String? narration;
  String? date;
  int? balance;
  String? currency;

  AccountTrans(
      {this.sId,
      this.type,
      this.amount,
      this.narration,
      this.date,
      this.balance,
      this.currency});

  AccountTrans.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    amount = json['amount'];
    narration = json['narration'];
    date = json['date'];
    balance = json['balance'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['type'] = type;
    data['amount'] = amount;
    data['narration'] = narration;
    data['date'] = date;
    data['balance'] = balance;
    data['currency'] = currency;
    return data;
  }
}
