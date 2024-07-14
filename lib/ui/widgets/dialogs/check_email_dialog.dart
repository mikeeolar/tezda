import 'package:tezda/core/utils/exports.dart';

class CheckEmailDialog extends StatelessWidget {
  const CheckEmailDialog({Key? key, required this.onComplete})
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
              height: 370.h,
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
                    'Check your email',
                    textAlign: TextAlign.center,
                    style: BrandTextStyles.bold.copyWith(
                        color: const Color(0xFF000B09), fontSize: 18.sp),
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    'A temporary password has been sent to your mail. Click continue to log in',
                    textAlign: TextAlign.center,
                    style: BrandTextStyles.medium.copyWith(
                        color: const Color(0xFF334155), fontSize: 14.sp),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  CustomButton(onTap: () => onComplete(), title: 'Continue')
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
