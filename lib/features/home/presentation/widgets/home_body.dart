import 'package:flutter/material.dart';
import 'package:instagram_clone/features/home/presentation/widgets/offstage_navigator.dart';
import 'package:instagram_clone/features/home/presentation/widgets/tab_item.dart';

class HomeBody extends StatelessWidget {
  const HomeBody(this.navKeys, {super.key});
  final Map<TabItem, GlobalKey<NavigatorState>> navKeys;

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      OffstageNavigator(
        tabItem: TabItem.feed,
        navKey: navKeys[TabItem.feed],
        screen: const Placeholder(),
      ),
      OffstageNavigator(
        tabItem: TabItem.search,
        navKey: navKeys[TabItem.search],
        screen: const Placeholder(),
      ),
      OffstageNavigator(
          tabItem: TabItem.favorites,
          navKey: navKeys[TabItem.favorites],
          screen: const Placeholder()),
      OffstageNavigator(
        tabItem: TabItem.profile,
        navKey: navKeys[TabItem.profile],
        screen: const Placeholder(),
      ),
    ]);
  }
}