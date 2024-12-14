import 'package:app/view/home/product_details_view.dart';
import 'package:flutter/material.dart';
import '../../common/color_extension.dart';
import '../../model/cart.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController txtSearch = TextEditingController();

  List prodCategArr = [
    {
      "name": "Meat",
      "icon": "assets/img/meat_fish.png",
      "color": const Color(0xff53B175),
      "page": MeatScreen(),
    },
    {
      "name": "Fruits & Vegetables",
      "icon": "assets/img/fresh_fruits.png",
      "color": const Color(0xffF8A44C),
      "page": FruitsVegetablesScreen(),
    },
    {
      "name": "Cooking Oil & Ghee",
      "icon": "assets/img/cooking_oil.png",
      "color": const Color(0xffF7A593),
      "page": CookingOilScreen(),
    },
    {
      "name": "Beverages",
      "icon": "assets/img/beverages.png",
      "color": const Color(0xffD3B0E0),
      "page": BeveragesScreen(),
    },
    {
      "name": "Chips",
      "icon": "assets/img/Chips.png",
      "color": const Color(0xFFFDE598),
      "page": ChipsScreen(),
    },
    {
      "name": "Dairy & Eggs",
      "icon": "assets/img/dairy_eggs.png",
      "color": const Color(0xffB7DFF5),
      "page": DairyEggsScreen(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Find Products",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: const Color(0xffF2F3F2),
                  borderRadius: BorderRadius.circular(15)),
              alignment: Alignment.center,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Image.asset(
                      "assets/img/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                  const Text(
                    "Explore Mart",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          // GridView to display product categories
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 1,
              ),
              itemCount: prodCategArr.length,
              itemBuilder: (context, index) {
                final category = prodCategArr[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => category['page'],
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: category['color'],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          category['icon'],
                          width: 80,
                          height: 80,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          category['name'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Individual Screens for Categories
class MeatScreen extends StatefulWidget {
  const MeatScreen({super.key});

  @override
  State<MeatScreen> createState() => _MeatScreenState();
}

class _MeatScreenState extends State<MeatScreen> {
  List<Map<String, dynamic>> meatArr = [
    {
      "name": "Beef",
      "icon": "assets/img/beef_bone.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 1500"
    },
    {
      "name": "Chicken",
      "icon": "assets/img/broiler_chicken.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 800"
    },
    {
      "name": "Fish",
      "icon": "assets/img/meat_fish.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 2000"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: meatArr.length,
            itemBuilder: (context, index) {
              var sObj = meatArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class FruitsVegetablesScreen extends StatefulWidget {
  const FruitsVegetablesScreen({super.key});

  @override
  State<FruitsVegetablesScreen> createState() => _FruitsVegetablesScreenState();
}

class _FruitsVegetablesScreenState extends State<FruitsVegetablesScreen> {
  List<Map<String, dynamic>> fjArr = [
    {
      "name": "Carrots",
      "icon": "assets/img/carrot.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 30"
    },
    {
      "name": "Apple",
      "icon": "assets/img/apple.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 10"
    },
    {
      "name": "Banana",
      "icon": "assets/img/banana.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 15"
    },
    {
      "name": "Cauliflower",
      "icon": "assets/img/cauli.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: fjArr.length,
            itemBuilder: (context, index) {
              var sObj = fjArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class CookingOilScreen extends StatefulWidget {
  const CookingOilScreen({super.key});

  @override
  State<CookingOilScreen> createState() => _CookingOilScreenState();
}

class _CookingOilScreenState extends State<CookingOilScreen> {
  List<Map<String, dynamic>> oilArr = [
    {
      "name": "Dalda",
      "icon": "assets/img/dalda.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 900"
    },
    {
      "name": "Sufi",
      "icon": "assets/img/sufi.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 700"
    },
    {
      "name": "Kisaan",
      "icon": "assets/img/kisan.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 600"
    },
    {
      "name": "Soya Supreme",
      "icon": "assets/img/soya.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 800"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: oilArr.length,
            itemBuilder: (context, index) {
              var sObj = oilArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class BeveragesScreen extends StatefulWidget {
  const BeveragesScreen({super.key});

  @override
  State<BeveragesScreen> createState() => _BeveragesScreenState();
}

class _BeveragesScreenState extends State<BeveragesScreen> {
  List<Map<String, dynamic>> bevArr = [
    {
      "name": "Pepsi",
      "icon": "assets/img/pepsi_can.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 110"
    },
    {
      "name": "Sprite",
      "icon": "assets/img/sprite_can.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 100"
    },
    {
      "name": "CocaCola",
      "icon": "assets/img/cocacola_can.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 110"
    },
    {
      "name": "Dew",
      "icon": "assets/img/dew.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 110"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: bevArr.length,
            itemBuilder: (context, index) {
              var sObj = bevArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class ChipsScreen extends StatefulWidget {
  const ChipsScreen({super.key});

  @override
  State<ChipsScreen> createState() => _ChipsScreenState();
}

class _ChipsScreenState extends State<ChipsScreen> {
  List<Map<String, dynamic>> chipsArr = [
    {
      "name": "Lays",
      "icon": "assets/img/lays.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 70"
    },
    {
      "name": "Cheetos",
      "icon": "assets/img/cheetos.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 100"
    },
    {
      "name": "Wavy",
      "icon": "assets/img/wavy.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 60"
    },
    {
      "name": "Chipsino",
      "icon": "assets/img/chipsino.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 50"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: chipsArr.length,
            itemBuilder: (context, index) {
              var sObj = chipsArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DairyEggsScreen extends StatefulWidget {
  const DairyEggsScreen({super.key});

  @override
  State<DairyEggsScreen> createState() => _DairyEggsScreenState();
}

class _DairyEggsScreenState extends State<DairyEggsScreen> {
  List<Map<String, dynamic>> eggsArr = [
    {
      "name": "QuickMart Special Eggs",
      "icon": "assets/img/egg_chicken_white.png",
      "qty": "1",
      "unit": "kg Prices",
      "price": "Rs 300"
    },
    {
      "name": "Organic Eggs",
      "icon": "assets/img/egg_chicken_red.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 500"
    },
    {
      "name": "Pasta",
      "icon": "assets/img/egg_pasta.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 250"
    },
    {
      "name": "Baking Items",
      "icon": "assets/img/bakery_snacks.png",
      "qty": "250",
      "unit": "gm Prices",
      "price": "Rs 150"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(
            "assets/img/back.png",
            width: 24,
            height: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: TColor.button,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.75,
            ),
            itemCount: eggsArr.length,
            itemBuilder: (context, index) {
              var sObj = eggsArr[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ProductDetailsView(item: sObj),
                    ),
                  );
                },
                child: Card(
                  elevation: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            sObj['icon'],
                            width: 100,
                            height: 80,
                            fit: BoxFit.contain,
                          ),
                        ],
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['name'],
                          style: TextStyle(
                              color: TColor.primaryText,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "${sObj["qty"]}${sObj["unit"]}",
                          style: TextStyle(
                            color: TColor.secondaryText,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          sObj['price'],
                          style: TextStyle(
                            color: TColor.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
