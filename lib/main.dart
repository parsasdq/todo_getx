import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx/constants/getroute.dart';
import 'binding/bindings.dart';
import 'constants/style.dart';
import 'package:get_storage/get_storage.dart';

void main()async {
  await GetStorage.init();
  runApp( Splash());
}

class Splash extends StatelessWidget {
  const Splash({super.key});
  @override
  Widget build(BuildContext context) {
      return GetMaterialApp(
    locale: Locale("fa"),
        debugShowCheckedModeBanner: false,
        home: Directionality(textDirection: TextDirection.rtl, child:  Scaffold(
            body: EasySplashScreen(
          logo: Image.asset('OIP.jpg'),
          title: Text(
            'برنامه چک لیست باینری اپ',
            style: TittleStyle,
          ),
          backgroundColor: Colors.black,
          loaderColor: Colors.white,
          loadingText: Text(
            ' .... درحال بارگیری اطلاعات \n version:',textDirection: TextDirection.ltr,
            style: SubTittleStyle,
          ),
          navigator: "/TASK",
          durationInSeconds:5,
        )),),
        getPages: GetRoutes().getpages,
        initialBinding: MyBindings(),
      );
  }
}
