import 'package:breeds/repositories/breeds.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class LandindgPage extends StatefulWidget {
  const LandindgPage({Key key}) : super(key: key);

  @override
  State<LandindgPage> createState() => _LandindgPageState();
}

class _LandindgPageState extends State<LandindgPage> {
  TextEditingController searchController = TextEditingController();
  bool notFond = false;
  List<dynamic> breeds;
  @override
  void initState() {
    getBreedsInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: searchController,
                decoration: InputDecoration(
                  hintText: 'Buscar nombre de la raza en inglés',
                  suffixIcon: Icon(Icons.search),
                ),
                onSubmitted: (value) => searchBreeed(value),
              ),
            ),
            Expanded(
              child: (notFond)
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search_off,
                            size: 80.0,
                            color: Colors.black26,
                          ),
                          Text('No hay resultados para la busqueda'),
                          TextButton(
                            onPressed: () {
                              notFond = false;
                              searchController.clear();
                              getBreedsInit();
                            },
                            child: Text('Toca para listar todas las razas'),
                          )
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemCount: breeds.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10.0),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      breeds[index]['name'] ??
                                          'Nombre de la raza',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'detail',
                                            arguments: {
                                              'breed': breeds[index]
                                            });
                                      },
                                      child: Text('Más...'),
                                    ),
                                  ],
                                ),
                                Image.network(
                                  breeds[index]['image']['url'] ??
                                      'https://cdn2.thecatapi.com/images/0XYvRd7oD.jpg',
                                  // height: 150.0,
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(breeds[index]['origin'] ??
                                        'País de origen'),
                                    Text(breeds[index]['intelligence']
                                            .toString() ??
                                        'Inteligencia'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  void getBreedsInit() async {
    breeds = await getBreeds();
    setState(() {});
  }

  searchBreeed(String query) {
    final resultFilter = breeds
        .where(
          (element) => element['name'] == query,
        )
        .toList();
    if (resultFilter.length > 0) {
      return setState(() {
        breeds = resultFilter;
      });
    }
    setState(() {
      notFond = true;
    });
  }
}
