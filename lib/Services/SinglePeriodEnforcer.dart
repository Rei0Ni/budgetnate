import 'package:flutter/services.dart';

class SinglePeriodEnforcer extends TextInputFormatter
  {
    @override
    TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
        final newText = newValue.text;

        if('.'.allMatches(newText).length <= 1)
        {
            return newValue;
        }
        
        return oldValue;
    }
  }