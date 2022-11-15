import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:myshop/ui/cart/cart_screen.dart';
import 'package:myshop/ui/products/products_manager.dart';
import 'package:provider/provider.dart';

import '../shared/app_drawer.dart';

import '../cart/cart_manager.dart';
import '../products/top_right_badge.dart';

enum FilterOptions { favorites, all }

class IntroduceScreen extends StatefulWidget {
  const IntroduceScreen({super.key});

  @override
  State<IntroduceScreen> createState() => _IntroduceScreenState();
}

class _IntroduceScreenState extends State<IntroduceScreen> {
  final _showOnlyFavorites = ValueNotifier<bool>(false);
  late Future<void> _fetchProducts;

  @override
  void initState() {
    super.initState();
    _fetchProducts = context.read<ProductsManager>().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyFruit'),
        actions: <Widget>[
          buildProductFilterMenu(),
          buildShoppingCartIcon(),
        ],
      ),
      backgroundColor: Colors.lightGreen[100],

      drawer: const AppDrawer(),
      body: ListView(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: const Text(
              'TYTY shop Hello !!!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.0,
                fontFamily: "DancingScript",
                color: Colors.orange,
              ),
            ),
          ),

          CarouselSlider(
            items: [
              //1st Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://noithatmienbac.vn/images/image/kienthuc/bo-tri-he-thong-den-chieu-sang-hop-ly.jpg"),
                    fit: BoxFit.cover,

                  ),

                ),
              ),

              //2nd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://nhadepdecors.com/wp-content/uploads/2022/03/thiet-ke-cua-hang-trai-cay-2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //3rd Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://conbuom.vn/wp-content/uploads/2021/01/mau-thiet-ke-shop-dep7.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //4th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://st1.foodsd.co.il/Images/Products/large/TENeKydcuHqGVM4e.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              //5th Image of Slider
              Container(
                margin: EdgeInsets.all(6.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  image: DecorationImage(
                    image: NetworkImage("https://namphuthai.vn/wp-content/uploads/2017/07/mua-hoa-qua-nhap-khau-cover.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

            ],

            //Slider Container properties
            options: CarouselOptions(
              height: 280.0,
              enlargeCenterPage: true,
              autoPlay: true,
              aspectRatio: 16 / 9,
              autoPlayCurve: Curves.fastOutSlowIn,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              viewportFraction: 0.8,
            ),
          ),

            Padding(
              padding: EdgeInsets.all(8.0),
              child: const Text(
                  "TYTY clean fruit specializes in providing three regions of Vietnam's specialty fruits, which are famous throughout the country."

                      "In addition, TYTY Clean Fruit also provides imported fruits with clear origin from Australia, USA, New Zealand, South Africa..."

                      "Clean Fruit TYTY is committed to providing customers only with high quality products with the most attentive service.",
                style: TextStyle(

                fontWeight: FontWeight.w600,
                fontSize: 20.0,
                fontFamily: "DancingScript",
                color: Colors.black,
              ),
              ),
          ),
        ],
      ),
    );
  }

  Widget buildShoppingCartIcon() {
    return Consumer<CartManager>(
      builder: (ctx, cartManager, child) {
        return TopRightBadge(
          data: cartManager.productCount,
          child: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
            ),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
        );
      },
    );
  }

  Widget buildProductFilterMenu() {
    return PopupMenuButton(
      onSelected: (FilterOptions selectedValue) {
        setState(() {
          if (selectedValue == FilterOptions.favorites) {
            _showOnlyFavorites.value = true;
          } else {
            _showOnlyFavorites.value = false;
          }
        });
      },
      icon: const Icon(
        Icons.more_vert,
      ),
      itemBuilder: (ctx) => [
        const PopupMenuItem(
          value: FilterOptions.favorites,
          child: Text('Only Favorites'),
        ),
        const PopupMenuItem(
          value: FilterOptions.all,
          child: Text('Show All'),
        ),
      ],
    );
  }
}

