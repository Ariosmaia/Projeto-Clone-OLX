import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xlo/helpers/format_filed.dart';
import 'package:xlo/models/filter.dart';

class PriceRangeField extends StatelessWidget {
  final Filter filter;

  const PriceRangeField({Key key, this.filter}) : super(key: key);
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
            initialValue: filter.minPrice?.toString(),
            onSaved: (s) {
              if (s.isEmpty)
                filter.minPrice = null;
              else
                filter.minPrice = int.parse(getSanitizedText(s));
            },
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
            initialValue: filter.maxPrice?.toString(),
            onSaved: (s) {
              if (s.isEmpty)
                filter.maxPrice = null;
              else
                filter.maxPrice = int.parse(getSanitizedText(s));
            },
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
