import 'dart:convert';

import 'package:ionicons/ionicons.dart';

import '../globals.dart';
import '../pallete.dart';
import '/pages/budget_page.dart';
import '/pages/create_budge_page.dart';
import '/pages/daily_page.dart';
import '/pages/profile_page.dart';
import '/pages/stats_page.dart';
import '/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:http/http.dart' as http;


class RootApp extends StatefulWidget {
  @override
  _RootAppState createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;

  List<Widget> pages = [
    DailyPage(),
    StatsPage(),
    BudgetPage(),
    ProfilePage(),
    CreatBudgetPage(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: getBody(),
        bottomNavigationBar: getFooter(),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              selectedTab(4);
            },
            child: Icon(
              Icons.add,
              size: 25,
            ),
            backgroundColor: primary
            //params
            ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerDocked);
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Ionicons.calendar,
      Ionicons.stats_chart,
      Ionicons.wallet,
      Ionicons.person,
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.verySmoothEdge,
      leftCornerRadius: 10,
      iconSize: 30,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) async {

    bool sucesso = await getMovimentacoes();

    if (sucesso == true) {
      setState(() {
        if (index != 2) {
          pageIndex = index;
        } else {
          pageIndex = index;
        }
      });
    }
  }

  getMovimentacoes() async {
    http.Response res = await http.get(BASE_URL+'/api/v1/movement/read-all');

    bool sucesso = false;
    List<Movimentacao> movs =  new List<Movimentacao>();
    if (res.statusCode == 200) {

      var responseData = json.decode(res.body);

      for (var singlemovimentacao in responseData) {
        Movimentacao movimentacao = Movimentacao(
          id: singlemovimentacao["id"],
          nome: singlemovimentacao["nome"],
          descricao: singlemovimentacao["descricao"],
          data: singlemovimentacao["data"],
          tipoMovimentacao: singlemovimentacao["tipoMovimentacao"],
          valor: singlemovimentacao["valor"],
          recorrencia: singlemovimentacao["recorrencia"],
          categoria: singlemovimentacao["categoria"],
          pessoaFisica: singlemovimentacao["pessoaFisica"],
        );

        movs.add(movimentacao);
      }
      sucesso = true;
    }

    globalMovimentacoes = movs;
    return sucesso;
  }
}
