import 'package:flutter/material.dart';
import '../exchange_rates.dart';
import 'package:flutter/cupertino.dart';
import '../cards.dart';
import 'dart:io' show Platform;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedCurrency = 'inr';

  DropdownButton<String> androidDropDownButton() {
    List<DropdownMenuItem<String>> dropDownItems = [];
    for (String currency in currenciesList) {
      var newItem = DropdownMenuItem(
        child: Text(
          currency,
          style: TextStyle(
            fontWeight: FontWeight.w900,
          ),
        ),
        value: currency,
      );
      dropDownItems.add(newItem);
    }

    return DropdownButton<String>(
      itemHeight: 49,
      iconEnabledColor: Colors.black,
      dropdownColor: Colors.black26,
      autofocus: true,
      isExpanded: false,
      isDense: true,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      elevation: 30,
      icon: Icon(Icons.payment),
      value: selectedCurrency,
      items: dropDownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          updateRates();
        });
      },
    );
  }

  CupertinoPicker iOSPicker() {
    List<Text> pickerItems = [];
    for (String currency in currenciesList) {
      pickerItems.add(Text(currency));
    }

    return CupertinoPicker(
      itemExtent: 35,
      onSelectedItemChanged: (selectedIndex) {
        setState(() {
          selectedCurrency = currenciesList[selectedIndex];
          updateRates();
        });
      },
      children: pickerItems,
    );
  }

  bool isWaiting = false;
  Map<String, String> coinValues = {};

  void updateRates() async {
    isWaiting = true;
    try {
      var data = await ExchangeRates().getExchangeRate(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  Column makeCards() {
    List<DisplayCard> cryptoCards = [];
    for (String crypto in cryptoList) {
      cryptoCards.add(
        DisplayCard(
          cryptoCurrency: crypto,
          exchangeRate: isWaiting ? '?' : coinValues[crypto],
          currency: selectedCurrency,
        ),
      );
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: cryptoCards,
    );
  }

  @override
  void initState() {
    super.initState();
    updateRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' 💲 Crypto Exchange',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            makeCards(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120.0,
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 30.0),
        color: Color(0xFFE79526),
        child: Platform.isAndroid ? androidDropDownButton() : iOSPicker(),
      ),
    );
  }
}
