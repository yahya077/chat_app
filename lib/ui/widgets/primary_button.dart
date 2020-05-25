import 'package:chatapp/ui/size_config.dart';
import 'package:chatapp/ui/style.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final Widget child;
  final Function onTap;
  const PrimaryButton({
    Key key,
    this.child,
    this.onTap,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6),
        padding: EdgeInsets.symmetric(
          horizontal: SizeConfig.blockSizeHorizontal * 6,
          vertical: SizeConfig.blockSizeHorizontal*4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: Style.gradientColor,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(25)),
        child: child,
      ),
    );
  }
}
