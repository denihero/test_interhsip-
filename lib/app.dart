import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project_intership/features/presentation/bloc/get_post_cubit/get_post_cubit.dart';
import 'package:test_project_intership/features/presentation/pages/home_page.dart';
import 'package:test_project_intership/service_locator.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<GetPostCubit>()..getPost()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData.light(), // de
        home: const HomePage(),
      ),
    );
  }
}

