import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/account/profile/profile_viewmodel.dart';
import 'package:tezda/ui/widgets/custom_network_image.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  static GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void onViewModelReady(ProfileViewModel viewModel) {
    viewModel.setup();
  }

  @override
  Widget builder(
      BuildContext context, ProfileViewModel viewModel, Widget? child) {
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
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
                      Center(
                    child: Text(
                      'Edit Profile',
                      style: BrandTextStyles.bold.copyWith(
                          color: const Color(0xFF000B09), fontSize: 24.sp),
                    ),
                  ),
                  const SizedBox(),
                    ],
                  ),
                  SizedBox(height: 23.h),
                  
                  SizedBox(height: 28.h),
                  Center(
                    child: Container(
                      width: 150.h,
                      height: 150.h,
                      decoration: const ShapeDecoration(
                        shape: CircleBorder(
                          side: BorderSide(width: 2, color: BrandColors.dark50),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(200.r),
                        child: CustomNetworkImage(
                          imageUrl: viewModel.user?.avatar,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  CustomTextField(
                    label: 'Name',
                    controller: viewModel.nameCtrl,
                    hintText: 'Enter your name',
                    type: TextFieldType.name,
                    inputType: TextInputType.name,
                  ),
                  SizedBox(height: 20.h),
                  CustomTextField(
                    label: 'Email Address',
                    hintText: 'Enter email address',
                    controller: viewModel.emailCtrl,
                    type: TextFieldType.email,
                    inputType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.15),
                  CustomButton(
                      onTap: () {
                        node.unfocus();
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          viewModel.updateAccount();
                        }
                      },
                      title: 'Save'),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProfileViewModel viewModelBuilder(BuildContext context) => ProfileViewModel();
}
