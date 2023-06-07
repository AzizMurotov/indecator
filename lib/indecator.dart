import 'package:flutter/material.dart';
import 'package:indecator/strings.dart';

import 'home_page.dart';

class IndicatorPage extends StatefulWidget {
  static const String id = "indecator_page";

  const IndicatorPage({Key? key}) : super(key: key);

  @override
  State<IndicatorPage> createState() => _IndicatorPageState();
}

class _IndicatorPageState extends State<IndicatorPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(
      initialPage: 0,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("indicator"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.id);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 20, left: 20, top: 5),
              child: Text(
                'Skip',
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              nimadir(
                image: 'assets/images/1.png',
                title: Strings.OneTitle,
                content: Strings.OneContent,
              ),
              nimadir(
                reverse: true,
                image: "assets/images/2.png",
                title: Strings.TwoTitle,
                content: Strings.TwoContent,
              ),
              nimadir(
                image: "assets/images/3.png",
                title: Strings.ThreeTitle,
                content: Strings.ThreeContent,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndecator(),
            ),
          )
        ],
      ),
    );
  }

  Widget nimadir({image, title, content, reverse = false}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                child: Image.asset(image),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
          Text(
            title,
            style: const TextStyle(
                color: Colors.green, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            content,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
  Widget _indecator(bool isActivite){
    return AnimatedContainer(duration: Duration(milliseconds: 300),
    height: 6,
      width: isActivite?30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
  List <Widget> _buildIndecator(){
    List<Widget> indecators = [];
    for(int i=0; i<3; i++){
      if(_currentIndex==i){
        indecators.add(_indecator(true));
      } else{
        indecators.add(_indecator(false));
      }
    }
    return indecators;
  }
}
