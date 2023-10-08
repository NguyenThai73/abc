// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/components/button_global.dart';
import 'package:staras_manager/constants/constant.dart';

class EditProfileHrScreen extends StatefulWidget {
  const EditProfileHrScreen({Key? key}) : super(key: key);

  @override
  _EditProfileHrScreenState createState() => _EditProfileHrScreenState();
}

class _EditProfileHrScreenState extends State<EditProfileHrScreen> {
  String gender = 'Male';

  DropdownButton<String> getGender() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String gender in genderList) {
      var item = DropdownMenuItem(
        value: gender,
        child: Text(gender),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: gender,
      onChanged: (value) {
        setState(() {
          gender = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Edit Profile',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20.0,
            ),
            Container(
              width: context.width(),
              padding: const EdgeInsets.all(20.0),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0)),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Image(
                    image: AssetImage(
                      'images/employeeaddimage.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      hintText: 'MaanTheme',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Owner/Admin name',
                      hintText: 'MaanTeam',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.EMAIL,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'maantheme@maantheme.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      hintText: '+8801767 432556',
                      labelStyle: kTextStyle,
                      border: const OutlineInputBorder(),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Company Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '112/3 Green Road',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: 60.0,
                    child: FormField(
                      builder: (FormFieldState<dynamic> field) {
                        return InputDecorator(
                          decoration: InputDecoration(
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              labelText: 'Select Gender',
                              labelStyle: kTextStyle,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5.0))),
                          child:
                              DropdownButtonHideUnderline(child: getGender()),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Update',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
