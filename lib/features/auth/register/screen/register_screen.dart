import 'package:bloc_api/dependancy_injection/dependancy_injection.dart';
import 'package:bloc_api/features/auth/register/bloc/register_bloc.dart';
import 'package:bloc_api/features/auth/register/bloc/register_event.dart';
import 'package:bloc_api/resource/colors.dart';
import 'package:bloc_api/resource/utils.dart';
import 'package:bloc_api/universal_widgets/mytext.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    mobileNumberController.dispose();
    nameController.dispose();

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
                  inputField('Name', nameController, isHide: true),
                  const SizedBox(height: 20),
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
                        context.push("/login");
                      },
                      child: const MyText(
                        text: "Already have an account? Login",
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
    final registerBloc = getIt<RegisterBloc>();
    Map<String, dynamic> map = {
      "mobile_number": '+91${mobileNumberController.text.trim()}',
      "name": nameController.text.trim()
    };

    if (nameController.text.isEmpty) {
      Utils.toastMessage("Please enter Name", fail);
    } else if (mobileNumberController.text.isEmpty) {
      Utils.toastMessage("Please enter mobile Number", fail);
    } else if (Utils.validateMobile(mobileNumberController.text) == false) {
      Utils.toastMessage("Enter valid Phone number", fail);
    } else if (mobileNumberController.text.length < 10) {
      Utils.toastMessage("Phone number must have 10 digits", fail);
    } else {
      registerBloc.add(RegisterOtpGetEvent(map: map, context));
    }
  }
}
