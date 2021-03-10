import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'questoes.dart';

class SimuladoScreen extends StatefulWidget {
  @override
  _SimuladoScreenState createState() => _SimuladoScreenState();
}

class _SimuladoScreenState extends State<SimuladoScreen> {

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      appBar: AppBar(
        title: Text("Simulado"),
        toolbarHeight: 100,
      ),
      body: Container(
        color: Colors.white,
        width: double.maxFinite,
        child: Column (
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 120.0,),
            SizedBox(
              height: 50.0,
              width: 300,
              child: RaisedButton(
                child: Text("Gerar simulados"),
                textColor: Colors.white,
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  Firestore.instance.collection("questao").document("MATEMATICA").collection("questoes").getDocuments()
                    .then((value) {
                      List<Map> questoes = [];
                      value.documents.forEach((element) => questoes.add(element.data));
                      box.write('simulado', questoes);
                      
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Questoes()),
                      );
                    });
                },
              )
            ),

            // SizedBox(height: 20.0,),
            // SizedBox(
            //   height: 50.0,
            //   width: 300,
            //   child: RaisedButton(
            //     child: Text("Simulado por Área"),
            //     textColor: Colors.white,
            //     color: Theme.of(context).primaryColor,
            //     onPressed: (){},
            //   )
            // ),

            // SizedBox(height: 20.0,),
            // SizedBox(
            //   height: 50.0,
            //   width: 300,
            //   child: RaisedButton(
            //     child: Text("Simulado por assunto"),
            //     textColor: Colors.white,
            //     color: Theme.of(context).primaryColor,
            //     onPressed: (){},
            //   )
            // ),

            // SizedBox(height: 20.0,),
            // SizedBox(
            //   height: 50.0,
            //   width: 300,
            //   child: RaisedButton(
            //     child: Text("Simulado personalizado"),
            //     textColor: Colors.white,
            //     color: Theme.of(context).primaryColor,
            //     onPressed: (){},
            //   )
            // )
          ],
        )
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}