import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled32/view/login.dart';
import 'package:untitled32/view/medicine_screen.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
              itemBuilder: (_) => [
                    PopupMenuItem(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text("logout"), Icon(Icons.output_rounded)],
                      ),
                      onTap: () {
                        GetStorage().remove('token');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ])
        ],
        title: Text(
          "Categories",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff17A274),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 1,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/capsules.jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "capsules\n medicine",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 2,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/All Your Preventative Botox Questions, Answered.jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "injictable\n medicine",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 3,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/eye drop1.jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "drops solution",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 4,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage(
                                    'assets/SKINCARE_ DER NÄCHSTE SCHRITT _ TRETINOIN (RETIRIDES).jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "ointment \nmedicine",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 5,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/syrup medicans.jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "   syrup \n medicans",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return const MedicineScreen(
                                categoryID: 6,
                              );
                            },
                          ),
                        );
                      },
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blueGrey,
                        ),
                        child: Stack(alignment: Alignment.center, children: [
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/natural herbs.jpg'),
                                // Replace with your image asset path
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: 130,
                            height: 130,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: const Color.fromARGB(141, 81, 81, 81)),
                          ),
                          const Center(
                            child: Text(
                              "natural\n herbs",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 255, 255)),
                            ),
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Text(
            "My cart",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: const Color(0xff17A274)),
      body: Column(
        children: [
          SizedBox(
            height: 450,
            width: 350,
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 199, 244, 229),
                          borderRadius: BorderRadius.circular(16)),
                      height: 100,
                      width: 300,
                      child: const ListTile(
                        title: Text(
                          "Trade Name",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        leading: CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 28, 191, 137),
                          radius: 25,
                          child: Text(
                            "Id",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("manufacture"),
                        ),
                        trailing: Text(
                          "20-1-2023",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 92, 91, 91)),
                        ),
                      ),
                    ),
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 250,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 28, 191, 137),
                    borderRadius: BorderRadius.circular(16)),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "End order  ",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Icon(
                      Icons.shopping_cart_checkout,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class favorite extends StatefulWidget {
  const favorite({super.key});

  @override
  State<favorite> createState() => _favoriteState();
}

class _favoriteState extends State<favorite> {
  bool isPressed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My favorite",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff17A274),
      ),
      body: Expanded(
        child: ListView.builder(
            itemCount: 10,
            itemBuilder: (BuildContext context, index) {
              return Padding(
                padding: const EdgeInsets.all(5),
                child: Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 199, 244, 229),
                      borderRadius: BorderRadius.circular(16)),
                  height: 100,
                  width: 290,
                  child: ListTile(
                      title: Text(
                        "Trade Name",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 28, 191, 137),
                        radius: 25,
                        child: Text(
                          "Id",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("manufacture"),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          //   setState(() {
                          //     isPressed = !isPressed;
                          //   });
                        },
                        icon:
                            //  isPressed == true
                            //     ? const Icon(Icons.favorite_border)
                            //     : const
                            Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      )),
                ),
              );
            }),
      ),
    );
  }
}
