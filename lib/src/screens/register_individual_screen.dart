import 'package:flutter/material.dart';

import '../components/tile_button_widget.dart';
import '../route_handler.dart';

class RegisterIndividualScreen extends StatelessWidget {
  const RegisterIndividualScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          TileButton(
            onPressed: () {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, NamedRoute.register);
              });
            },
            iconTile: Icons.person_add_rounded,
            titleTile: "Cadastro",
            subtitleTile: "Cadastre indivíduos",
          ),
          const SizedBox(height: 10),
          TileButton(
            onPressed: () {},
            iconTile: Icons.description_rounded,
            titleTile: "Exportar",
            subtitleTile: "Exportar documento",
          ),
        ],
      ),
    );
  }
}
