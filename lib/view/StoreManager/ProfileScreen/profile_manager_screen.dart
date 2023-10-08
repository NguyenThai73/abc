import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/view/StoreManager/ProfileScreen/edit_profile_manager_screen.dart';

class ProfileManagerScreen extends StatefulWidget {
  const ProfileManagerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ProfileManagerScreenState createState() => _ProfileManagerScreenState();
}

class _ProfileManagerScreenState extends State<ProfileManagerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        titleSpacing: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Profile',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          const Image(
            image: AssetImage('images/editprofile.png'),
          ).onTap(() {
            const EditProfileManagerScreen().launch(context);
          }),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
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
                  const CircleAvatar(
                    radius: 60.0,
                    backgroundColor: kMainColor,
                    backgroundImage: AssetImage(
                      'images/emp1.png',
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Company Name',
                      hintText: 'Staras',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.NAME,
                    decoration: const InputDecoration(
                      labelText: 'Owner/Full Name',
                      hintText: 'Nguyen Ngoc Thy',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    readOnly: true,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'thy06052004@gmail.com',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  AppTextField(
                    textFieldType: TextFieldType.PHONE,
                    controller: TextEditingController(),
                    readOnly: true,
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
                    readOnly: true,
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
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    readOnly: true,
                    decoration: const InputDecoration(
                      labelText: 'Gender',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Male',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
