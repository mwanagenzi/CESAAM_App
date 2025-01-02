import 'package:cesaam_feedback_app/screens/cesaam_bio_screen.dart';
import 'package:cesaam_feedback_app/screens/cesaam_media_handles.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'CESAAM',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true, //TODO: define in app theme
        bottom: TabBar(
            controller: _tabController,
            labelStyle: const TextStyle(color: Colors.white),
            tabs: const [
              Tab(
                text: 'Who We Are',
              ),
              Tab(
                text: 'Media',
              ),
            ]),
      ),
      body: TabBarView(controller: _tabController, children: const [
        CESAAMBioScreen(),
        MediaHandlesScreen(),
      ]),
    );
  }
}
