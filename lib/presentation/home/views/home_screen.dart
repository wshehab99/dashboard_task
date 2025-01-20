import 'package:dashbaord/app/themes/app_colors.dart';
import 'package:dashbaord/presentation/home/bloc/main_cubit.dart';
import 'package:dashbaord/presentation/home/widgets/pie_chart_widget.dart';
import 'package:dashbaord/presentation/widgets/app_layout_builder.dart';
import 'package:dashbaord/resources/assets_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/bar_chart_widget.dart';
import '../widgets/calender_widget.dart';
import '../widgets/card_hover_widget.dart';
import '../widgets/notification_button.dart';
import '../widgets/side_navigation_menu.dart';
import '../widgets/tablet_desktop_grid_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit = context.read();
        return AppLayoutBuilder(
          desktop: Scaffold(
            appBar: tabletDesktopAppBar(
              isCollapsed: cubit.isCollapsed,
              collapseNavSide: cubit.collapseNavSide,
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SideNavigationMenu(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Dashboard",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const CalendarWidget(),
                          ],
                        ),
                        const SizedBox(height: 10),
                        const TabletOrDesktopGridView(),
                        const Row(
                          children: [
                            Expanded(child: PieChartWidget()),
                            Expanded(child: BarChartWidget()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          mobile: Scaffold(
            appBar: AppBar(
              title: Image.asset(
                AssetsManager.extendeLogo,
                width: 90,
              ),
              actions: [
                const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: NotificationButton(),
                ),
              ],
            ),
            drawer: Drawer(
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
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 10),
                  Text(
                    "Dashboard",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: Color(0xFF17A794),
                    title: "Customers",
                    count: "54,214",
                    isDecrease: false,
                    icon: Icon(Icons.person),
                    differ: "2.541",
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: Color(0xFF299BF6),
                    title: "orders",
                    count: "7,543",
                    isDecrease: true,
                    icon: Icon(Icons.shopping_basket_outlined),
                    differ: "1.08%",
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: AppColors.error,
                    title: "revenue",
                    count: "\$9,254",
                    isDecrease: true,
                    icon: Icon(Icons.attach_money_outlined),
                    differ: "7.00%",
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: Color(0xFF4254BA),
                    title: "groth",
                    count: "+20.6%",
                    isDecrease: false,
                    icon: Icon(Icons.bubble_chart_sharp),
                    differ: "4.87%",
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: Color(0xFFFEC20D),
                    title: "conversation",
                    count: "9,62%",
                    isDecrease: false,
                    icon: Icon(Icons.pie_chart),
                    differ: "3.07%",
                  ),
                  const SizedBox(height: 10),
                  const CardHoverWidget(
                    color: Color(0xFF49526B),
                    title: "balance",
                    count: "\$168.5k",
                    isDecrease: false,
                    icon: Icon(Icons.account_balance_wallet),
                    differ: "18.34%",
                  ),
                  const PieChartWidget(),
                  const BarChartWidget(),
                ],
              ),
            ),
          ),
          tablet: Scaffold(
            appBar: tabletDesktopAppBar(
              isCollapsed: cubit.isCollapsed,
              collapseNavSide: cubit.collapseNavSide,
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SideNavigationMenu(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 7.5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Dashboard",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        const TabletOrDesktopGridView(),
                        const Row(
                          children: [
                            Expanded(child: PieChartWidget()),
                            Expanded(child: BarChartWidget()),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  AppBar tabletDesktopAppBar({
    required bool isCollapsed,
    required void Function()? collapseNavSide,
  }) =>
      AppBar(
        title: Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 350),
              curve: Curves.linear,
              alignment: Alignment.center,
              width: isCollapsed ? 50 : 200,
              child: Image.asset(
                isCollapsed ? AssetsManager.logoSM : AssetsManager.extendeLogo,
                width: isCollapsed ? 25 : 90,
              ),
            ), // Header with Collapse Button
            IconButton(
              icon: const Icon(
                Icons.menu,
                color: AppColors.darkGrey,
              ),
              onPressed: collapseNavSide,
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: NotificationButton(),
          ),
        ],
      );
}
