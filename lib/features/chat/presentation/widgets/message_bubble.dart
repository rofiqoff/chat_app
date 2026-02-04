import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/core/theme/app_text_styles.dart';
import 'package:chat_app/features/chat/data/models/message.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/constants/app_constants.dart';

class MessageBubble extends StatelessWidget {
  final Message message;

  const MessageBubble({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          message.isSentByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.only(
          top: AppConstants.spacingS,
          bottom: AppConstants.spacingS,
          left: message.isSentByMe ? 64 : AppConstants.spacingM,
          right: message.isSentByMe ? AppConstants.spacingM : 64,
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: AppConstants.spacingM,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: message.isSentByMe ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(16.0),
            topRight: const Radius.circular(16.0),
            bottomLeft: Radius.circular(message.isSentByMe ? 16.0 : 0.0),
            bottomRight: Radius.circular(message.isSentByMe ? 0.0 : 16.0),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.12),
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Message text
            Text(
              message.content,
              style: AppTextStyles.bodyMedium.copyWith(
                color: message.isSentByMe
                    ? AppColors.surface
                    : AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: 4.0),

            // Time and status
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  _formatTime(message.timestamp),
                  style: AppTextStyles.bodySmall.copyWith(
                    color: message.isSentByMe
                        ? AppColors.surface.withOpacity(0.7)
                        : AppColors.textSecondary,
                  ),
                ),
                if (message.isSentByMe) ...[
                  const SizedBox(width: 4.0),
                  _buildStatusIcon(message.status),
                ]
              ],
            ),
          ],
        ),
      ),
    );
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inDays > 0) {
      // Today - show time
      return DateFormat('HH:mm').format(timestamp);
    } else if (difference.inDays == 1) {
      // Yesterday
      return 'Yesterday ${DateFormat('HH:mm').format(timestamp)}';
    } else if (difference.inDays < 7) {
      // This week - show day and time
      return DateFormat('EEE HH:mm').format(timestamp); // E.g., Mon, Tue
    } else {
      // Older - show date
      return DateFormat('dd/MM/yyyy HH:mm').format(timestamp);
    }
  }

  Widget _buildStatusIcon(MessageStatus status) {
    IconData icon;
    Color color = AppColors.surface.withOpacity(0.7);

    switch (status) {
      case MessageStatus.sent:
        icon = Icons.check;
        break;
      case MessageStatus.delivered:
        icon = Icons.done_all;
        break;
      case MessageStatus.read:
        icon = Icons.done_all;
        color = AppColors.accent;
        break;
      case MessageStatus.failed:
        icon = Icons.error;
        color = AppColors.error;
        break;
    }

    return Icon(
      icon,
      size: 12.0,
      color: color,
    );
  }
}
