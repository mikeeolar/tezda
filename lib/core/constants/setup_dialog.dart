import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/widgets/dialogs/loader_dialog.dart';
import 'package:tezda/ui/widgets/dialogs/loading_dialog.dart';
import 'package:tezda/ui/widgets/dialogs/success_dialog.dart';


void setupDialog() {
  final DialogService dialogService = locator<DialogService>();

  final builders = {
    DialogType.loader: (context, sheetRequest, completer) => LoaderDialog(request: sheetRequest as DialogRequest),
    DialogType.loading: (context, sheetRequest, completer) =>
        LoadingDialog(request: sheetRequest as DialogRequest),
    DialogType.success: (context, sheetRequest, completer) => SuccessDialog(
      request: sheetRequest as DialogRequest,
      completer: completer as Function,
    ),
  };

  dialogService.registerCustomDialogBuilders(builders);
}