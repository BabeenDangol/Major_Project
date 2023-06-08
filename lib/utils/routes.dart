import 'package:flutter/material.dart';
import 'package:rental/Components/TenantNavBar/bottomnav_login.dart';
import 'package:rental/screen/Tenant_view.dart';
import 'package:rental/screen/aboutus.dart';
import 'package:rental/screen/login.dart';
import 'package:rental/screen/register.dart';
import 'package:rental/screen/renter_view.dart';
import 'package:rental/screen/search.dart';
import 'package:rental/screen/setting.dart';
import 'package:rental/utils/route_names.dart';
import '../screen/Home.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.home:
        {
          return MaterialPageRoute(
            builder: (context) => Home(),
          );
        }
      case RouteName.login:
        {
          return MaterialPageRoute(
            builder: (context) => LoginPage(),
          );
        }
      case RouteName.register:
        {
          return MaterialPageRoute(
            builder: (context) => Register(),
          );
        }
      case RouteName.renter:
        {
          return MaterialPageRoute(
            builder: (context) => RenterViewPage(),
          );
        }
      case RouteName.tenant:
        {
          return MaterialPageRoute(
            builder: (context) => TenantViewPage(),
          );
        }
      case RouteName.setting:
        {
          return MaterialPageRoute(
            builder: (context) => Setting(),
          );
        }
      case RouteName.search:
        {
          return MaterialPageRoute(
            builder: (context) => Search(),
          );
        }
      case RouteName.aboutus:
        {
          return MaterialPageRoute(
            builder: (context) => AboutUs(),
          );
        }
      case RouteName.tenantbottomnav:
        {
          return MaterialPageRoute(
            builder: (context) => TenantBottombar(),
          );
        }
      default:
        {
          return MaterialPageRoute(
            builder: (context) {
              return const Scaffold(
                body: Text("DedEND"),
              );
            },
          );
        }
    }
  }
}
