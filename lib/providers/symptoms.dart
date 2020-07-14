import 'package:client/models/symptoms.dart';
import 'package:flutter/cupertino.dart';

class SymptomsProvider with ChangeNotifier {
  Symptoms _symptoms = new Symptoms(
    tested: false,
    testPositive: false,
    qaurantined: false,
    datcough: false,
    difficultyBreathing: false,
    shakingChills: true,
    coughfrequency: 'Mild',
    bodyTemperature: 'None',
  );

  Symptoms get symptoms => _symptoms;

  updateTested(bool value) {
    this._symptoms.tested = value;
    notifyListeners();
  }

  updateQaurantined(bool value) {
    this._symptoms.qaurantined = value;
    notifyListeners();
  }

  updateTestPositive(bool value) {
    this._symptoms.testPositive = value;
    notifyListeners();
  }

  updateDatcough(bool value) {
    this._symptoms.datcough = value;
    notifyListeners();
  }

  updateDifficultyBreathing(bool value) {
    this._symptoms.difficultyBreathing = value;
    notifyListeners();
  }

  updateShakingChills(bool value) {
    this._symptoms.shakingChills = value;
    notifyListeners();
  }

  updateCoughFrequency(String value) {
    this._symptoms.coughfrequency = value;
    notifyListeners();
  }

  updateBodyTemperature(String value) {
    this._symptoms.bodyTemperature = value;
    notifyListeners();
  }
}
