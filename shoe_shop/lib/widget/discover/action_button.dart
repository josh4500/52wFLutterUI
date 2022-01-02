import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  const ActionWidget({Key? key, required this.icon, this.onTap})
      : super(key: key);
  final IconData icon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFF4F4F6),
      ),
      child: IconButton(
        visualDensity: VisualDensity.compact,
        onPressed: onTap,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        iconSize: 24,
      ),
    );
  }
}
