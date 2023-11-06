import 'package:favorite_places/Screens/addplace_screen.dart';
import 'package:favorite_places/Screens/place_details.dart';
import 'package:favorite_places/providers/placeprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlacesList extends StatefulWidget {
  // final List<Place> places;
  const PlacesList({
    super.key,
  });

  @override
  State<PlacesList> createState() => _PlacesListState();
}

class _PlacesListState extends State<PlacesList> {
  late Future<void> _placesfuture;
  @override
  void initState() {
    _placesfuture =
        Provider.of<PlaceProvider>(context, listen: false).fetchandsetplaces();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Your Places')),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => const AddPlacesScreen()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
          future: _placesfuture,
          builder: ((context, snapshot) =>
              snapshot.connectionState == ConnectionState.waiting
                  ? const Center(child: CircularProgressIndicator())
                  : Consumer<PlaceProvider>(child: const Text('No places to show'),builder: (context, data, child) =>ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: CircleAvatar(
                  backgroundImage: FileImage(data.places[index].image),
                ),
                title: Text(
                  data.places[index].title,
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (ctx) => PlaceDetails(
                          place: data.places[index],
                        ))),
              ),
              itemCount: data.places.length,
                  ))))
    );
   
    // builder: ((context, snapshot) {
    //   if (snapshot.connectionState == ConnectionState.waiting) {
    //     return const CircularProgressIndicator();
    //   } else if (snapshot.hasError) {
    //     return Text('Error occured $snapshot.error');
    //   } else {
    //     return Consumer<PlaceProvider>(builder: (ctx, data, _) {
    //           print('I am on place list');

    //       return ListView.builder(
    //         itemBuilder: (context, index) => ListTile(
    //           leading: CircleAvatar(
    //             backgroundImage: FileImage(data.places[index].image),
    //           ),
    //           title: Text(
    //             data.places[index].title,
    //             style: Theme.of(context).textTheme.titleMedium!.copyWith(
    //                 color: Theme.of(context).colorScheme.onBackground),
    //           ),
    //           onTap: () => Navigator.of(context).push(MaterialPageRoute(
    //               builder: (ctx) => PlaceDetails(
    //                     place: data.places[index],
    //                   ))),
    //         ),
    //         itemCount: data.places.length,
    //       );
    //     });
    //   }
    // }
    // )
    //
  }
}
