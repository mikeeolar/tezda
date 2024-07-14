class FormattedResponse {
  final bool success;
  final bool? deviceRegistered;
  final dynamic data;
  final String? responseCodeError;
  final String? errors;
  final String? message;

  FormattedResponse(
      {required this.success,
      this.deviceRegistered,
      this.data,
      this.message,
      this.responseCodeError,
      this.errors});
}
