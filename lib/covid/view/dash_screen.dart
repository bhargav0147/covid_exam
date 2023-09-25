import 'package:covid_exam/covid/controller/covid_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getData();
  }

  CovidController controller = Get.put(CovidController());

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
            body: Obx(
              () =>  controller.dataList.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        return showCountry(index);
                      },
                      itemCount: controller.dataList.length,
                    ),
            )));
  }

  Widget showCountry(int index) {
    return Container(
      margin: EdgeInsets.all(5),
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(color: Colors.black54, blurRadius: 1, spreadRadius: 1)
      ], color: Colors.white),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Container(
                  height: 45,
                  width: 60,
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.black54, blurRadius: 1, spreadRadius: 1)
                  ], color: Colors.white),
                  child: Image.network(
                      '${controller.dataList[index].countryInfo!.flag}')),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${controller.dataList[index].country}',
                    style: TextStyle(
                        letterSpacing: 1,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Population -> ${controller.dataList[index].population}',
                    style: TextStyle(
                        letterSpacing: 1,
                        fontSize: 10,
                        color: Colors.black,),
                  ),
                ],
              ),
              Spacer(),
              IconButton(onPressed: () {
                  Get.toNamed('/info',arguments: index);
              }, icon: Icon(Icons.navigate_next,color: Colors.black,)),
              SizedBox(width: 10),
            ],
          ),
        ),
      ),
    );
  }
}
