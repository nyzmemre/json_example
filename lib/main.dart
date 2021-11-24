import 'package:flutter/material.dart';
import 'package:json_example/services/get_api.dart';

import 'models/models.dart';

void main() {
  runApp(JsonExample());
}

class JsonExample extends StatelessWidget {
  final _getApi=GetApi();
  @override
  Widget build(BuildContext context) {

    _getApi.getModelsData();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Json Example")),
          body: FutureBuilder<Models>(
              future: _getApi.getModelsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return ListView.builder(
                    itemBuilder: (context, int index){
                      return Text("${snapshot.data!.title}");
                    },

                  );
                else if (snapshot.hasError)
                  return Text("${snapshot.error}");
                else
                  return Center(child: CircularProgressIndicator(),);
              }
          )),
    );
  }
}
