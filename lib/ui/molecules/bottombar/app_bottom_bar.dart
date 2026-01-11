import 'package:chat_app/core/theme/app_colors.dart';
import 'package:chat_app/ui/molecules/bottombar/app_bottom_nav_item.dart';
import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  final List<AppBottomNavItem> items;

  const AppBottomBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bottomNavItems = items
        .map(
          (item) => BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label,
          ),
        )
        .toList();

    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
      onTap: onTap,
      items: bottomNavItems,
    );
  }
}
