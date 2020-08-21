@JS("AMap")
library amap;
import 'package:js/js.dart';

@JS('Map')
class AMap {
  external AMap(dynamic /*String|HTMLDivElement*/ div, MapOptions opts);
}

@JS()
@anonymous
class MapOptions {
  external LngLat get center;
  external set center(LngLat v);
  external factory MapOptions({
    LngLat center,
    num zoom,
    String /*‘2D’|‘3D’*/ viewMode,
  });
}
@JS()
class LngLat {
  external num getLng();
  external num getLat();
  external LngLat(num lng, num lat);
}