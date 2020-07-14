import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/selection.dart';
import '../functions/openLink.dart';
import '../providers/symptoms.dart';

class SymptomsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider Symptoms
    var _symptomsProvider = Provider.of<SymptomsProvider>(context);

    return Container(
      child: SingleChildScrollView(
        child: Column(
          children: [
            //Test
            SelectionComponent(
              title: 'Have you been tested for COVID 19',
              value: _symptomsProvider.symptoms.tested,
              onChanged: (bool newValue) {
                _symptomsProvider.updateTested(newValue);
              },
            ),
            //Qaurantined or not
            SelectionComponent(
              title:
                  'Have you been quarantined or visited any containment zone?',
              value: _symptomsProvider.symptoms.qaurantined,
              onChanged: (bool newValue) {
                _symptomsProvider.updateQaurantined(newValue);
              },
            ),
            //Covid Positive during test
            SelectionComponent(
              title: 'Was the Covid test positive ?',
              value: _symptomsProvider.symptoms.testPositive,
              onChanged: (bool newValue) {
                _symptomsProvider.updateTestPositive(newValue);
              },
            ),
            //Dry and tight Cough
            SelectionComponent(
              title: 'Dry and Tight Cough',
              value: _symptomsProvider.symptoms.datcough,
              onChanged: (bool newValue) {
                _symptomsProvider.updateDatcough(newValue);
              },
            ),
            //Difficulty Breathing
            SelectionComponent(
              title: 'Difficulty Breathing',
              value: _symptomsProvider.symptoms.difficultyBreathing,
              onChanged: (bool newValue) {
                _symptomsProvider.updateDifficultyBreathing(newValue);
              },
            ),
            //Shaking And Chills
            SelectionComponent(
              title: 'Shaking or Chills',
              value: _symptomsProvider.symptoms.shakingChills,
              onChanged: (bool newValue) {
                _symptomsProvider.updateShakingChills(newValue);
              },
            ),
            //Cough Frequency
            ListTile(
              title: Text('Cough Frequency'),
              trailing: DropdownButton<String>(
                value: _symptomsProvider.symptoms.coughfrequency,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {
                  _symptomsProvider.updateCoughFrequency(newValue);
                },
                items: <String>[
                  'None',
                  'Mild',
                  'Average',
                  'Very Frequent',
                  'Severe',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            //Body temperature
            ListTile(
              title: Text('Body Temperature'),
              trailing: DropdownButton<String>(
                value: _symptomsProvider.symptoms.bodyTemperature,
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                onChanged: (String newValue) {
                  _symptomsProvider.updateBodyTemperature(newValue);
                },
                items: <String>[
                  'None',
                  'Mild Fever',
                  'Average Fever',
                  'High Fever',
                  'Very High Frequent',
                ].map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            //Call Options
            //Doctor
            ListTile(
              title: Text('Call a Doctor'),
              leading: Image(
                image: AssetImage('images/doctor.png'),
                width: 30,
              ),
              trailing: Icon(Icons.phone_in_talk),
              dense: true,
              onTap: () => openLink('tel://09513615550'),
            ),
            //Counsellor
            ListTile(
              title: Text('Call a Counsellor'),
              leading: Image(
                image: AssetImage('images/advisor.png'),
                width: 30,
              ),
              trailing: Icon(Icons.phone_in_talk),
              dense: true,
              onTap: () => openLink('tel://08448449428'),
            ),
            //Ambulance
            ListTile(
              title: Text('Call Helpline'),
              leading: Image(
                image: AssetImage('images/phone.png'),
                width: 30,
              ),
              trailing: Icon(Icons.phone_in_talk),
              dense: true,
              onTap: () => openLink('tel://108'),
            ),
            ListTile(
              title: Text(
                'Call the Ambulance',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
              leading: Image(
                image: AssetImage('images/phoner.png'),
                width: 30,
              ),
              dense: true,
              onTap: () => openLink('tel://104'),
            ),
            SizedBox(height: 10),

            //Save Button
            FlatButton(
              child: Text(
                'Save',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Theme.of(context).primaryColor,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
