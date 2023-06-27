import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/input_component.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  String _firstName = '';
  String _lastName = '';
  String _pseudo = '';

  String _phone = '';
  String _email = '';

  String _address = '';
  String _city = '';
  String _zipCode = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ListView(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 300,
                        height: 300,
                        child: Placeholder()
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(defaultPadding),
                          child: Column(
                            children : [
                              Padding(
                                padding: EdgeInsets.symmetric(vertical: defaultPadding/2, horizontal: defaultPadding/4),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Text('Mon compte',
                                      style: Theme.of(context).textTheme.headlineMedium,
                                      textAlign: TextAlign.start,
                                  ),
                                ),
                              ),
                              Form(
                                child: Column(
                                  children: [
                                    InputComponent(label: 'Prénom', stringSetter: (value) => _firstName = value),
                                    InputComponent(label: 'Nom', stringSetter: (value) => _lastName = value),
                                    InputComponent(label: 'Pseudo', stringSetter: (value) => _pseudo = value),
                                  ],
                                )
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                Form(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            InputComponent(label: "Téléphone", stringSetter: (value) => _phone = value),
                            InputComponent(label: "Email", stringSetter: (value) => _email = value),
                          ]
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            InputComponent(label: "Adresse", stringSetter: (value) => _address = value),
                            InputComponent(label: "Ville", stringSetter: (value) => _city = value),
                            InputComponent(label: "Code postal", stringSetter: (value) => _zipCode = value),
                          ],
                        ),
                      )
                    ],
                  )
                )
              ]
            )
        )
    );
  }
}