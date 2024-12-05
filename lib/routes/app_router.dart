import 'package:bloc_api/screens/home/home_screens.dart';
import 'package:bloc_api/screens/login/login.dart';
import 'package:bloc_api/screens/master_products/master_products.dart';
import 'package:bloc_api/screens/music_details/music_details.dart';
import 'package:bloc_api/screens/music_list/music_list.dart';
import 'package:bloc_api/screens/splash/splash_screen.dart';
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
        builder: (context, state) => const MasterProducts(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const Login(),
      ),
      GoRoute(
        path: '/musiclist',
        builder: (context, state) => const MusicList(),
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
