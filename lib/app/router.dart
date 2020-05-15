import 'package:auto_route/auto_route_annotations.dart';
import 'package:headyproject/ui/view/home/home_view.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  HomeView homeView;
}
