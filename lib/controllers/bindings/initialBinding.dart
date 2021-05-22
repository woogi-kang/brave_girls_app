import 'package:brave_girls/controllers/supabase_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SupaBaseController>(SupaBaseController(), permanent: true);
  }
}