
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/order/order_viewmodel.dart';

class OrderView extends StackedView<OrderViewModel> {
 const OrderView({Key? key}) : super(key: key);

 @override
 Widget builder(BuildContext context, OrderViewModel viewModel, Widget? child) {
   return const Scaffold();
 }

 @override
 OrderViewModel viewModelBuilder(BuildContext context) => OrderViewModel();
}