import 'package:flutter/material.dart';

class RegisterIndividualScreenWidget extends StatefulWidget {
  const RegisterIndividualScreenWidget({super.key});

  @override
  State<RegisterIndividualScreenWidget> createState() => _RegisterIndividualScreenWidgetState();
}

class _RegisterIndividualScreenWidgetState extends State<RegisterIndividualScreenWidget> {
  String? dropdownValue;

  final List<String> provinces = [
    "Niassa",
    "Cabo Delgado",
    "Nampula",
    "Zambezia",
    "Tete",
    "Manica",
    "Sofala",
    "Gaza",
    "Inhambane",
    "Maputo Província",
    "Maputo Cidade",
  ];

  DateTime? dateTime;
  DateTime dateTimeNow = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900, 1),
      lastDate: dateTimeNow,
      confirmText: "Concluido",
      cancelText: "Cancelar",
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark().copyWith(
            colorScheme: const ColorScheme.dark(
              primary: Colors.blue,
              onPrimary: Color.fromARGB(255, 30, 30, 30),
              surface: Color.fromARGB(255, 30, 30, 30),
              onSurface: Colors.white,
            ),
            dialogBackgroundColor: const Color.fromARGB(255, 30, 30, 30),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) setState(() => dateTime = picked);
    ;
  }

  PageController _controller = PageController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.2),
                borderRadius: BorderRadius.circular(5),
              ),
              child: const Icon(
                Icons.chevron_left_rounded,
                color: Colors.white,
              ),
            ),
          ),
        ),
        title: Text("Cadastrar"),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: PageView(
          controller: _controller,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 25),
                        CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(.2),
                          radius: 50,
                          child: const Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 15),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Nome completo",
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
                        const SizedBox(height: 10),
                        InkWell(
                          borderRadius: BorderRadius.circular(5),
                          onTap: () {
                            _selectDate(context);
                          },
                          child: Container(
                            height: 45,
                            width: MediaQuery.sizeOf(context).width,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 30, 30, 30),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(dateTime != null ? "${dateTime!.year}/${dateTime!.month}/${dateTime!.day}" : "Data de nascimento", style: TextStyle(color: dateTime != null ? Colors.white : Colors.white.withOpacity(.2))),
                                Icon(Icons.calendar_today, color: dateTime != null ? Colors.white : Colors.white.withOpacity(.2)),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: MediaQuery.sizeOf(context).width,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 30, 30, 30),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: const Color.fromARGB(255, 30, 30, 30),
                              icon: Icon(Icons.home_work_rounded, color: dropdownValue != null ? Colors.white : null),
                              style: const TextStyle(color: Colors.white),
                              value: dropdownValue,
                              hint: Text(
                                "Província",
                                style: TextStyle(
                                  color: Colors.white.withOpacity(.2),
                                  fontSize: 14,
                                ),
                              ),
                              items: provinces.map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.add_home,
                              color: Colors.white.withOpacity(.2),
                            ),
                            contentPadding: const EdgeInsets.only(top: 15, left: 12),
                            hintText: "Cidade/Distrito",
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
                        const SizedBox(height: 10),
                        TextField(
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Residência (Atual e anterior)",
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
                        const SizedBox(height: 10),
                        FilledButton(
                          onPressed: () {
                            _controller.animateToPage(1, curve: Curves.ease, duration: const Duration(milliseconds: 140));

                            setState(() {});
                          },
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<OutlinedBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Continuar"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Para finalizar o processo de cadastro\nanexe fotografias.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Icon(Icons.add_a_photo_rounded, color: Colors.white),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: FilledButton(
                      onPressed: () {
                        Navigator.pop(context);
                        // ScaffoldMessenger.of(context).showSnackBar(
                        //   SnackBar(
                        //     content: Text("Cadastro realizado com sucesso."),
                        //   ),
                        // );
                      },
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<OutlinedBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Finalizar cadastro"),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
