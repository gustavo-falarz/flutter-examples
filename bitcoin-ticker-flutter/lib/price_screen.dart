import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'coin_data.dart';
import 'network.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';
  List<Widget> rateTexts = [];

  @override
  void initState() {
    super.initState();
    getRates();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: rateTexts,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: getDropDown(),
          ),
        ],
      ),
    );
  }

  void getRates() async {
    rateTexts.clear();
    var rate;
    for (String crypto in cryptoList) {
      rate = await HttpService.getRates(crypto, selectedCurrency);
      updateUi(crypto, rate);
    }
  }

  void updateUi(String crypto, String rate) {
    setState(() {
      var rateText = Padding(
        padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
        child: Card(
          color: Colors.lightBlueAccent,
          elevation: 5.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
            child: Text(
                '$crypto = $rate',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
          ),
        ),
      );

      rateTexts.add(rateText);
    });
  }


  CupertinoPicker getIOsDropDown() {
    return CupertinoPicker(
      itemExtent: 32.0,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (selectedItemIndex) {
        selectedCurrency = currenciesList[selectedItemIndex];
        getRates();
      },
      children: getCurrencyList(),
    );
  }

  DropdownButton<String> getAndroidDropDown() {
    return DropdownButton<String>(
      value: selectedCurrency,
      items: getCurrencyList(),
      onChanged: (value) {
        setState(() {
          selectedCurrency = value;
          getRates();
        });
      },
    );
  }

  List<DropdownMenuItem<String>> getCurrencyList() {
    List<DropdownMenuItem<String>> currencyList = [];
    for (String s in currenciesList) {
      currencyList.add(
        DropdownMenuItem(
          value: s,
          child: Center(
            child: Text(
              s,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      );
    }

    return currencyList;
  }

  getDropDown() {
    if (Platform.isAndroid) {
      return getAndroidDropDown();
    } else if (Platform.isIOS) {
      return getIOsDropDown();
    }
  }
}
