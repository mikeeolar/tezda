// ignore_for_file: deprecated_member_use

import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/home/product_detail/product_detal_viewmodel.dart';
import 'package:tezda/ui/widgets/custom_network_image.dart';
import 'package:dots_indicator/dots_indicator.dart';

class ProductDetailView extends StackedView<ProductDetailViewModel> {
  const ProductDetailView({
    Key? key,
    required this.product,
  }) : super(key: key);

  final ProductResponse product;

  @override
  Widget builder(
      BuildContext context, ProductDetailViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
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
                            side:
                                BorderSide(width: 2, color: BrandColors.dark50),
                          ),
                        ),
                        child:
                            const Icon(Icons.arrow_back, color: Colors.black),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        height: 40.h,
                        width: 40.w,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFe7e7e7),
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 2, color: BrandColors.dark50),
                          ),
                        ),
                        child: SvgPicture.asset(
                          'order-light'.svg,
                          height: 25.h,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 33.h),
                SizedBox(
                  height: 300.h,
                  child: PageView(
                    controller: viewModel.pageController,
                    onPageChanged: (index) {
                      viewModel.setIndex(index);
                      viewModel.activeIndex = index;
                    },
                    children: product.images
                            ?.map((e) => ClipRRect(
                                borderRadius: BorderRadius.circular(20.r),
                                child: CustomNetworkImage(imageUrl: e)))
                            .toList() ??
                        [],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Center(
                  child: DotsIndicator(
                    dotsCount: product.images?.length ?? 0,
                    position: viewModel.activeIndex,
                    decorator: DotsDecorator(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      spacing: const EdgeInsets.all(3),
                      size: Size(8.w, 8.w),
                      activeSize: Size(8.w, 8.w),
                      color: const Color(0xFFC2C2AE),
                      activeColor: BrandColors.primary,
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200.w,
                      child: Text(
                        product.title ?? '',
                        style: BrandTextStyles.bold.copyWith(
                          fontSize: 18.sp,
                          color: BrandColors.dark,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        viewModel.toggleFavourite(product);
                      },
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        padding: EdgeInsets.all(6.w),
                        decoration: const ShapeDecoration(
                          color: BrandColors.secondary,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 2, color: BrandColors.dark50),
                          ),
                        ),
                        child: SvgPicture.asset(product.isFavourite
                            ? 'favourite-dark'.svg
                            : 'favourite-light'.svg),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.h),
                Text(
                  product.description ?? '',
                  style: BrandTextStyles.regular.copyWith(
                    fontSize: 14.sp,
                    color: BrandColors.dark,
                  ),
                ),
                SizedBox(height: 20.h),
                Text(
                  Utils.currencyFormatter(2).format(product.price),
                  style: BrandTextStyles.bold.copyWith(
                    fontSize: 20.sp,
                    color: BrandColors.primary,
                  ),
                ),
                SizedBox(height: 10.h),
                const Divider(),
                SizedBox(height: 10.h),
                Text(
                  'Select Size',
                  style: BrandTextStyles.bold.copyWith(
                    fontSize: 18.sp,
                    color: BrandColors.dark,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: BrandColors.dark50,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          'S',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: BrandColors.dark50,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          'M',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: BrandColors.dark50,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          'L',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: BrandColors.dark50,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          'XL',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          color: BrandColors.dark50,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: Text(
                          'XXL',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 14.sp,
                            color: BrandColors.dark,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                Text(
                  'Select Color',
                  style: BrandTextStyles.bold.copyWith(
                    fontSize: 18.sp,
                    color: BrandColors.dark,
                  ),
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: const ShapeDecoration(
                          color: Colors.black,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 0, color: BrandColors.dark50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: const ShapeDecoration(
                          color: Colors.brown,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 0, color: BrandColors.dark50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: const ShapeDecoration(
                          color: Colors.red,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 0, color: BrandColors.dark50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: const ShapeDecoration(
                          color: Colors.yellow,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 0, color: BrandColors.dark50),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 12.h),
                        decoration: const ShapeDecoration(
                          color: Colors.grey,
                          shape: CircleBorder(
                            side:
                                BorderSide(width: 0, color: BrandColors.dark50),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: double.infinity,
                    padding:
                        EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    decoration: BoxDecoration(
                      color: BrandColors.primary,
                      borderRadius: BorderRadius.circular(5.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('order-light'.svg,
                            color: Colors.white),
                        SizedBox(width: 10.w),
                        Text(
                          'Add to cart',
                          style: BrandTextStyles.medium.copyWith(
                            fontSize: 15.sp,
                            color: BrandColors.light,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 50.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  ProductDetailViewModel viewModelBuilder(BuildContext context) =>
      ProductDetailViewModel();
}
