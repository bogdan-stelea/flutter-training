import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class Convertor extends StatefulWidget {
  const Convertor();

  @override
  _ConvertorState createState() => _ConvertorState();
}

class _ConvertorState extends State<Convertor> {
  double _conversionRate = 4.9253;
  double _result = 0;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFormField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,20}'))
            ],
            decoration: InputDecoration(
              labelText: 'Sum in euro',
              icon: Icon(Icons.euro),
            ),
          ),
          if (_result != 0)
            Container(
              margin: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                _result.toStringAsFixed(2) + ' RON',
                style: TextStyle(fontSize: 24),
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = 0;
                    _controller.clear();
                  });
                },
                child: Text('Clear'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = double.parse(_controller.text) * _conversionRate;
                  });
                },
                child: Text('Convert'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
