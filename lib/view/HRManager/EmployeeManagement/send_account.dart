// import 'package:country_code_picker/country_code_picker.dart';
// ignore_for_file: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/components/button_global.dart';
import 'package:staras_manager/constants/constant.dart';

class SendAccount extends StatefulWidget {
  const SendAccount({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SendAccountState createState() => _SendAccountState();
}

class _SendAccountState extends State<SendAccount> {
  String employee = '0 - 10';

  DropdownButton<String> getEmployee() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String emp in employees) {
      var item = DropdownMenuItem(
        value: emp,
        child: Text(emp),
      );
      dropDownItems.add(item);
    }
    return DropdownButton(
      items: dropDownItems,
      value: employee,
      onChanged: (value) {
        setState(() {
          employee = value!;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainColor,
      appBar: AppBar(
        backgroundColor: kMainColor,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Send Account',
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 740.0,
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
                  SizedBox(
                    height: 60.0,
                    child: AppTextField(
                      textFieldType: TextFieldType.PHONE,
                      controller: TextEditingController(),
                      enabled: true,
                      decoration: InputDecoration(
                        labelText: 'Enter Phone Employee',
                        hintText: '0362462473',
                        labelStyle: kTextStyle,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        border: const OutlineInputBorder(),
                        // prefixIcon: CountryCodePicker(
                        //   padding: EdgeInsets.zero,
                        //   onChanged: print,
                        //   initialSelection: 'BD',
                        //   showFlag: false,
                        //   showDropDownButton: true,
                        //   alignLeft: false,
                        // ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ButtonGlobal(
                    buttontext: 'Sent',
                    buttonDecoration:
                        kButtonDecoration.copyWith(color: kMainColor),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     builder: (context) => const EditProfileEmployee(),
                      //   ),
                      // );
                    }, // thêm sự kiện cho button
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Or Send Account With...',
                    style: kTextStyle.copyWith(
                        color: kGreyTextColor, fontSize: 12.0),
                  ),
                  Hero(
                    tag: 'social',
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Center(
                                  child: Icon(
                                FontAwesomeIcons.facebookF,
                                color: Color(0xFF3B5998),
                              )),
                            ),
                          ),
                        ),
                        Card(
                          elevation: 2.0,
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                top: 10.0,
                                bottom: 10.0),
                            child: Center(
                              child: Image.asset(
                                'images/google.png',
                                height: 25.0,
                                width: 25.0,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            elevation: 2.0,
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              child: Center(
                                child: Icon(
                                  FontAwesomeIcons.twitter,
                                  color: Color(0xFF3FBCFF),
                                ),
                              ),
                            ),
                          ),
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
    );
  }
}
