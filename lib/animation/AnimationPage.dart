import 'package:flutter/material.dart';
import 'NormalAnimateWidget.dart';
import 'BuilderAnimateWidget.dart';
import 'WidgetAnimateWidget.dart';
import 'HeroTransition.dart';


class AnimationPage extends StatelessWidget {
  AnimationPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: TabBarView(
          children: [
            NormalAnimateWidget(),
            BuilderAnimateWidget(),
            WidgetAnimateWidget(),
            Page1()
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home),text: "普通动画",),
            Tab(icon: Icon(Icons.rss_feed),text: "Builder动画",),
            Tab(icon: Icon(Icons.perm_identity),text: "Widget动画",),
            Tab(icon: Icon(Icons.message),text:'hero动画')
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }
}
