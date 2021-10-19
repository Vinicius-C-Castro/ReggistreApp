import 'package:flutter/cupertino.dart';
import 'package:moneytextformfield/moneytextformfield.dart';

import '/json/create_budget_json.dart';
import '/theme/colors.dart';
import 'package:flutter/material.dart';

import 'create_category.dart';

class CreatBudgetPage extends StatefulWidget {
  @override
  _CreatBudgetPageState createState() => _CreatBudgetPageState();
}

class _CreatBudgetPageState extends State<CreatBudgetPage> {
  int activeCategory = 0;
  int _value = 0;
  TextEditingController _budgetName =
      TextEditingController(text: "");
  TextEditingController _budgetPrice = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.05),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(color: white, boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.01),
                spreadRadius: 10,
                blurRadius: 3,
                // changes position of shadow
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 60, right: 20, left: 20, bottom: 25),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Adicionar Movimentação",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: black),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      // Icon(
                      //   Icons.exit_to_app_outlined,
                      //   size: 25,
                      // ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Categorias",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: black.withOpacity(0.5)),
                ),
                Row(
                  children: [
                    FlatButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CreateCategoryPage()),
                        );
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: <Widget>[
                          Text("Criar Categoria", style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          )),
                          SizedBox(width: 6),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),

          ),
          SizedBox(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
                children: List.generate(categories.length, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    activeCategory = index;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(
                      left: 10,
                    ),
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        color: white,
                        border: Border.all(
                            width: 2,
                            color: activeCategory == index
                                ? primary
                                : Colors.transparent),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: grey.withOpacity(0.01),
                            spreadRadius: 10,
                            blurRadius: 3,
                            // changes position of shadow
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 20, bottom: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: grey.withOpacity(0.15)),
                              child: Center(
                                child: Image.asset(
                                  categories[index]['icon'],
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.contain,
                                ),
                              )),
                          Text(
                            categories[index]['name'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            })),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _budgetName,
                  cursorColor: black,
                  style: TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold, color: black),
                  decoration: InputDecoration(
                    focusColor: blue,
                    labelText: "Descrição",

                    focusedBorder: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 2,color: blue),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(12.0),
                      borderSide: BorderSide(width: 2, color: blue),
                    ),
                    labelStyle: TextStyle(
                        color: grey,
                        fontSize: 14.0
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: (size.width - 300),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MoneyTextFormField(
                              settings: MoneyTextFormFieldSettings(
                                controller: _budgetPrice,
                                moneyFormatSettings: MoneyFormatSettings(
                                  displayFormat: MoneyDisplayFormat.symbolOnLeft,
                                  currencySymbol: "R\$",
                                  fractionDigits: 2,),
                                appearanceSettings: AppearanceSettings(
                                  labelText: "Valor",
                                  formattedStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: black),),
                              )
                            // decoration: InputDecoration(
                            //     prefixText: "R\$ "),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _icon(0, text: "Receita", icon: Icons.add_rounded),
                    SizedBox(
                      width: 50,
                    ),
                    _icon(1, text: "Despesa", icon: Icons.remove),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _icon(int index, {String text, IconData icon}) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: (index == _value ? (index == 0 ? secondary : red) : grey),
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: InkResponse(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color: Colors.white,
                size: 40,
              ),
              Text(text, style: TextStyle(color: Colors.white)),
            ],
          ),
          onTap: () => setState(
                () {
                  _value = index;
            },
          ),
        ),
      ),
    );
  }
}

