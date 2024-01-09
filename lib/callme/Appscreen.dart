import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ViewScreen.dart';
import 'app_bloc.dart';
import 'app_state_bloc.dart';

class AppScreen extends StatefulWidget {
  const AppScreen({Key? key}) : super(key: key);

  @override
  State<AppScreen> createState() => _AppScreenState();
}

class _AppScreenState extends State<AppScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    context.read<AppStateBloc>().add(LoadUserEvent());
    context.read<AppsBloc>().add(LoadUserEvent2());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Amarjeet"),
      ),
      body: SafeArea(
        child: ViewScreen(),
      ),
    );
  }
}
