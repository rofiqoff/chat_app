import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../../chat/domain/entities/chat.dart';

class ChatListItem extends StatelessWidget {
  final Chat chat;
  final VoidCallback? onTap;

  const ChatListItem({
    Key? key,
    required this.chat,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppConstants.spacingM,
        vertical: AppConstants.spacingS,
      ),

      // Avatar
      leading: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.primary,
        child: chat.isGroup
            ? const Icon(
                Icons.group,
                color: AppColors.surface,
                size: 28,
              )
            : Text(
                chat.name[0].toUpperCase(),
                style: AppTextStyles.heading3.copyWith(
                  color: AppColors.surface,
                ),
              ),
      ),

      // Name and last message
      title: Text(
        chat.name,
        style: AppTextStyles.bodyLarge.copyWith(
          fontWeight: FontWeight.w600,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
      subtitle: Text(
        chat.lastMessage,
        style: AppTextStyles.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),

      // Time and unread count
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            chat.time,
            style: AppTextStyles.bodySmall,
          ),
          const SizedBox(height: AppConstants.spacingXS),
          if (chat.unreadCount > 0) ...[
            const SizedBox(height: AppConstants.spacingXS),
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppConstants.spacingS,
                vertical: AppConstants.spacingXS,
              ),
              decoration: const BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
              ),
              constraints: const BoxConstraints(
                minWidth: 20,
                minHeight: 20,
              ),
              child: Text(
                chat.unreadCount > 99 ? '99+' : '${chat.unreadCount}',
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.surface,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ],
      ),
    );
  }
}
