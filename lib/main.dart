import 'package:flutter/material.dart';
import 'package:widget_of_the_week/views/shared_preference/cubit/preferences_cubit.dart';
import 'package:widget_of_the_week/views/shared_preference/ui_for_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => PreferencesCubit()..isLogin(),
        child: const UiForCubit(),
      ),
      // home:  const SharedPreference(),
    );
  }
}
