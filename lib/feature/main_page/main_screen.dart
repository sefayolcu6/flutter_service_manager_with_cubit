import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_service_manager/core/managers/http_manager.dart';
import 'package:flutter_service_manager/feature/main_page/main_page_cubit/main_page_cubit.dart';
import 'package:flutter_service_manager/feature/main_page/main_page_cubit/main_page_state.dart';

class ServiceExpampleScreen extends StatefulWidget {
  const ServiceExpampleScreen({super.key});

  @override
  State<ServiceExpampleScreen> createState() => _ServiceExpampleScreenState();
}

class _ServiceExpampleScreenState extends State<ServiceExpampleScreen>
    with ScreenProperties {
  HttpManager services = HttpManager();
  @override
  void initState() {
    mainPageServicesCubit = context.read<MainPageServicesCubit>();
    mainPageServicesCubit.getModalValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: BlocBuilder<MainPageServicesCubit, MainPageState>(
        builder: (context, state) {
          if (state is MainPageServiceLoading) {
            return const Center(child:  RefreshProgressIndicator());
          } else if (state is MainPageServiceSuccess) {
            return Center(
              child: Text(mainPageServicesCubit.model.body ?? ""),
            );
          } else if (state is MainPageServiceError) {
            return const Text("Beklenmeyen Hata");
          }
          return const Center(child: Text("Beklenmeyen Hata"));
        },
      )),
    );
  }
}

mixin ScreenProperties {
  late MainPageServicesCubit mainPageServicesCubit;
}
