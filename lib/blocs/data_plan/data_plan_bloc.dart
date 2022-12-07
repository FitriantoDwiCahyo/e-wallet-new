import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../models/data_plan_form_model.dart';
import '../../services/transaction_service.dart';

part 'data_plan_event.dart';
part 'data_plan_state.dart';

class DataPlanBloc extends Bloc<DataPlanEvent, DataPlanState> {
  DataPlanBloc() : super(DataPlanInitial()) {
    on<DataPlanEvent>((event, emit) async {
      // TODO: implement event handler

      if (event is DataPlanPost) {
        try {
          emit(DataPlanLoading());

          await TransactionService().dataPlan(event.data);

          emit(DataPlanSuccess());
        } catch (e) {
          emit(DataPlanFailed(e.toString()));
        }
      }
    });
  }
}
