import 'package:bookly_app/features/search/presentation/logic/search_cubit/search_cubit_cubit.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatefulWidget {
  const CustomSearchTextField({
    super.key,
  });

  @override
  State<CustomSearchTextField> createState() => _CustomSearchTextFieldState();
}

class _CustomSearchTextFieldState extends State<CustomSearchTextField> {
  late TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (value) {
        SearchCubit.get(context).getSearch(val: value);
        setState(() {});
      },
      decoration: const InputDecoration(
        hintText: 'Search',
        suffixIcon: Icon(
          Icons.search,
          size: 25,
        ),
      ),
    );
  }
}
