import 'package:bloc_api/dependancy_injection/dependancy_injection.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:bloc_api/universal_widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  @override
  void dispose() {
    mobileNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Center(
          child: Container(
            height: MediaQuery.sizeOf(context).height,
            constraints: const BoxConstraints(maxWidth: 480, minWidth: 400),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 60, bottom: 30),
                      height: MediaQuery.sizeOf(context).height * 0.25,
                      child: Center(
                          child: Image.asset('assets/genni_app/logo.png'))),
                  MyText(
                    text: "Welcome back!",
                    fontweight: FontWeight.w700,
                    textalign: TextAlign.center,
                    fontsize: 20,
                    latterSpacing: 1,
                    color: Theme.of(context).indicatorColor,
                  ),
                  const MyText(
                    text: "Please enter your Mobile number",
                    fontweight: FontWeight.w400,
                    textalign: TextAlign.center,
                    fontsize: 16,
                    latterSpacing: -0.05,
                    color: Color(0xFFC6C6C6),
                  ),
                  inputField('Mobile Number', mobileNumberController,
                      isHide: false),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {
                        getOtpApi();
                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: kPrimaryColor,
                          elevation: 1),
                      child: const MyText(
                        text: "get otp",
                        color: white,
                        fontsize: 14,
                        fontweight: FontWeight.bold,
                        latterSpacing: -0.04,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      onPressed: () {
                        context.pop();
                      },
                      child: const MyText(
                        text: "Do not have an account? Register",
                        color: black,
                      ))
                ],
              ),
            ),
          ),
        ),
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

  getOtpApi() {
    final productBloc = getIt<LoginBloc>();
    Map<String, dynamic> map = {
      "mobile_number": '+91${mobileNumberController.text.trim()}'
    };

    if (mobileNumberController.text.isEmpty) {
      Utils.toastMessage("Please enter Mobile Number", fail);
    } else if (Utils.validateMobile(mobileNumberController.text) == false) {
      Utils.toastMessage("Enter valid  number", fail);
    } else if (mobileNumberController.text.length < 10) {
      Utils.toastMessage("Mobile number must have 10 digits", fail);
    } else {
      productBloc.add(LoginOtpGetEvent(map: map, context));
    }
  }
}
