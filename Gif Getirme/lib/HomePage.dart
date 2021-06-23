import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'GifCard.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _controller = TextEditingController();

  List<String> gifUrls = [];
  void getGifUrls(String word) async {

    var gifData = await http.get(
        'https://api.tenor.com/v1/search?q=$word&key=LIVDSRZULELA&limit=8');
    var gifDataParsed = jsonDecode(gifData.body);
    gifUrls.clear();
    for (int i = 0; i < 8; i++) {
      gifUrls.add(gifDataParsed['results'][i]['media'][0]['tinygif']['url']);
    }

    setState(() {});
  }

  @override
  void initState() {
    getGifUrls('ismail abi');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tenor GIF API"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: TextField(
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  controller: _controller,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blueGrey),
                        borderRadius: BorderRadius.circular(10),
                      )),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueGrey.shade100,
                ),
                onPressed: () {
                  getGifUrls(_controller.text);
                },
                child: Text('Gif Getir'),
              ),
              gifUrls.isEmpty
                  ? CircularProgressIndicator()
                  : Container(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: ListView.separated(
                    itemCount: 8,
                    itemBuilder: (_, int index) {
                      return GifCard(gifUrls[index]);
                    },
                    separatorBuilder: (_, __) {
                      return Divider(
                        color: Colors.blue,
                        thickness: 5,
                        height: 5,
                      );
                    },
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

