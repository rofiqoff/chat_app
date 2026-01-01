import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class ScreenContainer extends StatelessWidget {
  final Widget child;
  final String? title;

  const ScreenContainer({super.key, required this.child, this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Text(title ?? ''),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        leading: (title != null && title?.isNotEmpty == true) ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ) : null,
        elevation: 0,
      ),
      body: SafeArea(child: child),
    );
  }
}