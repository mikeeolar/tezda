import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/dashboard/home/home_viewmodel.dart';
import 'package:tezda/ui/widgets/custom_network_image.dart';

class FavouriteView extends StackedView<HomeViewModel> {
  const FavouriteView({Key? key}) : super(key: key);

  @override
  Widget builder(BuildContext context, HomeViewModel viewModel, Widget? child) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'My Favourites',
                      style: BrandTextStyles.bold.copyWith(
                        fontSize: 20.sp,
                        color: BrandColors.dark,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 33.h),
              if (viewModel.favouriteProducts.isEmpty)
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 100.h),
                      SvgPicture.asset('empty-transaction'.svg),
                      SizedBox(height: 20.h),
                      Text(
                        'No Favourite Added Yet!',
                        style: BrandTextStyles.bold.copyWith(
                          fontSize: 20.sp,
                          color: BrandColors.dark,
                        ),
                      ),
                    ],
                  ),
                )
              else
                Center(
                  child: Wrap(
                      runSpacing: 25.h,
                      spacing: 10.w,
                      children: viewModel.favouriteProducts
                          .asMap()
                          .entries
                          .take(20)
                          .map((e) {
                        final product = e.value;
                        return GestureDetector(
                          onTap: () =>
                              viewModel.navigateToProductDetail(product),
                          child: Container(
                            width: 170.w,
                            height: 350.h,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            decoration: BoxDecoration(
                              color: BrandColors.dark50,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.r),
                                  child: CustomNetworkImage(
                                    imageUrl: product.images?.first,
                                  ),
                                ),
                                SizedBox(height: 20.h),
                                Text(
                                  product.title ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  style: BrandTextStyles.bold.copyWith(
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
                                      style: BrandTextStyles.bold.copyWith(
                                        fontSize: 18.sp,
                                        color: BrandColors.primary,
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        viewModel.toggleFavourite(product);
                                      },
                                      child: SvgPicture.asset(
                                        product.isFavourite
                                            ? 'favourite-dark'.svg
                                            : 'favourite-light'.svg,
                                        height: 30.h,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList()),
                ),
              SizedBox(height: 50.h),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(BuildContext context) => HomeViewModel();
}
