import 'package:tezda/core/utils/exports.dart';

class BackWrapper extends StatefulWidget {
  const BackWrapper(
      {super.key,
      this.title,
      this.onBackPressed,
      required this.child,
      this.padding,
      this.titleColor,
      this.backgroundColor,
      this.trailing,
      this.backBtnColor,
      this.hasBackButton = false});

  final String? title;
  final Color? titleColor;
  final Function? onBackPressed;
  final Color? backBtnColor;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;
  final bool hasBackButton;
  final Color? backgroundColor;

  @override
  State<BackWrapper> createState() => _BackWrapperState();
}

class _BackWrapperState extends State<BackWrapper> {
  late bool canPop;

  @override
  void initState() {
    super.initState();
    canPop = StackedService.navigatorKey!.currentState!.canPop();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: Utils.darkWhiteNav,
      child: Scaffold(
        backgroundColor: widget.backgroundColor,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            widget.hasBackButton
                                ? SizedBox(
                                    height: 30.w,
                                    width: 30.w,
                                    child: InkWell(
                                      borderRadius:
                                          BorderRadius.circular(100.r),
                                      onTap: () => widget.onBackPressed!(),
                                      child: Icon(
                                        Icons.arrow_back_ios_new,
                                        size: 18.h,
                                        color: widget.backBtnColor ?? const Color(0xFF334155),
                                      ),
                                    ),
                                  )
                                : canPop
                                    ? SizedBox(
                                        height: 30.w,
                                        width: 30.w,
                                        child: InkWell(
                                          borderRadius:
                                              BorderRadius.circular(100.r),
                                          onTap: () =>
                                              widget.onBackPressed == null
                                                  ? Navigator.pop(context)
                                                  : widget.onBackPressed!(),
                                          child: Icon(
                                            Icons.arrow_back_ios_new,
                                            size: 18.h,
                                            color: widget.backBtnColor ?? const Color(0xFF334155),
                                          ),
                                        ),
                                      )
                                    : const SizedBox(),
                            widget.title == null
                                ? const SizedBox()
                                : Text(
                                    widget.title!,
                                    textAlign: TextAlign.center,
                                    style: BrandTextStyles.bold.copyWith(
                                      color: widget.titleColor ??
                                          const Color(0xFF030602),
                                      fontSize: 18.sp,
                                    ),
                                  ),
                            const SizedBox(),
                          ],
                        ),
                        SizedBox(height: 8.h),
                      ],
                    ),
                  ),
                  const Divider(color: Color(0xFFE2E8F0)),
                  Expanded(
                    child: ColoredBox(
                      color: Colors.transparent,
                      child: widget.child,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
