import 'package:audio_service/audio_service.dart';
import 'package:bloc_api/dependancy_injection/dependancy_injection.dart';
import 'package:bloc_api/features/login/bloc/login_bloc.dart';
import 'package:bloc_api/features/master_products/bloc/product_bloc.dart';
import 'package:bloc_api/features/music_details/audio_handler.dart';
import 'package:bloc_api/features/otp_verify/bloc/otp_bloc.dart';
import 'package:bloc_api/routes/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  setupServiceLocator();
  WidgetsFlutterBinding.ensureInitialized();

  await AudioService.init(
    builder: () => AudioPlayerHandler(),
    config: const AudioServiceConfig(
      androidNotificationChannelId: 'com.example.audio',
      androidNotificationChannelName: 'Audio Playback',
      androidNotificationOngoing: true,
    ),
  );

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (context) => getIt<ProductBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<LoginBloc>(),
    ),
    BlocProvider(
      create: (context) => getIt<OtpVerifyBloc>(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return child!;
      },
      routerConfig: AppRouter.router,
    );
  }
}
