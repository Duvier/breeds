import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  State<DetailPage> createState() => DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(arguments['breed']['name']),
      ),
      body: Column(
        children: [
          Image.network(
            arguments['breed']['image']['url'] ??
                'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
            // height: MediaQuery.of(context).size.height / 1.6,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(
                physics: BouncingScrollPhysics(),
                children: [
                  Text(
                    'Descripción',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    arguments['breed']['description'],
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'País de origen',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    arguments['breed']['origin'],
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Inteligencia',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    arguments['breed']['intelligence'].toString(),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Adaptabilidad',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    arguments['breed']['adaptability'].toString(),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Tiempo de vida',
                    style: TextStyle(fontSize: 12.0),
                  ),
                  Text(
                    arguments['breed']['life_span'].toString(),
                    style:
                        TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
