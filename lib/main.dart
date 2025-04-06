import 'dart:math';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
// ignore: unused_import
import 'map_screen.dart';
import 'dart:math' as math;

void main() => runApp(const BusRouteApp());

class AppLanguage {
  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'Bus Route Table',
      'routesTitle': 'Bus Routes',
      'addRoute': 'Add Route',
      'editRoute': 'Edit Route',
      'route': 'Route',
      'routeNumber': 'Route Number',
      'routeName': 'Route Name',
      'operatingHours': 'Operating Hours',
      'duration': 'Duration',
      'routeLength': 'Route Length',
      'busDepot': 'Bus Depot',
      'details': 'Details',
      'edit': 'Edit',
      'delete': 'Delete',
      'add': 'Add',
      'save': 'Save Changes',
      'routeNotSelected': 'Route not selected',
      'addNewRoute': 'Add New Route',
      'editRouteTitle': 'Edit Route',
      'enterRouteNumber': 'Please enter route number',
      'enterRouteName': 'Please enter route name',
      'enterOperatingHours': 'Please enter operating hours',
      'enterDuration': 'Please enter duration',
      'enterRouteLength': 'Please enter route length',
      'enterBusDepot': 'Please enter bus depot',
      'hoursExample': 'Example: 05:45 – 22:10',
      'durationExample': 'Example: 41.5 min',
      'lengthExample': 'Example: 16.9 km',
      'routeInfo': 'Route Information',
      'additionalInfo':
          'This section can include additional information about the route, such as a list of stops, route map, bus arrival schedules for key stops, accessibility information, etc.',
      'language': 'Language',
      'noRoutesMessage': 'No routes available. Add a new route to get started.',
      'search': 'Search',
      'closeSearch': 'Close Search',
      'searchHint': 'Search by route number, name, or depot...',
      'noSearchResults': 'No routes found matching your search',
      'welcomeTitle': 'Individual Work 2 (Mobile development)',
      'welcomeSubtitle': 'Bus Route Management System',
      'getStarted': 'Get Started',
      'share': 'Share',
      // Add this to the 'en' section in AppLanguage._localizedValues
      'shareText':
          'Bus Route #{routeNumber}: {routeName}\nOperating Hours: {operatingHours}\nDuration: {duration}\nRoute Length: {routeLength}\nBus Depot: {busDepot}',
      'shareRoute': 'Share Route',
      'shareSubject': 'Bus Route Information',
      'deleted': 'deleted',
      'undo': 'Undo',
      'cancel': 'Cancel',
      'myLocation': 'My Location',
      'latitude': 'Latitude',
      'longitude': 'Longitude',
      'nearbyBusStops': 'Nearby Bus Stops:',
      'close': 'Close',
      'viewOnMap': 'View on Map',
      'locationPermissionDenied': 'Location permission denied',
      'locationPermissionPermanentlyDenied':
          'Location permissions are permanently denied, please enable in Settings',
      'openSettings': 'Open Settings',
      'locationError': 'Error getting location',
      'mapFeatureNotAvailable': 'Map view is not available yet',
      'routes': 'Routes',
      'directions': 'Directions',
      'directionsNotAvailable': 'Directions not available yet',
      'distance': 'Distance',
      'refresh': 'Refresh',
      'radius': 'radius',
      'noNearbyStops': 'No bus stops found nearby',
      'tryIncreasingRadius':
          'Try increasing the search radius or move to a different location',
      'errorLoadingStops': 'Error loading bus stops',
      'routeMap': 'Route Map',
      'routeMapNotAvailable': 'Route map is not available',
      'pinchToZoom': 'Pinch to zoom, drag to pan',
      'scrollForMore': 'Scroll down for more',
    },
    'ru': {
      'appTitle': 'Таблица маршрутов автобусов',
      'routesTitle': 'Маршруты автобусов',
      'addRoute': 'Добавить маршрут',
      'editRoute': 'Редактировать маршрут',
      'route': 'Маршрут',
      'routeNumber': 'Номер маршрута',
      'routeName': 'Наименование маршрута',
      'operatingHours': 'Режим работы',
      'duration': 'Продолжительность',
      'routeLength': 'Длина',
      'busDepot': 'Автопарк',
      'details': 'Детали',
      'edit': 'Редактировать',
      'delete': 'Удалить',
      'add': 'Добавить',
      'save': 'Сохранить изменения',
      'routeNotSelected': 'Маршрут не выбран',
      'addNewRoute': 'Добавить новый маршрут',
      'editRouteTitle': 'Редактировать маршрут',
      'enterRouteNumber': 'Пожалуйста, введите номер маршрута',
      'enterRouteName': 'Пожалуйста, введите наименование маршрута',
      'enterOperatingHours': 'Пожалуйста, введите режим работы',
      'enterDuration': 'Пожалуйста, введите продолжительность маршрута',
      'enterRouteLength': 'Пожалуйста, введите длину маршрута',
      'enterBusDepot': 'Пожалуйста, введите автопарк',
      'hoursExample': 'Например: 05:45 – 22:10',
      'durationExample': 'Например: 41,5 мин',
      'lengthExample': 'Например: 16,9 км',
      'routeInfo': 'Информация о маршруте',
      'additionalInfo':
          'В эту секцию можно добавить дополнительную информацию о маршруте, например, список остановок, карту маршрута, расписание прибытия автобусов на ключевые остановки, информацию о доступности и т.д.',
      'language': 'Язык',
      'noRoutesMessage':
          'Маршруты отсутствуют. Добавьте новый маршрут, чтобы начать.',
      'search': 'Поиск',
      'closeSearch': 'Закрыть поиск',
      'searchHint': 'Искать по номеру, названию или автопарку...',
      'noSearchResults': 'Не найдено маршрутов по вашему запросу',
      'welcomeTitle': 'Индивидуальная работа 2 (Мобильная разработка)',
      'welcomeSubtitle': 'Система управления автобусными маршрутами',
      'getStarted': 'Начать',
      'share': 'Поделиться',
      'shareRoute': 'Поделиться маршрутом',
      'shareSubject': 'Информация о маршруте автобуса',
      'shareText':
          'Маршрут автобуса №{routeNumber}: {routeName}\nРежим работы: {operatingHours}\nПродолжительность: {duration}\nДлина: {routeLength}\nАвтопарк: {busDepot}',
      'deleted': 'удален',
      'undo': 'Отменить',
      'cancel': 'Отмена',
      'myLocation': 'Мое местоположение',
      'latitude': 'Широта',
      'longitude': 'Долгота',
      'nearbyBusStops': 'Ближайшие остановки:',
      'close': 'Закрыть',
      'viewOnMap': 'Показать на карте',
      'locationPermissionDenied':
          'Разрешение на определение местоположения отклонено',
      'locationPermissionPermanentlyDenied':
          'Разрешения на определение местоположения отклонены навсегда, включите их в Настройках',
      'openSettings': 'Открыть Настройки',
      'locationError': 'Ошибка при получении местоположения',
      'mapFeatureNotAvailable': 'Просмотр карты пока недоступен',
      'routes': 'Маршруты',
      'directions': 'Проложить маршрут',
      'directionsNotAvailable': 'Прокладка маршрута пока недоступна',
      'distance': 'Расстояние',
      'refresh': 'Обновить',
      'radius': 'радиус',
      'noNearbyStops': 'Остановки поблизости не найдены',
      'tryIncreasingRadius':
          'Попробуйте увеличить радиус поиска или переместиться в другое место',
      'errorLoadingStops': 'Ошибка при загрузке остановок',
      'routeMap': 'Карта маршрута',
      'routeMapNotAvailable': 'Карта маршрута недоступна',
      'pinchToZoom':
          'Щипок для масштабирования, перетаскивание для перемещения',
      'scrollForMore': 'Прокрутите вниз',
    },
    'uz': {
      'appTitle': 'Avtobus yo\'nalishlari jadvali',
      'routesTitle': 'Avtobus yo\'nalishlari',
      'addRoute': 'Yo\'nalish qo\'shish',
      'editRoute': 'Yo\'nalishni tahrirlash',
      'route': 'Yo\'nalish',
      'routeNumber': 'Yo\'nalish raqami',
      'routeName': 'Yo\'nalish nomi',
      'operatingHours': 'Ish vaqti',
      'duration': 'Davomiyligi',
      'routeLength': 'Yo\'nalish uzunligi',
      'busDepot': 'Avtopark',
      'details': 'Tafsilotlar',
      'edit': 'Tahrirlash',
      'delete': 'O\'chirish',
      'add': 'Qo\'shish',
      'save': 'O\'zgarishlarni saqlash',
      'routeNotSelected': 'Yo\'nalish tanlanmagan',
      'addNewRoute': 'Yangi yo\'nalish qo\'shish',
      'editRouteTitle': 'Yo\'nalishni tahrirlash',
      'enterRouteNumber': 'Iltimos, yo\'nalish raqamini kiriting',
      'enterRouteName': 'Iltimos, yo\'nalish nomini kiriting',
      'enterOperatingHours': 'Iltimos, ish vaqtini kiriting',
      'enterDuration': 'Iltimos, davomiylikni kiriting',
      'enterRouteLength': 'Iltimos, yo\'nalish uzunligini kiriting',
      'enterBusDepot': 'Iltimos, avtoparkni kiriting',
      'hoursExample': 'Masalan: 05:45 – 22:10',
      'durationExample': 'Masalan: 41,5 daqiqa',
      'lengthExample': 'Masalan: 16,9 km',
      'routeInfo': 'Yo\'nalish haqida ma\'lumot',
      'additionalInfo':
          'Bu bo\'limga yo\'nalish haqida qo\'shimcha ma\'lumotlar qo\'shish mumkin, masalan, bekatlar ro\'yxati, yo\'nalish xaritasi, avtobuslarning asosiy bekatlarga kelish jadvali, qulayliklar to\'g\'risida ma\'lumot va boshqalar.',
      'language': 'Til',
      'noRoutesMessage':
          'Yo\'nalishlar mavjud emas. Boshlash uchun yangi yo\'nalish qo\'shing.',
      'search': 'Qidiruv',
      'closeSearch': 'Qidiruvni yopish',
      'searchHint':
          'Yo\'nalish raqami, nomi yoki avtopark bo\'yicha qidirish...',
      'noSearchResults':
          'Sizning so\'rovingiz bo\'yicha yo\'nalishlar topilmadi',
      'welcomeTitle': 'Individual ish 2 (Mobil dasturlash)',
      'welcomeSubtitle': 'Avtobus yo\'nalishlari boshqaruv tizimi',
      'getStarted': 'Boshlash',
      'share': 'Ulashish',
      'shareRoute': 'Yo\'nalishni ulashish',
      'shareSubject': 'Avtobus yo\'nalishi haqida ma\'lumot',
      'shareText':
          'Avtobus yo\'nalishi №{routeNumber}: {routeName}\nIsh vaqti: {operatingHours}\nDavomiyligi: {duration}\nYo\'nalish uzunligi: {routeLength}\nAvtopark: {busDepot}',
      'deleted': 'o\'chirildi',
      'undo': 'Bekor qilish',
      'cancel': 'Bekor qilish',
      'myLocation': 'Mening joylashuvim',
      'latitude': 'Kenglik',
      'longitude': 'Uzunlik',
      'nearbyBusStops': 'Yaqin avtobus bekatlar:',
      'close': 'Yopish',
      'viewOnMap': 'Xaritada ko\'rish',
      'locationPermissionDenied': 'Joylashuv ruxsati rad etildi',
      'locationPermissionPermanentlyDenied':
          'Joylashuv ruxsatlari doimiy rad etildi, iltimos Sozlamalarda yoqing',
      'openSettings': 'Sozlamalarni ochish',
      'locationError': 'Joylashuvni olishda xatolik yuz berdi',
      'mapFeatureNotAvailable': 'Xarita ko\'rinishi hozircha mavjud emas',
      'routes': 'Marshrutlar',
      'directions': 'Ko\'rsatmalar',
      'directionsNotAvailable':
          'Yo\'nalish ko\'rsatmalari hozircha mavjud emas',
      'distance': 'Masofa',
      'refresh': 'Yangilash',
      'radius': 'radius',
      'noNearbyStops': 'Yaqin atrofda avtobus bekatlari topilmadi',
      'tryIncreasingRadius':
          'Qidiruv radiusini oshirishga harakat qiling yoki boshqa joyga ko\'chiring',
      'errorLoadingStops': 'Bekatlari yuklashda xatolik yuz berdi',
      'routeMap': 'Yo\'nalish xaritasi',
      'routeMapNotAvailable': 'Yo\'nalish xaritasi mavjud emas',
      'pinchToZoom':
          'Kattalashtirish uchun qising, siljitish uchun sudrab boring',
      'scrollForMore': 'Pastga tushiring',
    },
  };

  static String get(String key, String languageCode) {
    // Convert to lowercase to ensure case-insensitive lookup
    final code = languageCode.toLowerCase();
    return _localizedValues[code]?[key] ?? key;
  }
}

