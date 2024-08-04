import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_adv/bloc/user_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  void initState() {
    context.read<UserBloc>().add(LoadUserEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List'),
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is UserLoadedState) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (context, index) {
                final user = state.users[index];
                return ListTile(
                  title: Text(
                    user.name,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                  ),
                  subtitle: Text(user.email),
                  trailing: Text(user.position),
                  leading: CircleAvatar(child: Text(user.id.toString())),
                );
              },
            );
          } else if (state is UserErrorState) {
            return Center(child: Text('Error: ${state.errorMessage}'));
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
