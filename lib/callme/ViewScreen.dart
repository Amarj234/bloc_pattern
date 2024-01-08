import 'package:bloc_pattern/callme/Usermodels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_state_bloc.dart';

class ViewScreen extends StatelessWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppStateState>(builder: (context, state) {
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
    });
  }
}
