import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:friendsync/repository/messages.dart';
import 'package:friendsync/screens/map/map_screen.dart';
import 'package:friendsync/state/friend_requests/request_bloc.dart';
import 'package:friendsync/state/friendsync_logger.dart';
import 'package:friendsync/state/theme/theme_cubit.dart';
import '../../screens/profile/profile_screen.dart';
import '../../screens/friends/friends_screen.dart';
import '../../screens/home/home_screen.dart';

enum NavigationBody { home, friendList, map, profile }

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FriendsScreen(),
    const MapScreen(),
    const AccountScreen(),
  ];

  @override
  void initState() {
    super.initState();

    /* This is here for the new friendrequest indicator on navbar */
    final bloc = context.read<FriendRequestBloc>();
    if (bloc.state is FriendRequestInitial) {
      bloc.add(FriendRequestRefresh());
    }

    /* 📩 Enables server pushes to our app :) */
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      FirebaseMessaging messaging = FirebaseMessaging.instance;

      await messaging.requestPermission();

      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        Messenger().handleMessage(message, context);
      });

      FriendsyncLogger.i("Successful setup for message listening!");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: BlocBuilder<FriendRequestBloc, FriendRequestState>(
        builder: (context, state) {
          bool hasRequests =
              state is FriendRequestLoaded && state.incomingRequests.isNotEmpty;

          return BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, themeMode) {
              final theme = Theme.of(context);

              return Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: theme.shadowColor.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, -1),
                    ),
                  ],
                ),
                clipBehavior: Clip.antiAlias,
                child: NavigationBar(
                  key: UniqueKey(),
                  onDestinationSelected: (int index) {
                    setState(() {
                      _currentIndex = index;
                    });
                  },
                  indicatorColor: theme.colorScheme.secondaryContainer,
                  backgroundColor: theme.cardColor,
                  height: 80,
                  selectedIndex: _currentIndex,
                  destinations: <Widget>[
                    const NavigationDestination(
                      selectedIcon: Icon(Icons.home_rounded),
                      icon: Icon(Icons.home_rounded),
                      label: 'Home',
                    ),
                    NavigationDestination(
                      selectedIcon: Stack(
                        clipBehavior: Clip.none, // render outside stack bounds
                        children: [
                          const Icon(Icons.people),
                          if (hasRequests)
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 9,
                                  minHeight: 9,
                                ),
                              ),
                            ),
                        ],
                      ),
                      icon: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          const Icon(Icons.people),
                          if (hasRequests)
                            Positioned(
                              right: -5,
                              top: -5,
                              child: Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                                constraints: const BoxConstraints(
                                  minWidth: 9,
                                  minHeight: 9,
                                ),
                              ),
                            ),
                        ],
                      ),
                      label: 'Friends',
                    ),
                    const NavigationDestination(
                      selectedIcon: Icon(Icons.map_rounded),
                      icon: Icon(Icons.map_rounded),
                      label: 'Map',
                    ),
                    const NavigationDestination(
                      selectedIcon: Icon(Icons.person_rounded),
                      icon: Icon(Icons.person_rounded),
                      label: 'Profile',
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
