import 'package:chat_app/ui/molecules/snackbar.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/theme/app_text_styles.dart';
import '../../../../call/domain/entities/call.dart';

class CallsTabs extends StatelessWidget {
  final List<Call> calls;

  const CallsTabs({
    Key? key,
    required this.calls,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: calls.length,
      itemBuilder: (context, index) {
        final call = calls[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor:
                call.isMissed ? AppColors.error : AppColors.primary,
            child: Icon(
              call.isVideo ? Icons.videocam : Icons.phone,
              color: AppColors.surface,
              size: 20,
            ),
          ),
          title: Text(
            call.name,
            style:
                AppTextStyles.bodyLarge.copyWith(fontWeight: FontWeight.w600),
          ),
          subtitle: Row(
            children: [
              Icon(
                call.isIncoming ? Icons.call_received : Icons.call_made,
                size: 16,
                color:
                    call.isMissed ? AppColors.error : AppColors.textSecondary,
              ),
              const SizedBox(width: 4),
              Text(
                call.time,
                style: AppTextStyles.bodyMedium
                    .copyWith(color: AppColors.textSecondary),
              ),
            ],
          ),
          trailing: IconButton(
            icon: Icon(
              call.isVideo ? Icons.videocam : Icons.call,
              color: AppColors.primary,
            ),
            onPressed: () {
              showMessageSuccess(context, 'Call ${call.name}');
            },
          ),
        );
      },
    );
  }
}
