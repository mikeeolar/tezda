//This triggers the register device process
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/auth/login/login_viewmodel.dart';
import 'package:tezda/ui/widgets/dialogs/change_password_dialog.dart';

void changePassword({required LoginViewModel model}) {
  final BuildContext context = StackedService.navigatorKey!.currentContext!;
  showDialog(
    context: context,
    builder: (ctx) {
      return ChangePasswordDialog(onComplete: () {
      });
    },
  );
}
