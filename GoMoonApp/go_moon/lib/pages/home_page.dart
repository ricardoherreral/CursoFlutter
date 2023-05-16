import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  late double _deviceHeight, _deviceWidth;

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: _deviceHeight,
          width: _deviceWidth,
          padding: EdgeInsets.symmetric(
            horizontal: _deviceWidth * 0.05,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _pageTitle(),
              _destinationDropDownWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _destinationDropDownWidget() {
    List<String> _items = [
      'Ricas Web Station',
      'Prenure Station',
    ];
    return Container(
      padding: EdgeInsets.symmetric(horizontal: _deviceWidth * 0.05),
      width: _deviceWidth,
      decoration: BoxDecoration(
        color: Color.fromRGBO(53, 53, 53, 1.0),
        borderRadius: BorderRadius.circular(
          10,
        ),
      ),
      child: DropdownButton(
        value: _items.first,
        items: _items.map((e) {
          return DropdownMenuItem(
            child: Text(e),
            value: e,
          );
        }).toList(),
        onChanged: (_) {},
        underline: Container(),
        dropdownColor: Color.fromRGBO(
          53,
          53,
          53,
          1.0,
        ),
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return Container(
        child: Text(
      "#GoMoon",
      style: TextStyle(
        color: Colors.white,
        fontSize: 70,
        fontWeight: FontWeight.w800,
      ),
    ));
  }

  Widget _astroImageWidget() {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/images/astro_moon.png"),
          ),
        ),
      ),
    );
  }
}
