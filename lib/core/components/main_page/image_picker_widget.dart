import 'package:flutter/material.dart';

import 'dotted_border.dart';

///
class ImagePickerWidget extends StatefulWidget {
  ///
  ImagePickerWidget({Key? key}) : super(key: key);

  @override
  _ImagePickerWidgetState createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  double _dottedBoxSize(context) {
    return MediaQuery.of(context).size.width / 2 - 40;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorderBox(
            child: Container(
              height: _dottedBoxSize(context),
              width: _dottedBoxSize(context),
              child: const Icon(
                Icons.add_a_photo,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: const [
                Icon(
                  Icons.file_upload_sharp,
                  color: Colors.grey,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  // ignore: lines_longer_than_80_chars
                  'front',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
