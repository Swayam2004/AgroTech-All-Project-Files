import 'package:agro_tech/pages/layout_page.dart';
import 'package:agro_tech/utilities/repository/authentication_repository/authentication_repository.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();
  var authenticationRepository = Get.put(AuthenticationRepository());

  void verifyOTP(String otp) async {
    var isVerified = await authenticationRepository.verifyOTP(otp);

    isVerified ? Get.offAll(() => const Layout()) : Get.back();
  }
}
