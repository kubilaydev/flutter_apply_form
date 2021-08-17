import 'package:flutter/material.dart';

///
class FilterBox extends StatelessWidget {
  ///
  FilterBox(
      {Key? key,
      required this.title,
      required this.titleIcon,
      required this.content,
      required this.iconColor})
      : super(key: key);

  ///
  final String title;

  ///
  final String content;

  ///
  final IconData titleIcon;

  ///
  final Color iconColor;

  ///

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 2 - 24,
            padding: const EdgeInsets.only(top: 12, bottom: 12, left: 12),
            margin: const EdgeInsets.only(
              top: 18,
            ),
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(
                width: 1,
                color: const Color(0XFFE5E5E5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  titleIcon,
                  color: iconColor,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(content,
                    style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        Positioned(
          top: 10,
          left: 14,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(2),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.black38,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }
}
