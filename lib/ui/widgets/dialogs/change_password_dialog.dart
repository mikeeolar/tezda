import 'package:tezda/core/utils/exports.dart';

class ChangePasswordDialog extends StatelessWidget {
  const ChangePasswordDialog({Key? key, required this.onComplete})
      : super(key: key);

  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        Future.value(false);
      },
      child: Align(
        alignment: Alignment.center,
        child: IntrinsicHeight(
          child: Material(
            color: Colors.transparent,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
              margin: EdgeInsets.only(bottom: 20.h),
              width: 343.w,
              height: 400.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24.r)),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                          onTap: () => Navigator.of(context).pop(),
                          child: SvgPicture.asset('close-circle'.svg))),
                  SizedBox(height: 25.h),
                  Image.asset(
                    'warning'.png,
                    height: 100.h,
                  ),
                  Text(
                    'Change your password!',
                    textAlign: TextAlign.center,
                    style: BrandTextStyles.bold.copyWith(
                        color: const Color(0xFF000B09), fontSize: 18.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Kindly change your password to contine\n',
                          style: BrandTextStyles.medium.copyWith(
                            color: const Color(0xFF334155),
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'NB: ',
                          style: BrandTextStyles.bold.copyWith(
                            color: const Color(0xFF000B09),
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          text: 'Current password is the temporary password sent to your email.',
                          style: BrandTextStyles.medium.copyWith(
                            color: const Color(0xFF003930),
                            fontSize: 14.sp
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(
                      onTap: () => onComplete(), title: 'Continue')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
