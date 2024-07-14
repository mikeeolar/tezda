// ignore_for_file: deprecated_member_use

import 'package:flutter/scheduler.dart';
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/dashboard_viewmodel.dart';
import 'package:tezda/ui/views/dashboard/home/home_viewmodel.dart';
import 'package:tezda/ui/views/dashboard/home/widgets/products_loader.dart';
import 'package:tezda/ui/widgets/custom_network_image.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ReactivePartialBuild<DashboardViewModel>(
      builder: (context, parentModel) =>
          ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (viewModel) {
          SchedulerBinding.instance.addPostFrameCallback((_) {
            viewModel.fetchCategories();
            viewModel.fetchProducts();
          });
        },
        builder: (context, viewModel, child) =>
            AnnotatedRegion<SystemUiOverlayStyle>(
          value: Utils.dark,
          child: Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              fillColor: const Color(0xFFe7e7e7),
                              radius: 50.r,
                              borderColor: const Color(0xFFe7e7e7),
                              suffixIcon: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: const Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(10.h),
                              height: 55.h,
                              width: 45.w,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFe7e7e7),
                                shape: CircleBorder(
                                  side: BorderSide(
                                      width: 2, color: BrandColors.dark50),
                                ),
                              ),
                              child: SvgPicture.asset(
                                'order-light'.svg,
                                height: 20.h,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Categories',
                            style: BrandTextStyles.medium
                                .copyWith(fontSize: 18.sp),
                          ),
                          Text(
                            'See all',
                            style: BrandTextStyles.regular.copyWith(
                              fontSize: 13.sp,
                              color: BrandColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                            children: viewModel.categories
                                    ?.asMap()
                                    .entries
                                    .map((e) {
                                  final category = e.value;
                                  return Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          viewModel.toggleCategory(category.id);
                                        },
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 8.h),
                                          decoration: BoxDecoration(
                                            color: viewModel.id == category.id
                                                ? BrandColors.primary
                                                : BrandColors.dark50,
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                          ),
                                          child: Text(
                                            category.name ?? '',
                                            style:
                                                BrandTextStyles.medium.copyWith(
                                              fontSize: 13.sp,
                                              color: viewModel.id == category.id
                                                  ? Colors.white
                                                  : BrandColors.dark,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 10.w),
                                    ],
                                  );
                                }).toList() ??
                                []),
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Text(
                        'All Products',
                        style: BrandTextStyles.bold.copyWith(
                          fontSize: 20.sp,
                          color: BrandColors.dark,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    if (viewModel.fetchingProducts)
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: SizedBox(
                          height: 1000.h,
                          child: GridView.builder(
                            // shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            physics: const PageScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10.0,
                              crossAxisSpacing: 10.0,
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                            ),
                            itemCount: 10,
                            itemBuilder: (ctx, i) {
                              return const ProductsLoader();
                            },
                          ),
                        ),
                      )
                    else
                      Center(
                        child: Wrap(
                            runSpacing: 25.h,
                            spacing: 10.w,
                            children: viewModel.products
                                    ?.asMap()
                                    .entries
                                    .take(20)
                                    .map((e) {
                                  final product = e.value;
                                  return GestureDetector(
                                    onTap: () => viewModel
                                        .navigateToProductDetail(product),
                                    child: Container(
                                      width: 170.w,
                                      height: 350.h,
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10.h, horizontal: 10.w),
                                      decoration: BoxDecoration(
                                        color: BrandColors.dark50,
                                        borderRadius:
                                            BorderRadius.circular(15.r),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12.r),
                                            child: CustomNetworkImage(
                                              imageUrl: product.images?.first,
                                            ),
                                          ),
                                          SizedBox(height: 20.h),
                                          Text(
                                            product.title ?? '',
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style:
                                                BrandTextStyles.bold.copyWith(
                                              fontSize: 18.sp,
                                              color: BrandColors.dark,
                                            ),
                                          ),
                                          SizedBox(height: 5.h),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                Utils.currencyFormatter(2)
                                                    .format(product.price),
                                                style: BrandTextStyles.bold
                                                    .copyWith(
                                                  fontSize: 18.sp,
                                                  color: BrandColors.primary,
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  viewModel
                                                      .toggleFavourite(product);
                                                },
                                                child: SvgPicture.asset(
                                                  product.isFavourite ? 'favourite-dark'.svg : 'favourite-light'.svg,
                                                  height: 30.h,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }).toList() ??
                                []),
                      ),
                    SizedBox(height: 50.h)
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
