import 'package:flutter/material.dart';
import 'package:ifeventos/views/simulados.dart';

import 'simulados.dart';

class Principal extends StatelessWidget {


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
                  child: Text("Cronograma de Estudo"),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){},
                )
              ),

              SizedBox(height: 20.0,),
              SizedBox(
                height: 50.0,
                width: 300,
                child: RaisedButton(
                  child: Text("Simulados"),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SimuladoScreen()),
                    );
                  },
                )
              ),

              SizedBox(height: 20.0,),
              SizedBox(
                height: 50.0,
                width: 300,
                child: RaisedButton(
                  child: Text("Rendimentos"),
                  textColor: Colors.white,
                  color: Theme.of(context).primaryColor,
                  onPressed: (){},
                )
              )
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
            icon: Icon(Icons.book),
            label: 'Book',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
      ),
        
      );
  }
}