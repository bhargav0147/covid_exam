import 'package:covid_exam/covid/model/covid_model.dart';
import 'package:covid_exam/utils/api_helper.dart';
import 'package:get/get.dart';

class CovidController extends GetxController
{
  Covid model = Covid();
  RxList<Covid> dataList = <Covid>[].obs;
  // RxList<Covid> finalDataList = <Covid>[].obs;

  void getData()
  async {
    dataList.value =await ApiHelper.helper.getJson();
    print(dataList.length);

  }
}