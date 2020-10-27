import 'package:clubgolf/src/helpers/get_storages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:clubgolf/src/controllers/root_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetStorages.inst.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RootController>(
      init: RootController(),
      builder: (_) {
        return GetMaterialApp(
          title: _.title,
          defaultTransition: _.defaultTransition,
          debugShowCheckedModeBanner: _.debugShowCheckedModeBanner,
          initialRoute: _.initialRoute,
          getPages: _.getPages,
          theme: _.theme,
          locale: _.locale,
          localizationsDelegates: _.localizationsDelegates,
          localeResolutionCallback: (deviceLocale, supporteLocate) =>
              supporteLocate.first,
          supportedLocales: _.supportedLocales,
        );
      },
    );
  }
}
