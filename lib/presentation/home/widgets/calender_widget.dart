import 'package:dashbaord/app/utilities/extinsions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/main_cubit.dart';

class CalendarWidget extends StatefulWidget {
  const CalendarWidget({super.key});

  @override
  State<CalendarWidget> createState() => _CalendarWidgetState();
}

class _CalendarWidgetState extends State<CalendarWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainCubit, MainState>(
      builder: (context, state) {
        MainCubit cubit = context.read();
        return GestureDetector(
          onTap: () => cubit.pickDate(context),
          child: Row(
            children: [
              Icon(
                Icons.calendar_today,
                color: Colors.blue.shade700,
              ),
              const SizedBox(width: 8),
              Text(
                cubit.selectedDateTime.format,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ],
          ),
        );
      },
    );
  }
}
