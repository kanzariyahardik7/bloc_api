import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/user_preferences.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../repo/login_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository})
      : super(LoginOtpGetInitState(otpGetResponse: ApiResponse.init())) {
    on<LoginOtpGetEvent>(_getOtp);
    on<LoginOtpVerifyEvent>(_otpVerify);
  }

  _getOtp(LoginOtpGetEvent event, Emitter<LoginState> emit) async {
    emit(LoginOtpGetLoadingState(otpGetResponse: ApiResponse.loading()));
    await loginRepository.generateOTP(event.map).then((value) {
      if (value?.code == 200) {
        emit(LoginOtpGetState(otpGetResponse: ApiResponse.completed(value)));
        Utils.toastMessage(value?.message ?? "", success);
      } else {
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(LoginOtpGetErrorState(
          otpGetResponse: ApiResponse.error(error.toString())));
    });
  }

  _otpVerify(LoginOtpVerifyEvent event, Emitter<LoginState> emit) async {
    emit(
        LoginOtpVerifyLodingState(otpGetVerifyResponse: ApiResponse.loading()));
    await loginRepository.otpVerification(event.map).then((value) {
      if (value?.code == 200) {
        emit(LoginOtpVerifiedState(
            otpGetVerifyResponse: ApiResponse.completed(value)));
        event.context.pushReplacement("/home");
        UserPreferences().saveUser(value!.data!);
        Utils.toastMessage(value.message ?? "", success);
      } else {
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(LoginOtpVerifyErrorState(
          otpGetVerifyResponse: ApiResponse.error(error.toString())));
    });
  }
}
