import 'package:bloc_api/features/auth/register/bloc/register_event.dart';
import 'package:bloc_api/features/auth/register/bloc/register_state.dart';
import 'package:bloc_api/features/auth/register/repo/register_repo.dart';
import 'package:bloc_api/resource/api_response.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/enums.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterRepository registerRepository;
  RegisterBloc({required this.registerRepository})
      : super(RegisterOtpGetInitState(otpGetResponse: ApiResponse.init())) {
    on<RegisterOtpGetEvent>(_getRegisterOtp);
  }

  Future<void> _getRegisterOtp(
      RegisterOtpGetEvent event, Emitter<RegisterState> emit) async {
    emit(RegisterOtpGetLoadingState(otpGetResponse: ApiResponse.loading()));
    await registerRepository.registerGenerateOtp(event.map).then((value) {
      if (value?.code == 201) {
        emit(RegisterOtpGetSuccessState(
            otpGetResponse: ApiResponse.completed(value)));
        Utils.toastMessage(value?.message ?? "", success);
        event.context.push(
          "/otp-verify",
          extra: {
            "authScreen": AuthScreen.register,
            "mobileNumber": event.map["mobile_number"]
          },
        );
      } else {
        emit(RegisterOtpGetInitState(otpGetResponse: ApiResponse.init()));
        Utils.toastMessage(value?.message ?? "", fail);
      }
    }).onError((error, stackTrace) {
      emit(RegisterOtpGetErrorState(
          otpGetResponse: ApiResponse.error(error.toString())));
    });
  }
}
