// ignore_for_file: file_names
import 'package:crypto/models/coin.dart';
import 'package:crypto/views/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/utils/global.dart' as gb;

// ignore: prefer_typing_uninitialized_variables
var coinNameAndUnitChoosen;
// ignore: prefer_typing_uninitialized_variables
var coinModel;
// ignore: prefer_typing_uninitialized_variables
var bitCoinNumber = 1.0;
// ignore: prefer_typing_uninitialized_variables
var convertedValue;
// ignore: prefer_typing_uninitialized_variables
var currentCoinValue;
var dropdownvalue = '';
TextEditingController bitCoinNumberController =
    TextEditingController(text: "1");

class Conversion extends StatefulWidget {
  const Conversion({Key? key}) : super(key: key);

  @override
  State<Conversion> createState() => _ConversionState();
}

class _ConversionState extends State<Conversion> {
  void _onPressedFiat() {
    setState(() {
      gb.currentType = 'fiat';
      coinNameAndUnitChoosen = '';
      dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const Conversion();
        }),
      );
    });
  }

  void _onPressedCommodity() {
    setState(() {
      gb.currentType = 'commodity';
      coinNameAndUnitChoosen = '';
      dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const Conversion();
        }),
      );
    });
  }

  void _onPressedCrypto() {
    setState(() {
      gb.currentType = 'crypto';
      coinNameAndUnitChoosen = '';
      dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const Conversion();
        }),
      );
    });
  }

  void _onPressedHome() {
    setState(() {
      coinNameAndUnitChoosen = '';
      dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return const Home();
        }),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // gb.fetchCoin();
    List<String> itemList = [];
    List<Coin> itemListModel = [];
    for (var item in gb.CoinList) {
      if (item.type == gb.currentType) {
        itemListModel.add(item);
        itemList.add(item.name + ' (' + item.unit + ')');
      }
    }
    if (dropdownvalue == '') {
      dropdownvalue = itemList[0];
    }
    for (var i = 0; i < itemList.length - 1; i++) {
      if (itemList[i] == dropdownvalue) {
        coinModel = itemListModel[i];
        currentCoinValue = coinModel.value;
        convertedValue = currentCoinValue * bitCoinNumber;
        break;
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Bitcoin Conversion (' + gb.currentType + ')'),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          ),
          ListTile(
            title: TextButton(
                onPressed: null,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    'Choose Conversion Type',
                    style: TextStyle(
                      fontSize: 30,
                      foreground: Paint()
                        ..strokeWidth = 3
                        ..color = Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                )),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 50),
          ),
          ListTile(
            title: Card(
              child: TextButton(
                  onPressed: _onPressedCrypto,
                  child: Text(
                    'Crypto',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..strokeWidth = 3
                        ..color = Colors.white,
                    ),
                  )),
            ),
          ),
          ListTile(
            title: Card(
              child: TextButton(
                  onPressed: _onPressedFiat,
                  child: Text(
                    'Fiat',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..strokeWidth = 3
                        ..color = Colors.white,
                    ),
                  )),
            ),
          ),
          ListTile(
            title: Card(
              child: TextButton(
                  onPressed: _onPressedCommodity,
                  child: Text(
                    'Commodity',
                    style: TextStyle(
                      fontSize: 20,
                      foreground: Paint()
                        ..strokeWidth = 3
                        ..color = Colors.white,
                    ),
                  )),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
          ),
          ListTile(
            title: Card(
              child: TextButton(
                  onPressed: _onPressedHome,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 20,
                        foreground: Paint()
                          ..strokeWidth = 3
                          ..color = Colors.red,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ),
          ),
        ],
      )),
      body: SingleChildScrollView(
          child: Container(
        margin: const EdgeInsets.all(10),
        child: Container(
          margin: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.all(30),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'BITCOIN (BTC)',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: bitCoinNumberController,
                    textAlign: TextAlign.center,
                    decoration: const InputDecoration(
                        label: Center(child: Text("Enter Bitcoin Value"))),
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    onChanged: (text) {
                      if (text.isNotEmpty) {
                        bitCoinNumber = double.parse(text);
                      } else {
                        bitCoinNumber = 0.0;
                      }
                      setState(() {});
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: const Center(
                  child: Text(
                    'to',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Card(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButton(
                    isExpanded: true,
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: itemList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Center(child: Text(items)),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        coinNameAndUnitChoosen = newValue!;
                        dropdownvalue = newValue;
                      });
                    },
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Center(
                  child: Text(
                    bitCoinNumber.toString() +
                        ' (BTC) = ' +
                        convertedValue.toString() +
                        ' (' +
                        coinModel.unit +
                        ')',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: ElevatedButton(
                    onPressed: () => setState(() {}),
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      child: const Text(
                        'Refresh',
                        style: TextStyle(fontSize: 18),
                      ),
                    )),
              )
            ],
          ),
        ),
      )),
    );
  }
}
