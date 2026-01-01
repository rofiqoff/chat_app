/// App Strings - All text strings in the app
class AppStrings {
  // Onboarding
  static const String onboardingTitle = 'Welcome to ChatApp';
  static const String onboardingSubtitle =
      'Connect with friends and family\ninstantly and securely';
  static const String getStarted = 'Get Started';
  static const String alreadyHaveAccount = 'I already have an account';

  // Authentication
  static const String login = 'Login';
  static const String register = 'Register';
  static const String enterPhoneNumber = 'Enter your phone number';
  static const String verificationCodeSent =
      'We will send you a verification code';
  static const String phoneNumberHint = '812 3456 7890';
  static const String next = 'Next';
  static const String phoneNumberRequired = 'Phone number is required';
  static const String phoneNumberInvalid = 'Please enter a valid phone number';

  // OTP
  static const String verifyOtp = 'Verify OTP';
  static const String enterVerificationCode = 'Enter verification code';
  static String codeSentTo(String phone) => 'Code sent to $phone';
  static String resendCodeIn(int seconds) => 'Resend code in $seconds seconds';
  static const String resendCode = 'Resend code';
  static const String verify = 'Verify';
  static const String verifying = 'Verifying...';
}
