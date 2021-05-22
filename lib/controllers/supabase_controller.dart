import 'package:get/get.dart';
import 'package:supabase/supabase.dart';

class SupaBaseController extends GetxController {
  final String apiKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoic2VydmljZV9yb2xlIiwiaWF0IjoxNjE5Nzc5NjE3LCJleHAiOjE5MzUzNTU2MTd9.15N90pb617lsVWIAOiObSxmsWTr9_A3Zzh1BVMkrlWM';
  final String url = "https://dizpelalthguwpduzwiu.supabase.co";

  late SupabaseClient client;

  @override
  void onInit() {
    client = SupabaseClient(url, apiKey);
    update();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  dynamic getMusicChartTable() async {
    final response = await client
        .from("music_chart")
        .select()
        .order('name', ascending: true)
        .execute();

    if(response.status == 200) {
      return response.data;
    }
  }

  dynamic getSchedule() async {
    final response = await client
        .from("schedule")
        .select()
        .order('name', ascending: true)
        .execute();

    if(response.status == 200) {
      return response.data;
    }
  }
}