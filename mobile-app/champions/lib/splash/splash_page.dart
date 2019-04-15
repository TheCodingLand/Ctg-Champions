import 'package:flutter/material.dart';


class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        
        child:Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/img.png'),
                      ),
            
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: Container(
                                child: Image.asset('assets/logo/ctg.png')
                            ),
                            radius: 100,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                          ),
                          
                        ],
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[

                      CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.teal),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                      ),
                      Text('loading')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
