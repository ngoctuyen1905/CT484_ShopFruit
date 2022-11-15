import 'package:flutter/material.dart';
import 'auth_card.dart';
import 'app_banner.dart';

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  const AuthScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              //   gradient: LinearGradient(
              //   colors: [
              //     const Color.fromRGBO(215, 117, 255, 1).withOpacity(0.5),
              //     const Color.fromRGBO(255, 188, 117, 1).withOpacity(0.9),
              //   ],
              //   begin: Alignment.topLeft,
              //   end: Alignment.bottomRight,
              //   stops: const [0, 1],
              // ),
              image: DecorationImage(
                  image: NetworkImage("https://png.pngtree.com/thumb_back/fw800/back_our/20190620/ourmid/pngtree-blue-sleek-minimalist-summer-fruit-drink-poster-background-image_150327.jpg"),
                  fit: BoxFit.cover),
            ),
            ),
          SingleChildScrollView(
            child: SizedBox(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Flexible(
                    child: AppBanner(),
                  ),
                  Flexible(
                    flex: deviceSize.width > 600 ? 2 : 1,
                    child: const AuthCard(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
