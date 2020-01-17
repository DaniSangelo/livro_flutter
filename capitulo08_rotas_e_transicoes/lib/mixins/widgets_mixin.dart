import 'package:flutter/material.dart';

mixin TextFormFieldMixin {
  textFormField({
    @required focusNode,
    @required controller,
    @required labelText,
    @required textInputAction,
    @required onFieldSubmitted,
    @required validator,
  }) {
    return TextFormField(
      autovalidate: true,
      focusNode: focusNode ?? null,
      controller: controller ?? null,
      decoration: InputDecoration(
        labelText: labelText ?? 'Informe o labelText',
      ),
      textInputAction: textInputAction ?? null,
      onFieldSubmitted: onFieldSubmitted ?? null,
      validator: validator ?? null,
    );
  }
}
