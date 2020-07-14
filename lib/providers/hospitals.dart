import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../constants/constants.dart';

enum LoaderStatus { busy, idle }

class HospitalsProvider with ChangeNotifier {
  //Loader State
  static LoaderStatus _loaderStatus = LoaderStatus.idle;
  LoaderStatus get loaderStatus => _loaderStatus;
  void setLoaderStatus(LoaderStatus status) {
    _loaderStatus = status;
  }

  List _pvthospitals = [];

  List get pvthospitals => [..._pvthospitals];

  Future<void> updatePvtHospitals() async {
    setLoaderStatus(LoaderStatus.busy);
    var response = await http.get(
      '$url/mixhospitals/?lang=en',
      headers: {
        "Content-type": "application/json",
        "Authorization": "token 3b93bb1c7d919d069ac99a0c49242752be334e70"
      },
    );
    print('enter');
    var decodedResponse = convert.jsonDecode(response.body);
    _pvthospitals = decodedResponse;
    setLoaderStatus(LoaderStatus.idle);
    notifyListeners();
  }

  //Government Hospitals
  List _govhospitals = [];

  List get govhospitals => [..._govhospitals];

  Future<void> updateGovHospitals() async {
    // setLoaderStatus(LoaderStatus.busy);
    _govhospitals = [];
    var response = await http.get(
      '$url/governmenthospitals/?lang=en',
      headers: {
        "Content-type": "application/json",
        "Authorization": "token 3b93bb1c7d919d069ac99a0c49242752be334e70"
      },
    );
    var decodedResponse = convert.jsonDecode(response.body);
    _govhospitals = decodedResponse;
    // setLoaderStatus(LoaderStatus.idle);
    notifyListeners();
  }
}
