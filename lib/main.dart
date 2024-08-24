import 'package:flutter/material.dart';
import 'package:flutter_service_manager/core/api_constants/api_constans.dart';
import 'package:flutter_service_manager/core/managers/http_manager.dart';
import 'package:flutter_service_manager/core/models/place_holder_model.dart';

void main() {
  runApp(const ServiceExpampleScreen());
}

class ServiceExpampleScreen extends StatefulWidget {
  const ServiceExpampleScreen({super.key});

  @override
  State<ServiceExpampleScreen> createState() => _ServiceExpampleScreenState();
}

class _ServiceExpampleScreenState extends State<ServiceExpampleScreen> {
  PlaceHolderModel model = PlaceHolderModel(
      id: 0, userId: 0, title: "Loading....", body: "Loading....");
  HttpManager services = HttpManager();
  @override
  void initState() {
    services.getFromApi(
      fromJson: (json) => PlaceHolderModel.fromJson(json),
      apiUrl: ApiConstants.jsonplaceholderUrl,
    ).then((onValue) {
      setState(() {
        model = onValue;
      });
    }).onError(
      (error, stackTrace) {
        print(error);
        print(stackTrace);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(model.body ?? ""),
        ),
      ),
    );
  }
}
