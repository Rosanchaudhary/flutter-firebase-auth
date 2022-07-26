import 'package:firebase_auth_bloc/blocs/auth/auth_bloc.dart';
import 'package:firebase_auth_bloc/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutRequestedEvent());
                },
                icon: Icon(Icons.exit_to_app)),
            IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage();
                  }));
                },
                icon: Icon(Icons.account_circle))
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/bloc_logo_full.png',
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Bloc library is awesome \n state management \n for flutter',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
