import 'package:flutter/material.dart';
import 'package:razorpay_plugin/razorpay_plugin.dart';

void main() {
  runApp(new MaterialApp(
    title: "Payment",
    theme: ThemeData(primaryColor:  Colors.lightBlueAccent,accentColor: Colors.white30),
    home: new Home(),
  ));
}

class Home extends StatelessWidget{
  startPayment() async {
    Map<String, dynamic> options = new Map();
    options.putIfAbsent("name", () => "Register");
    options.putIfAbsent("image", () => "https://www.73lines.com/web/image/12427");
    options.putIfAbsent("description", () => "This is a real transaction");
    options.putIfAbsent("amount", () => "200");
    options.putIfAbsent("email", () => "test.test@gmail.com");
    options.putIfAbsent("contact", () => "9990997865");
    //Must be a valid HTML color.
    options.putIfAbsent("theme", () => "#FF0000");
    options.putIfAbsent("api_key", () => "API_KEY");
    Map<dynamic,dynamic> paymentResponse = new Map();
    paymentResponse = await Razorpay.showPaymentForm(options);
    debugPrint("response $paymentResponse");
  }
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: AppBar(
          title: Text("Payment_method"),
          backgroundColor: Colors.red,
        ),
        body: 
        RaisedButton(
          onPressed: ()=>startPayment(),
          child: Text("Pay"),
          color: Theme.of(context).accentColor,
          elevation: 4.0,
          splashColor: Colors.blueGrey,
        )
      );
    }
}
