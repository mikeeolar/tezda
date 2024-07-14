
import 'package:tezda/core/utils/exports.dart';
import 'package:tezda/ui/views/auth/login/login_view.dart';
import 'package:tezda/ui/views/splash/splash_viewmodel.dart';

class SplashView extends StackedView<SplashViewModel> {
  const SplashView({Key? key}) : super(key: key);

  @override
  void onViewModelReady(SplashViewModel viewModel) {
    super.onViewModelReady(viewModel);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      viewModel.setup();
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (viewModel.user?.loginUsername == null) {
          viewModel.navaigateToOnboarding();
        } else {
          Future.delayed(
              2.seconds,
              () => locator<NavigationService>().navigateWithTransition(
                  const LoginView(),
                  transitionStyle: Transition.fade));
        }
      });
    });
  }

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor:  BrandColors.light,
      body: Center(
        child: Image.asset(
          'assets/images/tezda_logo.png',
          height: 50,
        ),
      ),
    );
  }

  @override
  SplashViewModel viewModelBuilder(BuildContext context) => SplashViewModel();
}
