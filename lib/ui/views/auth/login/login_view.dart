import 'package:flutter/scheduler.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/auth/login/login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  const LoginView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(LoginViewModel viewModel) {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      viewModel.setup();
    });
  }

  @override
  Widget builder(
      BuildContext context, LoginViewModel viewModel, Widget? child) {
    final FocusNode node = FocusScope.of(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () => locator<NavigationService>().back(),
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(
                          side: BorderSide(width: 2, color: BrandColors.dark50),
                        ),
                      ),
                      child: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: 33.h),
                  Center(
                    child: Text(
                      'Sign in',
                      style: BrandTextStyles.bold.copyWith(
                          color: const Color(0xFF000B09), fontSize: 24.sp),
                    ),
                  ),
                  SizedBox(height: 48.h),
                  CustomTextField(
                    initalValue: viewModel.user?.loginUsername,
                    label: 'Email Address',
                    hintText: 'Enter email address',
                    onChanged: (value) => viewModel.email = value,
                  ),
                  SizedBox(height: 24.h),
                  CustomTextField(
                    label: 'Password',
                    hintText: 'Enter password',
                    obscure: viewModel.obscurePassword,
                    suffixFunc: () =>
                        viewModel.obscurePassword = !viewModel.obscurePassword,
                    onChanged: (value) => viewModel.password = value,
                  ),
                  SizedBox(height: 8.h),
                  InkWell(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Forgot Password?',
                        style: BrandTextStyles.bold.copyWith(
                            color: const Color(0xFF003930), fontSize: 12.sp),
                      ),
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.25),
                  CustomButton(
                      onTap: () {
                        node.unfocus();
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          viewModel.login();
                        }
                      },
                      title: 'Log In'),
                  SizedBox(height: 12.h),
                  InkWell(
                    onTap: () => viewModel.navigateToCreateAccount(),
                    child: Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Don’t have an account? ',
                              style: BrandTextStyles.medium.copyWith(
                                  color: const Color(0xFF334155),
                                  fontSize: 14.sp),
                            ),
                            TextSpan(
                              text: 'Create an account',
                              style: BrandTextStyles.bold.copyWith(
                                  color: const Color(0xFF003930),
                                  fontSize: 14.sp),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();
}
