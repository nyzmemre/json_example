import 'package:flutter/material.dart';
import 'package:json_example/services/get_api.dart';

import 'models/models.dart';

void main() {
  runApp(JsonExample());
}

class JsonExample extends StatefulWidget {
  @override
  _JsonExampleState createState() => _JsonExampleState();
}

class _JsonExampleState extends State<JsonExample> {
  final _getApi=GetApi();
@override
  void initState() {
  _getApi.getModelsData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Json Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(title: Text("Json Example")),
          body: FutureBuilder<List<Models>>(
              future: _getApi.getModelsData(),
              builder: (context, snapshot) {
                if (snapshot.hasData)
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, int index){
                      return Card(
                        child: Column(
                          children: [
                            Text("${snapshot.data![index].title}"),
                            SizedBox(height: 10,),
                          ],
                        ),
                      );
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
