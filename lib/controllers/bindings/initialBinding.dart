import 'package:brave_girls/controllers/auth_controller.dart';
import 'package:brave_girls/utils/supabase.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<SupaBaseController>(SupaBaseController(), permanent: true);
  }
}