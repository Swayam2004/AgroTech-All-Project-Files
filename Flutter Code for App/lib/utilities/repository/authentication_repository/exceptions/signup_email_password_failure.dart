class SignupEmailPasswordFailure {
  final String message;

  const SignupEmailPasswordFailure({this.message = "An Unknown erro occured"});

  factory SignupEmailPasswordFailure.code(String code) {
    switch (code) {
      case "email-already-in-use":
        return const SignupEmailPasswordFailure(
            message: "The email is already in use by another account.");
      case "invalid-email":
        return const SignupEmailPasswordFailure(
            message: "The email address is badly formatted.");
      case "operation-not-allowed":
        return const SignupEmailPasswordFailure(
            message: "Email & Password accounts are not enabled.");
      case "weak-password":
        return const SignupEmailPasswordFailure(
            message: "The password is too weak.");
      default:
        return const SignupEmailPasswordFailure();
    }
  }
}
