import 'package:tezda/core/utils/exports.dart';

class CompleteRegistrationDialog extends StatelessWidget {
  const CompleteRegistrationDialog({Key? key, required this.onComplete})
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
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
        margin: EdgeInsets.only(bottom: 20.h),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24.r)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: SvgPicture.asset('close-circle'.svg))),
              SizedBox(height: 25.h),
            Image.asset('warning'.png, height: 100.h,),
           Text(
              'Complete registration',
              textAlign: TextAlign.center,
              style: BrandTextStyles.bold.copyWith(
                color: const Color(0xFF000B09),
                fontSize: 20.sp
              ),
            ),
            Text(
              'To create a payment, you need to\ncomplete your business registration.',
              textAlign: TextAlign.center,
              style: BrandTextStyles.medium.copyWith(
                color: const Color(0xFF334155),
                fontSize: 14.sp
              ),
            ),
            SizedBox(
              height: 25.h,
            ),
            CustomButton(onTap: () => onComplete(), title: 'Complete')
          ],
        ),
      ),
    );
  }
}
