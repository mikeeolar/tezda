
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/account/account_viewmodel.dart';
import 'package:tezda/ui/widgets/dialogs/confirm_dialog.dart';

class AccountView extends StackedView<AccountViewModel> {
 const AccountView({Key? key}) : super(key: key);

 @override
 Widget builder(BuildContext context, AccountViewModel viewModel, Widget? child) {
   return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Account',
                      style: BrandTextStyles.bold.copyWith(
                        fontSize: 20.sp,
                        color: BrandColors.dark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50.h),
                InkWell(
                  onTap: () => locator<NavigationService>().navigateTo(Routes.profile),
                  child: Row(
                    children: [
                      SvgPicture.asset('account_light'.svg, height: 20.h),
                      SizedBox(width: 15.w),
                      Text(
                        'Edit Profile',
                        style: BrandTextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: BrandColors.dark,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 35.h),
                 Row(
                  children: [
                    SvgPicture.asset('notification'.svg, height: 20.h),
                    SizedBox(width: 15.w),
                    Text(
                      'Notifications',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: BrandColors.dark,
                      ),
                    ),
                  ],
                ),
                 SizedBox(height: 35.h),
                 Row(
                  children: [
                    SvgPicture.asset('order-light'.svg, height: 20.h),
                    SizedBox(width: 15.w),
                    Text(
                      'Track Order',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: BrandColors.dark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                 Row(
                  children: [
                    SvgPicture.asset('settings'.svg, height: 20.h),
                    SizedBox(width: 15.w),
                    Text(
                      'Settings',
                      style: BrandTextStyles.medium.copyWith(
                        fontSize: 18.sp,
                        color: BrandColors.dark,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 35.h),
                 GestureDetector(
                  onTap: () {
                    showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (ctx) => ConfimDialog(
                              title: 'Are you sure you want\nto logout?',
                              textButton: 'Yes, Logout',
                              onComplete: () {
                                Navigator.of(context).pop();
                                locator<NavigationService>()
                                    .clearStackAndShow(Routes.login);
                              }),
                        );
                  },
                   child: Row(
                    children: [
                      SvgPicture.asset('logout'.svg, height: 20.h),
                      SizedBox(width: 15.w),
                      Text(
                        'Log out',
                        style: BrandTextStyles.medium.copyWith(
                          fontSize: 18.sp,
                          color: BrandColors.dark,
                        ),
                      ),
                    ],
                                   ),
                 ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
 }

 @override
 AccountViewModel viewModelBuilder(BuildContext context) => AccountViewModel();
}