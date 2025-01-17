import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/enums.dart';
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
  }

  _getOtp(LoginOtpGetEvent event, Emitter<LoginState> emit) async {
    emit(LoginOtpGetLoadingState(otpGetResponse: ApiResponse.loading()));
    await loginRepository.loginGenerateOtp(event.map).then((value) {
      if (value?.code == 200) {
        emit(LoginOtpGetSuccessState(
            otpGetResponse: ApiResponse.completed(value)));
        Utils.toastMessage(value?.message ?? "", success);
        event.context.push(
          "/otp-verify",
          extra: {
            "authScreen": AuthScreen.login,
            "mobileNumber": event.map["mobile_number"]
          },
        );
      } else {
        emit(LoginOtpGetInitState(otpGetResponse: ApiResponse.init()));
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(LoginOtpGetErrorState(
          otpGetResponse: ApiResponse.error(error.toString())));
    });
  }
}