class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    BuildContext context,
    Widget child,
    ScrollableDetails details,
  ) {
    return child;
  }

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    return const BouncingScrollPhysics();
  }
}

class WelcomeScreen extends StatelessWidget {
  final String languageCode;
  final VoidCallback onGetStarted;

  const WelcomeScreen({
    super.key,
    required this.languageCode,
    required this.onGetStarted,
  });

  String _t(String key) {
    return AppLanguage.get(key, languageCode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.indigo.shade800, Colors.indigo.shade600],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Bus icon
                Icon(
                  Icons.directions_bus_rounded,
                  size: 80,
                  color: Colors.white,
                ),
                SizedBox(height: 40),
                // Title
                Text(
                  _t('welcomeTitle'),
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                // Subtitle
                Text(
                  _t('welcomeSubtitle'),
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white.withAlpha(230),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 60),
                // Get started button
                ElevatedButton(
                  onPressed: onGetStarted,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.indigo,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    textStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text(_t('getStarted')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NearbyBusStopsScreen extends StatefulWidget {
  final Position userPosition;
  final String languageCode;
  final String Function(String) t;

  const NearbyBusStopsScreen({
    super.key,
    required this.userPosition,
    required this.languageCode,
    required this.t,
  });

  @override
  State<NearbyBusStopsScreen> createState() => _NearbyBusStopsScreenState();
}

// Add this class to your file (before the build method in your state class):

class _BouncingArrow extends StatefulWidget {
  @override
  _BouncingArrowState createState() => _BouncingArrowState();
}

class _BouncingArrowState extends State<_BouncingArrow>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(
      begin: 0,
      end: 5,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, _animation.value),
          child: Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 24),
        );
      },
    );
  }
}

