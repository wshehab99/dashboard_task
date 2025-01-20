import 'package:flutter/material.dart';

import '../../../app/themes/app_colors.dart';

class CardHoverWidget extends StatefulWidget {
  const CardHoverWidget({
    super.key,
    required this.color,
    required this.count,
    required this.isDecrease,
    required this.title,
    required this.icon,
    required this.differ,
  });
  final Color color;
  final String title;
  final String count;
  final bool isDecrease;
  final Widget icon;
  final String differ;

  @override
  State<CardHoverWidget> createState() => _CardHoverWidgetState();
}

class _CardHoverWidgetState extends State<CardHoverWidget> {
  double angle = 0.8;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onHover: (value) {
        setState(() {
          angle = value ? 0.0 : 0.8;
        });
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.title.toUpperCase(),
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 13, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.count,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium
                          ?.copyWith(fontSize: 21, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4.5,
                            vertical: 2.8,
                          ),
                          decoration: BoxDecoration(
                            color: widget.isDecrease
                                ? AppColors.error
                                : AppColors.success,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                widget.isDecrease
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                size: 10,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 2.5,
                              ),
                              Text(
                                widget.differ,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Flexible(
                          child: Column(
                            children: [
                              Text(
                                "Sience last month",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Transform.rotate(
                angle: angle,
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(7.5),
                  ),
                  child: Transform.rotate(
                    angle: -angle,
                    child: widget.icon,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
