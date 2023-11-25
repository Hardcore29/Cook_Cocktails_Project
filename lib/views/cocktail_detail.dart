import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String strDrink;
  final String strDrinkThumb;
  final String strInstructions;
  final String? strIngredient1;
  final String? strIngredient2;
  final String? strIngredient3;
  final String? strIngredient4;
  final String? strIngredient5;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  const DetailPage(
      {Key? key,
      required this.strDrink,
      required this.strDrinkThumb,
      required this.strInstructions,
      this.strIngredient1,
      this.strIngredient2,
      this.strIngredient3,
      this.strIngredient4,
      this.strIngredient5,
      this.strMeasure1,
      this.strMeasure2,
      this.strMeasure3,
      this.strMeasure4,
      this.strMeasure5})
      : super(key: key);
  void showIngredient() {
    List ingradient = [
      strIngredient1,
      strIngredient2,
      strIngredient3,
      strIngredient4,
      strIngredient5
    ];
    for (int i = 0; i < ingradient.length; i++) {
      if (ingradient[i] == null) {}
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 212, 175, 55),
        title: Center(
          child: Text(
            strDrink,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Expanded(
          child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: const Color.fromARGB(255, 212, 175, 55),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                  child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.network(
                  strDrinkThumb,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              )),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                thickness: 2,
                color: Colors.black,
              ),
              Text(
                '''Ingredient:
                      ${strIngredient1 != null ? "$strIngredient1:$strMeasure1" : ''}
                      ${strIngredient2 != null ? "$strIngredient2:$strMeasure2" : ''}
                      ${strIngredient3 != null ? "$strIngredient3:$strMeasure3" : ''}
                      ${strIngredient4 != null ? "$strIngredient4:$strMeasure4" : ''}
                      ${strIngredient5 != null ? "$strIngredient5:$strMeasure5" : ''}
                      ''',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              Text(
                "Instructions: $strInstructions",
                style: const TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
