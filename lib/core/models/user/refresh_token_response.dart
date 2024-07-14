class RefreshTokenResponse {
  RefreshTokenData? data;
  String? code;
  String? message;
  bool? isSuccessful;

  RefreshTokenResponse({this.data, this.code, this.message, this.isSuccessful});

  RefreshTokenResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? RefreshTokenData.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
    isSuccessful = json['isSuccessful'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = code;
    data['message'] = message;
    data['isSuccessful'] = isSuccessful;
    return data;
  }
}

class RefreshTokenData {
  String? accessToken;
  String? tokenType;
  String? expiresIn;
  String? refreshToken;

  RefreshTokenData(
      {this.accessToken,
      this.tokenType,
      this.expiresIn,
      this.refreshToken});

  RefreshTokenData.fromJson(Map<String, dynamic> json) {
    accessToken = json['accessToken'];
    tokenType = json['tokenType'];
    expiresIn = json['expiresIn'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['accessToken'] = accessToken;
    data['tokenType'] = tokenType;
    data['expiresIn'] = expiresIn;
    data['refreshToken'] = refreshToken;
    return data;
  }
}
