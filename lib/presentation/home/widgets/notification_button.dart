
import 'package:flutter/material.dart';

class NotificationButton extends StatefulWidget {
  const NotificationButton({super.key});

  @override
  State<NotificationButton> createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  bool _isHovered = false;
  OverlayEntry? _dropdownOverlay;

  void _toggleDropdown() {
    if (_dropdownOverlay == null) {
      _showDropdown();
    } else {
      _hideDropdown();
    }
  }

  void _showDropdown() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final offset = renderBox.localToGlobal(Offset.zero);

    _dropdownOverlay = OverlayEntry(
      builder: (context) => Stack(
        children: [
          // This GestureDetector closes the dropdown when tapped outside
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: _hideDropdown,
            child: Container(
              color: Colors.transparent, // Makes the whole screen tappable
            ),
          ),
          Positioned(
            left: offset.dx - 150,
            top: offset.dy + renderBox.size.height + 10,
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 200, // Adjust the width as needed
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(
                    5,
                    (index) => ListTile(
                      leading: const Icon(Icons.notifications),
                      title: Text('Notification ${index + 1}'),
                      onTap: () {
                        _hideDropdown();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    overlay.insert(_dropdownOverlay!);
  }

  void _hideDropdown() {
    _dropdownOverlay?.remove();
    _dropdownOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: GestureDetector(
        onTap: _toggleDropdown,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color:
                _isHovered ? Colors.blue.withOpacity(0.2) : Colors.transparent,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: const Icon(
            Icons.notifications,
            size: 32.0,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
