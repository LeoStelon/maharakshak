import 'package:flutter/material.dart';

import './screens/main.dart';
import './screens/donate.dart';
import './screens/helpline.dart';
import './screens/bankdetails.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'mainscreen':
        return MaterialPageRoute(builder: (_) => MainScreen());
      case 'donatescreen':
        return MaterialPageRoute(builder: (_) => DonateScreen());
      case 'helplinescreen':
        return MaterialPageRoute(builder: (_) => HelplineScreen());
      case 'bankdetailsscreen':
        return MaterialPageRoute(builder: (_) => BankDetailsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Container(
              child: Center(
                child: Text('Check Route Name'),
              ),
            ),
          ),
        );
    }
  }
}
