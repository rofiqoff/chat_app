import 'package:chat_app/core/constants/app_strings.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/features/chat/domain/entities/chat.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';

class ScreenContainer extends StatelessWidget {
  final Widget body;
  final Chat chat;

  const ScreenContainer({
    super.key,
    required this.body,
    required this.chat,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: _appsBar(),
      body: SafeArea(child: body),
    );
  }

  AppBar _appsBar() {
    return AppBar(
      backgroundColor: AppColors.primary,
      titleSpacing: 0,
      title: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.surface,
            child: chat.isGroup
                ? const Icon(
                    Icons.group,
                    color: AppColors.primary,
                    size: 20,
                  )
                : Text(
                    chat.name[0].toUpperCase(),
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: AppColors.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),

          const SizedBox(width: 12),

          // Name and status
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                chat.name,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.w600,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                AppStrings.online,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.surface.withOpacity(0.8),
                ),
              )
            ],
          ))
        ],
      ),
      actions: [
        // Video call button
        IconButton(
          icon: const Icon(Icons.videocam, color: AppColors.surface),
          onPressed: () {
            print('Video call tapped');
            // TODO: Start video call
          },
        ),
        // Voice call button
        IconButton(
          icon: const Icon(Icons.call, color: AppColors.surface),
          onPressed: () {
            print('Voice call tapped');
            // TODO: Start voice call
          },
        ),
        // More options
        IconButton(
          icon: const Icon(Icons.more_vert, color: AppColors.surface),
          onPressed: () {
            print('More options tapped');
            // TODO: Show options menu
          },
        ),
      ],
    );
  }
}
