import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../courier/courier.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  final String? title;
  final Function()? onBackPressed;

  const ScreenContainer({
    super.key,
    required this.child,
    this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(title ?? ''),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        leading: (title != null && title?.isNotEmpty == true)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => onBackPressed != null
                    ? onBackPressed?.call()
                    : Courier.back(context),
              )
            : null,
        elevation: 0,
      ),
      body: SafeArea(child: child),
    );
  }
}
