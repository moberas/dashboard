import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EmailTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function onFieldSubmitted;
  final Function validator;

  const EmailTextField({
    Key key,
    @required this.controller,
    @required this.focusNode,
    @required this.onFieldSubmitted,
    @required this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextFormField(
            controller: controller,
            validator: validator,
            focusNode: focusNode,
            obscureText: false,
            textInputAction: TextInputAction.send,
            onFieldSubmitted: onFieldSubmitted,
            decoration: InputDecoration(
              hintText: 'Email',
              contentPadding: const EdgeInsets.all(8),
            ),
          ),
        ),
      ],
    );
  }
}
