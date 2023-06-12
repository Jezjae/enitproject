import 'package:enitproject/app/screen/map_home/controller/map_home_controller.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TestButton extends StatelessWidget {   // 테스트용
  final dynamic test;
  const TestButton({required this.test,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 1,child: Text('$test'));
  }
}


class CustomGoogleMap extends GetView<MapHomeController> {
  final MapCreatedCallback onMapCreated;
  final RxList circle;
  const CustomGoogleMap({required this.onMapCreated,required this.circle,Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    //if(){};

    final Set<Marker> markers = new Set();
    Set<Marker> getmarkers() { //markers to place on map

      for(int i=0;i< MapHomeController.to.latLngList.length;i++){
        markers.add(Marker( //add first marker
          markerId: MarkerId(MapHomeController.to.latLngList[i].storyPlayListKey ??'123'),
          position: LatLng(MapHomeController.to.latLngList[i].latitude ?? 0.0, MapHomeController.to.latLngList[i].longitude ?? 0.0), //
          infoWindow: InfoWindow( //popup info
            title: MapHomeController.to.latLngList[i].title,  // 타이틀만 보여 줄꺼면 잘보이게 꾸미기 필요
          ),
          icon: BitmapDescriptor.defaultMarker, //Icon for Marker
        ));
      }

      return markers;
    }

    final Set<Circle> circles = new Set();
    Set<Circle> getcircles() { //markers to place on map
      for(int i=0;i< MapHomeController.to.latLngList.length;i++){
        circles.add(Circle( //add first marker
          circleId: CircleId(MapHomeController.to.latLngList[i].storyPlayListKey ?? '123'), // 타이틀만 보여 줄꺼면 잘보이게 꾸미기 필요
          center: LatLng(MapHomeController.to.latLngList[i].latitude ?? 0.0, MapHomeController.to.latLngList[i].longitude ?? 0.0),
          radius: 40,
          strokeColor:circle[i],
          fillColor: circle[i].withOpacity(0.5),
          strokeWidth: 1,
        ), //Icon for Marker
        );
      }
      return circles;
    }
    //-----------------------------------------------------------
    // Future<CameraPosition> getposition1()async{
    //   final location = await Geolocator.getCurrentPosition();
    //   final LatLng companyLatLng = LatLng(location.latitude,location.longitude);
    //   final CameraPosition initialPosition = CameraPosition(
    //     target: companyLatLng,
    //     zoom: 15
    //   );
    //   return initialPosition;
    // }

    final location = Geolocator.getCurrentPosition();
    double lat =  33.49766527106121;
    double lng =  126.53094118653355;
    final LatLng companyLatLng = LatLng(lat, lng);
    final CameraPosition initialPosition = CameraPosition(  //지도 위치 초기화 및 우리가 바라볼 곳
      target: companyLatLng,
      zoom: 15,
    );

    return Positioned(
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        circles: getcircles(),
        markers: getmarkers(),
        onMapCreated: onMapCreated,
          onCameraIdle: ()=>{
            controller.initSize.value = 1
          }

      ),
    );
  }
}