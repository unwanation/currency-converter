import 'dart:async';

import 'package:currency_converter/model/converter_data_model.dart';
import 'package:currency_converter/network/service.dart';
import 'package:currency_converter/res/currencies.dart';
import 'package:currency_converter/widgets/input.dart';
import 'package:currency_converter/widgets/result.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  updateRates(await fetchRates());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StreamApp(),
    );
  }
}

class StreamApp extends StatefulWidget {
  const StreamApp({super.key});

  @override
  State<StreamApp> createState() => _StreamAppState();
}

StreamController<ConverterDataModel> controller =
    StreamController<ConverterDataModel>();

class _StreamAppState extends State<StreamApp> {
  final Stream<ConverterDataModel> _data = (() {
    return controller.stream.asBroadcastStream();
  })();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            StreamBuilder<ConverterDataModel>(
              stream: _data,
              builder: (BuildContext context,
                  AsyncSnapshot<ConverterDataModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Input(
                    data: snapshot.data ??
                        ConverterDataModel(0, currencies[0], currencies[0]),
                  );
                }

                return Input(
                  data: ConverterDataModel(0, currencies[0], currencies[0]),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 30),
              child: Icon(
                Icons.arrow_downward,
                size: 50,
              ),
            ),
            StreamBuilder<ConverterDataModel>(
              stream: _data,
              builder: (BuildContext context,
                  AsyncSnapshot<ConverterDataModel> snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return Result(
                    data: snapshot.data ??
                        ConverterDataModel(0, currencies[0], currencies[0]),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        )),
      ),
    );
  }
}
