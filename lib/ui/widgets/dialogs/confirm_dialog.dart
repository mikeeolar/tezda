import 'package:tezda/core/utils/exports.dart';

class ConfimDialog extends StatelessWidget {
  const ConfimDialog({
    Key? key,
    required this.onComplete,
    required this.title,
    required this.textButton,
  }) : super(key: key);

  final Function onComplete;
  final String title;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IntrinsicHeight(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 27.w),
            width: 320.w,
            height: 350.h,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(24.r)),
            child: Column(
              children: [
                Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: SvgPicture.asset('close-circle'.svg))),
                SizedBox(height: 15.h),
                SvgPicture.asset(
                  'logout'.svg,
                  height: 100.h,
                ),
                SizedBox(height: 20.h),
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: BrandTextStyles.bold.copyWith(
                      color: const Color(0xFF000B09), fontSize: 18.sp),
                ),
                SizedBox(
                  height: 25.h,
                ),
                CustomButton(onTap: () => onComplete(), title: textButton),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
