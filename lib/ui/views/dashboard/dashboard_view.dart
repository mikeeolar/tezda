
// ignore_for_file: deprecated_member_use

import 'package:flutter/scheduler.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:tezda/ui/views/dashboard/favourite/favourite_view.dart';
import 'package:tezda/ui/views/dashboard/home/home_view.dart';
import 'package:tezda/ui/views/dashboard/order/order_view.dart';
import 'package:tezda/ui/views/dashboard/account/account_view.dart';

class DashboardView extends StackedView<DashboardViewModel> {
  const DashboardView({
    Key? key,
    required this.index,
  }) : super(key: key);

  final int index;

  void openMenu() {}

  @override
  void onViewModelReady(DashboardViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      viewModel.setIndex(index);
    });
  }

  @override
  Widget builder(
    BuildContext context,
    DashboardViewModel viewModel,
    Widget? child,
  ) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Utils.lightdarkNav,
      child: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Material(
          child: Stack(
            children: [
              Scaffold(
                backgroundColor: Colors.white,
                body: [
                  const HomeView(),
                  const FavouriteView(),
                  const OrderView(),
                  const AccountView(),
                ].elementAt(viewModel.currentIndex),
                bottomNavigationBar: Container(
                  height: Platform.isIOS ? 100.h : 70.h,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(0.00, -1.00),
                      end: Alignment(0, 1),
                      colors: [
                        Color(0x00798795),
                        Color(0xFFF1FAFF),
                        Color(0xFFF1FAFF)
                      ],
                    ),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    selectedLabelStyle: BrandTextStyles.medium
                        .copyWith(fontSize: 12.sp, color: BrandColors.primary),
                    unselectedLabelStyle: BrandTextStyles.medium
                        .copyWith(fontSize: 12.sp, color: BrandColors.dark50),
                    selectedItemColor: BrandColors.primary,
                    unselectedItemColor: BrandColors.dark,
                    elevation: 0,
                    onTap: viewModel.setIndex,
                    currentIndex: viewModel.currentIndex,
                    items: <BottomNavigationBarItem>[
                      bottomBarItem(
                          context: context,
                          name: 'Home',
                          iconPath: 'home-light'.svg,
                          activeIconPath: 'home-dark'.svg,
                          semanticlabel: 'Home',
                          activeSemanticLabel: 'Home Navigator is Active',
                          active: viewModel.currentIndex == 0),
                      bottomBarItem(
                          context: context,
                          name: 'Favourite',
                          iconPath: 'favourite-light'.svg,
                          activeIconPath: 'favourite-dark'.svg,
                          semanticlabel: 'Favourite',
                          activeSemanticLabel: 'Favourite Navigator is Active',
                          active: viewModel.currentIndex == 1),
                      bottomBarItem(
                          context: context,
                          name: 'Orders',
                          iconPath: 'order-light'.svg,
                          activeIconPath: 'order-dark'.svg,
                          semanticlabel: 'Order',
                          activeSemanticLabel: 'Order Navigator is Active',
                          active: viewModel.currentIndex == 2),
                      bottomBarItem(
                          context: context,
                          name: 'Account',
                          iconPath: 'account_light'.svg,
                          activeIconPath: 'account-dark'.svg,
                          semanticlabel: 'Account',
                          activeSemanticLabel: 'Account Navigator is Active',
                          active: viewModel.currentIndex == 3),
                    ],
                  ),
                ),
              ),
              IgnorePointer(
                ignoring: true,
                child: AnimatedContainer(
                  duration: 300.milliseconds,
                  width: double.infinity,
                  height: double.infinity,
                  color: viewModel.showMenu
                      ? Colors.black.withOpacity(.5)
                      : Colors.transparent,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  DashboardViewModel viewModelBuilder(BuildContext context) =>
      DashboardViewModel();

  BottomNavigationBarItem bottomBarItem(
      {required BuildContext context,
      required String name,
      required String iconPath,
      required String activeIconPath,
      required String semanticlabel,
      required String activeSemanticLabel,
      Color? color,
      required bool active}) {
    return BottomNavigationBarItem(
      label: name,
      icon: Column(
        children: [
          SvgPicture.asset(
            iconPath,
            height: 20.h,
            width: 20.h,
            // color: const Color(0xFF8B8B8B),
            colorFilter: const ColorFilter.mode(Color(0xFF8B8B8B), BlendMode.dstIn),
            semanticsLabel: semanticlabel,
            fit: BoxFit.fill,
          ),
          SizedBox(height: 5.h)
        ],
      ),
      activeIcon: Column(
        children: [
          SvgPicture.asset(
            activeIconPath,
            height: 20.h,
            width: 20.h,
            colorFilter: const ColorFilter.mode(BrandColors.primary, BlendMode.srcIn),
            semanticsLabel: activeSemanticLabel,
          ),
          SizedBox(height: 5.h)
        ],
      ),
    );
  }
}
