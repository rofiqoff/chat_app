import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/features/authentication/presentation/screens/phone_auth_screen.dart';
import 'package:chat_app/shared/atoms/app_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppConstants.spacingL),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // App Icon
              const Icon(
                Icons.message,
                size: 120,
                color: AppColors.primary,
              ),

              const SizedBox(height: 40),

              // Title
              const Text(
                AppStrings.onboardingTitle,
                style: AppTextStyles.heading2,
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: AppConstants.spacingM),

              // Subtitle
              Text(
                AppStrings.onboardingSubtitle,
                textAlign: TextAlign.center,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),

              const Spacer(),

              // Get Started Button
              AppButton(
                label: AppStrings.getStarted,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PhoneAuthScreen(isLogin: false)),
                  );
                },
              ),

              const SizedBox(height: AppConstants.spacingM),

              // Login Button
              AppButton(
                label: AppStrings.alreadyHaveAccount,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            const PhoneAuthScreen(isLogin: true)),
                  );
                },
                isOutlined: true,
              ),

              const SizedBox(height: AppConstants.spacingL),
            ],
          ),
        ),
      ),
    );
  }
}
