import 'package:flutter/material.dart';
import 'Screens/convert_screen.dart';

class DisplayCard extends StatelessWidget {
  const DisplayCard({
    Key key,
    @required this.cryptoCurrency,
    @required this.exchangeRate,
    @required this.currency,
  }) : super(key: key);

  final String cryptoCurrency;
  final String exchangeRate;
  final String currency;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        double rate = double.parse(exchangeRate);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Conversion(
              cash: currency,
              crypto: cryptoCurrency,
              exchangeRate: rate,
            ),
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Color(0xFFF9BC23),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
              '1 $cryptoCurrency = $exchangeRate $currency',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Cards extends StatelessWidget {
  Cards({this.txt});
  final txt;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0),
      child: Card(
        color: Color(0xEEF9BC23),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
          child: Text(
            '$txt',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black54,
            ),
          ),
        ),
      ),
    );
  }
}

class TxtField extends StatelessWidget {
  TxtField({this.onTap});
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Card(
        color: Color(0xAEF9BC23),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 28.0),
          child: TextField(
            decoration: new InputDecoration(
              filled: false,
              hintText: 'Enter Amount',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                borderSide: BorderSide.none,
              ),
            ),
            keyboardType: TextInputType.number,
            onChanged: onTap,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class FinalVal extends StatelessWidget {
  FinalVal({this.rate});
  final String rate;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0),
      child: Card(
        color: Color(0xAEF9BC23),
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 28.0),
          child: Text(
            '$rate',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  Button({this.onTap, this.txt});
  final Function onTap;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.fromLTRB(2, 18.0, 2.0, 18.0),
        child: Card(
          color: Color(0xFFE79526),
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Center(
              child: Text(
                '$txt',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

//cards