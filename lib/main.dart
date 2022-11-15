import 'package:flutter/material.dart';
import 'home.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:myshop/ui/screens.dart';
import 'package:provider/provider.dart';
/* import 'package:myshop/ui/products/product_overview_screen.dart';
import 'package:myshop/ui/products/user_products_screen.dart';
import './ui/products/product_detail_screen.dart';
import './ui/products/products_manager.dart';
import 'ui/cart/cart_screen.dart';
import 'ui/orders/orders_screen.dart'; */

import 'ui/screens.dart';

Future<void> main() async {
  // (1) Load the .env file
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override

  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        // (2) Create and provide AuthManager(),
        ChangeNotifierProvider(create: (context) => AuthManager()),

        ChangeNotifierProxyProvider<AuthManager, ProductsManager>(
          create: (ctx) => ProductsManager(),
          update: (ctx, authManager, productsManager) {
            // khi authManager co bao hieu thay doi thi doc lai authToken cho productManager
            productsManager!.authToken = authManager.authToken;
            return productsManager;
          },
        ),

        ChangeNotifierProvider(
          create: (ctx) => CartManager(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => OrdersManager(),
        )
      ],
      child: Consumer<AuthManager>(
        builder: (ctx, authManager, child) {
          return MaterialApp(
            title: 'My Fruit',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Lato',
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.lightGreen,
              ).copyWith(
                secondary: Colors.deepOrange,
              ),
            ),
            home: authManager.isAuth
                ? const Home()
                : FutureBuilder(
                    future: authManager.tryAutoLogin(),
                    builder: (ctx, snapshot) {
                      return snapshot.connectionState == ConnectionState.waiting
                          ? const SplashScreen()
                          : const AuthScreen();
                    },
                  ),
            routes: {
              CartScreen.routeName: (ctx) => const CartScreen(),
              OrdersScreen.routeName: (ctx) => const OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => const UserProductsScreen(),
            },
            onGenerateRoute: (settings) {
              if (settings.name == ProductDetailScreen.routeName) {
                final productId = settings.arguments as String;
                return MaterialPageRoute(builder: (ctx) {
                  return ProductDetailScreen(
                    ctx.read<ProductsManager>().findById(productId),
                  );
                });
              }

              if (settings.name == EditProductScreen.routeName) {
                final productId = settings.arguments as String?;
                return MaterialPageRoute(
                  builder: (ctx) {
                    return EditProductScreen(
                      productId != null
                          ? ctx.read<ProductsManager>().findById(productId)
                          : null,
                    );
                  },
                );
              }
              return null;
            },
          );
        },
      ),
    );
  }
}
