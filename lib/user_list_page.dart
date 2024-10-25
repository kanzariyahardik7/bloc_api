import 'package:bloc_api/bloc/user_bloc.dart';
import 'package:bloc_api/bloc/user_event.dart';
import 'package:bloc_api/bloc/user_state.dart';
import 'package:bloc_api/user_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserBloc(RepositoryProvider.of<UserRepo>(context))
        ..add(UserLoadEvent()),
      child: Scaffold(
          appBar: AppBar(
            title: Text("AppBar"),
          ),
          body: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is UserLoadedState) {
                return ListView.builder(
                  itemCount: state.userData.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "${state.userData[index].firstName} ${state.userData[index].lastName}"),
                                Text("${state.userData[index].email}")
                              ],
                            ),
                          ),
                          CircleAvatar(
                            radius: 20,
                            backgroundColor: Colors.redAccent,
                            backgroundImage: NetworkImage(
                                state.userData[index].avatar ?? ""),
                          ),
                        ],
                      ),
                    );
                  },
                );
              } else {
                return Center(child: Text("error"));
              }
            },
          )),
    );
  }
}
