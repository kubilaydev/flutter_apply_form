
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

///
class DottedBorderBox extends StatelessWidget {
  ///
  DottedBorderBox({Key? key, required this.child}) : super(key: key);

  ///
  final double cornerRadius = 10.0;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      color: const Color(0xFFE9EBF5),
      strokeWidth: 1,
      radius: const Radius.circular(10),
      dashPattern: const [5, 5],
      customPath: (size) {
        return Path()
          ..moveTo(cornerRadius, 0)
          ..lineTo(size.width - cornerRadius, 0)
          ..arcToPoint(Offset(size.width, cornerRadius),
              radius: Radius.circular(cornerRadius))
          ..lineTo(size.width, size.height - cornerRadius)
          ..arcToPoint(Offset(size.width - cornerRadius, size.height),
              radius: Radius.circular(cornerRadius))
          ..lineTo(cornerRadius, size.height)
          ..arcToPoint(Offset(0, size.height - cornerRadius),
              radius: Radius.circular(cornerRadius))
          ..lineTo(0, cornerRadius)
          ..arcToPoint(Offset(cornerRadius, 0),
              radius: Radius.circular(cornerRadius));
      },
      child: child,
    );
  }
}
