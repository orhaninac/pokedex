import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/pokedex.dart';
import 'package:flutter_app/pokemon_detail.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {
  String url =
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;
  Future<Pokedex> veri;

  Future<Pokedex> pokemonlariGetir() async {
    var response = await http.get(url);
    var decodedJson = json.decode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    veri = pokemonlariGetir();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pokedex"),
      ),
      body: OrientationBuilder(
        // ignore: missing_return
        builder: (context,orientation){
          if(orientation==Orientation.portrait){
            return FutureBuilder(
              future: veri,
              // ignore: missing_return
              builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
                if (gelenPokedex.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (gelenPokedex.connectionState == ConnectionState.done) {
                  return GridView.count(
                    crossAxisCount: 2,
                    children: gelenPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetail(pokemon: poke,)));
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 150,
                                    width: 120,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: poke.img,fit: BoxFit.contain,),
                                  ),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            );
          }
          else{
            return FutureBuilder(
              future: veri,
              // ignore: missing_return
              builder: (context, AsyncSnapshot<Pokedex> gelenPokedex) {
                if (gelenPokedex.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (gelenPokedex.connectionState == ConnectionState.done) {
                  return GridView.extent(maxCrossAxisExtent: 300,
                    children: gelenPokedex.data.pokemon.map((poke) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => PokemonDetail(pokemon: poke,)));
                        },
                        child: Hero(
                          tag: poke.img,
                          child: Card(
                            elevation: 6,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 200,
                                    width: 150,
                                    child: FadeInImage.assetNetwork(
                                      placeholder: "assets/loading.gif",
                                      image: poke.img,fit: BoxFit.contain,),
                                  ),
                                ),
                                Text(
                                  poke.name,
                                  style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  );
                }
              },
            );
          }
        },

      ),
    );
  }
}
