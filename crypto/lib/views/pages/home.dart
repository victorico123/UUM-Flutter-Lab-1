import 'package:crypto/views/pages/conversion.dart' as cv;
import 'package:flutter/material.dart';
import 'package:crypto/utils/global.dart' as gb;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onPressedFiat() {
    setState(() {
      gb.currentType = 'fiat';
      cv.coinNameAndUnitChoosen = '';
      cv.dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return cv.Conversion();
        }),
      );
    });
  }

  void _onPressedCommodity() {
    setState(() {
      gb.currentType = 'commodity';
      cv.coinNameAndUnitChoosen = '';
      cv.dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return cv.Conversion();
        }),
      );
    });
  }

  void _onPressedCrypto() {
    setState(() {
      gb.currentType = 'crypto';
      cv.coinNameAndUnitChoosen = '';
      cv.dropdownvalue = '';
      Navigator.push(
        context,
        MaterialPageRoute(builder: (builder) {
          return cv.Conversion();
        }),
      );
    });
  }

  void _onPressedHome() {
    setState(() {
      cv.coinNameAndUnitChoosen = '';
      cv.dropdownvalue = '';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              child: const Text(
                'Choose Value Exchange',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () => _onPressedCommodity(),
                    child: Card(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 200,
                              maxWidth: 150,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/commodity.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Commodity',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                  GestureDetector(
                    onTap: () => _onPressedCrypto(),
                    child: Card(
                        child: ConstrainedBox(
                            constraints: const BoxConstraints(
                              maxHeight: 200,
                              maxWidth: 150,
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: 150,
                                    child: Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Image.asset(
                                        'assets/images/crypto.png',
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Text(
                                      'Crypto',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ))),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () => _onPressedFiat(),
              child: Card(
                  child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxHeight: 200,
                        maxWidth: 150,
                      ),
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: Image.asset(
                              'assets/images/fiat.png',
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              'Fiat',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
