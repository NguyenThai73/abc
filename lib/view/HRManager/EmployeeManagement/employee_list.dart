// ignore_for_file: depend_on_referenced_packages, library_private_types_in_public_api

import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/constants/strings.dart';
import 'package:staras_manager/features/widgets/featured_employee_tile.dart';
import 'package:staras_manager/features/widgets/search_employee.dart';
import 'package:staras_manager/features/widgets/vetical_space.dart';
import 'package:staras_manager/model/employee_model.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/add_employee.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/profile_employee.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  _EmployeeListState createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  List<Employee> employees = [];

  @override
  void initState() {
    super.initState();
    fetchEmployeeData();
  }

  Future<String?> readAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  Future<void> fetchEmployeeData() async {
    const apiUrl =
        'https://staras-api.smjle.vn/api/employee/hr-get-employee-list';

    // Read the access token from secure storage
    final String? accessToken = await readAccessToken();

    print(accessToken);

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $accessToken',
        },
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        if (kDebugMode) {
          print(responseData);
        }

        if (responseData.containsKey('data')) {
          // Check if the 'data' key exists in the response
          final List<dynamic> employeeData = responseData['data'];

          final List<Employee> employeeList =
              employeeData.map((json) => Employee.fromJson(json)).toList();

          setState(() {
            employees = employeeList; // Update the employee list
          });
        } else {
          print(
              'API Error: Response does not contain the expected data structure.');
        }
      } else {
        print('API Error: ${response.statusCode}, ${response.body}');
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Error call employee data. Please try again later.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
  }

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
          'Employee List',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20.0,
          ),
          Expanded(
            child: Container(
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
                    height: 15.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: AppTextField(
                          textFieldType: TextFieldType.NAME,
                          readOnly: true,
                          decoration: InputDecoration(
                            enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: kMainColor),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: kMainColor),
                            ),
                            border: const OutlineInputBorder(),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                            labelText: 'Total Employee',
                            labelStyle: const TextStyle(color: kMainColor),
                            hintText: employees.length
                                .toString(), // Display the total count here
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Expanded(
                        child: MaterialButton(
                          height: 60.0,
                          minWidth: 70.0,
                          color: const Color.fromARGB(255, 137, 188, 9),
                          textColor: Colors.white,
                          onPressed: () => {
                            // Điều hướng đến màn hình AddEmployee
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const AddEmployee(),
                              ),
                            ),
                          },
                          // splashColor: Colors.redAccent,
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add), // Icon "add"
                              SizedBox(
                                  width:
                                      8.0), // Khoảng cách giữa biểu tượng và văn bản
                              Text("Add Employee"), // Văn bản
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  VerticalSpace(value: 20, ctx: context),
                  const SearchEmployee(),
                  // VerticalSpace(value: 40, ctx: context),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: employees.length,
                      itemBuilder: (context, index) {
                        final employee = employees[index];
                        return Column(
                          children: [
                            Material(
                              elevation: 2.0,
                              child: Container(
                                width: context.width(),
                                padding: const EdgeInsets.all(10.0),
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(
                                      color: Color.fromARGB(255, 137, 188, 9),
                                      width: 3.0,
                                    ),
                                  ),
                                  color: Colors.white,
                                ),
                                child: ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProfileEmployeeScreen(
                                                id: employee.id ?? 0),
                                      ),
                                    );
                                  },
                                  leading: Container(
                                    width: 50,
                                    child: CircleAvatar(
                                      backgroundImage: NetworkImage(
                                          employee.profileImage ?? ""),
                                    ),
                                  ),
                                  title: Text(
                                    employee.name ?? '',
                                    maxLines: 2,
                                    style: kTextStyle.copyWith(
                                      color: kTitleColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  subtitle: const Text('Admin'),
                                  trailing: const Icon(Icons.arrow_forward_ios),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
