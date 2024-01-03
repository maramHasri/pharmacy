import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:untitled32/model/medicine_model.dart';
import 'package:untitled32/view/detailsScreen.dart';
import 'package:untitled32/view/login.dart';
import 'package:untitled32/view/search_medicine.dart';

import '../service/userService.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key, required this.categoryID}) : super(key: key);

  final int categoryID;

  @override
  _MedicineScreenState createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  var jsonList;

  @override
  void initState() {
    super.initState();
    getMedicine();
  }

  List<Medicine> medicines = [];
  List<int> medicinesLength = [];
  String? status;

  Future<void> getMedicine() async {
    ImpUserService service = ImpUserService();
    final value = await service.getCategoryMedicines(widget.categoryID);
    setState(() {
      medicines = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Medicines",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff17A274),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return searchScreen();
                })));
              },
              icon: Icon(Icons.search))
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: medicines.length,
        itemBuilder: (BuildContext context, int index) {
          final medicine = medicines[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: ((context) {
                  return detailScreen(medicineID: medicine.id);
                })));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 199, 244, 229),
                  borderRadius: BorderRadius.circular(16),
                ),
                height: 120,
                width: 300,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor:
                                  const Color.fromARGB(255, 28, 191, 137),
                              radius: 18,
                              child: Text(
                                medicine.id,
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              medicine.trade_name,
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          medicine.manufacture_company,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        medicine.date,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color.fromARGB(255, 123, 122, 122),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  medicine.isFavorite = !medicine.isFavorite;
                                });
                              },
                              icon: Icon(
                                  medicine.isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color:
                                      medicine.isFavorite ? Colors.red : null,
                                  size: 30),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:untitled32/model/medicine_model.dart';
// import 'package:untitled32/view/detailsScreen.dart';
// import 'package:untitled32/view/login.dart';

// import '../service/userService.dart';

// class MedicineScreen extends StatefulWidget {
//   const MedicineScreen({Key? key, required this.categoryID}) : super(key: key);

//   final int categoryID;

//   @override
//   _MedicineScreenState createState() => _MedicineScreenState();
// }

// class _MedicineScreenState extends State<MedicineScreen> {
//   var jsonList;

//   @override
//   void initState() {
//     super.initState();
//     getMedicine();
//   }

//   List<Medicine> medicines = [];
//   List<int> medicinesLength = [];
//   String? status;

