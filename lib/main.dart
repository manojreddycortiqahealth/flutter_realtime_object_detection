import 'package:flutter/material.dart';
import 'package:flutter_realtime_object_detection/app/app_router.dart';
import 'package:flutter_realtime_object_detection/services/navigation_service.dart';
import 'package:flutter_realtime_object_detection/view_models/home_view_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: <SingleChildWidget>[
      Provider<NavigationService>(create: (_) => NavigationService())
    ],
    child: Application(),
  ));
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 812),
        builder: () {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark(),
            onGenerateRoute: AppRoute.generateRoute,
            initialRoute: AppRoute.splashScreen,
            navigatorKey: NavigationService.navigationKey,
            navigatorObservers: <NavigatorObserver>[
              NavigationService.routeObserver
            ],
          );
        });
  }
}
