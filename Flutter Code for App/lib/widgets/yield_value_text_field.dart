import 'package:agro_tech/utilities/constants/constants.dart';
import 'package:flutter/material.dart';

class YieldValueTextField extends StatelessWidget {
  final TextEditingController _controller;
  final String? Function(String?)? _validator;
  final String _labelText;

  const YieldValueTextField({
    super.key,
    required TextEditingController controller,
    String? Function(String?)? validator,
    required String labelText,
  })  : _labelText = labelText,
        _validator = validator,
        _controller = controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: _controller,
        keyboardType: TextInputType.number,
        validator: _validator,
        cursorColor: themeColor,
        decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: themeColor, width: 2),
          ),
          floatingLabelStyle: const TextStyle(color: Colors.black87),
          filled: true,
          fillColor: themeColor3.withOpacity(0.3),
          labelText: _labelText,
        ),
      ),
    );
  }
}
