import 'package:flutter/material.dart';
import 'package:flutter_shop/views/account_page.dart';
import 'package:flutter_shop/views/cart_page.dart';
import 'package:flutter_shop/views/shop_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Shop',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const FlutterShop(),
      ),
    );
  }
}

class AppState extends ChangeNotifier {}

class FlutterShop extends StatefulWidget {
  const FlutterShop({super.key});

  @override
  State<FlutterShop> createState() => _FlutterShopState();
}

class _FlutterShopState extends State<FlutterShop> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = AccountPage();
        break;
      case 1:
        page = ShopPage();
        break;
      case 2:
        page = CartPage();
        break;
      default:
        throw UnimplementedError('No widget for $selectedIndex');
    }

    return LayoutBuilder(
        builder: (context, constraints) {
          return Scaffold(
            body: Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 1200,
                    destinations: const [
                      NavigationRailDestination(
                        icon: Icon(Icons.account_circle_sharp),
                        label: Text('Account'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.shopping_cart),
                        label: Text('Cart'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    child: page,
                  ),
                ),
              ],
            ),
          );
        }
    );
  }
}