import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddTokenDialog extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final VoidCallback? onPressed;
  final BorderSide borderColor;

  AddTokenDialog({
    Key? key,
    required this.child,
    this.onPressed,
    this.widthFactor = 0.4,
    this.heightFactor = 0.06,
    this.borderColor = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container();  }


}
