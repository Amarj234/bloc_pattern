import 'package:bloc_pattern/callme/Usermodels.dart';
import 'package:bloc_pattern/callme/app_bloc.dart';
import 'package:bloc_pattern/callme/app_state_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_state2.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<AppStateBloc>().state;
    final state2 = context.watch<AppsBloc>().state;
    print(state2);
    if (state2 is UserLoadedState3) {
      print(state2.userval[0].title);
    } else if (state2 is ErroState) {
      print("Farah ${state2.error}");
    }
    if (state is UserLoadingState2) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else if (state is UserErrorState2) {
      return Center(child: Text("Error ${state.error}"));
    } else if (state is UserLoadedState2) {
      Usermodels userList = state.users;
      return ListView.builder(
          itemCount: userList.users!.length,
          itemBuilder: (_, index) {
            var data = userList.users!;
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Card(
                  color: data[index].isred
                      ? Theme.of(context).splashColor
                      : Theme.of(context).primaryColor,
                  child: ListTile(
                      onTap: () {
                        context.read<AppStateBloc>().add(ChangeUserEvent(id: data[index].id!));
                      },
                      title: Text(
                        '${data[index].firstName}  ${data[index].lastName}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '${data[index].email}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(data[index].image.toString()),
                      ))),
            );
          });
    }
    return Container();
  }
}
