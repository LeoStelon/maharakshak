import 'dart:convert' as convert;
import 'package:client/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

enum LoaderStatus { busy, idle }

class UserProvider with ChangeNotifier {
  //Loader State
  static LoaderStatus _loaderStatus = LoaderStatus.idle;
  LoaderStatus get loaderStatus => _loaderStatus;
  void setLoaderStatus(LoaderStatus status) {
    _loaderStatus = status;
  }

  List _userDailyData = [];

  List get userDailyData => [..._userDailyData];

  Future<String> updatedailyData() async {
    _userDailyData = [];
    var response = await http.get(
      '$url/userdailydata/',
      headers: {
        "Content-type": "application/json",
        "Authorization": "token 3b93bb1c7d919d069ac99a0c49242752be334e70"
      },
    );
    var decodedResponse = convert.jsonDecode(response.body);
    _userDailyData = decodedResponse;
    notifyListeners();
    //Something must be returned for the Future in Profile section
    return 'ok';
  }
}
