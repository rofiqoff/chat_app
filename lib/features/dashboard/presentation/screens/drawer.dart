import 'package:chat_app/courier/courier.dart';
import 'package:chat_app/ui/molecules/snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';

class DrawerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: AppColors.primary),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundColor: AppColors.surface,
                  child: Icon(Icons.person, size: 40, color: AppColors.primary),
                ),
                const SizedBox(height: AppConstants.spacingM),
                Text(
                  AppStrings.yourName,
                  style:
                      AppTextStyles.heading4.copyWith(color: AppColors.surface),
                ),
                const SizedBox(height: 4),
                Text(
                  AppStrings.yourPhone,
                  style: AppTextStyles.bodyMedium
                      .copyWith(color: AppColors.surface),
                ),
              ],
            ),
          ),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text(AppStrings.profile),
            onTap: () {
              Courier.back(context);
              showMessageSuccess(context, 'Profile Tapped');
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text(AppStrings.settings),
            onTap: () {
              Courier.back(context);
              showMessageSuccess(context, 'Setting Tapped');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout, color: AppColors.error),
            title: const Text(AppStrings.logout,
                style: TextStyle(color: AppColors.error)),
            onTap: () {
              Courier.back(context);
              showMessageSuccess(context, 'Logout tapped');
            },
          ),
        ],
      ),
    );
  }
}