class _NearbyBusStopsScreenState extends State<NearbyBusStopsScreen> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final Set<Circle> _circles = {};
  List<BusStop> _nearbyStops = [];
  bool _isLoading = true;

  // Search radius in meters
  final double _searchRadius = 1000;

  @override
  void initState() {
    super.initState();
    _initializeMap();
    _loadNearbyBusStops();
  }

  void _initializeMap() {
    // Add user location marker
    _markers.add(
      Marker(
        markerId: const MarkerId('user_location'),
        position: LatLng(
          widget.userPosition.latitude,
          widget.userPosition.longitude,
        ),
        infoWindow: InfoWindow(title: widget.t('myLocation')),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );

    // Add a circle to show search radius
    _circles.add(
      Circle(
        circleId: const CircleId('search_radius'),
        center: LatLng(
          widget.userPosition.latitude,
          widget.userPosition.longitude,
        ),
        radius: _searchRadius,
        fillColor: Colors.blue.withAlpha(51),
        strokeColor: Colors.blue,
        strokeWidth: 1,
      ),
    );
  }

  Future<void> _loadNearbyBusStops() async {
    setState(() {
      _isLoading = true;
    });

    try {
      // In a real app, you'd fetch this data from an API
      // For now, we'll use mock data
      await Future.delayed(Duration(seconds: 1)); // Simulate network delay

      List<BusStop> stops = _getMockBusStops();

      // Calculate distance from user for each stop
      final List<BusStop> stopsWithDistance =
          stops.map((stop) {
            final double distanceInMeters = _calculateDistance(
              widget.userPosition.latitude,
              widget.userPosition.longitude,
              stop.position.latitude,
              stop.position.longitude,
            );
            return stop.copyWith(distance: distanceInMeters);
          }).toList();

      // Filter stops within search radius
      final nearbyStops =
          stopsWithDistance
              .where(
                (stop) =>
                    stop.distance != null && stop.distance! <= _searchRadius,
              )
              .toList();

      // Sort by distance
      nearbyStops.sort((a, b) => (a.distance ?? 0).compareTo(b.distance ?? 0));

      // Create markers for each nearby bus stop
      for (var stop in nearbyStops) {
        _markers.add(
          Marker(
            markerId: MarkerId(stop.id),
            position: stop.position,
            infoWindow: InfoWindow(
              title: stop.name,
              snippet: '${widget.t('routes')}: ${stop.routes.join(', ')}',
            ),
            icon: BitmapDescriptor.defaultMarkerWithHue(
              BitmapDescriptor.hueRed,
            ),
          ),
        );
      }

      setState(() {
        _nearbyStops = nearbyStops;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${widget.t('errorLoadingStops')}: $e')),
      );
    }
  }

  // Calculate distance between two coordinates in meters using Haversine formula
  double _calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // meters
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);

    final double a =
        math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) *
            math.cos(_toRadians(lat2)) *
            math.sin(dLon / 2) *
            math.sin(dLon / 2);

    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    return earthRadius * c;
  }

  double _toRadians(double degrees) {
    return degrees * math.pi / 180;
  }

  // Mock data - in a real app, you'd get this from your backend or a local database
  List<BusStop> _getMockBusStops() {
    // Create some bus stops around the user's location
    final userLat = widget.userPosition.latitude;
    final userLng = widget.userPosition.longitude;

    return [
      BusStop(
        id: 'stop1',
        name: 'Central Station',
        position: LatLng(userLat + 0.001, userLng + 0.002),
        routes: ['1', '5', '8'],
      ),
      BusStop(
        id: 'stop2',
        name: 'Market Street',
        position: LatLng(userLat - 0.002, userLng + 0.001),
        routes: ['2', '7', '10'],
      ),
      BusStop(
        id: 'stop3',
        name: 'University Campus',
        position: LatLng(userLat + 0.003, userLng - 0.002),
        routes: ['3', '9'],
      ),
      BusStop(
        id: 'stop4',
        name: 'Main Square',
        position: LatLng(userLat - 0.001, userLng - 0.003),
        routes: ['1', '6', '12'],
      ),
      BusStop(
        id: 'stop5',
        name: 'Hospital',
        position: LatLng(userLat + 0.005, userLng + 0.005),
        routes: ['4', '8'],
      ),
      BusStop(
        id: 'stop6',
        name: 'Sports Center',
        position: LatLng(userLat - 0.005, userLng - 0.006),
        routes: ['5', '11'],
      ),
      BusStop(
        id: 'stop7',
        name: 'Shopping Mall',
        position: LatLng(userLat + 0.008, userLng - 0.001),
        routes: ['2', '7', '9'],
      ),
    ];
  }

  void _goToUserLocation() {
    _mapController?.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(widget.userPosition.latitude, widget.userPosition.longitude),
        15,
      ),
    );
  }

  void _goToStop(BusStop stop) {
    _mapController?.animateCamera(CameraUpdate.newLatLng(stop.position));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.t('nearbyBusStops')),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _loadNearbyBusStops,
            tooltip: widget.t('refresh'),
          ),
          IconButton(
            icon: const Icon(Icons.my_location),
            onPressed: _goToUserLocation,
            tooltip: widget.t('myLocation'),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                widget.userPosition.latitude,
                widget.userPosition.longitude,
              ),
              zoom: 15,
            ),
            onMapCreated: (controller) {
              setState(() {
                _mapController = controller;
              });
            },
            markers: _markers,
            circles: _circles,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
          ),

          // Loading indicator
          if (_isLoading)
            const Center(
              child: Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: CircularProgressIndicator(),
                ),
              ),
            ),

          // Bus stops list panel
          if (!_isLoading && _nearbyStops.isNotEmpty)
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(26),
                      blurRadius: 10,
                      offset: const Offset(0, -2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.t('nearbyBusStops')} (${_nearbyStops.length})',
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${_searchRadius.round()}m ${widget.t('radius')}',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                    const Divider(height: 1),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _nearbyStops.length,
                        itemBuilder: (context, index) {
                          final stop = _nearbyStops[index];
                          return ListTile(
                            leading: const Icon(
                              Icons.location_on,
                              color: Colors.red,
                            ),
                            title: Text(stop.name),
                            subtitle: Text(
                              '${widget.t('routes')}: ${stop.routes.join(', ')} • ${(stop.distance ?? 0).round()}m',
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.directions),
                              onPressed: () {
                                // In a real app, this would show directions
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      widget.t('directionsNotAvailable'),
                                    ),
                                  ),
                                );
                              },
                              tooltip: widget.t('directions'),
                            ),
                            onTap: () => _goToStop(stop),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Empty state message
          if (!_isLoading && _nearbyStops.isEmpty)
            Center(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        Icons.location_off,
                        size: 48,
                        color: Colors.grey,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        widget.t('noNearbyStops'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        widget.t('tryIncreasingRadius'),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class BusRouteApp extends StatefulWidget {
  const BusRouteApp({super.key});

  @override
  State<BusRouteApp> createState() => _BusRouteAppState();
}

class _BusRouteAppState extends State<BusRouteApp> {
  String _languageCode = 'en'; // Default to Russian
  bool _showWelcome =
      true; // The line to track if welcome screen should be shown

  void _changeLanguage(String languageCode) {
    setState(() {
      _languageCode = languageCode;
    });
  }

  void _hideWelcome() {
    setState(() {
      _showWelcome = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bus Tracker',
      debugShowCheckedModeBanner: false,
      scrollBehavior: CustomScrollBehavior(),
      theme: ThemeData.dark(useMaterial3: true).copyWith(
        primaryColor: Colors.indigo,
        colorScheme: const ColorScheme.dark(
          primary: Colors.indigo,
          secondary: Colors.tealAccent,
          surface: Color(0xFF1E1E1E),
          surfaceTint: Color(0xFF1E1E1E),
          surfaceContainerHighest: Color(0xFF121212),
        ),
        cardTheme: const CardTheme(color: Color(0xFF252525)),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.indigo,
          elevation: 4,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.indigo,
            foregroundColor: Colors.white,
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(foregroundColor: Colors.tealAccent),
        ),
      ),
      home:
          _showWelcome
              ? WelcomeScreen(
                languageCode: _languageCode,
                onGetStarted: _hideWelcome,
              )
              : BusRoutePage(
                languageCode: _languageCode,
                onLanguageChanged: _changeLanguage,
              ),
    );
  }
}

class BusRoute {
  final int id;
  final String routeNumber;
  final String routeName;
  final String operatingHours;
  final String duration;
  final String routeLength;
  final String busDepot;

  BusRoute({
    required this.id,
    required this.routeNumber,
    required this.routeName,
    required this.operatingHours,
    required this.duration,
    required this.routeLength,
    required this.busDepot,
  });
}

class BusStop {
  final String id;
  final String name;
  final LatLng position;
  final List<String> routes;
  final double? distance; // Optional distance from user

  BusStop({
    required this.id,
    required this.name,
    required this.position,
    required this.routes,
    this.distance,
  });

  // Create a copy with distance field set
  BusStop copyWith({double? distance}) {
    return BusStop(
      id: id,
      name: name,
      position: position,
      routes: routes,
      distance: distance ?? this.distance,
    );
  }
}

class BusRoutePage extends StatefulWidget {
  final String languageCode;
  final Function(String) onLanguageChanged;

  const BusRoutePage({
    super.key,
    required this.languageCode,
    required this.onLanguageChanged,
  });

  @override
  State<BusRoutePage> createState() => _BusRoutePageState();
}

class _BusRoutePageState extends State<BusRoutePage> {
  int _currentIndex = 0;
  BusRoute? _selectedRoute;

  String _searchQuery = '';
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  Position? _currentPosition; // Add this line to store the current position
  bool _isLoadingLocation =
      false; // Add this to track when location is being fetched
  bool _showScrollIndicator = true; // Add this line here

  final _formKey = GlobalKey<FormState>();
  final _controllers = <String, TextEditingController>{
    'routeNumber': TextEditingController(),
    'routeName': TextEditingController(),
    'operatingHours': TextEditingController(),
    'duration': TextEditingController(),
    'routeLength': TextEditingController(),
    'busDepot': TextEditingController(),
  };

  // Sample bus routes data
  final List<BusRoute> _busRoutes = [
    // Example data commented out to show empty state by default
    BusRoute(
      id: 1,
      routeNumber: '1',
      routeName: 'Массив Ахмада Югнаки – ЦУМ «Ташкент»',
      operatingHours: '05:45 – 22:10',
      duration: '41,5 мин',
      routeLength: '16,9 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 2,
      routeNumber: '2',
      routeName: 'Массив Чиланзар, 25 квартал – Площадь Дархан',
      operatingHours: '05:20 – 23:00',
      duration: '55,5 мин',
      routeLength: '20,8 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 3,
      routeNumber: '3',
      routeName: 'Рынок ТТЗ – Рынок Юнусабад',
      operatingHours: '06:05 – 22:00',
      duration: '40 мин',
      routeLength: '16,5 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 4,
      routeNumber: '5',
      routeName: 'Массив Феруза – Торговый центр «Чорсу»',
      operatingHours: '05:30 – 23:00',
      duration: '53,5 мин',
      routeLength: '19,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 5,
      routeNumber: '6',
      routeName: 'Юнусабад, 17 квартал – Юнусабад, 6 квартал',
      operatingHours: '05:20 – 22:00',
      duration: '25,0 мин',
      routeLength: '7,8 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 6,
      routeNumber: '7',
      routeName: 'Юнусабад, 10 квартал – Юнусабад, 19 квартал',
      operatingHours: '06:10 – 22:50',
      duration: '25,0 мин',
      routeLength: '9,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 7,
      routeNumber: '8',
      routeName: 'Массив Сергели-10 – Массив Чиланзар, 25 квартал',
      operatingHours: '05:20 – 23:30',
      duration: '55,0 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 8,
      routeNumber: '8T',
      routeName: 'Метро Чорсу – Махалля Найман',
      operatingHours: '05:55 – 22:00',
      duration: '45,2 мин',
      routeLength: '17,1 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 9,
      routeNumber: '9T',
      routeName: 'Массив Чиланзар, 25 квартал – Вокзал «Ташкент»',
      operatingHours: '05:45 – 22:30',
      duration: '47,2 мин',
      routeLength: '14,2 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 10,
      routeNumber: '11',
      routeName: 'Аэропорт местных линий – Массив Бельтепа',
      operatingHours: '05:00 – 23:00',
      duration: '60,5 мин',
      routeLength: '24,1 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 11,
      routeNumber: '12',
      routeName: 'Рынок Куйлюк – Международный аэропорт',
      operatingHours: '05:50 – 23:00',
      duration: '65,3 мин',
      routeLength: '23,7 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 12,
      routeNumber: '13',
      routeName: 'Массив Изза – ЦУМ «Ташкент»',
      operatingHours: '05:20 – 23:00',
      duration: '62,0 мин',
      routeLength: '21,1 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 13,
      routeNumber: '13T',
      routeName: 'Массив Водник – Вокзал «Ташкент»',
      operatingHours: '05:25 – 22:30',
      duration: '40,0 мин',
      routeLength: '15,0 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 14,
      routeNumber: '14',
      routeName: 'Вокзал «Ташкент» – Автостанция ТТЗ',
      operatingHours: '05:20 – 23:00',
      duration: '50,5 мин',
      routeLength: '15,9 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 15,
      routeNumber: '15',
      routeName: 'Массив Куйлюк-1 – Метро Дустлик',
      operatingHours: '05:25 – 22:00',
      duration: '30,0 мин',
      routeLength: '14,3 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 16,
      routeNumber: '16',
      routeName: 'Вокзал «Ташкент» Автостанция ТТЗ',
      operatingHours: '05:50 – 22:30',
      duration: '50,5 мин',
      routeLength: '17,4 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 17,
      routeNumber: '17',
      routeName: 'Массив Ахмада Югнаки – Торговый центр «Чорсу»',
      operatingHours: '05:40 – 23:30',
      duration: '57,5 мин',
      routeLength: '22,55 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 18,
      routeNumber: '17T',
      routeName: 'Массив Бекабад – Вещевой рынок Чиланзар',
      operatingHours: '05:30 – 21:00',
      duration: '45,2 мин',
      routeLength: '20,3 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 19,
      routeNumber: '18',
      routeName: 'Метро Чиланзар – Массив Тузель, 3 квартал',
      operatingHours: '05:30 – 23:00',
      duration: '50,0 мин',
      routeLength: '17,6 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 20,
      routeNumber: '19',
      routeName: 'ТТЗ – ЦУМ «Ташкент»',
      operatingHours: '05:45 – 22:00',
      duration: '49,5 мин',
      routeLength: '17,1 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 21,
      routeNumber: '20',
      routeName: 'Массив Ибн Сино-1 – Улица Гулабад (Чорсу)',
      operatingHours: '05:00 – 21:00',
      duration: '25,0 мин',
      routeLength: '7,3 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 22,
      routeNumber: '21',
      routeName: 'Массив Карасу-1 – ЦУМ «Ташкент»',
      operatingHours: '05:55 – 22:30',
      duration: '39,0 мин',
      routeLength: '13,3 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 23,
      routeNumber: '22',
      routeName: 'ЦУМ «Ташкент» – Метро Дустлик',
      operatingHours: '05:55 – 22:30',
      duration: '45,5 мин',
      routeLength: '15,2 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 24,
      routeNumber: '23',
      routeName: 'Фархадский рынок – Метро Чорсу',
      operatingHours: '06:50 – 21:50',
      duration: '35,5 мин',
      routeLength: '9,44 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 25,
      routeNumber: '24',
      routeName: 'Махалля Дурмень – Юнусабад, 6 квартал',
      operatingHours: '05:20 – 23:00',
      duration: '70,5 мин',
      routeLength: '24,6 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 26,
      routeNumber: '25',
      routeName: 'Юнусабад, 9 квартал – Рынок ТТЗ',
      operatingHours: '05:30 – 20:50',
      duration: '55,2 мин',
      routeLength: '19,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 27,
      routeNumber: '26',
      routeName: 'Махалля Мажнунтол – Алайский рынок',
      operatingHours: '05:45 – 22:00',
      duration: '60,5 мин',
      routeLength: '20,7 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 28,
      routeNumber: '27',
      routeName: 'Торговый центр «Чорсу» – Махалля Кукча Аклан',
      operatingHours: '06:30 – 19:30',
      duration: '16,0 мин',
      routeLength: '5,8 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 29,
      routeNumber: '28',
      routeName: 'Медицинская академия – Массив Янгиабад',
      operatingHours: '05:50 – 23:30',
      duration: '70,5 мин',
      routeLength: '23,1 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 30,
      routeNumber: '29',
      routeName: 'Махалля Хувайдо – Метро Пахтакор',
      operatingHours: '05:30 – 20:00',
      duration: '25,2 мин',
      routeLength: '6,7 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 31,
      routeNumber: '30',
      routeName: 'Махалля Олмос – ЦУМ «Ташкент»',
      operatingHours: '05:15 – 23:00',
      duration: '60,0 мин',
      routeLength: '19,2 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 32,
      routeNumber: '31',
      routeName: 'Массив Каракамыш 2/4 – Рынок Чинни',
      operatingHours: '05:30 – 22:00',
      duration: '58,0 мин',
      routeLength: '22,5 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 33,
      routeNumber: '32',
      routeName: 'Массив Сергели-6а – Улица Гулабад (Чорсу)',
      operatingHours: '05:30 – 23:00',
      duration: '67,0 мин',
      routeLength: '24,2 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 34,
      routeNumber: '33',
      routeName: 'Торговый центр "Саодат" – Рынок Урикзор',
      operatingHours: '05:30 – 23:00',
      duration: '45,0 мин',
      routeLength: '14,2 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 35,
      routeNumber: '34',
      routeName: 'Метро Чиланзар – Медицинский городок',
      operatingHours: '05:30 – 23:30',
      duration: '50,0 мин',
      routeLength: '14,5 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 36,
      routeNumber: '35',
      routeName: 'Детская больница №5 – Улица М. Тургунбаевой',
      operatingHours: '05:30 – 21:30',
      duration: '40,0 мин',
      routeLength: '13,5 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 37,
      routeNumber: '37',
      routeName: 'ЦУМ «Ташкент» – Аэропорт местных линий',
      operatingHours: '05:40 – 23:00',
      duration: '51,5 мин',
      routeLength: '19,4 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 38,
      routeNumber: '38',
      routeName: 'Массив Сергели-10 – Массив Бадамзар',
      operatingHours: '05:00 – 23:30',
      duration: '65,5 мин',
      routeLength: '20,8 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 39,
      routeNumber: '39',
      routeName: 'Метро Тузель – Рынок «Food City»',
      operatingHours: '05:45 – 22:00',
      duration: '40,2 мин',
      routeLength: '15,5 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 40,
      routeNumber: '40',
      routeName: 'Сергели, 12 квартал – Вокзал «Ташкент»',
      operatingHours: '05:15 – 22:30',
      duration: '63,0 мин',
      routeLength: '22,7 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 41,
      routeNumber: '41',
      routeName: 'Массив Чиланзар, 25 квартал – Вещевой рынок Чиланзар',
      operatingHours: '05:45 – 22:00',
      duration: '35,5 мин',
      routeLength: '8,3 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 42,
      routeNumber: '42',
      routeName: 'Торговый центр «Чорсу» – Поселок Кенсай',
      operatingHours: '06:10 – 21:30',
      duration: '55,8 мин',
      routeLength: '21,2 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 43,
      routeNumber: '43',
      routeName: 'Юнусабад, 6 квартал – Институт Фтизиатрии',
      operatingHours: '05:55 – 22:00',
      duration: '49,5 мин',
      routeLength: '17,9 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 44,
      routeNumber: '44',
      routeName: 'Авиасозлар – Торговый центр «Чорсу»',
      operatingHours: '05:20 – 23:15',
      duration: '40,0 мин',
      routeLength: '13,5 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 45,
      routeNumber: '45',
      routeName: 'Массив Кушбеги – Рынок «Food City»',
      operatingHours: '05:00 – 23:10',
      duration: '50,5 мин',
      routeLength: '24,5 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 46,
      routeNumber: '46',
      routeName: 'Массив Бирлик – Завод РЭТ',
      operatingHours: '04:50 – 23:00',
      duration: '58,0 мин',
      routeLength: '20,2 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 47,
      routeNumber: '47',
      routeName: 'Массив Дустлик -2 – Улица Гулабад (Чорсу)',
      operatingHours: '05:40 – 22:00',
      duration: '62,5 мин',
      routeLength: '24,6 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 48,
      routeNumber: '48',
      routeName: 'Поселок Новатор – Массив Аль-Хорезми',
      operatingHours: '05:05 – 22:30',
      duration: '58,5 мин',
      routeLength: '22 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 49,
      routeNumber: '49',
      routeName: 'Автостанция ТТЗ – Массив Янгиабад',
      operatingHours: '05:30 – 22:30',
      duration: '55,0 мин',
      routeLength: '22,9 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 50,
      routeNumber: '50',
      routeName: 'Юнусабад, 9 квартал – Поселок Чингельды',
      operatingHours: '05:30 – 21:30',
      duration: '65,5 мин',
      routeLength: '24,8 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 51,
      routeNumber: '51',
      routeName: 'Юнусабад, 6 квартал – Площадь Бешагач',
      operatingHours: '05:40 – 23:20',
      duration: '41,0 мин',
      routeLength: '12,8 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 52,
      routeNumber: '52',
      routeName: 'Вокзал «Ташкент» – Авиагородок (Медсанчасть)',
      operatingHours: '06:00 – 22:00',
      duration: '15,0 мин',
      routeLength: '3,8 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 53,
      routeNumber: '53',
      routeName: 'Массив Урикзор – Метро Пахтакор',
      operatingHours: '05:20 – 22:00',
      duration: '52,0 мин',
      routeLength: '18,8 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 54,
      routeNumber: '54',
      routeName: 'Массив Куйлюк-1 – Метро Дустлик',
      operatingHours: '05:30 – 22:30',
      duration: '55,8 мин',
      routeLength: '19,4 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 55,
      routeNumber: '55',
      routeName: 'Улица Истиклол – Ташкентский трубный завод',
      operatingHours: '05:30 – 23:30',
      duration: '55,0 мин',
      routeLength: '19,7 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 56,
      routeNumber: '56',
      routeName: 'Махалля Таротешар – Торговый центр «Чорсу»',
      operatingHours: '05:00 – 21:30',
      duration: '55,0 мин',
      routeLength: '19,5 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 57,
      routeNumber: '57',
      routeName: 'Поселок Эркин – Алайский рынок',
      operatingHours: '05:40 – 23:15',
      duration: '49,0 мин',
      routeLength: '15,15 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 58,
      routeNumber: '58',
      routeName: 'Массив Дустлик -2 – Экскаваторный завод',
      operatingHours: '05:00 – 23:30',
      duration: '60,5 мин',
      routeLength: '23,3 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 59,
      routeNumber: '59',
      routeName: 'Массив Дустлик-2 – Рынок Урикзор',
      operatingHours: '05:30 – 20:30',
      duration: '70,0 мин',
      routeLength: '22,5 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 60,
      routeNumber: '60',
      routeName: 'ЦУМ «Ташкент» – Электрокабельный завод',
      operatingHours: '05:40 – 23:00',
      duration: '30,1 мин',
      routeLength: '10,1 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 61,
      routeNumber: '61',
      routeName: 'Международный аэропорт – Массив Янгиабад',
      operatingHours: '05:50 – 22:15',
      duration: '43,0 мин',
      routeLength: '19,3 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 62,
      routeNumber: '62',
      routeName: 'Массив Дустлик-2 – Улица Мухаммада Юсуфа',
      operatingHours: '05:30 – 21:30',
      duration: '62,5 мин',
      routeLength: '23,2 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 63,
      routeNumber: '63',
      routeName: 'Массив Карасу – 1 Рынок Юнусабад',
      operatingHours: '05:30 – 23:30',
      duration: '55,4 мин',
      routeLength: '19,4 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 64,
      routeNumber: '64',
      routeName: 'Массив Бирлик – Метро Пахтакор',
      operatingHours: '06:00 – 21:30',
      duration: '40,0 мин',
      routeLength: '13 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 65,
      routeNumber: '65',
      routeName: 'Метро Пахтакор – Махалля Сохибкор',
      operatingHours: '05:50 – 22:30',
      duration: '55,0 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 66,
      routeNumber: '66',
      routeName: 'Массив Спутник-17 – Вокзал Ташкент',
      operatingHours: '06:00 – 21:30',
      duration: '60,1 мин',
      routeLength: '19,5 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 67,
      routeNumber: '67',
      routeName: 'Юнусабад, 19 квартал – Международный аэропорт',
      operatingHours: '05:10 – 22:30',
      duration: '53,5 мин',
      routeLength: '18 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 68,
      routeNumber: '68',
      routeName: 'Торговый центр «Чорсу» – Рынок «Food City»',
      operatingHours: '06:00 – 23:00',
      duration: '67,0 мин',
      routeLength: '25,6 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 69,
      routeNumber: '69',
      routeName: 'Рынок Урикзор – Вокзал «Ташкент»',
      operatingHours: '05:30 – 23:00',
      duration: '64,0 мин',
      routeLength: '23,1 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 70,
      routeNumber: '70',
      routeName: 'Чиланзар, 20 квартал – Улица Мухаммада Юсуфа',
      operatingHours: '05:00 – 22:20',
      duration: '57,0 мин',
      routeLength: '20,8 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 71,
      routeNumber: '71',
      routeName: 'Массив Узумзор – Ж/с Чукурсай',
      operatingHours: '05:35 – 21:10',
      duration: '45,0 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 71,
      routeNumber: '71',
      routeName: 'Массив Узумзор – Ж/с Чукурсай',
      operatingHours: '05:35 – 21:10',
      duration: '45,0 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 72,
      routeNumber: '72',
      routeName: 'Авиасозлар – Площадь Джами',
      operatingHours: '05:35 – 23:10',
      duration: '60,0 мин',
      routeLength: '16,9 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 73,
      routeNumber: '73',
      routeName: 'Метро Чорсу – Рынок Чинни',
      operatingHours: '05:00 – 22:20',
      duration: '55,5 мин',
      routeLength: '22,3 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 74,
      routeNumber: '74',
      routeName: 'Метро Чиланзар – Махалля Найман',
      operatingHours: '04:45 – 21:30',
      duration: '55,5 мин',
      routeLength: '19,4 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 75,
      routeNumber: '75',
      routeName: 'Т/ц Tashkent Index – Площадь Актепа',
      operatingHours: '05:50 – 22:15',
      duration: '55,0 мин',
      routeLength: '18,1 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 76,
      routeNumber: '76',
      routeName: 'Массив Каракамыш 2/4 – Международный аэропорт',
      operatingHours: '05:20 – 23:00',
      duration: '50,2 мин',
      routeLength: '16,2 км',
      busDepot: 'Автосантранс Сервис',
    ),
    BusRoute(
      id: 77,
      routeNumber: '77',
      routeName: 'Массив Чиланзар, 25 квартал – Аэропорт местных линий',
      operatingHours: '05:10 – 23:15',
      duration: '60,0 мин',
      routeLength: '20,5 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 78,
      routeNumber: '78',
      routeName: 'Метро Беруни – Вокзал «Ташкент»',
      operatingHours: '05:45 – 23:00',
      duration: '65,0 мин',
      routeLength: '21,2 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 79,
      routeNumber: '80',
      routeName: 'Южный вокзал – Улица Мухаммада Юсуфа',
      operatingHours: '05:10 – 23:00',
      duration: '50,0 мин',
      routeLength: '19,2 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 80,
      routeNumber: '81',
      routeName: 'Улица Гулабад (Чорсу) – Массив Куйлюк-1',
      operatingHours: '05:35 – 23:00',
      duration: '50,2 мин',
      routeLength: '22,3 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 81,
      routeNumber: '82',
      routeName: 'Юнусабад, 17 квартал – Массив Ибн Сино-1',
      operatingHours: '05:20 – 22:30',
      duration: '65,5 мин',
      routeLength: '21,4 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 82,
      routeNumber: '83',
      routeName: 'Юнусабад, 6 квартал – Экскаваторный завод',
      operatingHours: '05:35 – 22:00',
      duration: '57,5 мин',
      routeLength: '17,3 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 83,
      routeNumber: '84',
      routeName: 'Махалля Обод Турмуш (Уртааул) – Улица Гулабад (Чорсу)',
      operatingHours: '05:30 – 21:30',
      duration: '70,8 мин',
      routeLength: '25,6 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 84,
      routeNumber: '85',
      routeName: 'Массив Каракамыш 2/4 – ЦУМ «Ташкент»',
      operatingHours: '06:00 – 23:30',
      duration: '43,5 мин',
      routeLength: '14 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 85,
      routeNumber: '86',
      routeName: 'Массив Сергели-12 – Метро Алмазар',
      operatingHours: '05:00 – 22:30',
      duration: '45,0 мин',
      routeLength: '16,3 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 86,
      routeNumber: '87',
      routeName: 'Чиланзар, 30 квартал – Массив Каракамыш 2/4',
      operatingHours: '06:20 – 23:00',
      duration: '60,0 мин',
      routeLength: '22,1 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 87,
      routeNumber: '88',
      routeName: 'Массив Ибн Сино-1 – Улица Мухаммада Юсуфа',
      operatingHours: '05:30 – 23:15',
      duration: '65,0 мин',
      routeLength: '20,8 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 88,
      routeNumber: '89',
      routeName: 'Массив Карасу-1 – Торговый центр «Чорсу»',
      operatingHours: '05:35 – 23:00',
      duration: '51,5 мин',
      routeLength: '17,3 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 89,
      routeNumber: '91',
      routeName: 'Юнусабад, 15 квартал – Мечеть Кукча',
      operatingHours: '06:00 – 23:00',
      duration: '48,5 мин',
      routeLength: '15,8 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 90,
      routeNumber: '93',
      routeName: 'Рынок «Food City» – Юнусабад, 9 квартал',
      operatingHours: '04:45 – 22:30',
      duration: '75,5 мин',
      routeLength: '21,5 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 91,
      routeNumber: '94',
      routeName: 'Рынок Урикзор – Международный аэропорт',
      operatingHours: '04:40 – 23:50',
      duration: '59,0 мин',
      routeLength: '20,3 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 92,
      routeNumber: '95',
      routeName: 'Юнусабад 15 квартал – Авиасозлар',
      operatingHours: '05:45 – 22:30',
      duration: '55,0 мин',
      routeLength: '21,1 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 93,
      routeNumber: '96',
      routeName: 'Юнусабад, 9 квартал – Метро Машинасозлар',
      operatingHours: '05:30 – 23:00',
      duration: '55,0 мин',
      routeLength: '18,2 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 94,
      routeNumber: '97',
      routeName: 'Рынок Юнусабад – Вокзал «Ташкент»',
      operatingHours: '05:50 – 22:30',
      duration: '45,0 мин',
      routeLength: '12,1 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 95,
      routeNumber: '98',
      routeName: 'Вещевой рынок Чиланзар – Гостиница Узбекистан',
      operatingHours: '05:30 – 23:05',
      duration: '60,2 мин',
      routeLength: '18,7 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 96,
      routeNumber: '99',
      routeName: 'Массив Водник – Фархадский рынок',
      operatingHours: '05:35 – 23:15',
      duration: '55,3 мин',
      routeLength: '23,9 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 97,
      routeNumber: '100',
      routeName: 'Массив Каракамыш 2/4 – Площадь Бешагач',
      operatingHours: '05:30 – 23:00',
      duration: '55,0 мин',
      routeLength: '17,1 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 98,
      routeNumber: '101',
      routeName: 'Метро Буюк Ипак Йули – Махалля Дархан',
      operatingHours: '05:40 – 23:10',
      duration: '70,0 мин',
      routeLength: '25,8 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 99,
      routeNumber: '103',
      routeName: 'Торговый центр «Чорсу» – Вещевой рынок Чиланзар',
      operatingHours: '05:25 – 22:00',
      duration: '40,0 мин',
      routeLength: '17,7 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 100,
      routeNumber: '104',
      routeName: 'Метро Курувчилар – Махалля Согдиана',
      operatingHours: '06:00 – 21:30',
      duration: '45,0 мин',
      routeLength: '14,4 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 101,
      routeNumber: '105',
      routeName: 'Поселок Сергели – Вещевой рынок Чиланзар',
      operatingHours: '06:00 – 22:00',
      duration: '60,0 мин',
      routeLength: '19,3 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 102,
      routeNumber: '106',
      routeName: 'Махалля Учхоз – Торговый центр "Саодат"',
      operatingHours: '04:50 – 23:15',
      duration: '70,1 мин',
      routeLength: '28,5 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 103,
      routeNumber: '109',
      routeName: 'Метро Чорсу – Ж/с Чукурсай',
      operatingHours: '05:00 – 21:30',
      duration: '35,5 мин',
      routeLength: '9,4 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 104,
      routeNumber: '110',
      routeName: 'Рынок «Food City» – Автостанция ТТЗ',
      operatingHours: '05:45 – 23:00',
      duration: '75,0 мин',
      routeLength: '30,6 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 105,
      routeNumber: '112',
      routeName: 'Массив Сергели-10 – Рынок Куйлюк',
      operatingHours: '07:00 – 21:00',
      duration: '50,5 мин',
      routeLength: '19,8 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 106,
      routeNumber: '113',
      routeName: 'Станция Аэрации – Метро Чиланзар',
      operatingHours: '06:00 – 21:30',
      duration: '30,5 мин',
      routeLength: '7,8 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 107,
      routeNumber: '114',
      routeName: 'Массив Ибн Сино-2 – Массив Кушбеги',
      operatingHours: '05:10 – 23:30',
      duration: '52,5 мин',
      routeLength: '20,1 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 108,
      routeNumber: '115',
      routeName: 'Поселок ТашГРЭС – Улица Гулабад (Чорсу)',
      operatingHours: '05:00 – 23:00',
      duration: '50,0 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 109,
      routeNumber: '116',
      routeName: 'Медицинский городок – Вещевой рынок Чиланзар',
      operatingHours: '05:00 – 23:20',
      duration: '62,0 мин',
      routeLength: '18,85 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 110,
      routeNumber: '117',
      routeName: 'Ташкентский трубный завод – Рынок «Food City»',
      operatingHours: '05:00 – 21:30',
      duration: '45,5 мин',
      routeLength: '17,5 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 111,
      routeNumber: '118',
      routeName: 'Вещевой рынок Чиланзар – Узпослсавдо',
      operatingHours: '05:20 – 23:30',
      duration: '70,0 мин',
      routeLength: '26,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 112,
      routeNumber: '119',
      routeName: 'Массив Куйлюк-1 – Рынок Юнусабад',
      operatingHours: '05:50 – 23:00',
      duration: '54,2 мин',
      routeLength: '22,4 км',
      busDepot: 'Автопарк 1',
    ),
    BusRoute(
      id: 113,
      routeNumber: '120',
      routeName: 'Метро Чорсу – Махалля Гулистан',
      operatingHours: '05:30 – 23:00',
      duration: '55,0 мин',
      routeLength: '19,3 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 114,
      routeNumber: '121',
      routeName: 'Юнусабад, 9 квартал – Рынок Чинни',
      operatingHours: '05:30 – 22:00',
      duration: '71,0 мин',
      routeLength: '29,2 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 115,
      routeNumber: '122',
      routeName: 'Рынок Урикзор – Метро Рохат',
      operatingHours: '05:30 – 22:30',
      duration: '65,0 мин',
      routeLength: '28,3 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 116,
      routeNumber: '123',
      routeName: 'Метро Чорсу – Ж/с Чукурсай',
      operatingHours: '05:30 – 22:30',
      duration: '52,5 мин',
      routeLength: '19,6 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 117,
      routeNumber: '124',
      routeName: 'Юнусабад, 9 квартал – Метро Беруни',
      operatingHours: '05:40 – 22:30',
      duration: '45,4 мин',
      routeLength: '14,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 118,
      routeNumber: '125',
      routeName: 'Массив Урикзор – Массив Домбрабад',
      operatingHours: '05:30 – 22:30',
      duration: '41,0 мин',
      routeLength: '13,6 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 119,
      routeNumber: '126',
      routeName: 'Метро Курувчилар – Торговый центр «Чорсу»',
      operatingHours: '05:45 – 21:45',
      duration: '64,0 мин',
      routeLength: '24,8 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 120,
      routeNumber: '127',
      routeName: 'Массив Чиланзар, 25 квартал – Автостанция Авиасозлар',
      operatingHours: '05:30 – 23:30',
      duration: '65,0 мин',
      routeLength: '23,6 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 121,
      routeNumber: '128',
      routeName: 'Рынок “Food City” – Ункурган',
      operatingHours: '05:40 – 22:00',
      duration: '55,7 мин',
      routeLength: '32,6 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 122,
      routeNumber: '129',
      routeName: 'Авиасозлар – Юнусабад, 17 квартал',
      operatingHours: '05:45 – 23:00',
      duration: '59,5 мин',
      routeLength: '18,2 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 123,
      routeNumber: '130',
      routeName: 'Массив Сергели-10 – Рынок «Food City»',
      operatingHours: '05:30 – 22:00',
      duration: '79,5 мин',
      routeLength: '29,5 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 124,
      routeNumber: '131',
      routeName: 'Массив Дустлик-2 – Гостиница Олимпия',
      operatingHours: '05:00 – 23:00',
      duration: '68,0 мин',
      routeLength: '24,45 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 125,
      routeNumber: '132',
      routeName: 'Махалля Янги Дархан – Махалля Ташкент',
      operatingHours: '05:30 – 22:15',
      duration: '40,0 мин',
      routeLength: '14,6 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 126,
      routeNumber: '133',
      routeName: 'Метро Чинор – Рынок «Food City»',
      operatingHours: '06:00 – 21:00',
      duration: '50,0 мин',
      routeLength: '16,1 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 127,
      routeNumber: '134',
      routeName: 'Южный вокзал – Поселок Назарбек',
      operatingHours: '05:55 – 23:00',
      duration: '40,0 мин',
      routeLength: '16,3 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 128,
      routeNumber: '135',
      routeName: 'Текстильный комбинат – Поселок Назарбек',
      operatingHours: '05:50 – 21:30',
      duration: '47,5 мин',
      routeLength: '17,7 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 129,
      routeNumber: '136',
      routeName: 'Метро Чорсу – Экскаваторный завод',
      operatingHours: '05:40 – 22:30',
      duration: '25,7 мин',
      routeLength: '7,3 км',
      busDepot: 'Автопарк 2',
    ),
    BusRoute(
      id: 130,
      routeNumber: '137',
      routeName: 'Махалля Кушкурган – Новый Ташкент',
      operatingHours: '05:45 – 21:00',
      duration: '65,5 мин',
      routeLength: '28,4 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 131,
      routeNumber: '138',
      routeName: 'Метро Беруни – Махалля Бунёдкор',
      operatingHours: '06:00 – 22:15',
      duration: '30,5 мин',
      routeLength: '9,1 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 132,
      routeNumber: '139',
      routeName: 'Метро Чиланзар – Массив Бирлик',
      operatingHours: '05:55 – 23:15',
      duration: '23,5 мин',
      routeLength: '5,7 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 133,
      routeNumber: '140',
      routeName: 'Юнусабад, 12 квартал – Институт искусства',
      operatingHours: '05:30 – 23:00',
      duration: '50,2 мин',
      routeLength: '15,4 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 134,
      routeNumber: '141',
      routeName: 'Рынок Урикзор – Метро Пахтакор',
      operatingHours: '05:30 – 21:30',
      duration: '55,2 мин',
      routeLength: '17,4 км',
      busDepot: 'Автопарк 7',
    ),
    BusRoute(
      id: 135,
      routeNumber: '142',
      routeName: 'Махалля Катта Хасанбай – Махалля Тикланиш',
      operatingHours: '06:00 – 22:00',
      duration: '40 мин',
      routeLength: '13,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 136,
      routeNumber: '143',
      routeName: 'Площадь Бабура – Т/ц Tashkent Index',
      operatingHours: '06:30 – 19:00',
      duration: '40,2 мин',
      routeLength: '15,9 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 137,
      routeNumber: '144',
      routeName: 'Массив Дустлик-2 – Метро Курувчилар',
      operatingHours: '06:00 – 20:00',
      duration: '35,2 мин',
      routeLength: '12,6 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 138,
      routeNumber: '145',
      routeName: 'Мавзолей Зангиата – Рынок Куйлюк',
      operatingHours: '05:55 – 22:15',
      duration: '48,0 мин',
      routeLength: '18,8 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 139,
      routeNumber: '146',
      routeName: 'Торговый центр «Чорсу» – Рынок Чинни',
      operatingHours: '06:00 – 22:30',
      duration: '51,5 мин',
      routeLength: '16 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 140,
      routeNumber: '147',
      routeName: 'Торговый центр «Чорсу» – Рынок Чинни',
      operatingHours: '04:50 – 21:00',
      duration: '53,0 мин',
      routeLength: '21,6 км',
      busDepot: 'Автопарк 18',
    ),
    BusRoute(
      id: 141,
      routeNumber: '148',
      routeName: 'Махалля Аргын – Вокзал «Ташкент»',
      operatingHours: '05:20 – 22:45',
      duration: '60,0 мин',
      routeLength: '17,1 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 142,
      routeNumber: '149',
      routeName: 'Рынок Юнусабад – Массив Карасу-1',
      operatingHours: '06:00 – 22:30',
      duration: '45,0 мин',
      routeLength: '12,8 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 143,
      routeNumber: '150',
      routeName: 'ШПО «Малика» – Массив Чиланзар, 25 квартал',
      operatingHours: '05:15 – 23:05',
      duration: '55,5 мин',
      routeLength: '19,5 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 144,
      routeNumber: '151',
      routeName: 'Метро Буюк Ипак Йули – Поселок Чингельды',
      operatingHours: '05:45 – 22:30',
      duration: '35,5 мин',
      routeLength: '15,9 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 145,
      routeNumber: '152',
      routeName: 'Торговый центр «Чорсу» – Финансовый лицей',
      operatingHours: '05:20 – 21:30',
      duration: '45,6 мин',
      routeLength: '16,3 км',
      busDepot: 'Автопарк 8',
    ),
    BusRoute(
      id: 146,
      routeNumber: '153',
      routeName: 'Клиника ПМИ – Поселок Кибрай',
      operatingHours: '06:00 – 20:30',
      duration: '35,2 мин',
      routeLength: '16,2 км',
      busDepot: 'Автопарк 5',
    ),
    BusRoute(
      id: 147,
      routeNumber: '154',
      routeName: 'Махалля Бабура – Спец. клиника Зангиоты',
      operatingHours: '05:45 – 22:00',
      duration: '30,5 мин',
      routeLength: '16,1 км',
      busDepot: 'Автопарк 4',
    ),
    BusRoute(
      id: 148,
      routeNumber: '156',
      routeName: 'Сергели-3 (Ярмарка) – Махалля Галаба',
      operatingHours: '06:30 – 22:15',
      duration: '36 мин',
      routeLength: '20,4 км',
      busDepot: 'Автопарк 12',
    ),
    BusRoute(
      id: 149,
      routeNumber: '157',
      routeName: 'Юнусабад, 19 квартал – Метро Пахтакор',
      operatingHours: '05:20 – 21:30',
      duration: '45 мин',
      routeLength: '12,9 км',
      busDepot: 'Автопарк 8',
    ),
  ];

  List<BusRoute> get _filteredRoutes {
    if (_searchQuery.isEmpty) {
      return _busRoutes;
    }
    return _busRoutes.where((route) {
      return route.routeNumber.toLowerCase().contains(_searchQuery) ||
          route.routeName.toLowerCase().contains(_searchQuery) ||
          route.busDepot.toLowerCase().contains(_searchQuery);
    }).toList();
  }

  Future<void> _getCurrentLocation() async {
    setState(() {
      _isLoadingLocation = true;
    });

    try {
      // Check location permissions
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permission denied
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(_t('locationPermissionDenied'))),
          );
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permission permanently denied
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(_t('locationPermissionPermanentlyDenied')),
            action: SnackBarAction(
              label: _t('openSettings'),
              onPressed: () {
                Geolocator.openAppSettings();
              },
            ),
          ),
        );
        return;
      }

      // Get current position
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      setState(() {
        _currentPosition = position;
      });

      // Show location information
      _showLocationInfo(position);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('${_t('locationError')}: $e')));
    } finally {
      setState(() {
        _isLoadingLocation = false;
      });
    }
  }

  // Helper method to get translated text
  String _t(String key) {
    return AppLanguage.get(key, widget.languageCode);
  }

  String _getLanguageDisplayName(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return 'EN';
      case 'ru':
        return 'RU';
      case 'uz':
        return 'UZ';
      default:
        return code.toUpperCase();
    }
  }

  void _showLocationInfo(Position position) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(_t('myLocation')),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${_t('latitude')}: ${position.latitude.toStringAsFixed(6)}',
                ),
                Text(
                  '${_t('longitude')}: ${position.longitude.toStringAsFixed(6)}',
                ),
                SizedBox(height: 16),
                Text(_t('nearbyBusStops')),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(_t('close')),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder:
                          (context) => NearbyBusStopsScreen(
                            userPosition: position,
                            languageCode: widget.languageCode,
                            t: _t,
                          ),
                    ),
                  );
                },
                child: Text(_t('viewOnMap')),
              ),
            ],
          ),
    );
  }

  void _toggleLanguage() {
    // Cycle through languages: ru -> en -> uz -> ru
    final String newLanguageCode;
    switch (widget.languageCode.toLowerCase()) {
      case 'ru':
        newLanguageCode = 'en';
        break;
      case 'en':
        newLanguageCode = 'uz';
        break;
      default:
        newLanguageCode = 'ru';
    }
    widget.onLanguageChanged(newLanguageCode);
  }

  void _showAddRouteForm() {
    _clearFormControllers();
    setState(() => _currentIndex = 1);
  }

  void _showRouteDetails(BusRoute route) {
    setState(() {
      _selectedRoute = route;
      _currentIndex = 2;
    });
  }

  void _showRouteMap(String routeNumber) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder:
          (context) => Dialog(
            insetPadding: EdgeInsets.all(16),
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${_t('route')} №$routeNumber',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  ),
                  Divider(height: 1),
                  Expanded(
                    child: InteractiveViewer(
                      minScale: 0.5,
                      maxScale: 4.0,
                      boundaryMargin: EdgeInsets.all(double.infinity),
                      child: Image.network(
                        'https://tashtrans.uz/gallery/busshema/$routeNumber.jpg',
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return Center(
                            child: CircularProgressIndicator(
                              value:
                                  loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                            ),
                          );
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.error_outline,
                                size: 48,
                                color: Colors.red,
                              ),
                              SizedBox(height: 16),
                              Text(
                                _t('routeMapNotAvailable'),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          );
                        },
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      _t('pinchToZoom'),
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ),
          ),
    );
  }

  void _showEditRouteForm(BusRoute route) {
    _controllers['routeNumber']!.text = route.routeNumber;
    _controllers['routeName']!.text = route.routeName;
    _controllers['operatingHours']!.text = route.operatingHours;
    _controllers['duration']!.text = route.duration;
    _controllers['routeLength']!.text = route.routeLength;
    _controllers['busDepot']!.text = route.busDepot;
    setState(() {
      _selectedRoute = route;
      _currentIndex = 1;
    });
  }

  void _clearFormControllers() {
    _controllers.forEach((_, controller) => controller.clear());
    _selectedRoute = null;
  }

  void _addRoute() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _busRoutes.add(
          BusRoute(
            id: _busRoutes.length + 1,
            routeNumber: _controllers['routeNumber']!.text,
            routeName: _controllers['routeName']!.text,
            operatingHours: _controllers['operatingHours']!.text,
            duration: _controllers['duration']!.text,
            routeLength: _controllers['routeLength']!.text,
            busDepot: _controllers['busDepot']!.text,
          ),
        );
        _clearFormControllers();
        _currentIndex = 0;
      });
    }
  }

  void _updateRoute() {
    if (_formKey.currentState!.validate() && _selectedRoute != null) {
      setState(() {
        final index = _busRoutes.indexWhere((r) => r.id == _selectedRoute!.id);
        if (index != -1) {
          _busRoutes[index] = BusRoute(
            id: _selectedRoute!.id,
            routeNumber: _controllers['routeNumber']!.text,
            routeName: _controllers['routeName']!.text,
            operatingHours: _controllers['operatingHours']!.text,
            duration: _controllers['duration']!.text,
            routeLength: _controllers['routeLength']!.text,
            busDepot: _controllers['busDepot']!.text,
          );
        }
        _clearFormControllers();
        _currentIndex = 0;
      });
    }
  }

  void _deleteRoute(BusRoute route) {
    setState(() {
      _busRoutes.removeWhere((r) => r.id == route.id);
      if (_selectedRoute?.id == route.id) {
        _selectedRoute = null;
        _currentIndex = 0;
      }
    });
  }

  void _startSearch() {
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearch() {
    setState(() {
      _isSearching = false;
      _searchQuery = '';
      _searchController.clear();
    });
  }

  void _updateSearchQuery(String newQuery) {
    setState(() {
      _searchQuery = newQuery.toLowerCase();
    });
  }

  void _shareRoute(BusRoute route) {
    // Format the share text with route details
    String shareText = _t('shareText')
        .replaceAll('{routeNumber}', route.routeNumber)
        .replaceAll('{routeName}', route.routeName)
        .replaceAll('{operatingHours}', route.operatingHours)
        .replaceAll('{duration}', route.duration)
        .replaceAll('{routeLength}', route.routeLength)
        .replaceAll('{busDepot}', route.busDepot);

    // Share the route info
    Share.share(shareText, subject: _t('shareSubject'));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _controllers.forEach((_, controller) => controller.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            _isSearching
                ? TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: _t('searchHint'),
                    border: InputBorder.none,
                    hintStyle: const TextStyle(color: Colors.white70),
                  ),
                  style: const TextStyle(color: Colors.white),
                  autofocus: true,
                  onChanged: _updateSearchQuery,
                )
                : Text(_t('routesTitle')),
        actions: [
          // Search icon
          if (!_isSearching && _currentIndex == 0)
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: _startSearch,
              tooltip: _t('search'),
            ),
          // Close search
          if (_isSearching)
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: _stopSearch,
              tooltip: _t('closeSearch'),
            ),
          // Language toggle
          if (!_isSearching)
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.indigo.shade300,
                borderRadius: BorderRadius.circular(4),
              ),
              child: TextButton(
                onPressed: _toggleLanguage,
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                child: Text(
                  _getLanguageDisplayName(widget.languageCode),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          // Add route button
          if (_currentIndex == 0 && !_isSearching)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: _showAddRouteForm,
              tooltip: _t('addRoute'),
            ),
          // Back button
          if (_currentIndex != 0 && !_isSearching)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                setState(() {
                  _currentIndex = 0;
                  _clearFormControllers();
                });
              },
            ),
        ],
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildAllRoutesScreen(),
          _buildAddEditRouteScreen(),
          _buildRouteDetailsScreen(),
        ],
      ),
    );
  }

  Widget _buildAllRoutesScreen() {
    final routes = _filteredRoutes;

    return Stack(
      children: [
        // Main content
        if (routes.isEmpty)
        // Empty state handling
          _searchQuery.isNotEmpty
              ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.search_off, size: 48, color: Colors.grey),
                const SizedBox(height: 16),
                Text(
                  _t('noSearchResults'),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          )
              : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _t('noRoutesMessage'),
                  style: const TextStyle(fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  onPressed: _showAddRouteForm,
                  icon: const Icon(Icons.add),
                  label: Text(_t('addRoute')),
                ),
              ],
            ),
          )
        else
        // List of routes
          AnimationLimiter(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification && _showScrollIndicator) {
                  if (scrollNotification.metrics.pixels > 100) {
                    setState(() {
                      _showScrollIndicator = false;
                    });
                  }
                }
                return false;
              },
              child: ListView.builder(
                padding: const EdgeInsets.only(bottom: 80, left: 8, right: 8, top: 8),
                itemCount: routes.length,
                itemBuilder: (context, index) {
                  final route = routes[index];
                  final isEven = index % 2 == 0;
                  final cardColor = isEven
                      ? Theme.of(context).cardTheme.color
                      : Theme.of(context).cardTheme.color!.withAlpha(217);

                  return AnimationConfiguration.staggeredList(
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: SlideAnimation(
                      verticalOffset: 50.0,
                      child: FadeInAnimation(
                        child: Dismissible(
                          key: Key('route-${route.id}'),
                          direction: DismissDirection.horizontal,
                          background: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            alignment: Alignment.centerLeft,
                            padding: const EdgeInsets.only(left: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade700.withAlpha(179),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _t('edit'),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            margin: const EdgeInsets.only(bottom: 12),
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.only(right: 20.0),
                            decoration: BoxDecoration(
                              color: Colors.red.shade700.withAlpha(179),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  _t('delete'),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          confirmDismiss: (direction) async {
                            if (direction == DismissDirection.endToStart) {
                              return await showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text(_t('delete')),
                                    content: Text('${_t('route')} №${route.routeNumber}: ${route.routeName}'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(false),
                                        child: Text(_t('cancel')),
                                      ),
                                      TextButton(
                                        onPressed: () => Navigator.of(context).pop(true),
                                        child: Text(_t('delete')),
                                      ),
                                    ],
                                  );
                                },
                              );
                            } else {
                              _showEditRouteForm(route);
                              return false;
                            }
                          },
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              _deleteRoute(route);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('${_t('route')} №${route.routeNumber} ${_t('deleted')}'),
                                  action: SnackBarAction(
                                    label: _t('undo'),
                                    onPressed: () {
                                      setState(() {
                                        _busRoutes.insert(index, route);
                                      });
                                    },
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          child: InkWell(
                            onTap: () => _showRouteDetails(route),
                            borderRadius: BorderRadius.circular(12),
                            splashColor: Colors.indigo.withAlpha(77),
                            highlightColor: Colors.indigo.withAlpha(26),
                            child: Card(
                              margin: const EdgeInsets.only(bottom: 12),
                              elevation: 3,
                              color: cardColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: Colors.indigo.withAlpha(51),
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                          decoration: BoxDecoration(
                                            color: Colors.indigo.withAlpha(51),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            "${_t('route')} №${route.routeNumber}",
                                            style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            IconButton(
                                              icon: const Icon(Icons.share),
                                              onPressed: () => _shareRoute(route),
                                              tooltip: _t('share'),
                                              visualDensity: VisualDensity.compact,
                                              iconSize: 20,
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.map),
                                              onPressed: () => _showRouteMap(route.routeNumber),
                                              tooltip: _t('routeMap'),
                                              visualDensity: VisualDensity.compact,
                                              iconSize: 20,
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.edit),
                                              onPressed: () => _showEditRouteForm(route),
                                              tooltip: _t('edit'),
                                              visualDensity: VisualDensity.compact,
                                              iconSize: 20,
                                            ),
                                            IconButton(
                                              icon: const Icon(Icons.delete),
                                              onPressed: () => _deleteRoute(route),
                                              tooltip: _t('delete'),
                                              visualDensity: VisualDensity.compact,
                                              iconSize: 20,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const Divider(),
                                    _buildEnhancedInfoRow(Icons.route, "${_t('routeName')}:", route.routeName),
                                    _buildEnhancedInfoRow(Icons.access_time, "${_t('operatingHours')}:", route.operatingHours),
                                    _buildEnhancedInfoRow(Icons.timer, "${_t('duration')}:", route.duration),
                                    _buildEnhancedInfoRow(Icons.straighten, "${_t('routeLength')}:", route.routeLength),
                                    _buildEnhancedInfoRow(Icons.local_shipping, "${_t('busDepot')}:", route.busDepot),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

        // Floating scroll indicator
        if (_showScrollIndicator && routes.length > 5)
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                height: 44,
                width: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.indigo.shade600, Colors.indigo.shade800],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 8,
                      offset: Offset(0, 2),
                      spreadRadius: 1,
                    ),
                  ],
                  border: Border.all(
                    color: Colors.indigo.shade400,
                    width: 0.5,
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(22),
                    onTap: () {
                      // Scroll down when tapped - future implementation
                    },
                    splashColor: Colors.white.withOpacity(0.1),
                    highlightColor: Colors.white.withOpacity(0.1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: 8),
                        Text(
                          _t('scrollForMore'),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),

        // My Location Button - positioned at bottom right
        Positioned(
          bottom: 24,
          right: 24,
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.indigo.shade600, Colors.indigo.shade800],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black45,
                  blurRadius: 8,
                  offset: Offset(0, 2),
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              shape: CircleBorder(
                side: BorderSide(color: Colors.indigo.shade400, width: 0.5),
              ),
              child: InkWell(
                onTap: _isLoadingLocation ? null : _getCurrentLocation,
                customBorder: CircleBorder(),
                splashColor: Colors.white.withOpacity(0.2),
                highlightColor: Colors.white.withOpacity(0.1),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: _isLoadingLocation
                      ? SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2.5,
                    ),
                  )
                      : Icon(
                    Icons.my_location_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEnhancedInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon for visual enhancement
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: Icon(
              icon,
              size: 18,
              color: Colors.tealAccent.withAlpha(179),
            ),
          ),
          // Label with fixed width
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey[300],
              ),
            ),
          ),
          // Value with expanded width
          Expanded(
            child: Text(value, style: const TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildFormField(String key, String labelKey, {String? hintKey}) {
    final label = _t(labelKey);
    final hint = hintKey != null ? _t(hintKey) : null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: _controllers[key],
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          hintText: hint,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return _t("enter$labelKey");
          }
          return null;
        },
      ),
    );
  }

  Widget _buildAddEditRouteScreen() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _selectedRoute == null ? _t('addNewRoute') : _t('editRouteTitle'),
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            _buildFormField('routeNumber', 'routeNumber'),
            _buildFormField('routeName', 'routeName'),
            _buildFormField(
              'operatingHours',
              'operatingHours',
              hintKey: 'hoursExample',
            ),
            _buildFormField('duration', 'duration', hintKey: 'durationExample'),
            _buildFormField(
              'routeLength',
              'routeLength',
              hintKey: 'lengthExample',
            ),
            _buildFormField('busDepot', 'busDepot'),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _selectedRoute == null ? _addRoute : _updateRoute,
                child: Text(
                  _selectedRoute == null ? _t('addRoute') : _t('save'),
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRouteDetailsScreen() {
    if (_selectedRoute == null) {
      return Center(child: Text(_t('routeNotSelected')));
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${_t('route')} №${_selectedRoute!.routeNumber}",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 20),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildDetailRow(
                    "${_t('routeName')}:",
                    _selectedRoute!.routeName,
                  ),
                  _buildDetailRow(
                    "${_t('operatingHours')}:",
                    _selectedRoute!.operatingHours,
                  ),
                  _buildDetailRow(
                    "${_t('duration')}:",
                    _selectedRoute!.duration,
                  ),
                  _buildDetailRow(
                    "${_t('routeLength')}:",
                    _selectedRoute!.routeLength,
                  ),
                  _buildDetailRow(
                    "${_t('busDepot')}:",
                    _selectedRoute!.busDepot,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            _t('routeInfo'),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Text(_t('additionalInfo'), style: const TextStyle(fontSize: 16)),
          const SizedBox(height: 20),
          // Replace the current Row in the details screen with this more flexible layout:
          // Replace the current Wrap layout with this centered version:
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Wrap(
                alignment:
                    WrapAlignment
                        .center, // This centers the buttons in each row
                spacing: 12.0, // Increased spacing between buttons
                runSpacing: 12.0, // Spacing between rows
                children: [
                  OutlinedButton.icon(
                    onPressed: () => _shareRoute(_selectedRoute!),
                    icon: const Icon(Icons.share),
                    label: Text(_t('share')),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () => _showEditRouteForm(_selectedRoute!),
                    icon: const Icon(Icons.edit),
                    label: Text(_t('edit')),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      _deleteRoute(_selectedRoute!);
                    },
                    icon: const Icon(Icons.delete),
                    label: Text(_t('delete')),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.redAccent,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 160,
            child: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: Text(value, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }
}
