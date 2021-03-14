import 'package:brave_girls/controllers/authController.dart';
import 'package:brave_girls/models/todo.dart';
import 'package:brave_girls/services/database.dart';
import 'package:get/get.dart';

class TodoController extends GetxController {
  Rx<List<TodoModel?>?> todoList = Rx<List<TodoModel>>();

  List<TodoModel?>? get todos => todoList.value;

  @override
  void onInit() {
    String uid = Get.find<AuthController>().user!.uid;
    todoList.bindStream(Database().todoStream(uid)); //stream coming from firebase
    super.onInit();
  }
}
