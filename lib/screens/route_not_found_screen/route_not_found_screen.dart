import 'package:flutter/material.dart';

class RouteNotFoundScreen extends StatelessWidget {
  void backToHome(BuildContext context) {
    if(Navigator.of(context).canPop())
      Navigator.of(context).popUntil((route) => route.settings.name == "/");
    else
      Navigator.of(context).pushReplacementNamed("/");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Not Found'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Erorr! Route Not found!!',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor:  MaterialStateProperty.all(Theme.of(context).buttonColor),
                ),
                onPressed: () => backToHome(context),
                child: Text('Back to Home'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
