import 'package:flutter/material.dart';
import 'package:student_data/screens/home/model/home_model.dart';

class HomeProvider extends ChangeNotifier
{
  List<HomeModel> l1 = [];

  void addData(HomeModel m1){
    l1.add(m1);
    notifyListeners();
  }

  void deleteData(int index){
    l1.removeAt(index);
    notifyListeners();
  }

  void editData(int index,String Name,String Id,String Std){
    l1[index].id = Id;
    l1[index].name = Name;
    l1[index].std = Std;
    notifyListeners();
  }
}