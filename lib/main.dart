import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quick_math_game/constants/app_constant.dart';
import 'package:quick_math_game/constants/app_strings.dart';
import 'package:quick_math_game/widgets/main_list.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Builder(
        builder: (context) {
          return Scaffold(
            backgroundColor: Sabitler.mainbackgroundColor,
            appBar: AppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      _buildPopupDialog(context);
                    },
                    icon: Icon(Icons.info))
              ],
              backgroundColor: Sabitler.mainAppBarBackgroundColor,
              title: Sabitler.appBarTitle,
              titleTextStyle: GoogleFonts.openSans(
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            body: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.60,
                child: const MainList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildPopupDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Game İnfo'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(Strings.info),
      ],
    ),
    actions: <Widget>[
      FlatButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        textColor: Theme.of(context).primaryColor,
        child: const Text('Close'),
      ),
    ],
  );
}
