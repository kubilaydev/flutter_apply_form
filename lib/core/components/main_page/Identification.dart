import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'filter_box.dart';
import 'image_picker_widget.dart';

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
    ///
    var _licenceBirthDate = DateTime.now();

    ///
    var _passportBirthDate = DateTime.now();

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

              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Identification",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),

              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Driver License',
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: const Color(0XFFF2F2F2),
                height: 32,
                child: TabBar(
                    onTap: (context) {
                      setState(() {});
                    },
                    controller: _licenseController,
                    indicatorColor: Colors.grey,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(2), // Creates border
                        color: Theme.of(context).primaryColor),
                    tabs: const [
                      Tab(
                        icon: Text(
                          "Manually",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SourseSansPro',
                          ),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SourseSansPro',
                          ),
                        ),
                      ),
                    ]),
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
                              GestureDetector(
                                onTap: () {
                                  showCupertinoModalPopup(
                                      context: context,
                                      builder: (_) => Container(
                                            height: 190,
                                            color: const Color.fromARGB(
                                                255, 255, 255, 255),
                                            child: Column(
                                              children: [
                                                Container(
                                                  height: 180,
                                                  child: CupertinoDatePicker(
                                                      mode:
                                                          CupertinoDatePickerMode
                                                              .date,
                                                      use24hFormat: true,
                                                      minimumDate: DateTime
                                                              .now()
                                                          .subtract(
                                                              const Duration(
                                                                  days: 38400)),
                                                      initialDateTime:
                                                          _licenceBirthDate,
                                                      onDateTimeChanged: (val) {
                                                        setState(() {
                                                          _licenceBirthDate =
                                                              val;
                                                        });
                                                        print(
                                                            _licenceBirthDate);
                                                      }),
                                                ),
                                              ],
                                            ),
                                          ));
                                },
                                child: FilterBox(
                                  title: 'Birthday',
                                  content: DateFormat('d MMM yy', 'en_US')
                                      .format(_licenceBirthDate)
                                      .toString(),
                                  titleIcon: Icons.calendar_today_outlined,
                                  iconColor: Colors.black87,
                                ),
                              ),
                              Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
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
                                            value: _licenceGender,
                                            onChanged: (g) {
                                              setState(() {
                                                _licenceGender = g!;
                                              });
                                              print(_licenceGender);
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
                              )
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
                              ImagePickerWidget(),
                              //? LICENSE BACK
                              ImagePickerWidget(),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Passport",
                  style: Theme.of(context).textTheme.headline2,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                color: const Color(0XFFF2F2F2),
                height: 32,
                child: TabBar(
                    onTap: (context) {
                      setState(() {});
                    },
                    controller: _licenseController,
                    indicatorColor: Colors.grey,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black54,
                    indicator: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(2), // Creates border
                        color: Theme.of(context).primaryColor),
                    tabs: const [
                      Tab(
                        icon: Text(
                          "Manually",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SourseSansPro',
                          ),
                        ),
                      ),
                      Tab(
                        icon: Text(
                          "Photo",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'SourseSansPro',
                          ),
                        ),
                      ),
                    ]),
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
                            GestureDetector(
                              onTap: () {
                                showCupertinoModalPopup(
                                    context: context,
                                    builder: (_) => Container(
                                          height: 190,
                                          color: const Color.fromARGB(
                                              255, 255, 255, 255),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 180,
                                                child: CupertinoDatePicker(
                                                    mode:
                                                        CupertinoDatePickerMode
                                                            .date,
                                                    use24hFormat: true,
                                                    minimumDate: DateTime.now()
                                                        .subtract(
                                                            const Duration(
                                                                days: 38400)),
                                                    initialDateTime:
                                                        _passportBirthDate,
                                                    onDateTimeChanged: (val) {
                                                      setState(() {
                                                        _passportBirthDate =
                                                            val;
                                                      });
                                                      print(_passportBirthDate);
                                                    }),
                                              ),
                                            ],
                                          ),
                                        ));
                              },
                              child: FilterBox(
                                title: 'Birthday',
                                content: DateFormat('d MMM yy', 'en_US')
                                    .format(_passportBirthDate)
                                    .toString(),
                                titleIcon: Icons.calendar_today_outlined,
                                iconColor: Colors.black87,
                              ),
                            ),
                            Stack(
                              children: [
                                Center(
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12),
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
                                          value: _passportGender,
                                          onChanged: (g) {
                                            setState(() {
                                              _passportGender = g!;
                                            });
                                            print(_passportGender);
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
                            )
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
                              ImagePickerWidget(),
                              //? LICENSE BACK
                              ImagePickerWidget(),
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
}
