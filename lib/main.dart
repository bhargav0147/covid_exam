import 'package:covid_exam/covid/view/dash_screen.dart';
import 'package:covid_exam/covid/view/info_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true),
    routes: {
      '/':(p0) => DashScreen(),
      '/info':(p0) => IntroductionScreen(),
    },
  ));
}