import 'package:chat_app/core/constants/app_constants.dart';
import 'package:chat_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../../courier/courier.dart';

class ScreenContainer extends StatelessWidget {
  final Widget body;
  final String? title;
  final IconData? leadingIcon;
  final bool? showLeadingIcon;
  final Widget? drawer;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final List<Widget>? toolbarActions;
  final void Function()? onLeadingPressed;

  const ScreenContainer({
    super.key,
    required this.body,
    this.title,
    this.leadingIcon,
    this.showLeadingIcon = true,
    this.toolbarActions,
    this.drawer,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.onLeadingPressed,
  });

  @override
  Widget build(BuildContext context) {
    final titlePadding = showLeadingIcon == true ? 0.0 : AppConstants.spacingM;

    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.all(titlePadding),
          child: Text(title ?? ''),
        ),
        backgroundColor: AppColors.surface,
        foregroundColor: AppColors.textPrimary,
        iconTheme: const IconThemeData(color: AppColors.textPrimary),
        automaticallyImplyLeading: false,
        leading: (showLeadingIcon == true)
            ? IconButton(
                icon: Icon(leadingIcon ?? Icons.arrow_back),
                onPressed: () => onLeadingPressed != null
                    ? onLeadingPressed?.call()
                    : Courier.back(context),
              )
            : null,
        actions: toolbarActions,
        elevation: 0,
      ),
      drawer: drawer,
      bottomNavigationBar: bottomNavigationBar,
      floatingActionButton: floatingActionButton,
      body: SafeArea(child: body),
    );
  }
}
