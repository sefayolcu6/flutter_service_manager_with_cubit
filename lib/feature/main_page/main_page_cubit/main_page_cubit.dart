import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_service_manager/core/api_constants/api_constans.dart';
import 'package:flutter_service_manager/core/managers/http_manager.dart';
import 'package:flutter_service_manager/core/models/place_holder_model.dart';
import 'package:flutter_service_manager/feature/main_page/main_page_cubit/main_page_state.dart';

class MainPageServicesCubit extends Cubit<MainPageState> with CubitProperties {
  MainPageServicesCubit() : super(MainPageServiceInitial());

  Future<void> getModalValues() async {
    emit(MainPageServiceLoading());
    await services
        .getFromApi(
      fromJson: (json) => PlaceHolderModel.fromJson(json),
      apiUrl: ApiConstants.jsonplaceholderUrl,
    )
        .then((onValue) {
      emit(MainPageServiceSuccess());
      model = onValue;
    }).onError(
      (error, stackTrace) {
        emit(MainPageServiceError());
        print(error);
        print(stackTrace);
      },
    );
  }
}

mixin CubitProperties {
  HttpManager services = HttpManager();
  PlaceHolderModel model =
      PlaceHolderModel(id: 0, userId: 0, title: "", body: "");
}
