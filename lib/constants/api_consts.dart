const Map<String, String> headers = {"Content-Type": "application/json"};

const String BASE_URL = "https://staras-api.smjle.vn/api";
const String GetEmployee = "https://staras-api.smjle.vn/api/employee/";
const String PutEmployee =
    "https://staras-api.smjle.vn/api/employee/hr-update-employee-infor/";

class ApiResponse {
  Object? data;
  String? error;
}
