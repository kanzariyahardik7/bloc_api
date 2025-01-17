import 'package:bloc_api/features/auth/otp_verify/bloc/otp_event.dart';
import 'package:bloc_api/features/auth/otp_verify/bloc/otp_state.dart';
import 'package:bloc_api/features/auth/otp_verify/repo/otp_repo.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/user_preferences.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class OtpVerifyBloc extends Bloc<OtpEvent, OtpVerificationState> {
  final OtpRepo otpRepo;
  OtpVerifyBloc({required this.otpRepo})
      : super(OtpVerificationInitState(otpGetResponse: ApiResponse.init())) {
    on<LoginOtpVerifyEvent>(_loginOtpVerify);
    on<RegisterOtpVerifyEvent>(_registerOtpVerify);
  }

  _loginOtpVerify(
      LoginOtpVerifyEvent event, Emitter<OtpVerificationState> emit) async {
    emit(OtpVerificationLodingState(otpGetResponse: ApiResponse.loading()));
    await otpRepo.otpVerification(event.map).then((value) {
      if (value?.code == 200) {
        emit(OtpVerificationCompleteState(
            otpGetResponse: ApiResponse.completed(value)));
        event.context.go("/home");
        UserPreferences().saveUser(value!.data!);
        Utils.toastMessage(value.message ?? "", success);
      } else {
        emit(OtpVerificationInitState(otpGetResponse: ApiResponse.init()));
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(OtpVerificationErrorState(
          otpGetResponse: ApiResponse.error(error.toString())));
    });
  }

  _registerOtpVerify(
      RegisterOtpVerifyEvent event, Emitter<OtpVerificationState> emit) async {
    emit(OtpVerificationLodingState(otpGetResponse: ApiResponse.loading()));
    await otpRepo.otpVerification(event.map).then((value) {
      if (value?.code == 200) {
        emit(OtpVerificationCompleteState(
            otpGetResponse: ApiResponse.completed(value)));
        event.context.go("/home");
        UserPreferences().saveUser(value!.data!);
        Utils.toastMessage(value.message ?? "", success);
      } else {
        emit(OtpVerificationInitState(otpGetResponse: ApiResponse.init()));
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(OtpVerificationErrorState(
          otpGetResponse: ApiResponse.error(error.toString())));
    });
  }
}
