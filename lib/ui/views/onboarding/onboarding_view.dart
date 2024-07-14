import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/onboarding/onboarding_viewmodel.dart';

class OnboardingView extends StackedView<OnboardingViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
      BuildContext context, OnboardingViewModel viewModel, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Utils.dark,
      child: Scaffold(
        backgroundColor: const Color(0xFFd7d4ff),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Welcome',
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.extraBold.copyWith(fontSize: 30.sp),
                ),
                Text(
                  'Tezda Shopping House',
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.medium.copyWith(fontSize: 20.sp),
                ),
                Image.asset(
                  'onbg'.png,
                  height: 400.h,
                ),
                SizedBox(height: 58.h),
                CustomButton(
                  onTap: () => viewModel.navigateCreateAccount(),
                  title: 'Sign Up',
                  textColor: Colors.white,
                  backgroundColor: BrandColors.primary,
                ),
                SizedBox(height: 20.h),
                CustomButton(
                  onTap: () => viewModel.navigateToLogin(),
                  title: 'Log In',
                  textColor: BrandColors.dark,
                  backgroundColor: BrandColors.secondary,
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  OnboardingViewModel viewModelBuilder(BuildContext context) =>
      OnboardingViewModel();
}
