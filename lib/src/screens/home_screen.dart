import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../route_handler.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool loading = false;

  bool visible = false;

  _search(String value) async {
    setState(() => loading = true);

    await Future.delayed(const Duration(seconds: 3));
    visible = true;
    setState(() => loading = false);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextField(
            style: const TextStyle(color: Colors.white),
            onSubmitted: (value) {
              _search(value);
            },
            decoration: InputDecoration(
              hintText: "Nome ou BI",
              hintStyle: TextStyle(color: Colors.white.withOpacity(.6)),
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
          const SizedBox(height: 15),
          Container(
            height: 100,
            padding: const EdgeInsets.all(8),
            width: MediaQuery.sizeOf(context).width,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 30, 30, 30),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Ativar função de backup automatico", style: TextStyle(color: Colors.blueAccent)),
                    const SizedBox(height: 10),
                    Text(
                      "Automatize o processo\nde backup de seus dados.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Image.asset(
                  "assets/document_art.png",
                  height: 150,
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          if (loading)
            SizedBox(
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
          else
            !visible
                ? const SizedBox()
                : InkWell(
                    borderRadius: BorderRadius.circular(5),
                    onTap: () {
                      Navigator.pushNamed(context, NamedRoute.background);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.sizeOf(context).width,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 30, 30, 30),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 24,
                                backgroundColor: Colors.transparent,
                                backgroundImage: AssetImage("assets/user_photo_profile.png"),
                              ),
                              const SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Ruth G. Gersy", style: TextStyle(color: Colors.white, fontSize: 16)),
                                  Text("110100006601B", style: TextStyle(color: Colors.white.withOpacity(.8), fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ],
                          ),
                          Icon(Icons.search_rounded, color: Colors.blueAccent),
                        ],
                      ),
                    ),
                  ),
        ],
      ),
    );
  }
}
