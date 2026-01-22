import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/utils/string_extension.dart';
import '../../../user/domain/entities/user.dart';

class NearbyUserCard extends StatelessWidget {
  final User user;
  final VoidCallback onTap;

  const NearbyUserCard({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: 70,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Avatar
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight.withOpacity(0.1),
                  border: Border.all(
                    color: AppColors.primaryLight.withOpacity(0.3),
                    width: 1,
                  ),
                  shape: BoxShape.circle,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Column(
                  children: [
                    _personAvatar(
                      user.avatarUrl,
                      const Icon(
                        Icons.person,
                        color: AppColors.surface,
                        size: 24,
                      ),
                      24,
                    ),
                  ],
                ),
              ),

              // Name
              Text(
                getFirstName(user.name),
                style: AppTextStyles.bodyMedium.copyWith(
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: AppConstants.spacingXS),

              // Distance
              Text(
                '${user.distance}',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.textSecondary,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ));
  }
}

Widget _personAvatar(String? avatarUrl, Widget placeholder, double radius) {
  return CircleAvatar(
      radius: radius,
      backgroundColor: AppColors.primary,
      child: ClipOval(
        child: avatarUrl != null ? Image.network(avatarUrl) : placeholder,
      ));
}
