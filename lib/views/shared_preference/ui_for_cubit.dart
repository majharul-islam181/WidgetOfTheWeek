import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:widget_of_the_week/views/shared_preference/cubit/preferences_cubit.dart';

class UiForCubit extends StatefulWidget {
  const UiForCubit({super.key});

  @override
  State<UiForCubit> createState() => _UiForCubitState();
}

class _UiForCubitState extends State<UiForCubit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared for Cubit'),
      ),
      body: BlocBuilder<PreferencesCubit, PreferencesState>(
        builder: (context, state) {
          if (state is PreferencesInitial) {
            return const CircularProgressIndicator();
          } else if (state is PreferencesLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.name.isNotEmpty ? state.name : 'No name'),
                ],
              ),
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PreferencesCubit>().updateName('My Name');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
