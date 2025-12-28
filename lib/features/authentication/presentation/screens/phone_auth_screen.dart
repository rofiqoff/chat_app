import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/shared/atoms/app_button.dart';
import 'package:chat_app/shared/atoms/app_text_field.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PhoneAuthScreen extends StatefulWidget {
  final bool isLogin;

  const PhoneAuthScreen({
    Key? key,
    required this.isLogin,
  }) : super(key: key);

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // State variables
  String _countryCode = '+62';
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return AppStrings.phoneNumberRequired;
    }

    // Check if contains only digits
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return AppStrings.phoneNumberInvalid;
    }

    // Check minimum length (adjust based on your country)
    if (value.length < 9) {
      return AppStrings.phoneNumberInvalid;
    }
    return null; // null means validation passed
  }

  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _isLoading = false;
        });

        String fullPhoneNumber = '$_countryCode${_phoneController.text}';

        if (kDebugMode) {
          print('Phone number: $fullPhoneNumber');
        }

        // TODO: Navigate to OTP screen
        // We'll implement this in the next step
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(widget.isLogin ? AppStrings.login : AppStrings.register),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacingL),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppConstants.spacingL),

                // Title
                const Text(
                  AppStrings.enterPhoneNumber,
                  style: AppTextStyles.heading2,
                ),

                const SizedBox(height: AppConstants.spacingL),

                Text(
                  AppStrings.verificationCodeSent,
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.textSecondary,
                  ),
                ),

                const SizedBox(height: AppConstants.spacingXL),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Country Code Selector
                    _buildCountryCodeSelector(),

                    const SizedBox(width: AppConstants.spacingM),

                    // Phone Number Input
                    Expanded(
                      child: AppTextField(
                        controller: _phoneController,
                        hintText: AppStrings.phoneNumberHint,
                        keyboardType: TextInputType.phone,
                        validator: _validatePhoneNumber,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly, // Only numbers
                          LengthLimitingTextInputFormatter(13), // Max 13 digits
                        ],
                      ),
                    ),
                  ],
                ),

                const Spacer(),

                // Next Button
                AppButton(
                  label: AppStrings.next,
                  onPressed: _handleNext,
                  isLoading: _isLoading,
                ),

                const SizedBox(height: AppConstants.spacingL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Builds country code selector
  Widget _buildCountryCodeSelector() {
    return GestureDetector(
      onTap: () {
        // TODO: Show country code picker
        // For now, we'll keep it simple with just +62
        print('Country code selector tapped');
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingM,
          vertical: AppConstants.spacingM,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border),
          borderRadius: BorderRadius.circular(AppConstants.radiusM),
        ),
        child: Row(
          children: [
            Text(
              _countryCode,
              style: AppTextStyles.bodyLarge.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.arrow_drop_down,
              color: AppColors.textSecondary,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
