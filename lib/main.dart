import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:melooha_mod_1/reducers/cart/store.dart';
import 'package:melooha_mod_1/utils/colors.dart';
import 'package:melooha_mod_1/views/profile/profile_screen.dart';

void main() {
  runApp(
    StoreProvider(
      store: store,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.blue900,
        // useMaterial3: true,
      ),
      home: ProfileScreen(),
      // home: MessagePage(
      //   messageType: MessageType.success,
      // ),
    );
  }
}
