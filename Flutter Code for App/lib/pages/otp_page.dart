import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:agro_tech/utilities/features/authentication/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    late String otp;
    var otpController = Get.put(OTPController());

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "CODE",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 72.0,
                color: themeColor,
              ),
            ),
            Text(
              "Verification".toUpperCase(),
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 24.0,
                color: themeColor,
              ),
            ),
            const SizedBox(height: 48.0),
            const Text(
              "Enter the verification code sent",
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12.0),
            OtpTextField(
              showCursor: false,
              keyboardType: TextInputType.number,
              numberOfFields: 6,
              borderColor: themeColor,
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when every textfield is filled
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              }, // end onSubmit
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    otpController.verifyOTP(otp);
                  },
                  style: const ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(themeColor)),
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
