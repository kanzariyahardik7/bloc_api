import 'package:bloc_api/features/auth/register/screen/register_screen.dart';
import 'package:bloc_api/features/home/home_screens.dart';
import 'package:bloc_api/features/auth/login/screen/login_screen.dart';
import 'package:bloc_api/features/master_products/screen/master_products_screen.dart';
import 'package:bloc_api/features/music_list/music_list.dart';
import 'package:bloc_api/features/auth/otp_verify/screen/otp_verify_screen.dart';
import 'package:bloc_api/features/splash/splash_screen.dart';
import 'package:bloc_api/resource/enums.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreens(),
      ),
      GoRoute(
        path: '/product',
        builder: (context, state) => const MasterProductsScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/musiclist',
        builder: (context, state) => const MusicList(),
      ),
      GoRoute(
        path: '/otp-verify',
        builder: (context, state) {
          final data = state.extra as Map<String, dynamic>;
          return OtpVerifyScreen(
            authScreen: data["authScreen"] as AuthScreen,
            mobileNumber: data['mobileNumber'] ?? "",
          );
        },
      ),

      // GoRoute(
      //   path: '/bussiness/:bussinessId/:bussinessName',
      //   builder: (context, state) {
      //     final id = state.pathParameters['bussinessId'];
      //     final name =
      //         state.pathParameters['bussinessName']; // Get the parameter
      //     String sanitizedBusinessName = name!
      //         .replaceAll(' ', '-') // Replace spaces with hyphens
      //         .replaceAll('&', 'and'); // Replace '&' with 'and'
      //     return ShopDetails(
      //         bussinessId: int.parse(id!),
      //         bussinessName: sanitizedBusinessName);
      //   },
      // ),
      // GoRoute(
      //   path: '/web-nav-bar',
      //   builder: (context, state) => const WebNavBar(),
      // ),
      // GoRoute(
      //   path: '/nav-bar',
      //   builder: (context, state) => const NavBarScreen(),
      // ),
      // GoRoute(
      //   path: '/intro',
      //   builder: (context, state) => const Intro(),
      // ),
    ],
  );
}
