import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';
import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_event.dart';
import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_state.dart';

class OtpPage extends StatelessWidget {
  final TextEditingController otpController = TextEditingController();

  OtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final mobile = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Enter OTP")),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is Authenticated) {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("Logged in as ${state.user.mobile}")));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text("OTP sent to $mobile"),
              TextField(
                controller: otpController,
                decoration: const InputDecoration(labelText: "Enter OTP"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context)
                      .add(VerifyOtpEvent(mobile, otpController.text));
                },
                child: const Text("Verify"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
