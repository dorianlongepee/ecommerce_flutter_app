import 'package:flutter/material.dart';
import 'package:flutter_shop/models/user.dart';

import '../constants.dart';
import '../models/user.api.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  User user = User();
  bool loading = true;

  @override
  void initState() {
    super.initState();
    getUser();
  }

  Future<void> getUser() async {
    user = await UserApi.getUser();
    setState(() {
      loading = false;
    });
    print(user);
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 900) {
              return _buildDesktopLayout();
            } else {
              return _buildMobileLayout();
            }
          });
  }

  Widget _buildDesktopLayout() {
    return SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: ListView(children: [
              Row(
                children: [
                  ColoredBox(
                    color: Theme.of(context).colorScheme.background,
                    child: SizedBox(
                        width: 300,
                        height: 300,
                        child: Image.network(user.image)),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: defaultPadding / 2,
                                horizontal: defaultPadding / 4),
                            child: SizedBox(
                              width: double.infinity,
                              child: Text(
                                'Mon compte',
                                style:
                                    Theme.of(context).textTheme.headlineMedium,
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                          Form(
                              child: Column(
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(defaultPadding / 4),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Prénom",
                                    ),
                                    initialValue: user.firstName,
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(defaultPadding / 4),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Nom",
                                    ),
                                    initialValue: user.lastName,
                                  )),
                              Padding(
                                  padding: EdgeInsets.all(defaultPadding / 4),
                                  child: TextFormField(
                                    decoration: const InputDecoration(
                                      labelText: "Pseudo",
                                    ),
                                    initialValue: user.username,
                                  )),
                            ],
                          ))
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
                    child: Column(children: [
                      Padding(
                          padding: EdgeInsets.all(defaultPadding / 4),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Téléphone",
                            ),
                            initialValue: user.phone,
                          )),
                      Padding(
                          padding: EdgeInsets.all(defaultPadding / 4),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: "Email",
                            ),
                            initialValue: user.email,
                          )),
                    ]),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(defaultPadding / 4),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Adresse",
                              ),
                              initialValue: user.address,
                            )),
                        Padding(
                            padding: EdgeInsets.all(defaultPadding / 4),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Ville",
                              ),
                              initialValue: user.city,
                            )),
                        Padding(
                            padding: EdgeInsets.all(defaultPadding / 4),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                labelText: "Code postal",
                              ),
                              initialValue: user.postalCode,
                            )),
                      ],
                    ),
                  )
                ],
              ))
            ])));
  }

  Widget _buildMobileLayout() {
    return SafeArea(
        child: ListView(children: [
      Center(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: SizedBox(
              width: 300,
              height: 300,
              child: ColoredBox(
                  color: Theme.of(context).colorScheme.background,
                  child: Image.network(user.image))),
        ),
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding / 2),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: defaultPadding / 2,
                    horizontal: defaultPadding / 4),
                child: SizedBox(
                  width: double.infinity,
                  child: Text(
                    'Mon compte',
                    style: Theme.of(context).textTheme.headlineMedium,
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
              Form(
                  child: Column(
                children: [
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Prénom",
                        ),
                        initialValue: user.firstName,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Nom",
                        ),
                        initialValue: user.lastName,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Pseudo",
                        ),
                        initialValue: user.username,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Téléphone",
                        ),
                        initialValue: user.phone,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Email",
                        ),
                        initialValue: user.email,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Adresse",
                        ),
                        initialValue: user.address,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Ville",
                        ),
                        initialValue: user.city,
                      )),
                  Padding(
                      padding: EdgeInsets.all(defaultPadding / 4),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: "Code postal",
                        ),
                        initialValue: user.postalCode,
                      ))
                ],
              ))
            ],
          ),
        ),
      ),
    ]));
  }
}
