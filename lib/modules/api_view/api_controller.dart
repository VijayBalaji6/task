import 'package:get/get.dart';
import 'package:task/constants/api_response.dart';
import 'package:task/constants/constants.dart';
import 'package:task/models/api_model.dart';
import 'package:task/services/api_services.dart';

class ApiController extends GetxController {
  late ApiResponse<ApiDataModel> apiData;

  Future<void> getCall() async {
    apiData = ApiResponse.loading('Loading');
    update();
    try {
      final ApiDataModel apiResponseData =
          await ApiServices.getApiCall(url: url);
      apiData = ApiResponse.completed(apiResponseData);
    } catch (e) {
      apiData = ApiResponse.error(e.toString());
    }
    update();
  }
}
