import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:police_app/src/screens/pageview_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  _navigator() => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) {
        return const PageviewScreen();
      }), (route) => false);

  void _login() async {
    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 2));

    setState(() => loading = false);
    _navigator();
  }

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Faça login no\nPoliceapp",
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              "Para se entrar, você precisa confirmar seu codigo policial",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Codigo policial",
                hintStyle: TextStyle(color: Colors.white.withOpacity(.2)),
                filled: true,
                fillColor: const Color.fromARGB(255, 30, 30, 30),
                focusedBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const SizedBox(height: 25),
            loading
                ? SizedBox(
                    height: 48,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: LoadingAnimationWidget.inkDrop(
                            color: Colors.white,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  )
                : FilledButton(
                    onPressed: () => _login(),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Iniciar"),
                      ],
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
