import 'package:flutter/material.dart';
import 'package:flutter_farmer_app/addresses/domain/states/address_state.dart';
import 'package:flutter_farmer_app/common/dependencies.dart';
import 'package:flutter_farmer_app/map/domain/states/map_state.dart';
import 'package:flutter_farmer_app/root/presentation/root_page.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

void main() {
  setupDependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        title: 'Flutter Demo',
        home: MultiProvider(
          providers: [
            Provider<MapState>(
              create: (_) => MapState(),
            ),
            Provider<AddressesState>(
              create: (_) => AddressesState(
                GetIt.instance.get(),
              ),
            ),
          ],
          child: const RootPage(),
        ),
      );
}
