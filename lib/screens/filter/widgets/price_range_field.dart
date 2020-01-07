import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/helpers/format_filed.dart';

class PriceRangeField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Min'),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              // Somente é capaz aceitar digitos, mesmo se algume colar alguma coisa
              WhitelistingTextInputFormatter.digitsOnly,
              // Vai colocar no padrão de reais e não permite centavos
              RealInputFormatter(centavos: false),
            ],
            initialValue: null,
            onSaved: (s) {},
            validator: (s) {
              if (s.isEmpty && int.tryParse(getSanitizedText(s)) == null)
                return 'Utilize valores válidos';
              return null;
            },
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            decoration: const InputDecoration(
                border: OutlineInputBorder(), hintText: 'Max'),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: [
              // Somente é capaz aceitar digitos, mesmo se algume colar alguma coisa
              WhitelistingTextInputFormatter.digitsOnly,
              // Vai colocar no padrão de reais e não permite centavos
              RealInputFormatter(centavos: false),
            ],
            initialValue: null,
            onSaved: (s) {},
            validator: (s) {
              if (s.isEmpty && int.tryParse(getSanitizedText(s)) == null)
                return 'Utilize valores válidos';
              return null;
            },
          ),
        ),
      ],
    );
  }
}
