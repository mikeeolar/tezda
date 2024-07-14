import 'package:tezda/core/models/account/account_detail_response.dart';
import 'package:tezda/core/models/account/account_id_response.dart';
import 'package:tezda/core/models/account/account_transactions.dart';
import 'package:tezda/core/utils/exports.dart';

class UtilityService with ListenableServiceMixin {
  // final NavigationService _navigationService = locator<NavigationService>();
  // final DialogService _dialogService = locator<DialogService>();

  bool _signedIn = false;
  bool get signedIn => _signedIn;

  bool _showNav = false;
  bool get showNav => _showNav;

  bool? _isShipmentSuccessfull;
  bool? get isShipmentSuccessfull => _isShipmentSuccessfull;
  set isShipmentSuccessfull(bool? val) {
    _isShipmentSuccessfull = val;
    notifyListeners();
  }

  bool? _isRmbSuccessfull;
  bool? get isRmbSuccessfull => _isRmbSuccessfull;
  set isRmbSuccessfull(bool? val) {
    _isRmbSuccessfull = val;
    notifyListeners();
  }

  String? _description;
  String? get description => _description;
  set description(String? val) {
    _description = val;
    notifyListeners();
  }

  List<AccountDetailData>? _accountDetail;
  List<AccountDetailData>? get accountDetail => _accountDetail;


  double? _rmbAmount;
  double? get rmbAmount => _rmbAmount;

  int? _unifiedBalance;
  int? get unifiedBalance => _unifiedBalance;

  String? _cardLink;
  String? get cardLink => _cardLink;

  AccountTransactionData? _accountTransData;
  AccountTransactionData? get accountTransData => _accountTransData;

  List<AccountIdData>? _accounts;
  List<AccountIdData>? get accounts => _accounts;

  dynamic _escrowBalance;
  dynamic get escrowBalance => _escrowBalance;


  int index = 0;

  UtilityService() {
    listenToReactiveValues([
      _signedIn,
      _showNav,
      index,
      _accounts,
      _accountDetail,
      _escrowBalance,
      _accountTransData,
      _escrowBalance,
      _cardLink,
    ]);
  }

  void setIndex(int val) {
    index = val;
    notifyListeners();
  }

  void setSignedIn(bool val) {
    _signedIn = val;
    notifyListeners();
  }

  void setShowNav(bool val) {
    _showNav = val;
    notifyListeners();
  }

  void setCardLink(String? val) {
    _cardLink = val;
    notifyListeners();
  }

  void setRmbAmount(double? val) {
    _rmbAmount = val;
    notifyListeners();
  }

  void setAccouns(List<AccountIdData>? val) {
    _accounts = val;
    notifyListeners();
  }
}
