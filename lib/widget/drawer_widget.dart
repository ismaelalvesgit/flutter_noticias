
import 'package:flutter/material.dart';
import 'package:noticias/widget/drawer_tile.dart';

class DrawerWidget extends StatelessWidget {

  final PageController pageController;

  DrawerWidget(this.pageController);

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 203, 236, 241),
              Colors.white
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter
        )
    ),
  );

//  Widget _widget_background_menu() => Container(
//    decoration: BoxDecoration(
//      image: DecorationImage(image: AssetImage("images/backgroun-menu.jpg"),
//          fit: BoxFit.cover
//      ),
//    ),
//  );


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          _buildDrawerBack(),
          ListView(
            children: <Widget>[
              Container(
                width: double.maxFinite,
                height: 170.0,
                child: Stack(
                  children: <Widget>[
//                    _widget_background_menu(),
//                    Container(
//                      margin: EdgeInsets.only(top: 20.0, left: 10.0),
//                      child: Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Container(
//                            width: 100.0,
//                            height: 100.0,
//                            decoration: BoxDecoration(
//                                borderRadius: BorderRadius.circular(50.0),
//                                image: DecorationImage(image: AssetImage("images/user.png"))
//                            ),
//                          ),
//                          Text("Nome do usuário",
//                            style: TextStyle(
//                                fontFamily: "Roboto",
//                                color: Colors.white,
//                                fontSize: 25.0
//                            ),
//                          )
//                        ],
//                      ),
//                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    DrawerTile(Icons.home, "Início", pageController, 0),
                    DrawerTile(Icons.insert_emoticon, "Entreterimento", pageController, 1),
                    DrawerTile(Icons.device_hub, "Ciencias", pageController, 2),
                    DrawerTile(Icons.blur_circular, "Sport", pageController, 3),
                    DrawerTile(Icons.computer, "Tecnologia", pageController, 4),
                    DrawerTile(Icons.healing, "Saúde", pageController, 5),
                  ],
                ),
              )

            ],
          )
        ],
      ),
    );
  }
}
