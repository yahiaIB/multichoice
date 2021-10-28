import 'package:multichoice/models/hala_payments_entity.dart';
import 'package:multichoice/repository/hala_payments_repository.dart';
import 'package:multichoice/viewmodels/base_model.dart';

class HomeScreenViewModel extends BaseViewModel {
  List<HalaPaymentsEntity>? _halaPayments;
  List<HalaPaymentsEntity> get halaPayments => _halaPayments!;

  String? _totalAmount;
  String? get totalAmount => _totalAmount!;


  final HalaPaymentsRepository _repository = HalaPaymentsRepository();


  getHalaPayments() async {
    try{
      setBusy(true);
      var result  = await _repository.getHalaPayments();
      _halaPayments = result["list"];
      _totalAmount = result["totalAmount"].toString();
      setBusy(false);
    }catch(e){
      setError(err: e.toString());
      setBusy(false);
    }
  }
}