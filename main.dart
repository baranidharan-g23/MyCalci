import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          title: Text(
            'Calculator',
            style: TextStyle(fontSize: 40),
          )),
      body: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.bottomRight,
                child: Text(
                  '$past',
                  style: TextStyle(fontSize: 40, color: Colors.blueGrey),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(4),
                alignment: Alignment.bottomRight,
                child: Text(
                  '$output_val',
                  style: TextStyle(
                    fontSize: 70,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            calcirow('9', '8', '7', '/'),
            calcirow('6', '5', '4', 'x'),
            calcirow('3', '2', '1', '+'),
            calcirow('0', 'C', '-', '=')
          ],
        ),
      ),
    );
  }

  Row calcirow(String a, String b, String c, String d) {
    return Row(
      children: [
        calcibutton(a),
        calcibutton(b),
        calcibutton(c),
        calcibutton(d),
      ],
    );
  }

  Widget calcibutton(String val) => Expanded(
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ElevatedButton(
              onPressed: () {
                buttonclicked(val);
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  val,
                  style: TextStyle(fontSize: 50),
                ),
              )),
        ),
      );
  String res = '', output_val = '', past = '';
  int a = 0, b = 0;
  bool addd = false, subb = false, mult = false, div = false;
  void buttonclicked(String btntext) {
    if (btntext == 'C') {
      past = '';
      res = '';
      output_val = '';
      setState(() {});
    } else if (btntext == '+') {
      addd = true;
      a = int.parse(output_val);
      past = output_val + " + ";
      output_val = '';
      res = '';
      setState(
        () {},
      );
    } else if (btntext == '-') {
      subb = true;
      past = output_val + " - ";
      a = int.parse(output_val);
      output_val = '';
      res = '';
      setState(
        () {},
      );
    } else if (btntext == 'x') {
      mult = true;
      past = output_val + ' x ';
      a = int.parse(output_val);
      output_val = '';
      res = '';
      setState(
        () {},
      );
    } else if (btntext == '/') {
      div = true;
      past = output_val + ' / ';
      a = int.parse(output_val);
      output_val = '';
      res = '';
      setState(
        () {},
      );
    } else if (btntext == '=') {
      b = int.parse(output_val);
      output_val = '';
      res = '';
      if (addd == true) {
        past = "$a + $b";
        res = "${a + b}";
        addd = false;
        setState(() {
          output_val = res;
        });
      } else if (subb == true) {
        past = "$a - $b";
        res = "${a - b}";
        subb = false;
        setState(() {
          output_val = res;
        });
      } else if (mult == true) {
        past = "$a x $b";
        res = "${a * b}";
        mult = false;
        setState(() {
          output_val = res;
        });
      } else if (div == true) {
        past = "$a / $b";
        res = "${a / b}";
        div = false;
        setState(() {
          output_val = res;
        });
      }
    } else {
      print(btntext);
      res = '';
      res = output_val + btntext;
      print('res ' + res);
      setState(() {
        output_val = res;
      });
    }
  }
}
