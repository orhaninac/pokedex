import 'package:flutter/material.dart';
import 'model/pokedex.dart';

class PokemonDetail extends StatelessWidget {
  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepOrange,
        appBar: AppBar(
          elevation: 0,
          title: Text("Pokemon Detay"),
        ),
        body: OrientationBuilder(
          builder: (context, orientation) {
            if (orientation == Orientation.portrait) {
              return dikeyBody(context);
            } else {
              return yatayBody(context);
            }
          },
        ));
    ;
  }

  Stack dikeyBody(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          height: MediaQuery.of(context).size.height * 7 / 10,
          width: MediaQuery.of(context).size.width - 20,
          top: MediaQuery.of(context).size.height * 0.1,
          left: 10,
          child: Card(
            elevation: 6,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 80,
                ),
                Text(
                  pokemon.name,
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Height: " + pokemon.height,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Weight: " + pokemon.weight,
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  "Types ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.type
                      .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            ),
                          ))
                      .toList(),
                ),
                Text(
                  "Pre Evolution ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.prevEvolution != null
                      ? pokemon.prevEvolution
                          .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : [
                          Chip(
                            backgroundColor: Colors.green,
                            label: Text(
                              "Firs Version",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        ],
                ),
                Text(
                  "Next Evolution ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.nextEvolution != null
                      ? pokemon.nextEvolution
                          .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : [
                          Chip(
                            backgroundColor: Colors.green,
                            label: Text(
                              "Lastest Version",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          )
                        ],
                ),
                Text(
                  "Weaknesses ",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pokemon.weaknesses != null
                      ? pokemon.weaknesses
                          .map((tip) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  tip,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ))
                          .toList()
                      : Chip(
                          backgroundColor: Colors.green,
                          label: Text(
                            "NO Weaknesses",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                )
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Hero(
            tag: pokemon.img,
            child: Container(
              padding: EdgeInsets.only(top: 5),
              width: 150,
              height: 150,
              child: Image.network(
                pokemon.img,
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget yatayBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: MediaQuery.of(context).size.height * (3 / 4),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Hero(
                tag: pokemon.img,
                child: Container(
                  width: 200,
                  child: Image.network(
                    pokemon.img,
                    fit: BoxFit.fill,
                  ),
                )),
          ),
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Height : " + pokemon.height,
                  ),
                  Text(
                    "Weight : " + pokemon.weight,
                  ),
                  Text(
                    "Types",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((tip) => Chip(
                            backgroundColor: Colors.deepOrange.shade300,
                            label: Text(
                              tip,
                              style: TextStyle(color: Colors.white),
                            )))
                        .toList(),
                  ),
                  Text(
                    "Pre Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.prevEvolution != null
                        ? pokemon.prevEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("İlk hali")],
                  ),
                  Text(
                    "Next Evolution",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution != null
                        ? pokemon.nextEvolution
                            .map((evolution) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  evolution.name,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Son hali")],
                  ),
                  Text(
                    "Weakness",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses != null
                        ? pokemon.weaknesses
                            .map((weakness) => Chip(
                                backgroundColor: Colors.deepOrange.shade300,
                                label: Text(
                                  weakness,
                                  style: TextStyle(color: Colors.white),
                                )))
                            .toList()
                        : [Text("Zayıflığı yok")],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
