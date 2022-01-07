import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {Key? key, this.title = "", this.onTap, this.disabled = false})
      : super(key: key);

  final String title;
  final bool disabled;
  final VoidCallback? onTap;

  @override
  _CustomButtonState createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _scaleButton = false;
  bool _willStopScale = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      width: double.infinity,
      child: AnimatedScale(
        duration: const Duration(milliseconds: 500),
        scale: _scaleButton
            ? _willStopScale
                ? 1
                : 0.9
            : 1.0,
        onEnd: () {
          if (!_willStopScale) {
            setState(() {
              _willStopScale = true;
            });
          }
        },
        curve: Curves.easeInOut,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            widget.onTap?.call();
            setState(() {
              _scaleButton = !_scaleButton;
              _willStopScale = false;
            });
          },
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all(
              const Size.fromHeight(50),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(
              widget.disabled
                  ? const Color(0xADEA2E57)
                  : const Color(0xFFEA2E57),
            ),
            foregroundColor: MaterialStateProperty.all<Color>(
              Colors.white,
            ),
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 12.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
