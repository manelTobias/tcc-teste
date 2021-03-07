import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ifeventos/views/questoes.dart';

class Simulados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      appBar: AppBar(
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
                  child: Text("Gerar simulado"),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: ()async{
                    Future<List<QuerySnapshot>> questoes = Firestore.instance.collection("questao").document("MATEMATICA").collection("questoes").snapshots().toList();
                    await GetStorage.init('simulado');
                    GetStorage().write('simulado', questoes);
                    final questao = GetStorage().read('simulado');
                    print(questao);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Questoes()),
                    );
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