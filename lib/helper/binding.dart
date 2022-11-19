import 'package:act_4_community_by_ocp/core/view_model/auth_view_model.dart';
import 'package:act_4_community_by_ocp/core/view_model/control_view_model.dart';
import 'package:act_4_community_by_ocp/core/view_model/home_view_model.dart';
import 'package:get/get.dart';

class Binding extends Bindings{
  
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.put(HomeViewModel(),permanent: true,);
    //Get.lazyPut(() => HomeViewModel());
    Get.lazyPut(() => ControlViewModel());
  }

}