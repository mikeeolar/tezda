// ignore_for_file: deprecated_member_use

import 'package:tezda/core/utils/exports.dart';

class GridItem extends StatelessWidget {
  final String title;
  final String icon;
  final Function onTap;
  final Color color;
  final int? index;

  const GridItem({
    Key? key,
    required this.title,
    required this.icon,
    required this.onTap,
    required this.color,
    this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        // padding: EdgeInsets.symmetric(horizontal: 2.h, vertical: 2.h),
        // margin: EdgeInsets.only(right: 15.w),
        width: 130.w,
        height: 140.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: color.withOpacity(.2)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              spreadRadius: -1,
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              bottom: index == 1 ? -38.w : -20.w,
              right: index == 1 ? -25.w : -15.w,
              child: Opacity(
                opacity: .08,
                child: SvgPicture.asset(
                  icon,
                  width: 80.w,
                  color: color,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 130.w,
              height: 140.h,
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
              decoration: BoxDecoration(
                // color: BrandColors.orangeFF,
                borderRadius: BorderRadius.circular(14.r)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r)
                    ),
                    child: CircleAvatar(
                      radius: 24.r,
                      backgroundColor: color.withOpacity(.08),
                      child: Center(
                        child: SvgPicture.asset(
                          icon,
                          width: 20.w,
                          color: color
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.h,),
                  SizedBox(
                    height: 40.h,
                    child: Center(
                      child: Text(
                        title,
                        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}