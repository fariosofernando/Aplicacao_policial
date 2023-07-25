import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'login_screen.dart';

class PresplashScreen extends StatefulWidget {
  const PresplashScreen({super.key});

  @override
  State<PresplashScreen> createState() => _PresplashScreenState();
}

class _PresplashScreenState extends State<PresplashScreen> {
  double _animatedHeight = 200;

  void setAnimation() async {
    await Future.delayed(const Duration(milliseconds: 140));
    setState(() => _animatedHeight = 50);
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    setAnimation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: null,
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/police_picture.jpg",
            height: MediaQuery.sizeOf(context).height,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            color: Colors.black.withOpacity(.2),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "Registro Criminal",
                  style: TextStyle(
                    color: Colors.white.withOpacity(.8),
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Garantindo a segurança através\nda eficácia na gestão de dados",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    // fontSize: 30,
                  ),
                ),
                const SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
                          return const LoginScreen();
                        }), (route) => false);
                      },
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.white,
                            width: 1.5,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ),
                  ],
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                  height: _animatedHeight,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
