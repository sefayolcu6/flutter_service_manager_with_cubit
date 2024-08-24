import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_service_manager/feature/main_page/main_page_cubit/main_page_cubit.dart';
import 'package:flutter_service_manager/feature/main_page/main_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (_) => MainPageServicesCubit(),
      child: ServiceExpampleScreen(),
    ),
  );
}
