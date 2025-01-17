import 'package:bloc_api/dependancy_injection/dependancy_injection.dart';
import 'package:bloc_api/features/auth/otp_verify/bloc/otp_bloc.dart';
import 'package:bloc_api/features/auth/otp_verify/bloc/otp_event.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/enums.dart';
import 'package:bloc_api/universal_widgets/mytext.dart';
import 'package:flutter/material.dart';

class OtpVerifyScreen extends StatefulWidget {
  final String mobileNumber;
  final AuthScreen authScreen;
  const OtpVerifyScreen(
      {super.key, required this.mobileNumber, required this.authScreen});

  @override
  State<OtpVerifyScreen> createState() => _OtpVerifyScreenState();
}

class _OtpVerifyScreenState extends State<OtpVerifyScreen> {
  TextEditingController otpController = TextEditingController();

  @override
  void dispose() {
    otpController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          MyText(
            text: "Mobile Number = ${widget.mobileNumber}",
            color: black,
            fontsize: 14,
            fontweight: FontWeight.bold,
            latterSpacing: -0.04,
          ),
          inputField('OTP', otpController, isHide: true),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: ElevatedButton(
              onPressed: () {
                verifyOtpApi();
              },
              style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 45),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: kPrimaryColor,
                  elevation: 1),
              child: const MyText(
                text: "Verify",
                color: white,
                fontsize: 14,
                fontweight: FontWeight.bold,
                latterSpacing: -0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputField(String hint, TextEditingController controller,
      {bool isHide = true}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Container(
        height: MediaQuery.sizeOf(context).height * 0.06,
        decoration: const BoxDecoration(
            border: Border(
          bottom: BorderSide(width: 1.0, color: kdividerColor),
        )),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            isHide
                ? const SizedBox()
                : const SizedBox(
                    width: 40,
                    child: MyText(
                      text: "+91",
                      color: black,
                      fontsize: 14,
                      fontweight: FontWeight.bold,
                      latterSpacing: -0.04,
                    ),
                  ),
            Expanded(
              child: TextField(
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: black,
                ),
                maxLength: isHide ? 100 : 10,
                keyboardType: isHide ? TextInputType.name : TextInputType.phone,
                autofocus: false,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Color(0xFFC6C6C6),
                    ),
                    contentPadding: const EdgeInsets.all(8.0),
                    counter: const SizedBox(
                      height: 0.0,
                    )),
                controller: controller,
                onChanged: (value) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  verifyOtpApi() {
    final otpVerifyBloc = getIt<OtpVerifyBloc>();
    Map<String, dynamic> map = {
      "mobile_number": widget.mobileNumber,
      "otp": otpController.text.trim()
    };
    if (widget.authScreen == AuthScreen.login) {
      otpVerifyBloc.add(LoginOtpVerifyEvent(context: context, map: map));
    } else {
      otpVerifyBloc.add(RegisterOtpVerifyEvent(context: context, map: map));
    }
  }
}
