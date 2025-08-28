import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_event.dart';
import 'package:bloc_api/feature_tdd/auth/presentation/bloc/auth_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/login_with_mobile.dart';
import '../../domain/usecases/verify_otp.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginWithMobile loginWithMobile;
  final VerifyOtp verifyOtp;

  AuthBloc(this.loginWithMobile, this.verifyOtp) : super(AuthInitial()) {
    on<SendOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        await loginWithMobile(event.mobile);
        emit(OtpSentState());
      } catch (e) {
        emit(AuthError("Failed to send OTP"));
      }
    });

    on<VerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final user = await verifyOtp(event.mobile, event.otp);
        emit(Authenticated(user));
      } catch (e) {
        emit(AuthError("OTP verification failed"));
      }
    });
  }
}
