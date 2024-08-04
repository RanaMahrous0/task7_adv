import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task7_adv/bloc/user_bloc.dart';
import 'package:task7_adv/pages/user_page.dart';
import 'package:task7_adv/repoistory/user_repoistory.dart';

void main() {
  runApp(BlocProvider<UserBloc>(
    create: (context) => UserBloc(UserRepoistory()),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const UserPage(),
    );
  }
}
