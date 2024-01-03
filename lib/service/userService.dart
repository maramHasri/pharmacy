import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled32/model/userModel.dart';
import 'package:get/get.dart' as GET;
import '../model/medicine_model.dart';

abstract class userService {
  Dio dio = Dio();
  String baseURL = "http://127.0.0.1:8000/api/";

  login(UserModel user);
// categoryID
  register(UserModel user);

  Future<List<Medicine>> getCategoryMedicines(int categoryID);
}

class ImpUserService extends userService {
  @override
  login(UserModel user) async {
    try {
      print("""
      user Model : ${user.number} \n ${user.password}
      """);
      Response? response;
      try {
        response = await dio.post('${baseURL}login', data: user.toJson());
        GetStorage cache = GetStorage();
        await GetStorage().write('token', response.data['token']);
        print('token is : ${cache.read('token')}');
      } on DioException catch (exception) {
        print('Error is :${exception.response!.data}');
        print(exception.response!.data['message']);
      }
      if (response!.statusCode == 200) {
        print(response.data);
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  register(UserModel user) async {
    try {
      print("""
      user Model : ${user.number} \n ${user.password}
      """);
      Response? response;
      try {
        response =
            await dio.post('${baseURL}register', data: user.toJsonFull());
        GetStorage cache = GetStorage();
        await GetStorage().write('token', response.data['data']['token']);
        print('token is : ${cache.read('token')}');
      } on DioException catch (exception) {
        print('Error is :${exception.response!.data}');
        print(exception.response!.data['message']);
      }
      if (response!.statusCode == 200) {
        print(response.data);
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<List<Medicine>> getCategoryMedicines(int categoryID) async {
    List<Medicine> medicines = [];
    try {
      Response? response;
      try {
        response = await dio.get(
          '${baseURL}your-route/$categoryID/getcatgorymedicine',
        );
        debugPrint('Start Parsing data ');
        response.data['data'].forEach((element) {
          medicines.add(Medicine.fromMap(element));
        });
        debugPrint('Finish Parsing data ');
      } on DioException catch (exception) {
        print('Error is :${exception.response!.data}');
        print(exception.response!.data['message']);
        GET.Get.snackbar('Ops', exception.response!.data['message']);
      }
      if (response!.statusCode == 200) {
        print(response.data);
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
    return medicines;
  }

  @override
  Future<List<Medicine>> showdetails(int categoryID) async {
    List<Medicine> medicines = [];
    try {
      Response? response;
      try {
        response = await dio.get(
          '${baseURL}medicines/${Medicine}',
        );
        debugPrint('Start Parsing data ');
        response.data['data'].forEach((element) {
          medicines.add(Medicine.fromMap(element));
        });
        debugPrint('Finish Parsing data ');
      } on DioException catch (exception) {
        print('Error is :${exception.response!.data}');
        print(exception.response!.data['message']);
        GET.Get.snackbar('Ops', exception.response!.data['message']);
      }
      if (response!.statusCode == 200) {
        print(response.data);
      } else {
        print("Error");
      }
    } catch (e) {
      print(e.toString());
    }
    return medicines;
  }

  @override
  createOrder(
      List<Medicine> medicine, List<int> quantities, String status) async {
    try {
      Response response = await dio.post('${baseURL}medicines/placeOrder',
          data: {
            'order_status': status,
            'medicines': medicine,
            "quantities": quantities
          });
      print(response.data);
      GET.Get.back();
      GET.Get.snackbar('Done', response.data['message']);
      if (response.statusCode == 200) {
        print(response.data);
        return true;
      } else {
        print("Error");
      }
    } on DioException catch (e) {
      print(e.response!.data);
    }
  }
}
