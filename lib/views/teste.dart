import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ifeventos/widgets/custom-dialog-box.dart';

class CreateSimulado extends StatefulWidget {
  @override
  _CreateSimuladoState createState() => _CreateSimuladoState();
}

class _CreateSimuladoState extends State<CreateSimulado> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _titulo = new TextEditingController();
  bool _created = false;

  _register() async {
    try {
        Map<String, dynamic> simulado = {
          "titulo": _titulo.text,
        };

        Firestore.instance.collection("simulado").add(simulado).then((value) => {
          print("Deu tudo certo"),
          }).catchError((err) => {
            print(err)
          });
    } catch (e) {
      print(e);
      print("Deu errado");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdddddd),
      appBar: AppBar(
        title: Text("Cadastre-se"),
      ),

      body: SingleChildScrollView(
        child: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15
          ),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                TextFormField(
                  controller: _titulo,
                  cursorColor: Colors.greenAccent,
                  validator: (value) {
                    if(_titulo.text.isEmpty)
                      return 'Não pode ser vazio';
                    return null;
                  },
                  
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(
                      color: Colors.grey[800]
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey
                      )
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person, 
                      color: Colors.grey[800]
                    ),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey[800]
                      )
                    )
                  ),
                ),
                 
                SizedBox(height: 30,),
                SizedBox(
                  height: 50,
                  width: double.maxFinite,
                  child: RaisedButton(
                    color: Colors.green,
                    onPressed: _created ? null : () {
                      if(_formKey.currentState.validate())
                        _register();
                    },
                    child: Text(
                      "Cadastrar",
                      style: TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}