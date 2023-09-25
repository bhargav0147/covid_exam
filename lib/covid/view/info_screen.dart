import 'package:covid_exam/covid/controller/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  CovidController controller = Get.put(CovidController());
  int index = Get.arguments;

  @override
  Widget build(BuildContext context) {

    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.amber,
            title: Text(
              'Covid19',
              style: TextStyle(
                  letterSpacing: 1,
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            actions: [
              Icon(
                Icons.coronavirus,
                color: Colors.black,
              ),
              SizedBox(width: 10),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  "${controller.dataList[index].countryInfo!.flag}",
                  height: 150, width: 300, ),
               SizedBox(height: 20),
               shoInfo('Continent', '${controller.dataList[index].continent}'),
               shoInfo('Country', '${controller.dataList[index].country}'),
               shoInfo('Population', '${controller.dataList[index].population}'),
               shoInfo('Active Cases', '${controller.dataList[index].active}'),
               shoInfo('Deaths Cases', '${controller.dataList[index].deaths}'),
               shoInfo('Recovered Cases', '${controller.dataList[index].recovered}'),
               shoInfo('Total Cases', '${controller.dataList[index].cases}'),
               shoInfo('Total Test', '${controller.dataList[index].tests}'),
              ],
            ),
          ),
        ));
  }
  Widget shoInfo(String hint, String path)
  {
    return Container(
      height: 40,
      margin: EdgeInsets.all(5),
      width: double.infinity,
        padding: EdgeInsets.all(5),
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black54, blurRadius: 1, spreadRadius: 1)
      ], color: Colors.white),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "$hint :- $path",
          style: TextStyle(letterSpacing: 1, fontSize: 20),
        ),
      ),
    );
  }
}