import 'dart:math';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';
import 'package:untitled32/model/bloc/search_bloc.dart';
import 'package:untitled32/view/classifications.dart';
import 'package:get/get.dart';
import 'view/login.dart';
import 'view/sign.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([GetStorage.init()]);
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<SearchBloc>(
          create: (_) => SearchBloc(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  GetStorage cache = GetStorage();
  @override
  Widget build(BuildContext context) {
    String token = GetStorage().read('token') ?? 'noToken';
    debugPrint(GetStorage().hasData('token').toString());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: token == 'noToken' ? LoginPage() : const Classifications(),
    );
  }
}
