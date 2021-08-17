import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'dotted_border.dart';
import 'filter_box.dart';

///
class Identification extends StatefulWidget {
  ///
  Identification({
    Key? key,
  }) : super(key: key);

  ///

  @override
  _IdentificationState createState() => _IdentificationState();
}

class _IdentificationState extends State<Identification>
    with SingleTickerProviderStateMixin {
  ///

  ///
  final TextEditingController _licName = TextEditingController();

  ///
  final TextEditingController _licLastName = TextEditingController();

  ///
  final TextEditingController _licId = TextEditingController();

  ///
  final TextEditingController _pasName = TextEditingController();

  ///
  final TextEditingController _pasLastName = TextEditingController();

  ///
  final TextEditingController _pasId = TextEditingController();

  ///
  TabController? _licenseController;

  ///

  ///

  double _dottedBoxSize() {
    return MediaQuery.of(context).size.width / 2 - 40;
  }

  final double cornerRadius = 10.0;

  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    _licenseController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _licenseController!.dispose();

    super.dispose();
  }

  ///
  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var _licenceBirthDate = DateTime.now().subtract(const Duration(days: 8640));
    var _passportBirthDate =
        DateTime.now().subtract(const Duration(days: 8640));

    ///
    var _licenceGender = 1;

    ///
    var _passportGender = 1;

    return DefaultTabController(
      length: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),

              const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Identification",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.w700),
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Driver License',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: const Color(0XFFF2F2F2),
                height: 32,
                child: buildTabBar(),
              ),
              //? TABS
              AnimatedContainer(
                curve: Curves.fastOutSlowIn,
                duration: const Duration(seconds: 1),
                height: _licenseController!.index == 0 ? 360 : 245,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _licenseController,
                  children: <Widget>[
                    //? PAGE 1
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          buildTextFormField(
                            _licName,
                            'First Name',
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          buildTextFormField(_licLastName, 'Last Name'),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //? START
                              buildBirthDateGesture(_licenceBirthDate),
                              genderGetterBuilder(_licenceGender),
                              //? FINISH
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          buildTextFormField(
                              _licId, "Driver’s license Identifier"),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                    //? PAGE 2
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //? LICENSE FRONT
                              buildImagePicker(),
                              //? LICENSE BACK
                              buildImagePicker(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Passport",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: const Color(0XFFF2F2F2),
                height: 32,
                child: buildTabBar(),
              ),
              //? TABS
              Container(
                height: 420,
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _licenseController,
                  children: <Widget>[
                    //? PAGE 1
                    Column(
                      children: [
                        const SizedBox(
                          height: 16,
                        ),
                        buildTextFormField(
                          _pasName,
                          'First Name',
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        buildTextFormField(_pasLastName, 'Last Name'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //? START
                            buildBirthDateGesture(_passportBirthDate),
                            genderGetterBuilder(_passportGender),
                            //? FINISH
                          ],
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        buildTextFormField(_pasId, 'Passport Identifier'),
                      ],
                    ),
                    //? PAGE 2
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //? PASSPORT FRONT
                              buildImagePicker(),
                              //? LICENSE BACK
                              buildImagePicker(),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget genderGetterBuilder(int gender) {
    return Stack(
      children: [
        Center(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            margin: const EdgeInsets.only(
              top: 18,
            ),
            decoration: BoxDecoration(
              // color: Colors.red,
              border: Border.all(
                width: 2,
                color: const Color(0XFFE5E5E5),
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                  value: gender,
                  onChanged: (g) {
                    setState(() {
                      gender = g!;
                    });
                    print(gender);
                  },
                  // ignore: prefer_const_literals_to_create_immutables
                  items: const [
                    DropdownMenuItem(
                      child: Text('Male'),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Text('Female'),
                      value: 2,
                    ),
                  ]),
            ),
          ),
        ),
        Positioned(
          top: 8,
          left: 14,
          child: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(2),
            child: const Text(
              'Gender',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBirthDateGesture(DateTime birthDate) {
    return GestureDetector(
      onTap: () => _startDateTimePicker(context, birthDate),
      child: FilterBox(
        title: 'Birthday',
        content: DateFormat('d MMM yy', 'en_US').format(birthDate).toString(),
        titleIcon: Icons.calendar_today_outlined,
        iconColor: Colors.black87,
      ),
    );
  }

  // ignore_for_file: file_names
  Widget buildTextFormField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.grey,
      style: const TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black38,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4.0),
          borderSide: const BorderSide(
            color: Color(0XFFE5E5E5),
            width: 1.0,
          ),
        ),
        border: const OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(
            color: Colors.grey,
          ),
        ),
        labelText: hint,
      ),
    );
  }

  // ignore: avoid_positional_boolean_parameters
  Widget buildImagePicker() {
    return GestureDetector(
      onTap: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DottedBorderBox(
            child: Container(
              height: _dottedBoxSize(),
              width: _dottedBoxSize(),
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

  TabBar buildTabBar() {
    return TabBar(
        onTap: (context) {
          setState(() {});
        },
        controller: _licenseController,
        indicatorColor: Colors.grey,
        labelColor: Colors.white,
        unselectedLabelColor: Colors.black54,
        indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(2), // Creates border
            color: Theme.of(context).primaryColor),
        tabs: const [
          Tab(
            icon: Text(
              "Manually",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
          Tab(
            icon: Text(
              "Photo",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ]);
  }

  void _startDateTimePicker(context, birthDate) {
    showCupertinoModalPopup(
        context: context,
        builder: (_) => Container(
              height: 190,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  Container(
                    height: 180,
                    child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        use24hFormat: true,
                        minimumDate: DateTime.now()
                            .subtract(const Duration(days: 38400)),
                        initialDateTime: birthDate,
                        onDateTimeChanged: (val) {
                          setState(() {
                            birthDate = val;
                          });
                          print(birthDate);
                        }),
                  ),
                ],
              ),
            ));
  }
}
