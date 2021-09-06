import 'package:ReggitreApp/screens/menu/Helper/Movimentacoes_helper.dart';
import 'package:ReggitreApp/screens/menu/Widgets/TimeLineItem.dart';
import 'package:flutter/material.dart';

import '../../../pallete.dart';


class DespesasResumo extends StatefulWidget {
  @override
  _DespesasResumoState createState() => _DespesasResumoState();
}

class _DespesasResumoState extends State<DespesasResumo> {
  MovimentacoesHelper movimentacoesHelper = MovimentacoesHelper();
  List<Movimentacoes> listmovimentacoes = List();

  _allMovPorTipo() {
    movimentacoesHelper.getAllMovimentacoesPorTipo("d").then((list) {
      setState(() {
        listmovimentacoes = list;
      });
      print("All Mov: $listmovimentacoes");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _allMovPorTipo();
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: reggistreCollorRed,
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: width * 0.05,top: width * 0.2),
              child: Text("Despesas",style: TextStyle(
                color: Colors.white ,
                fontWeight: FontWeight.bold,
                fontSize: width * 0.08
              ),),
              
            ),
            Padding(
              padding: EdgeInsets.only(left: width * 0.03, top: width * 0.08),
              child: SizedBox(
                width: width,
                height: height * 0.74,
                child: ListView.builder(
                  itemCount: listmovimentacoes.length,
                  itemBuilder: (context, index){
                    List movReverse = listmovimentacoes.reversed.toList();
                    Movimentacoes mov = movReverse[index];
                    
                    if(movReverse[index] == movReverse.last){
                      return TimeLineItem(mov: mov, colorItem: reggistreCollorRed,isLast: true,);
                    }else{
                      return TimeLineItem(mov: mov,colorItem: reggistreCollorRed,isLast: false,);
                    }
                    
                  },
                ),
              ),
              
            ),
            
          ],
        ),
      ),
    );
  }
}
