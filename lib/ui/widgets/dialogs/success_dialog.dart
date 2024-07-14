import 'package:tezda/core/utils/exports.dart';

class SuccessDialog extends StatelessWidget {
  const SuccessDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  final DialogRequest request;
  final Function completer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
          margin: EdgeInsets.symmetric(horizontal: 25.w),
          width: 343.w,
          height: 380.h,
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
                'success'.png,
                height: 100.h,
              ),
              Text(
                request.title ?? 'Successful',
                textAlign: TextAlign.center,
                style: BrandTextStyles.bold.copyWith(
                    color: const Color(0xFF000B09), fontSize: 18.sp),
              ),
              SizedBox(height: 5.h),
              Text(
                request.description ?? 'Thank you for choosing MiddleMan',
                textAlign: TextAlign.center,
                style: BrandTextStyles.medium.copyWith(
                    color: const Color(0xFF334155), fontSize: 15.sp),
              ),
              SizedBox(
                height: 25.h,
              ),
              CustomButton(
                onTap: () => completer(DialogResponse(confirmed: true)),
                title:  request.mainButtonTitle ?? 'Done',
              )
            ],
          ),
        ),
      ),
    );
  }
}
