import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  VoidCallback _showBottomLogin;

  VoidCallback _showBottomCadastro;

  VoidCallback _showBottomResetPass;

  VoidCallback _showButtonEmailConfir;

  VoidCallback _showButtonUserCad;

  @override
  void initState() {
    super.initState();
    _showBottomLogin = _showBottomSheetLogin;
    _showBottomCadastro = _showBottomSheetCadastro;
    _showBottomResetPass = _showBottomSheetResetPass;
    _showButtonEmailConfir = _showBottomSheetEmailConfir;
    _showButtonUserCad = _showBottomSheetUserCad;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  /*Style modal button usuario ja cadastrado*/
  void _showBottomSheetUserCad(){
    setState(() {
      _showButtonUserCad = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return Stack(
        children: <Widget>[
          _widget_background_login(),
          Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 50.0),
            padding: EdgeInsets.all(25.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)
            ),
            child: Stack(
              children: <Widget>[
                Positioned(
                    right: 0.0,
                    child: IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.grey,
                      iconSize: 25.0,
                    )
                ),
                Column(
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      height: 160.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage("images/logo.png"))
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        const Text("Ops, você já está cadastrado.",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 30.0,
                              fontFamily: "Roboto"),
                        ),
                        const Text("Seu e-mail já está registrado no aquarelo."
                            "Se não completou seu cadastro confira sua caixa de "
                            "entrada ou redefina su senha",
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 20.0,
                              fontFamily: "Roboto"),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      height: 40.0,
                      width: double.infinity,
                      margin: EdgeInsets.only(left: 3.0, right: 3.0, top: 3.0,bottom: 25.0),
                      child: OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(
                            color: Colors.blue
                        ),
                        child: const Text(
                          "REDEFINIR SENHA",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 18.0,
                              fontFamily: "Roboto"),
                        ),
                        highlightColor: Colors.white,
                        highlightedBorderColor: Colors.blueAccent,
                      ),
                    ),
                    Container(
                      height: 40.0,
                      width: double.infinity,
                      margin: EdgeInsets.all(3.0),
                      child: OutlineButton(
                        onPressed: () {},
                        borderSide: BorderSide(
                            color: Colors.black
                        ),
                        child: const Text(
                          "CONTINUAR",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: "Roboto"),
                        ),
                        highlightColor: Colors.white,
                        highlightedBorderColor: Colors.blueAccent,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showButtonUserCad = _showBottomSheetUserCad;
        });
      }
    });

  }

  /*Style modal button email de confirmação*/

  void _showBottomSheetEmailConfir(){
    setState(() {
      _showButtonEmailConfir = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return Stack(
        children: <Widget>[
          _widget_background_login(),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 50.0),
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                      right: 0.0,
                      child: IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.grey,
                        iconSize: 25.0,
                      )
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: 160.0,
                        height: 160.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("images/logo.png"))
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          const Text("Pronto. Bem-vindo ao aquarelo.",
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 30.0,
                                fontFamily: "Roboto"),
                          ),
                          const Text("Enviamos um e-mail de confirmação para você, "
                              "confira sua caixa de entrada e complete seu cadastro.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 20.0,
                                fontFamily: "Roboto"),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 40.0,
                        width: double.infinity,
                        margin: EdgeInsets.all(3.0),
                        child: OutlineButton(
                          onPressed: () {},
                          borderSide: BorderSide(
                              color: Colors.black
                          ),
                          child: const Text(
                            "CONTINUAR",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontFamily: "Roboto"),
                          ),
                          highlightColor: Colors.white,
                          highlightedBorderColor: Colors.blueAccent,
                        ),
                      ),
                    ],
                  )
                ],
              ),
          )
        ],
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showButtonEmailConfir = _showBottomSheetEmailConfir;
        });
      }
    });

  }

  /*Style modal button reset Pass*/
  void _showBottomSheetResetPass(){
    setState(() {
      _showBottomResetPass = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return Stack(
        children: <Widget>[
          _widget_background_login(),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 50.0),
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 0.0,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          iconSize: 25.0,
                        )
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/logo.png"))
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text("Redefina sua senha abaixo:",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30.0,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Seu email:"
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text){},
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          width: double.infinity,
                          margin: EdgeInsets.all(10.0),
                          child: OutlineButton(
                            onPressed: () {
                              _showBottomSheetEmailConfir();
                            },
                            borderSide: BorderSide(
                                color: Colors.blue
                            ),
                            child: const Text(
                              "ENVIAR EMAIL DE RECUPERAÇÂO",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontFamily: "Roboto"),
                            ),
                            highlightColor: Colors.white,
                            highlightedBorderColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showBottomResetPass = _showBottomSheetResetPass;
        });
      }
    });

  }


  /*Style modal button Login*/

  void _showBottomSheetLogin(){
    setState(() {
      _showBottomLogin = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return Stack(
        children: <Widget>[
          _widget_background_login(),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 50.0),
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0)
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 0.0,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          iconSize: 25.0,
                        )
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage("images/logo.png"))
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text("Vamos começar?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30.0,
                                  fontFamily: "Roboto"),
                            ),
                            const Text("Entre agora.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30.0,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0,),
                        Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Seu email:"
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text){},
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Sua senha:"
                                  ),
                                  obscureText: true,
                                  validator: (text){},
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 30.0,),
                        FlatButton(onPressed: (){
                          _showBottomSheetResetPass();
                        },
                          child: Row(
                            children: <Widget>[
                              const Text("Esqueceu sua senha?",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 13.0
                                ),
                              ),
                              const Text("Recupere aqui.",
                                style: TextStyle(
                                    fontFamily: "Roboto",
                                    fontSize: 13.0,
                                    color: Colors.blue
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          width: double.infinity,
                          margin: EdgeInsets.all(3.0),
                          child: OutlineButton(
                            onPressed: () {},
                            borderSide: BorderSide(
                              color: Colors.blue
                            ),
                            child: const Text(
                              "ENTRAR",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontFamily: "Roboto"),
                            ),
                            highlightColor: Colors.white,
                            highlightedBorderColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showBottomLogin = _showBottomSheetLogin;
        });
      }
    });

  }

  /*Style momdal button Cadastro*/

  void _showBottomSheetCadastro(){
    setState(() {
      _showBottomCadastro = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet((context) {
      return Stack(
        children: <Widget>[
          _widget_background_login(),
          Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.only(left: 25.0, right: 25.0, bottom: 25.0, top: 50.0),
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0)
              ),
              child: SingleChildScrollView(
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        right: 0.0,
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: Colors.grey,
                          iconSize: 25.0,
                        )
                    ),
                    Column(
                      children: <Widget>[
                        Container(
                          width: 160.0,
                          height: 160.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(image: AssetImage("images/logo.png"))
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            const Text("Crie sua conta agora e aproveite todos os nossos benefícios.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 30.0,
                                  fontFamily: "Roboto"),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.0,),
                        Form(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Seu email:"
                                  ),
                                  keyboardType: TextInputType.emailAddress,
                                  validator: (text){},
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Sua senha:"
                                  ),
                                  obscureText: true,
                                  validator: (text){},
                                ),
                                TextFormField(
                                  decoration: InputDecoration(
                                      labelText: "Repita sua senha:"
                                  ),
                                  obscureText: true,
                                  validator: (text){},
                                ),
                              ],
                            )
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          height: 40.0,
                          width: double.infinity,
                          margin: EdgeInsets.all(3.0),
                          child: OutlineButton(
                            onPressed: () {
                              _showBottomSheetUserCad();
                            },
                            borderSide: BorderSide(
                                color: Colors.blue
                            ),
                            child: const Text(
                              "CADASTRAR",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18.0,
                                  fontFamily: "Roboto"),
                            ),
                            highlightColor: Colors.white,
                            highlightedBorderColor: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
          )
        ],
      );
    })
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showBottomCadastro = _showBottomSheetCadastro;
        });
      }
    });

  }

  /*Style Background*/

  Widget _widget_background_login(){
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/backgroun-login.jpg"),
        fit: BoxFit.cover
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: Stack(
        children: <Widget>[
          _widget_background_login(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 260.0,
                  height: 260.0,
                  child: Image.asset("images/logo.png"),
                ),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0 ,bottom: 5.0),
                width: double.infinity,
                height: 40.0,
                child: RaisedButton(onPressed: _showBottomSheetLogin,
                  color: Colors.white,
                  child: Text("JÁ TENHO UMA CONTA",
                    style: TextStyle(
                      color: Colors.blueAccent,
                      fontFamily: "Roboto",
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0, right: 10.0 ,top: 5.0, bottom: 10.0),
                width: double.infinity,
                height: 40.0,
                child: RaisedButton(onPressed: _showBottomSheetCadastro,
                  color: Colors.blue[400],
                  child: Text("CRIAR UMA CONTA AGORA",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: "Roboto",
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
