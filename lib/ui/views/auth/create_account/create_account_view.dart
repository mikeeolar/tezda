import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/auth/create_account/create_account_viewmodel.dart';

class CreateAccountView extends StackedView<CreateAccountViewModel> {
  const CreateAccountView({Key? key}) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onViewModelReady(CreateAccountViewModel viewModel) {}

  @override
  Widget builder(
      BuildContext context, CreateAccountViewModel viewModel, Widget? child) {
    final FocusNode node = FocusScope.of(context);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Utils.darkWhiteNav,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
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
                SizedBox(height: 20.h),
                Text(
                  'Sign Up',
                  style: BrandTextStyles.medium.copyWith(
                    color: const Color(0xFF000B09),
                    fontSize: 24.sp,
                  ),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 12.h),
                      Text(
                        'Create an account to get started',
                        style: BrandTextStyles.medium.copyWith(
                            color: const Color(0xFF64748B), fontSize: 16.sp),
                      ),
                      SizedBox(height: 40.h),
                      CustomTextField(
                        controller: viewModel.nameCtrl,
                        onChanged: (value) => viewModel.name = value,
                        label: 'Name',
                        hintText: 'Name',
                        type: TextFieldType.name,
                        inputType: TextInputType.name,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        controller: viewModel.emailCtrl,
                        onChanged: (value) => viewModel.email = value,
                        label: 'Email Address',
                        hintText: 'Email Address',
                        type: TextFieldType.email,
                        inputType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        label: 'Password',
                        hintText: 'Enter password',
                        obscure: viewModel.obscurePassword,
                        suffixFunc: () => viewModel.obscurePassword =
                            !viewModel.obscurePassword,
                        onChanged: (value) => viewModel.password = value,
                      ),
                      SizedBox(height: 70.h),
                      CustomButton(
                        onTap: () {
                          node.unfocus();
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            viewModel.createUser();
                          }
                        },
                        title: 'Sign Up',
                      ),
                      SizedBox(height: 12.h),
                      InkWell(
                        onTap: () => viewModel.navigateToLogin(),
                        child: Center(
                          child: Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Have an account? ',
                                  style: BrandTextStyles.medium.copyWith(
                                      color: const Color(0xFF334155),
                                      fontSize: 14.sp),
                                ),
                                TextSpan(
                                  text: 'Log In',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  CreateAccountViewModel viewModelBuilder(BuildContext context) =>
      CreateAccountViewModel();
}
