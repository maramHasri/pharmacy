import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled32/model/bloc/search_bloc.dart';

class searchScreen extends StatefulWidget {
  const searchScreen({super.key});

  @override
  State<searchScreen> createState() => _searchScreenState();
}

class _searchScreenState extends State<searchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Medicine Search',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
        backgroundColor: const Color(0xff17A274),
      ),
      body: Column(
        children: [
          _searchField(context),
          _medicines(context)
          // Padding(
          //   padding: const EdgeInsets.all(16.0),
          //   child: TextField(
          //     onChanged: (value) => filterMedicines(value),
          //     decoration: InputDecoration(
          //       labelText: 'Search',
          //       prefixIcon: Icon(Icons.search),
          //     ),
          //   ),
          // ),
          // Expanded(
          //   child: ListView.builder(
          //     itemCount: filteredMedicines.length,
          //     itemBuilder: (context, index) {
          //       final medicine = filteredMedicines[index];
          //       return ListTile(
          //         title: Text(medicine.tradeName),
          //         subtitle: Text(medicine.scientificName),
          //         // Add other widgets to display more information about the medicine
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _searchField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
          decoration: InputDecoration(
              fillColor: Colors.white,
              hintText: 'search... ',
              contentPadding: const EdgeInsets.all(15),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.grey, width: 1)))),
    );
  }

  Widget _medicines(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
      if (state is LoadedWords) {
        return ListView.separated(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          itemBuilder: (context, index) {
            return Text(""
              // state.medicines[index].trade_name,
            // style: const TextStyle(color: Colors.black87),
            );
          },
          separatorBuilder: (context, index) => Divider(
            thickness: 0.2,
            color: Colors.grey,
          ),
          itemCount: state.medicines.length,
        );
      }
      return Container();
    });
  }
}
