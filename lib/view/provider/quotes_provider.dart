import 'dart:convert';

import 'package:adv_flutter_exam/view/modal/quotes_modal.dart';
import 'package:adv_flutter_exam/view/modal/result_modal.dart';
import 'package:adv_flutter_exam/view/provider/helper/api_sarvice.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuotesProvider extends ChangeNotifier {
  QuotesProvider()
  {
    jsonGetData();
    shareGetData();
  }
  QuotesModal? quotesModal;
  List<ResultModal> favoriteList =[];
  List<String> favoriteListString =[];
  List<bool> isLikeList=[];

  Future<void> jsonGetData() async {
    ApiSarvice apiSarvice = ApiSarvice();
    String? jsonData = await apiSarvice.getData();
    Map jsonMap = jsonDecode(jsonData!);
    print(jsonMap);
    quotesModal = QuotesModal.fromJson(jsonMap);
    print(quotesModal);
    notifyListeners();
  }

  void favoritesQutoesAdd(int index)
  {
    if(isLikeList[index]==false)
      {
        favoriteList.add(quotesModal!.resultsList[index]);
        favoriteListString.add(quotesModal!.resultsList[index].content);
        print(favoriteList);
        isLikeList[index]=true;
        notifyListeners();
      }else{
      favoriteList.remove(quotesModal!.resultsList[index]);
      favoriteListString.remove(quotesModal!.resultsList[index].content);

      print(favoriteList);
      isLikeList[index]=false;
      notifyListeners();
    }
    shareSetData();
    notifyListeners();
  }

  void favoritesRemove(int index)
  {
    favoriteListString.removeAt(index);
    favoriteList.removeAt(index);
    shareSetData();
    notifyListeners();
  }

  Future<void> shareSetData()
  async {
    // Obtain shared preferences.
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setStringList('items',favoriteListString);
    notifyListeners();
  }

  Future<void> shareGetData()
  async {
    print('object');
    SharedPreferences preferences = await SharedPreferences.getInstance();
    favoriteListString = preferences.getStringList('items')!;
    notifyListeners();
  }
}
