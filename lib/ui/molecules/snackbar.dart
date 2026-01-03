import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

void showMessageSuccess(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: AppColors.success,
    duration: duration,
  ));
}

void showMessageError(
  BuildContext context,
  String message, {
  Duration duration = const Duration(seconds: 2),
}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    backgroundColor: AppColors.error,
    duration: duration,
  ));
}