//   Future<void> getMedicine() async {
//     ImpUserService service = ImpUserService();
//     final value = await service.getCategoryMedicines(widget.categoryID);
//     setState(() {
//       medicines = value;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           "Medicines",
//           style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//         ),
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: const Color(0xff17A274),
//         leading: IconButton(onPressed: () {}, icon: Icon(Icons.search)),
//       ),
//       body: GridView.builder(
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//         ),
//         itemCount: medicines.length,
//         itemBuilder: (BuildContext context, int index) {
//           final medicine = medicines[index];
//           return Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: InkWell(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) {
//                       return detailScreen();
//                     },
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 199, 244, 229),
//                   borderRadius: BorderRadius.circular(16),
//                 ),
//                 height: 120,
//                 width: 300,
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: CircleAvatar(
//                               backgroundColor:
//                                   const Color.fromARGB(255, 28, 191, 137),
//                               radius: 18,
//                               child: Text(
//                                 medicine.id,
//                                 style: const TextStyle(color: Colors.white),
//                               ),
//                             ),
//                           ),
//                           Expanded(
//                             child: Text(
//                               medicine.trade_name,
//                               style: const TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.w700,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(4),
//                         child: Text(
//                           medicine.manufacture_company,
//                           style: const TextStyle(fontWeight: FontWeight.w500),
//                         ),
//                       ),
//                       Text(
//                         medicine.date,
//                         style: const TextStyle(
//                           fontSize: 14,
//                           color: Color.fromARGB(255, 123, 122, 122),
//                         ),
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               setState(() {
//                                 medicine.isFavorite = !medicine.isFavorite;
//                               });
//                             },
//                             icon: Icon(
//                                 medicine.isFavorite
//                                     ? Icons.favorite
//                                     : Icons.favorite_border,
//                                 color: medicine.isFavorite ? Colors.red : null,
//                                 size: 30),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:convert';

// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:untitled32/model/medicine_model.dart';

// import '../service/userService.dart';

// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:untitled32/bloc/bloc/medicine_bloc.dart';
// // import 'package:untitled32/bloc/login_bloc.dart';
// // import 'package:untitled32/model/medicine_model.dart';
// class MedicineScreen extends StatefulWidget {
//   const MedicineScreen({super.key, required this.categoryID});

//   final int categoryID;

//   @override
//   State<MedicineScreen> createState() => _MedicineScreenState();
// }

// class _MedicineScreenState extends State<MedicineScreen> {
//   var jsonList;

//   @override
//   initState() {
//     super.initState();
//     getMedicine();
//   }

//   List<Medicine> Medicines = [];
//   List<int> MedicinesLength = [];
//   String? Status;

//   Future getMedicine() async {
//     // try {
//     //   var response = await Dio()
//     //       .get("https://657c6cc2853beeefdb996ca5.mockapi.io/Medicine");
//     //   if (response.statusCode == 200) {
//     //     print(response.data[2]);
//     //
//     //     setState(() {
//     //       List<Medicine> jsonList = jsonDecode(response.data);
//     //       Medicines.addAll(jsonList);
//     //       print(Medicines);
//     //     });
//     //   } else {
//     //     return "we do not get data ";
//     //   }
//     // } catch (e) {
//     //   print(e);
//     // }
//     ImpUserService service = ImpUserService();
//     service.getCategoryMedicines(widget.categoryID).then((value) {
//       Medicines = value;
//       setState(() {});
//     });
//   }

//   bool isPressed = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Medicines ",
//             style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white),
//           ),
//           iconTheme: IconThemeData(color: Colors.white),
//           backgroundColor: const Color(0xff17A274),
//         ),
//         body: GridView.builder(
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2),
//             itemCount: Medicines.length,
//             itemBuilder: (BuildContext context, index) {
//               return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: InkWell(
//                   child: Container(
//                       decoration: BoxDecoration(
//                           color: Color.fromARGB(255, 199, 244, 229),
//                           borderRadius: BorderRadius.circular(16)),
//                       height: 120,
//                       width: 300,
//                       child: Column(
//                         children: [
//                           Row(
//                             children: [
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: CircleAvatar(
//                                   backgroundColor:
//                                       Color.fromARGB(255, 28, 191, 137),
//                                   radius: 18,
//                                   child: Text(
//                                     Medicines[index].id,
//                                     style: TextStyle(color: Colors.white),
//                                   ),
//                                 ),
//                               ),
//                               Expanded(
//                                 child: Text(
//                                   Medicines[index].trade_name,
//                                   style: TextStyle(
//                                       fontSize: 15,
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           Padding(
//                             padding: EdgeInsets.all(4),
//                             child: Text(
//                               Medicines[index].manufacture_company,
//                               style: TextStyle(fontWeight: FontWeight.w500),
//                             ),
//                           ),
//                           Text(
//                             Medicines[index].date,
//                             style: TextStyle(
//                                 fontSize: 14,
//                                 color: Color.fromARGB(255, 123, 122, 122)),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       isPressed = !isPressed;
//                                     });
//                                   },
//                                   icon: isPressed == true
//                                       ? const Icon(Icons.favorite_border)
//                                       : const Icon(
//                                           Icons.favorite,
//                                           color: Colors.red,
//                                         ),
//                                 )
//                               ],
//                             ),
//                           )
//                         ],
//                       )),
//                 ),
//               );
//             }));
//   }
// }

// ////////////////////////////////////////////////////////

// // return Scaffold(
// //   body: Column(
// //     children: [
// //       CustomScrollView(
// //         slivers: <Widget>[
// //           SliverAppBar(
// //             backgroundColor: const Color(0xff17A274),
// //             pinned: true,
// //             floating: true,
// //             actions: [
// //               IconButton(
// //                   onPressed: () {
// //                     showSearch(
// //                         context: context, delegate: customDelgate());
// //                   },
// //                   icon: const Padding(
// //                     padding: EdgeInsets.only(right: 20),
// //                     child: Icon(Icons.search),
// //                   )),
// //             ],
// //           )])]));
// //                 // SliverList(
// //                 //     delegate: SliverChildBuilderDelegate((context, index) => ListTile(
// //                 //           title: Text("Item${1 + index}"),
// //                 //         )))
// //               ],
// //             ),
// //             Column(
// //               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //               children: [
// //                 BlocBuilder<MedicineBloc, MedicineState>(
// //                   builder: (context, state) {
// //                     print("befor get  data");
// //                     if (state is Successful) {
// //                       print('data getted');
// //                       return SizedBox(
// //                         height: 250,
// //                         width: 250,
// //                         child: ListView.builder(
// //                           shrinkWrap: true,
// //                           itemCount: state.medicinee.length,
// //                           itemBuilder: (context, index) => ListTile(
// //                             // isThreeLine: true,
// //                             leading: CircleAvatar(
// //                               child: Text(state.medicinee[index].category_id
// //                                   .toString()),
// //                             ),
// //                             title: Text(state
// //                                 .medicinee[index].scientific_name
// //                                 .toString()),
// //                             subtitle: Text(
// //                                 state.medicinee[index].date.toString()),
// //                           ),
// //                         ),
// //                       );
// //                     } else if (state is Error) {
// //                       return Center(child: Text("error with getting data"));
// //                     } else {
// //                       print("data is in way");
// //                       return const Center(
// //                           child: Padding(
// //                         padding: const EdgeInsets.all(30),
// //                         child: CircularProgressIndicator(),
// //                       ));
// //                     }
// //                   },
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       );
// //     },
// //   ),
// // );
// //////////////////////////////////////

// class customDelgate extends SearchDelegate {
//   List<String> searchTerm = ["Abacavir"];

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//           onPressed: () {
//             query = '';
//           }, //just to delet the text
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     [
//       IconButton(
//           onPressed: () {
//             query = '';
//           }, //just to delet the text
//           icon: const Icon(Icons.clear))
//     ];
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     List<String> matchQuary = [];
//     for (var Items in searchTerm) {
//       if (Items.toLowerCase().contains(query.toLowerCase())) {
//         matchQuary.add(Items);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuary.length,
//         itemBuilder: (context, index) {
//           var result = matchQuary[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     List<String> matchQuary = [];
//     for (var Items in searchTerm) {
//       if (Items.toLowerCase().contains(query.toLowerCase())) {
//         matchQuary.add(Items);
//       }
//     }
//     return ListView.builder(
//         itemCount: matchQuary.length,
//         itemBuilder: (context, index) {
//           var result = matchQuary[index];
//           return ListTile(
//             title: Text(result),
//           );
//         });
//   }
// }