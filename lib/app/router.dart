// ignore_for_file: unused_local_variable

import 'package:flutter/cupertino.dart';
import 'package:tezda/core/models/product_response.dart';
import 'package:tezda/ui/views/auth/create_account/create_account_view.dart';
import 'package:tezda/ui/views/auth/login/login_view.dart';
import 'package:tezda/ui/views/dashboard/account/profile/profile_view.dart';
import 'package:tezda/ui/views/dashboard/dashboard_view.dart';
import 'package:tezda/ui/views/dashboard/home/product_detail/product_detail_view.dart';
import 'package:tezda/ui/views/onboarding/onboarding_view.dart';
import 'package:tezda/ui/views/splash/splash_view.dart';
import '../core/utils/exports.dart';

abstract class Routes {
  static const splash = '/splash';
  static const onboarding = '/onboarding';
  static const forgotPassword = '/forgotPassword';
  static const createAccount = '/createAccount';
  static const withdrawFunds = '/withdrawFunds';
  static const login = '/login';
  static const dashboard = '/dashboard';
  static const productDetil = '/productDetail';
  static const profile = '/profile';
}

class Routers {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final dynamic args = settings.arguments is Map<String, dynamic> &&
            (settings.arguments as Map<String, dynamic>)
                .containsKey('arguments')
        ? (settings.arguments as Map<String, dynamic>)['arguments']
        : settings.arguments;
    switch (settings.name) {
      case Routes.splash:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const SplashView(), settings: settings);
      case Routes.onboarding:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const OnboardingView(), settings: settings);
      case Routes.dashboard:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const DashboardView(
                  index: 0,
                ),
            settings: settings);
      case Routes.createAccount:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const CreateAccountView(),
            settings: settings);
      case Routes.login:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const LoginView(), settings: settings);
       case Routes.profile:
        return CupertinoPageRoute<dynamic>(
            builder: (context) => const ProfileView(), settings: settings);
      case Routes.productDetil:
        final product = args as ProductResponse;
        return CupertinoPageRoute<dynamic>(
            builder: (context) => ProductDetailView(product: product),
            settings: settings);
      default:
        return unknownRoutePage(settings.name!);
    }
  }
}

// borrowed from auto_route:
// returns an error page routes with a helper message.
PageRoute unknownRoutePage(String routeName) => CupertinoPageRoute(
      builder: (ctx) => Scaffold(
        body: Container(
          color: Colors.white,
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                child: Text(
                  routeName == '/'
                      ? 'Initial route not found! \n did you forget to annotate your home page with @initial or @MaterialRoute(initial:true)?'
                      : 'Route name $routeName is not found!',
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16),
                ),
              ),
              OutlinedButton.icon(
                label: const Text('Back'),
                icon: const Icon(Icons.arrow_back),
                onPressed: () => Navigator.of(ctx).pop(),
              )
            ],
          ),
        ),
      ),
    );
