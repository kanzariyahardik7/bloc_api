import 'package:bloc_api/repository/login_repository.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:bloc_api/screens/login/bloc/login_event.dart';
import 'package:bloc_api/screens/login/bloc/login_state.dart';
import 'package:bloc_api/widget/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginRepository loginRepository;
  LoginBloc({required this.loginRepository})
      : super(LoginOtpGetInitState(otpGetResponse: ApiResponse.init())) {
    on<LoginOtpGetEvent>(_getOtp);
  }

  _getOtp(LoginOtpGetEvent event, Emitter<LoginState> emit) {
    emit(LoginOtpGetLoadingState(otpGetResponse: ApiResponse.loading()));
    loginRepository.generateOTP(event.map).then((value) {
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
}
