import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double _enteredAmount;
  String _toCurrency;
  double _convertedAmount;

  final List<String> _currency = [
    'USD',
    'GEL',
    'EUR',
  ];

  @override
  void initState() {
    super.initState();
    _enteredAmount = 0;
    _convertedAmount = 0;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Money Converter",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Money Converter"),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    InputDecoration(hintText: "Please enter the amount."),
                onChanged: (text) {
                  setState(() {
                    var amount = double.tryParse(text);
                    if (amount != null) {
                      _enteredAmount = amount;
                    }
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('To:'),
                  DropdownButton(
                    value: _toCurrency,
                    items: _currency
                        .map((currencyS) => DropdownMenuItem<String>(
                            value: currencyS, child: Text(currencyS)))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        _toCurrency = value;
                      });
                    },
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    return _convertedAmount = convertTo(_enteredAmount, _toCurrency);
                  });
                },
                child: Text('Convert'),
              ),
              Text("Converted amount is $_convertedAmount")
            ],
          ),
        ),
      ),
    );
  }

  double convertTo(double amount, String chosenCurrency) {
    if (chosenCurrency == null) {
      return amount;
    }

    if (chosenCurrency == "USD") {
      double converted = amount * 0.30;
      return converted;
    }

    if (chosenCurrency == "EUR") {
      double convertedEur = amount * 0.25;
      return convertedEur;
    }

    if (chosenCurrency == "GEL") {
      return amount;
    }

    return amount;

  }
}
