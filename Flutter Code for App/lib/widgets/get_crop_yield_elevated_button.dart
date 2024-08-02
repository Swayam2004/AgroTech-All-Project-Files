import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class GetCropYieldElevatedButton extends StatelessWidget {
  final void Function()? _onPressed;
  final String _text;

  const GetCropYieldElevatedButton(
      {super.key, void Function()? onPressed, required String text})
      : _text = text,
        _onPressed = onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: themeColor3,
        disabledBackgroundColor: themeColor3.withOpacity(0.5),
      ),
      onPressed: _onPressed,
      child: Text(
        _text,
        style: const TextStyle(
            fontWeight: FontWeight.bold, fontSize: 15, color: themeColor),
      ),
    );
  }
}
