import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: KursTapshyrma(),
    );
  }
}

class KursTapshyrma extends StatefulWidget {
  KursTapshyrma({super.key});

  @override
  State<KursTapshyrma> createState() => _KursTapshyrmaState();
  bool isloading = false;
}

class _KursTapshyrmaState extends State<KursTapshyrma> {
  @override
  void initState() {
    tapshyrma();
    super.initState();
  }

  Future tapshyrma() async {
    // void isloading = true;
    final dio = Dio();
    final esketut = await dio.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=44.34&lon=10.99&appid=e26009f1fa3f0ede6ca5d84f1121fa73');

    // if (esketut.statusCode == 200) {
    //   print(esketut);
    //   final res = esketut.data;

    // }
    print('esketut.data ${esketut.data}');
    return esketut.data;
  }
  // void tapshyrma()

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: tapshyrma(),
            builder: (context, sn) {
              // final res = esketut.data;
              return Center(child: Text(sn.data.toString()));
            }));
  }
}
