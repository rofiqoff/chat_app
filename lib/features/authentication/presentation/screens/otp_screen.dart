import 'dart:async';
import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/courier/courier.dart';
import 'package:chat_app/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:chat_app/ui/atoms/app_button.dart';
import 'package:chat_app/ui/atoms/otp_input_box.dart';
import 'package:chat_app/ui/molecules/snackbar.dart';
import 'package:chat_app/ui/pages/screen_container.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String phoneNumber;

  const OtpScreen({
    Key? key,
    required this.phoneNumber,
  }) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

const int _otpLength = 4;

class _OtpScreenState extends State<OtpScreen> {
  int _countdown = 60;
  Timer? _timer;
  bool _isLoading = false;

  final List<TextEditingController> _controllers = List.generate(
    _otpLength,
    (index) => TextEditingController(),
  );

  final List<FocusNode> _focusNodes = List.generate(
    _otpLength,
    (index) => FocusNode(),
  );

  @override
  void initState() {
    super.initState();
    _startCountdown();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();

    for (var controllers in _controllers) {
      controllers.dispose();
    }

    for (var node in _focusNodes) {
      node.dispose();
    }

    super.dispose();
  }

  /// Start the countdown timer for resending OTP
  void _startCountdown() {
    _countdown = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdown > 0) {
        setState(() {
          _countdown--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  /// Handle OTP input changes
  void _handleOtpChange(int index, String value) {
    if (value.isNotEmpty) {
      if (index < _otpLength - 1) {
        _focusNodes[index + 1].requestFocus();
      } else {
        _focusNodes[index].requestFocus();
      }
    } else {
      if (index > 0) {
        _focusNodes[index - 1].requestFocus();
      }
    }
  }

  /// Get complete OTP code
  String _getOtpCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  /// Simulate OTP verification process
  void _handleVerifyOtp() {
    String otpCode = _getOtpCode();

    // Check if all fields are filled
    if (otpCode.length != _otpLength) {
      showMessageError(context, 'Please enter the complete OTP code.');
      return;
    }

    setState(() {
      _isLoading = true;
    });

    // Simulate a network call or OTP verification process
    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      setState(() {
        _isLoading = false;
      });

      print('OTP verified: $otpCode');

      // Simulate successful verification
      showMessageSuccess(context, 'OTP verified successfully!');

      Courier.sendAndRemoveAll(context, const DashboardScreen());
    });
  }

  /// Handle resend OTP action
  void _handleResendOtp() {
    if (_countdown > 0) return;

    print('Resending OTP to ${widget.phoneNumber}');

    _startCountdown();

    for (var controller in _controllers) {
      controller.clear();
    }

    _focusNodes[0].requestFocus();

    showMessageSuccess(context, 'OTP resent to ${widget.phoneNumber}');
  }

  @override
  Widget build(BuildContext context) {
    return ScreenContainer(
      title: AppStrings.enterVerificationCode,
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.spacingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: AppConstants.spacingL),
            const Text(
              AppStrings.enterVerificationCode,
              style: AppTextStyles.heading2,
            ),
            const SizedBox(height: AppConstants.spacingS),
            Text(
              AppStrings.codeSentTo(widget.phoneNumber),
              style: AppTextStyles.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppConstants.spacingXL),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _otpLength,
                (index) => Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.spacingS),
                  child: OtpInputBox(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    onChanged: (value) => _handleOtpChange(index, value),
                  ),
                ),
              ),
            ),
            const SizedBox(height: AppConstants.spacingL),
            Center(
              child: _countdown > 0
                  ? Text(
                      AppStrings.resendCodeIn(_countdown),
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    )
                  : GestureDetector(
                      onTap: _handleResendOtp,
                      child: Text(
                        AppStrings.resendCode,
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
            ),
            const Spacer(),
            AppButton(
              label: AppStrings.verify,
              onPressed: _handleVerifyOtp,
              isLoading: _isLoading,
            ),
            const SizedBox(height: AppConstants.spacingL),
          ],
        ),
      ),
    );
  }
}
