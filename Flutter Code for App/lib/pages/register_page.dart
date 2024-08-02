import 'package:agro_tech/pages/otp_page.dart';
import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/country_picker_dialog.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:get/get.dart';

import '../utilities/features/authentication/signup_controller.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  String phoneNoWithCode = "";

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    double inputBoxWidth = MediaQuery.of(context).size.width * 0.8;

    return Material(
      color: const Color(0xffffffff),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Image.asset(
              "assets/reg page farmer.png",
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              heightFactor: 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 50),
                  const Text(
                    'Register',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff4A6B3E),
                    ),
                  ),
                  const SizedBox(height: 70),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(32.0),
                          child: TextFormField(
                            style: const TextStyle(color: themeColor),
                            cursorColor: const Color(0xff91AF82),
                            controller: controller.fullName,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.person,
                                color: themeColor1,
                                size: 32,
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff91AF82),
                                    width: 1,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                borderRadius: BorderRadius.circular(16.0),
                                gapPadding: 24,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff91AF82),
                                    width: 2,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                borderRadius: BorderRadius.circular(16.0),
                                gapPadding: 24,
                              ),
                              focusColor: const Color(0xff91AF82),
                              hoverColor: const Color(0xff91AF82),
                              prefixIconColor: const Color(0xff91AF82),
                              labelText: 'Full Name',
                              labelStyle: const TextStyle(
                                color: Color(0xff91AF82),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: themeColor3,
                                    width: 10,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your full name';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 32.0),
                          child: IntlPhoneField(
                            style: const TextStyle(color: themeColor),
                            cursorColor: const Color(0xff91AF82),
                            initialCountryCode: 'IN',
                            disableLengthCheck: true,
                            pickerDialogStyle: PickerDialogStyle(
                                backgroundColor: themeColor2,
                                padding: const EdgeInsets.all(16.0)),
                            dropdownTextStyle:
                                const TextStyle(color: Color(0xff91AF82)),
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff91AF82),
                                    width: 1,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                borderRadius: BorderRadius.circular(16.0),
                                gapPadding: 24,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xff91AF82),
                                    width: 2,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignOutside),
                                borderRadius: BorderRadius.circular(16.0),
                                gapPadding: 24,
                              ),
                              focusColor: const Color(0xff91AF82),
                              hoverColor: const Color(0xff91AF82),
                              prefixIconColor: const Color(0xff91AF82),
                              labelText: 'Phone Number',
                              labelStyle: const TextStyle(
                                color: Color(0xff91AF82),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: themeColor3,
                                    width: 10,
                                    style: BorderStyle.solid,
                                    strokeAlign: BorderSide.strokeAlignCenter),
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                            ),
                            validator: (value) {
                              if (value == null ||
                                  value.completeNumber.isEmpty) {
                                return 'Please enter a phone no';
                              } else if (!RegExp(
                                      r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$') // Regex for verifying the phone number
                                  .hasMatch(value.completeNumber)) {
                                return 'Please enter a valid phone no';
                              }
                              return null; // Return null if the input is valid
                            },
                            languageCode: "en",
                            onChanged: (phone) {
                              phoneNoWithCode = phone.completeNumber;
                            },
                          ),
                        ),
                        const SizedBox(height: 64),
                        SizedBox(
                          width: inputBoxWidth,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                SignUpController.instance.phoneAuthentication(
                                    phoneNoWithCode.trim());
                                Get.to(() => const OTPScreen());
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff4A6B3E),
                              textStyle: const TextStyle(fontSize: 18),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                            ),
                            child: const Text(
                              'Get OTP',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
