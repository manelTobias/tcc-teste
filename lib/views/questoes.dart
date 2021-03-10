import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Questoes extends StatefulWidget {
  @override
  _QuestoesState createState() => _QuestoesState();
}

class _QuestoesState extends State<Questoes> {
  
  int _index = 0;
  bool _simuladoFinalizado = false;
  final box = GetStorage();
  List<Map> simulado = [];

  @override
  void initState() {
    setState(() => simulado = box.read('simulado'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      appBar: AppBar(
        toolbarHeight: _simuladoFinalizado ? 60 : 100,
        title: _simuladoFinalizado ? 
        Text("Simulado Finalizado") :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text("Questão ${_index+1}"),
            Text("Área: X", style: TextStyle(fontSize: 14)),
            Text("Assunto: ${simulado[_index]["assunto"]}", style: TextStyle(fontSize: 14)),
          ]
        ),
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child:_simuladoFinalizado ? 
          Center(
            child: Text("Simulado Finalizado!", style: TextStyle(fontSize: 18))
          ) :
          ListView(
            children: <Widget>[
              Text(simulado[_index]["enunciado"], style: TextStyle(fontSize: 16)),

              if(simulado[_index]["alternativas"].keys.contains("A"))
                opcao(descricao: simulado[_index]["alternativas"]["A"]["descricao"].toString()),
              
              if(simulado[_index]["alternativas"].keys.contains("B"))
                opcao(descricao: simulado[_index]["alternativas"]["B"]["descricao"].toString()),
              
              if(simulado[_index]["alternativas"].keys.contains("C"))
                opcao(descricao: simulado[_index]["alternativas"]["C"]["descricao"].toString()),

              if(simulado[_index]["alternativas"].keys.contains("D"))
                opcao(descricao: simulado[_index]["alternativas"]["D"]["descricao"].toString()),

              if(simulado[_index]["alternativas"].keys.contains("E"))
                opcao(descricao: simulado[_index]["alternativas"]["E"]["descricao"].toString())
            ] 
          )
      )
    );
  }

  Widget opcao({ @required String descricao }) {
    return FlatButton(
      padding: EdgeInsets.symmetric(vertical: 5),
      color: Colors.grey[300],
      child: Text(
        descricao,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16)
      ),
      onPressed: () {
        // TODO: salvar resposta no local
        setState(() {
          if(_index + 1 < simulado.length)
            _index++;
          else 
            _simuladoFinalizado = true;
        });
      },
    );
  }
}

// class Questoes extends StatelessWidget {
//   Widget getQuestoes(List questoes){
//     List<Widget> qst = new List<Widget>();
//     questoes.forEach((el) {
//       qst.add(Text(el.data.toString()));
//     });
//     return Column(
//       children: qst
//     );
//   }

//   salvarQuestoes(questoes) async {
//     await GetStorage.init('simulado');
//     GetStorage().write('simulado', questoes);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffffff),
//       appBar: AppBar(
//         toolbarHeight: 100,
//         ),
//         body: Container(
//           width: double.maxFinite,
//           color: Colors.white,
//           child: Column(
//             children: <Widget>[
//               Expanded(
//               child: StreamBuilder(
//                 stream: Firestore.instance.collection("questao").document("MATEMATICA").collection("questoes").snapshots(),
//                 builder: (context, snapshot) {
//                   switch(snapshot.connectionState) {
//                     case ConnectionState.none:
//                     case ConnectionState.waiting:
//                     return Center(
//                       child: CircularProgressIndicator()
//                     );
//                     default:
//                     salvarQuestoes(snapshot.data.documents); 
//                     return
//                     SingleChildScrollView(
//                       child: Container(
//                         padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//                           child: getQuestoes(snapshot.data.documents)
//                         ),
//                       );
//                     }
//           },
//         )
//       )
//     ],
//   )
// ),
        
//       );
        
//   }
//}