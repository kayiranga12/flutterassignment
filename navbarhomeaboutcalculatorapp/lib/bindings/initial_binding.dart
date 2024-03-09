


import 'package:navbarhomeaboutcalculatorapp/controllers/auth_controller.dart';
import 'package:navbarhomeaboutcalculatorapp/controllers/common/theme_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ThemeController());
    //Get.put(PapersDataUploader());
    Get.put(AuthController(), permanent: true);
    Get.put(NotificationService());
    Get.lazyPut(() =>  FireBaseStorageService());
  }
}
