import 'package:flutter/material.dart';
import 'package:ola_mundo/controller/app_controller.dart';
import 'package:ola_mundo/pages/widgets/floating_action_button_widget.dart';

class HomePage extends StatefulWidget {
  final String title;

  HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;
  bool _isSwitched = false;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    if (_counter == 0) {
      _showDialog();
    } else {
      setState(() {
        _counter--;
      });
    }
  }

  void _refreshCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'Continuar?',
        ),
        content: Text(
          'Deseja continuar com número negativo?',
        ),
        actions: [
          FlatButton(
            child: Text('Não'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          FlatButton(
            child: Text('Sim'),
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                _counter--;
              });
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        actions: [
          Switch(
            value: AppController.instance.isDarkTheme,
            onChanged: (value) {
              AppController.instance.changeTheme();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          // Image.asset(
          //   'assets/images/bg.jpg',
          //   fit: BoxFit.cover,
          //   height: 1000.0,
          //   width: 1000.0,
          // ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Pressione para incrementar ou decrementar os valores',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.057,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '$_counter',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.15,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FloatingActionButtonWidget(
                    onPressed: _incrementCounter,
                    child: Icon(Icons.add),
                    // backgroundColor: Colors.blue,
                  ),
                  FloatingActionButtonWidget(
                    onPressed: _decrementCounter,
                    child: Icon(Icons.remove),
                    backgroundColor: Colors.red[400],
                  ),
                  FloatingActionButtonWidget(
                    onPressed: _refreshCounter,
                    child: Icon(Icons.refresh),
                    backgroundColor: Colors.green,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
