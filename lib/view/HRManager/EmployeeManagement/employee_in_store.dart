// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:staras_manager/constants/constant.dart';
import 'package:staras_manager/model/employee_in_store_model.dart';
import 'package:staras_manager/view/HRManager/EmployeeManagement/profile_employee.dart';
import 'package:http/http.dart' as http;

class EmployeeInStore extends StatefulWidget {
  final int storeId;
  const EmployeeInStore({Key? key, required this.storeId}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _EmployeeInStoreState createState() => _EmployeeInStoreState();
}

class _EmployeeInStoreState extends State<EmployeeInStore> {
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  List<EmployeeInStoreModel>? employeeInStore;
  List<EmployeeInStoreResponseModels>? employeeInStoreResponseModels;

  Future<String?> readAccessToken() async {
    return await _secureStorage.read(key: 'access_token');
  }

  @override
  void initState() {
    super.initState();
    // Call the API to get employee data when the widget initializes.
    fetchEmployeeInStoreData(widget.storeId);
  }

  Future<void> fetchEmployeeInStoreData(int storeId) async {
    final apiUrl =
        'https://staras-api.smjle.vn/api/employeeinstore/getemployeeinstore?Id=$storeId';

    // Read the access token from secure storage
    final String? accessToken = await readAccessToken();

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
          final List<dynamic> employeeInStoreData = responseData['data'];

          final List<EmployeeInStoreModel> listEmployeeInStore =
              employeeInStoreData
                  .map((json) => EmployeeInStoreModel.fromJson(json))
                  .toList();

          setState(() {
            employeeInStore = listEmployeeInStore; // Update the employee list
          });

          final List<EmployeeInStoreResponseModels>
              listEmployeeInResponseModels = employeeInStoreData
                  .map((json) => EmployeeInStoreResponseModels.fromJson(json))
                  .toList();

          setState(() {
            employeeInStoreResponseModels =
                listEmployeeInResponseModels; // Update the employee list
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
          'Employee In Store',
          maxLines: 2,
          style: kTextStyle.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Image(
            image: AssetImage('images/employeesearch.png'),
          ),
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
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (employeeInStore != null && employeeInStore!.isNotEmpty)
                    for (EmployeeInStoreModel store in employeeInStore!)
                      if (store.id == widget.storeId)
                        for (EmployeeInStoreResponseModels employee
                            in employeeInStoreResponseModels!)
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: kGreyTextColor.withOpacity(0.5),
                              ),
                            ),
                            child: ListTile(
                              onTap: () {
                                // Handle onTap action (e.g., navigate to employee profile)
                              },
                              leading: Image.asset('images/emp1.png'),
                              title: Text(
                                employee.employeeName ?? "",
                                style: kTextStyle,
                              ),
                              subtitle: Text(
                                employee.positionName ?? "",
                                style: kTextStyle.copyWith(
                                  color: kGreyTextColor,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.arrow_forward_ios,
                                color: kGreyTextColor,
                              ),
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
