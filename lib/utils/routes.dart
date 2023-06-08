import 'package:flutter/material.dart';
import 'package:rental/Components/TenantNavBar/bottomnav_login.dart';
import 'package:rental/screen/Tenantpages/aboutus.dart';
import 'package:rental/screen/Tenantpages/postlisting.dart';
import 'package:rental/screen/Tenantpages/postpageview.dart';
import 'package:rental/screen/Tenantpages/search.dart';
import 'package:rental/screen/Tenantpages/setting.dart';

import 'package:rental/utils/route_names.dart';

import '../screen/Tenantpages/Tenant_view.dart';
import '../screen/login_register/login.dart';
import '../screen/login_register/register.dart';
import '../screen/renter/renter_view.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
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
      case RouteName.listing:
        {
          return MaterialPageRoute(
            builder: (context) => PostListing(),
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
      case RouteName.postview:
        {
          return MaterialPageRoute(
            builder: (context) => PostPageView(),
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
