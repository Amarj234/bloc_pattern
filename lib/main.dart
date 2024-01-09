import 'package:bloc_pattern/apicall.dart';
import 'package:bloc_pattern/app_block.dart';
import 'package:bloc_pattern/callme/app_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'callme/app_bloc.dart';
import 'homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<UserBloc>(
            create: (BuildContext context) => UserBloc(UserRepository()),
          ),
          BlocProvider<AppStateBloc>(
            create: (BuildContext context) => AppStateBloc(UserRepository()),
          ),
          BlocProvider<AppsBloc>(
            create: (BuildContext context) => AppsBloc(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ));
    ;
  }
}
