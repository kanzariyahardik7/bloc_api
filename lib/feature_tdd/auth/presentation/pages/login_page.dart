import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_event.dart';
import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController mobileController = TextEditingController();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is OtpSentState) {
            Navigator.pushNamed(context, '/otp',
                arguments: mobileController.text);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: mobileController,
                decoration:
                    const InputDecoration(labelText: "Enter Mobile Number"),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AuthBloc>(context)
                      .add(SendOtpEvent(mobileController.text));
                },
                child: const Text("Send OTP"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
