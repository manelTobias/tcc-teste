import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:ifeventos/views/simulados.dart';

class Questoes extends StatefulWidget {
  @override
  _QuestoesState createState() => _QuestoesState();
}

class _QuestoesState extends State<Questoes> {
  int index = 0;
  final questao = GetStorage().read('simulado');
  @override
  void initState() {
    print(questao);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffff),
      appBar: AppBar(
      toolbarHeight: 100,
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        child:
          ListView(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Text("questao[index].data.toString()")
              ),
            ] 
          )


      )
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