import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  const CustomRoundButton({
    Key? key,
    this.title = "",
    this.onTap,
  }) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onTap?.call();
        },
        child: Text(
          title,
          style: const TextStyle(
            color: Color(0xFFEA2E57),
            fontWeight: FontWeight.bold,
          ),
        ),
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(8.0),
          shadowColor: MaterialStateProperty.all(Colors.black38),
          overlayColor: MaterialStateColor.resolveWith(
              (states) => const Color(0x3FE2E2E8)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
          maximumSize: MaterialStateProperty.all(
            const Size.fromHeight(50),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFFFFFFF),
          ),
          foregroundColor: MaterialStateProperty.all<Color>(
            const Color(0xFFEA2E57),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
