
import 'package:flutter/material.dart';

import '../../../app/themes/app_colors.dart';
import '../../../app/utilities/layout_breakpoints.dart';
import 'card_hover_widget.dart';

class TabletOrDesktopGridView extends StatelessWidget {
  const TabletOrDesktopGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount:
            checkLayout(context) == LayoutBreakpoints.medium ? 2 : 3,
        childAspectRatio: 2.4,
        mainAxisExtent: 150,
      ),
      children: const [
        CardHoverWidget(
          color: Color(0xFF17A794),
          title: "Customers",
          count: "54,214",
          isDecrease: false,
          icon: Icon(Icons.person),
          differ: "2.541",
        ),
        CardHoverWidget(
          color: Color(0xFF299BF6),
          title: "orders",
          count: "7,543",
          isDecrease: true,
          icon: Icon(Icons.shopping_basket_outlined),
          differ: "1.08%",
        ),
        CardHoverWidget(
          color: AppColors.error,
          title: "revenue",
          count: "\$9,254",
          isDecrease: true,
          icon: Icon(Icons.attach_money_outlined),
          differ: "7.00%",
        ),
        CardHoverWidget(
          color: Color(0xFF4254BA),
          title: "groth",
          count: "+20.6%",
          isDecrease: false,
          icon: Icon(Icons.bubble_chart_sharp),
          differ: "4.87%",
        ),
        CardHoverWidget(
          color: Color(0xFFFEC20D),
          title: "conversation",
          count: "9,62%",
          isDecrease: false,
          icon: Icon(Icons.pie_chart),
          differ: "3.07%",
        ),
        CardHoverWidget(
          color: Color(0xFF49526B),
          title: "balance",
          count: "\$168.5k",
          isDecrease: false,
          icon: Icon(Icons.account_balance_wallet),
          differ: "18.34%",
        ),
      ],
    );
  }
}
