import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:http/http.dart' as http;
import 'package:html/dom.dart' as dom;
import 'package:html/parser.dart' as parser;
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> title;

  List<String> post;

  List<String> link;

  void _getDataFromWeb() async {
    final response =
        await http.get(Uri.parse("https://arprogramming.blogspot.com/"));
    dom.Document document = parser.parse(response.body);

    final elements =
        document.getElementsByClassName('entry-header blog-entry-header');

    final content = document.getElementsByClassName('entry-content');

    final link2 = document.getElementsByClassName('entry-title');

    setState(() {
      title = elements
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      post = content
          .map((element) => element.getElementsByTagName("a")[0].innerHtml)
          .toList();

      link = link2
          .map((element) =>
      element.getElementsByTagName("a")[0].attributes['href'])
          .toList();
    });
  }

  @override
  void initState() {
    _getDataFromWeb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: post.length == 0
            ? Text("No data", style: TextStyle(color: Colors.white))
            : ListView.builder(
                itemBuilder: (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: FadeInAnimation(
                        child: GestureDetector(
                          onTap: () async {
                            dynamic url = link[index];
                            if (await canLaunch(url)) {
                              launch(url);
                            } else {
                              print("error");
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Card(
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      title[index],
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    post[index],
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
                itemCount: post.length,
              ),
      ),
    );
  }
}
