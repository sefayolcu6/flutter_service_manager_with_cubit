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

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          mainPageServicesCubit.getModalValues();
                        },
                        child: Text("Get Modal")),
                    ElevatedButton(
                        onPressed: () {
                          mainPageServicesCubit.getListValues();
                        },
                        child: Text("Get List")),
                  ],
                ),
                BlocBuilder<MainPageServicesCubit, MainPageState>(
                  builder: (context, state) {
                    if (state is MainPageServiceLoading) {
                      return const Center(child: RefreshProgressIndicator());
                    } else if (state is MainPageServiceSuccess) {
                      return Center(
                          child: ListTile(
                        leading: Text(
                          mainPageServicesCubit.model.id.toString(),
                          style: TextStyle(fontSize: 20),
                        ),
                        title:
                            Text(mainPageServicesCubit.model.title.toString()),
                        subtitle: Text(mainPageServicesCubit.model.body ?? ""),
                      ));
                    } else if (state is MainPageServiceError ||
                        state is MainPageServiceListError) {
                      return const Text("");
                    } else if (state is MainPageServiceListSuccess) {
                      return SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: ListView.builder(
                          itemCount: mainPageServicesCubit.listModel.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              subtitle: Text(mainPageServicesCubit
                                  .listModel[index].body
                                  .toString()),
                            );
                          },
                        ),
                      );
                    }
                    return const Center(child: Text("Veri Çek"));
                  },
                ),
              ],
            ),
          )),
    );
  }
}

mixin ScreenProperties {
  late MainPageServicesCubit mainPageServicesCubit;
}
