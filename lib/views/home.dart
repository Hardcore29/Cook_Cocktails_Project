import 'package:drink_app/models/cocktail_model.dart';
import 'package:drink_app/views/cocktail_detail.dart';
import 'package:flutter/material.dart';
import 'package:drink_app/models/cocktail_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // ignore: unused_field
  List<Drinks>? _drinks;

  @override
  void initState() {
    super.initState();
    getCocktails();
  }

  Future<void> getCocktails() async {
    _drinks = await CocktailAPI.fetchDrinks(CustomDelegate().query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 212, 175, 55),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.local_drink),
              SizedBox(width: 10),
              Text('Cocktail'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomDelegate());
              },
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder<List<Drinks>>(
              future: CocktailAPI.fetchDrinks(CustomDelegate().query),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                      child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount:
                        (snapshot.data != null ? snapshot.data!.length : 0),
                    itemBuilder: (BuildContext context, int index) {
                      final cocktail = snapshot.data![index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailPage(
                                        strDrink: cocktail.strDrink,
                                        strDrinkThumb: cocktail.strDrinkThumb,
                                        strInstructions:
                                            cocktail.strInstructions,
                                        strIngredient1: cocktail.strIngredient1,
                                        strIngredient2: cocktail.strIngredient2,
                                        strIngredient3: cocktail.strIngredient3,
                                        strIngredient4: cocktail.strIngredient4,
                                        strIngredient5: cocktail.strIngredient5,
                                        strMeasure1: cocktail.strMeasure1,
                                        strMeasure2: cocktail.strMeasure2,
                                        strMeasure3: cocktail.strMeasure3,
                                        strMeasure4: cocktail.strMeasure4,
                                        strMeasure5: cocktail.strMeasure5,
                                      )));
                        },
                        child: Card(
                          elevation: 2,
                          color: const Color.fromARGB(255, 212, 175, 55),
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)),
                                child: Image.network(
                                  cocktail.strDrinkThumb,
                                  height: 110,
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  cocktail.strDrink,
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ));
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(child: CircularProgressIndicator());
              },
            )
          ],
        )
        /*Text(
            "Search your favourite Cocktail",
            style: TextStyle(
              fontSize: 25,
              color: Colors.greenAccent,
            ),
          ),*/
        );
  }
}

class CustomDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FutureBuilder<List<Drinks>>(
          future: CocktailAPI.fetchDrinks(query),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Expanded(
                  child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: (snapshot.data != null ? snapshot.data!.length : 0),
                itemBuilder: (BuildContext context, int index) {
                  final cocktail = snapshot.data![index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailPage(
                                    strDrink: cocktail.strDrink,
                                    strDrinkThumb: cocktail.strDrinkThumb,
                                    strInstructions: cocktail.strInstructions,
                                    strIngredient1: cocktail.strIngredient1,
                                    strIngredient2: cocktail.strIngredient2,
                                    strIngredient3: cocktail.strIngredient3,
                                    strIngredient4: cocktail.strIngredient4,
                                    strIngredient5: cocktail.strIngredient5,
                                    strMeasure1: cocktail.strMeasure1,
                                    strMeasure2: cocktail.strMeasure2,
                                    strMeasure3: cocktail.strMeasure3,
                                    strMeasure4: cocktail.strMeasure4,
                                    strMeasure5: cocktail.strMeasure5,
                                  )));
                    },
                    child: Card(
                      elevation: 2,
                      color: const Color.fromARGB(255, 212, 175, 55),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            child: Image.network(
                              cocktail.strDrinkThumb,
                              height: 110,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              cocktail.strDrink,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const Center(child: CircularProgressIndicator());
          },
        )
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const Center(
      child: Text(""),
    );
  }
}
