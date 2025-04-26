import 'package:hackaton2025_6/package.dart';
import 'package:collection/collection.dart';

class OphalingRepository {
  late List<Ophaling> _tempOphalingen;

  OphalingRepository() {
    _tempOphalingen = SampleOphalingen.ophalingen;
  }

  void updateTempOphaling(String id, Ophaling newOphaling) {
    final index = _tempOphalingen.indexWhere((o) => o.id == id);
    if (index != -1) {
      _tempOphalingen[index] = newOphaling;
    }
  }

  Ophaling? getTempOphaling(String id) {
    return _tempOphalingen.firstWhereOrNull((ophaling) => ophaling.id == id);
  }

  List<Ophaling> getTempOphalingen() {
    return _tempOphalingen;
  }
}