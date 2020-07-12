import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../cards.dart';

class Conversion extends StatefulWidget {
  Conversion({this.cash, this.crypto, this.exchangeRate});
  final cash;
  final crypto;
  final exchangeRate;
  @override
  _ConversionState createState() => _ConversionState(
        cash: cash,
        crypto: crypto,
        exchangeRate: exchangeRate,
      );
}

class _ConversionState extends State<Conversion> {
  _ConversionState({this.cash, this.crypto, this.exchangeRate});
  final cash;
  final crypto;
  final exchangeRate;

  String cryptoAmtS;
  bool ifPresent = false;
  double cryptoAmt = 1;
  double values = 0;
  int isSwap = 0;

  void cryptoCash() {
    setState(() {
      if (ifPresent) {
        values = cryptoAmt * exchangeRate;
      } else {
        print('Enter Amount');
      }
    });
  }

  void cashCrypto() {
    setState(() {
      if (ifPresent) {
        values = cryptoAmt / exchangeRate;
      } else {
        print('Enter Amount');
      }
    });
  }

  bool swap() {
    if (isSwap % 2 != 0)
      return false;
    else
      return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '💲Conversion💲',
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 150,
              child: Flexible(
                child: Image.asset('images/bitkey.jpg'),
              ),
            ),
            Cards(
              txt: swap()
                  ? crypto.toString().toUpperCase()
                  : cash.toString().toUpperCase(),
            ),
            SizedBox(
              height: 15,
            ),
            TxtField(
              onTap: (value) {
                setState(() {
                  cryptoAmtS = value;
                  if (cryptoAmtS != null) {
                    cryptoAmt = double.parse(cryptoAmtS);
                    ifPresent = true;
                  }
                });
              },
            ),
            SizedBox(
              height: 60,
            ),
            Cards(
              txt: swap()
                  ? cash.toString().toUpperCase()
                  : crypto.toString().toUpperCase(),
            ),
            SizedBox(
              height: 15,
            ),
            FinalVal(
              rate: values.toStringAsFixed(2),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Color(0x9FF88201),
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Button(
              txt: 'Back',
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Button(
              txt: 'Convert',
              onTap: () {
                swap() ? cryptoCash() : cashCrypto();
              },
            ),
            Button(
              txt: 'Swap',
              onTap: () {
                setState(() {
                  isSwap = isSwap + 1;
                  values = 0;
                  cryptoAmtS = '0';
                  print(isSwap);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
