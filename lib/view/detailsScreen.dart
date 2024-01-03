import 'package:flutter/material.dart';
import 'package:untitled32/model/medicine_model.dart';

import '../service/userService.dart';

class detailScreen extends StatefulWidget {
  // const detailScreen({super.key, required this.MedicineID});
  final String medicineID;
  detailScreen({required this.medicineID});

  @override
  State<detailScreen> createState() => _detailScreenState();
}

class _detailScreenState extends State<detailScreen> {
  int _quantity = 0;
  bool fav = false;
  // final int MedicineID;
  var ff;

  @override
  void initState() {
    super.initState();
    showdetails();
  }

  List<Medicine> medicines = [];
  List<int> medicinesLength = [];
  String? status;

  Future<void> showdetails() async {
    ImpUserService service = ImpUserService();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final medicine = medicines[widget.index];

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 199, 244, 229),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff17A274),
        title: const Text(
          ' medicine.trade_name.toString()',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                // Medicine.isFavorite==true
              });
            },
            icon: Icon(fav ? Icons.favorite : Icons.favorite_border),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: 180,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/SKINCARE_ DER NÄCHSTE SCHRITT _ TRETINOIN (RETIRIDES).jpg'),
                  // Replace with your image asset path
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 400,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'scientific name : ',
                          style: TextStyle(
                              color: Color(0xff17A274),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' medicine.scientific_name.toString()',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'trade name : ',
                          style: TextStyle(
                              color: Color(0xff17A274),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          ' medicine.trade_name.toString()',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    FittedBox(
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'manufacture company : ',
                            style: TextStyle(
                                color: Color(0xff17A274),
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            ' medicine.manufacture_company.toString()',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Expiry date: ',
                          style: TextStyle(
                              color: Color(0xff17A274),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          '  medicine.date',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Price : ',
                          style: TextStyle(
                              color: Color(0xff17A274),
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          'medicine.price',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: Type == '--quantity',
                            onPressed: () {
                              setState(() {
                                if (_quantity > 0) {
                                  _quantity--;
                                }
                              });
                            },
                            mini: true,
                            backgroundColor: const Color(0xff17A274),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Text(
                            '$_quantity',
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xff17A274),
                            onPressed: () {
                              setState(() {
                                _quantity++;
                              });
                            },
                            mini: true,
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color(0xff17A274)),
                        padding: const EdgeInsets.all(10),
                        child: const Text(
                          'add To Cart ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
//
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class detailScreen extends StatefulWidget {
//   const detailScreen({
//     super.key,
//     required this.MedicineID,
//   });

//   final int MedicineID;

//   @override
//   State<detailScreen> createState() => _detailScreenState();
// }

// class _detailScreenState extends State<detailScreen> {
//   int _quantity = 0;
//   bool fav = false;

//   var ff;

//   Future med() async {
//     var response = await http.get(
//         Uri.parse(
//             'http://192.168.1.102:8000/api/medicines/${widget.MedicineID}'),
//         headers: {
//           'Accept': 'application/json',
//         });
//     print(response.body);
//     if (response.statusCode == 200) {
//       ff = jsonDecode(response.body)["data"];
//       return response.body;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var type;
//     return FutureBuilder(
//       future: med(),
//       builder: (context, snapshot) {
//         if (ff == null) {
//           return const Scaffold(
//             body: Center(
//               child: CircularProgressIndicator(),
//             ),
//           );
//         } else {
//           return Scaffold(
//             appBar: AppBar(
//               backgroundColor: const Color(0xff17A274),
//               elevation: 0,
//               title: const Text('medicine'),
//               actions: [
//                 IconButton(
//                   onPressed: () {
//                     setState(() {
//                       fav = !fav;
//                     });
//                   },
//                   icon: Icon(fav ? Icons.favorite : Icons.favorite_border),
//                 )
//               ],
//             ),
//             body: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Image.asset(
//                     'assets/ointment .jpg',
//                     height: 200,
//                     width: double.infinity,
//                     fit: BoxFit.scaleDown,
//                   ),
//                   const SizedBox(
//                     height: 14,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'scientific name : ',
//                           style: TextStyle(
//                               color: Color(0xff17A274),
//                               fontSize: 19,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           ff['scientific_name'],
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'trade name : ',
//                           style: TextStyle(
//                               color: Color(0xff17A274),
//                               fontSize: 19,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           ff['trade_name'],
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'manufacture_company : ',
//                           style: TextStyle(
//                               color: Color(0xff17A274),
//                               fontSize: 19,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           ff['manufacture_company'],
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'expiry_date : ',
//                           style: TextStyle(
//                               color: Color(0xff17A274),
//                               fontSize: 19,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           ff['expiry_date'],
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 12, vertical: 20),
//                     child: Row(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           'price : ',
//                           style: TextStyle(
//                               color: Color(0xff17A274),
//                               fontSize: 19,
//                               fontWeight: FontWeight.w500),
//                         ),
//                         Text(
//                           ff['price'],
//                           style: const TextStyle(
//                               color: Colors.black,
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 50,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       FloatingActionButton(
//                         heroTag: type == '--quantity',
//                         onPressed: () {
//                           setState(() {
//                             if (_quantity > 0) {
//                               _quantity--;
//                             }
//                           });
//                         },
//                         mini: true,
//                         backgroundColor: const Color(0xff17A274),
//                         child: const Icon(Icons.remove),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       Text(
//                         '$_quantity',
//                         style: const TextStyle(fontSize: 30),
//                       ),
//                       const SizedBox(
//                         width: 30,
//                       ),
//                       FloatingActionButton(
//                         backgroundColor: const Color(0xff17A274),
//                         onPressed: () {
//                           setState(() {
//                             _quantity++;
//                           });
//                         },
//                         mini: true,
//                         child: const Icon(Icons.add),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     width: double.maxFinite,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(30),
//                         color: const Color(0xff17A274)),
//                     padding: const EdgeInsets.all(10),
//                     child: const Text(
//                       'add To Cart ',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 18,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
