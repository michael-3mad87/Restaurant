import 'package:flutter/material.dart';
import 'package:food/animations/FadeAnimation.dart';
import 'package:food/pages/HomePage.dart';

class StarterPage extends StatefulWidget {
  static final String id = 'StarterPage';
  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  bool _textVisible = true;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _animation =
        Tween<double>(begin: 1.0, end: 35.0).animate(_animationController);

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  void _onTap() {
    setState(() {
      _textVisible = false;
    });

    _animationController.forward().then((value) => Navigator.pushNamed(
        context,'HomePage'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            color: Colors.black,
            image: DecorationImage(
                image: AssetImage('assets/images/starter-image.jpg'),
                fit: BoxFit.cover)),
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.8),
            Colors.black.withOpacity(.2),
          ])),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FadeAnimation(
                    delay: .5,
                    child: Text(
                      'Pizza and \nPasta',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold),
                    )),
                SizedBox(
                  height: 20,
                ),
                FadeAnimation(
                    delay: 1,
                    child: Text(
                      "Presented with all love and cooperation",
                      style: TextStyle(
                          color: Colors.white, height: 1.4, fontSize: 18),
                    )),
                SizedBox(
                  height: 100,
                ),
                FadeAnimation(
                  delay: 1.2,
                  child: ScaleTransition(
                      scale: _animation,
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(
                                  colors: [Colors.yellow, Colors.orange])),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),
                            child: MaterialButton(
                              onPressed: () => _onTap(),
                              minWidth: double.infinity,
                              child: Text(
                                "Start",
                                style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold, fontSize: 22),
                              ),
                            ),
                          ))),
                ),
                SizedBox(
                  height: 30,
                ),
                FadeAnimation(
                    delay: 1.4,
                    child: AnimatedOpacity(
                      opacity: _textVisible ? 1.0 : 0.0,
                      duration: Duration(milliseconds: 50),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Now go to menu ",
                          style: TextStyle(color: Colors.white70, fontSize: 15),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
