import 'package:dashbaord/app/themes/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_cubit.dart';

class SideNavigationMenu extends StatelessWidget {
  const SideNavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit = context.read();
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: cubit.isCollapsed ? 70 : 200,
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                blurRadius: 7.5,
                spreadRadius: 2.5,
                color: AppColors.darkGrey.withOpacity(0.2),
              ),
            ],
          ),
          child: Column(
            children: [
              // Menu Items
              SideNavMenuItem(
                icon: Icons.speed,
                label: "Dashboard",
                onPressed: () {},
                isCollapsed: cubit.isCollapsed,
              ),
              SideNavMenuItem(
                icon: Icons.calendar_month,
                label: "Calender",
                onPressed: () {},
                isCollapsed: cubit.isCollapsed,
              ),
              SideNavMenuItem(
                icon: Icons.message,
                label: "Chat",
                onPressed: () {},
                isCollapsed: cubit.isCollapsed,
              ),
              SideNavMenuItem(
                icon: Icons.mail,
                label: "Email",
                onPressed: () {},
                isCollapsed: cubit.isCollapsed,
              ),
              SideNavMenuItem(
                icon: Icons.playlist_add_check,
                label: "Tasks",
                onPressed: () {},
                isCollapsed: cubit.isCollapsed,
              ),
            ],
          ),
        );
      },
    );
  }
}

class SideNavMenuItem extends StatelessWidget {
  const SideNavMenuItem({
    super.key,
    required this.icon,
    required this.label,
    required this.onPressed,
    required this.isCollapsed,
  });

  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final bool isCollapsed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.darkGrey,
              size: 20,
            ),
            if (!isCollapsed) ...[
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  children: [
                    Text(
                      label,
                      style: Theme.of(context).textTheme.titleSmall,
                      maxLines: 1,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
