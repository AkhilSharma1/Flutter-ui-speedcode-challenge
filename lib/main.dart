import 'package:flutter/material.dart';
import 'package:ui_templates/data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
        colors: [Color(0xFF696D77), Color(0xFF292C36)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        tileMode: TileMode.clamp,
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.favorite_border,
                size: 20.0,
                color: Colors.white,
              ),
              onPressed: () {},
            )
          ],
          title: Text(
            'Energy Cloud',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18.0,
                fontFamily: "Montserrat-Bold"),
          ),
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 20.0,
            ),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: <Widget>[
            _buildTopPart(),
            BottomPart(),
          ],
        ),
      ),
    );
  }

  _buildTopPart() {
    return Container(
      width: double.infinity,
      height: 245.0,
      child: Stack(
        children: <Widget>[
          Container(
            child: Image.asset(
              'assets/adidas.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              // color: Colors.blue,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration:
                  BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
              child: Image.asset('assets/360.png'),
            ),
          )
        ],
      ),
    );
  }
}

class BottomPart extends StatefulWidget {
  @override
  _BottomPartState createState() => _BottomPartState();
}

class _BottomPartState extends State<BottomPart> {
  bool isExpanded = false;
  int currentColorIndex = 0;
  int currentSizeIndex = 0;
  void expand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<Widget> colorSelector() {
    List<Widget> colorItemList = new List();

    for (var i = 0; i < colors.length; i++) {
      colorItemList
          .add(colorItem(colors[i], i == currentColorIndex, context, () {
        setState(() {
          currentColorIndex = i;
        });
      }));
    }

    return colorItemList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 18.0),
            child: Text(
              'Product Description',
              style: TextStyle(
                color: Color(0xFF949598),
                fontSize: 10.0,
                fontFamily: "Montserrat-SemiBold",
              ),
            ),
          ),
          SizedBox(height: 8.0),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 18.0),
            child: AnimatedCrossFade(
              firstChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontFamily: "Montserrat-Medium",
                ),
                maxLines: 2,
              ),
              secondChild: Text(
                desc,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 10.0,
                  fontFamily: "Montserrat-Medium",
                ),
              ),
              crossFadeState: isExpanded
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: kThemeAnimationDuration,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 26.0, right: 18.0),
            child: GestureDetector(
              child: Text(
                isExpanded ? 'less...' : 'more...',
                style: TextStyle(
                    color: Color(0xFFFB382F), fontWeight: FontWeight.w700),
              ),
              onTap: expand,
            ),
          ),
          SizedBox(height: 12.0),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 75.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Size',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: 10.0,
                      fontFamily: "Montserrat-SemiBold"),
                ),
                Text(
                  'Quantity',
                  style: TextStyle(
                      color: Color(0xFF949598),
                      fontSize: 10.0,
                      fontFamily: "Montserrat-SemiBold"),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: sizeNumlist.map((item) {
                  var index = sizeNumlist.indexOf(item);
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        currentSizeIndex = index;
                      });
                    },
                    child: sizeItem(item, index == currentSizeIndex, context),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  width: 100.0,
                  height: 30.0,
                  decoration: BoxDecoration(
                      color: Color(0xFF525663),
                      borderRadius: BorderRadius.circular(5.0)),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: _decrease,
                          child: Container(
                            height: double.infinity,
                            child: Text(
                              "-",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Bold"),
                            ),
                          ),
                        ),
                      ),
                      divider(),
                      Flexible(
                        flex: 3,
                        child: Container(
                          height: double.infinity,
                          child: Text(
                            "-",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontFamily: "Montserrat-Bold"),
                          ),
                        ),
                      ),
                      divider(),
                      Flexible(
                        flex: 3,
                        child: GestureDetector(
                          onTap: _incease,
                          child: Container(
                            height: double.infinity,
                            child: Text(
                              "+",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontFamily: "Montserrat-Bold"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 18.0),
            child: Text("Select Color",
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontSize: 10.0,
                    fontFamily: "Montserrat-SemiBold")),
          ),
          SizedBox(
            height: 8.0,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(left: 20.0),
            height: 34.0,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: colorSelector(),
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text("Price",
                style: TextStyle(
                    color: Color(0xFF949598),
                    fontFamily: "Montserrat-SemiBold")),
          ),
        ],
      ),
    );
  }

  Widget sizeItem(String size, bool isSelected, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12.0),
      child: Container(
        width: 30.0,
        height: 30.0,
        decoration: BoxDecoration(
            color: isSelected ? Color(0xFFFC3930) : Color(0xFF525663),
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                  color: isSelected
                      ? Colors.black.withOpacity(.5)
                      : Colors.black12,
                  offset: Offset(0.0, 10.0),
                  blurRadius: 10.0)
            ]),
        child: Center(
          child: Text(size,
              style: TextStyle(
                  color: Colors.white, fontFamily: "Montserrat-Bold")),
        ),
      ),
    );
  }

  Widget colorItem(
      Color color, bool isSelected, BuildContext context, VoidCallback _ontab) {
    return GestureDetector(
      onTap: _ontab,
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Container(
          width: 30.0,
          height: 30.0,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                          color: Colors.black.withOpacity(.8),
                          blurRadius: 10.0,
                          offset: Offset(0.0, 10.0))
                    ]
                  : []),
          child: ClipPath(
            clipper: MClipper(),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  void _decrease() {}

  void _incease() {}
}

class MClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    path.lineTo(0.0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

Widget divider() {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
    child: Container(
      width: 0.8,
      color: Colors.black,
    ),
  );
}
