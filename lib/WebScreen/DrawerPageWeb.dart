import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:purewallet_search_engine/WebScreen/screen.dart';



class DrawerPageWeb extends StatelessWidget {
  final String imageurl;
  final String title;
  final String price;

  const DrawerPageWeb(
      {Key? key,
        required this.imageurl,
        required this.title,
        required this.price
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double standardDeviceWidth = 432;
    double standardDeviceHeith = 840;
    Size sizeDisplay = MediaQuery.of(context).size;
    bool isWeb = sizeDisplay.width > 700;
    double devicePixelRatio = 2.5;
    double height = sizeDisplay.height * devicePixelRatio;
    double width = sizeDisplay.width * devicePixelRatio;
    TextEditingController strPasswordCtl = TextEditingController();

    // double usdPrice = (double.parse(globalPrice) * double.parse(globalEtherPrice));
    double usdPrice = double.parse(globalPrice) * 1608.74;

    return ListView(
      reverse: false,
      children: [
        ListTile(
          title: Text(
            'Your Cart',
            style: TextStyle(
              color: Colors.black,
              fontSize: 23.775, //height * 0.01,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
          leading: SizedBox(
            height: 65.38125, //height * 0.0275,
            width: 41.60625, //height * 0.0175,
            child: Icon(Icons.shopping_cart),
          ),
        ),
        Divider(
          thickness: 0.8,
        ),
        Padding(
          padding :
          EdgeInsets.only(top: height * 0.003,
              left: 11.325,//width * 0.01,
              right: 0,
          bottom: 21.393), //height * 0.009),
          child: Text(
            'item',
            style: TextStyle(
              color: Colors.black,
              fontSize: 21.3975, //height * 0.009,
              fontFamily: 'Roboto',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                globalNumber,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.6425, //height * 0.007,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.005,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    globalTitle,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.6425, //height * 0.007,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    globalPrice + ' ETH',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.6425, //height * 0.007,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          leading: Container(
            height: 202.125, //height * 0.0875,
            width: 63.525, //height * 0.0275,
            child: Image.asset(globalImageUrl),
          ),
        ),
        SizedBox(height: height * 0.008,),
        Divider(
          thickness: 0.8,
        ),
        Padding(
          padding :
          EdgeInsets.only(top: 14.265, //height * 0.006,
              left: 22.65,//width * 0.02,
              right: 22.65,//width * 0.02,
              bottom: 21.393), //height * 0.009),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Purchase Price',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.007,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                globalPrice + ' ETH',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.007,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: AlignmentDirectional.topEnd,
          child: Padding(
            padding: EdgeInsets.only(top: height * 0.00,
                left: 22.65, //width * 0.02,
                right: 22.65, //width * 0.02,
                bottom: 21.393), //height * 0.009),
            child: Text(
              '\$' + usdPrice.toString(),
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 16.6425, //height * 0.007,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Padding(
          padding :
          EdgeInsets.only(top: 7.131, //height * 0.003,
              left: 22.65, //width * 0.02,
              right: 22.65, //width * 0.02,
              bottom: 21.393), //height * 0.009),
          child: SizedBox(
            height: 60.06, //height * 0.026,
            width: 0.11325,//width * 0.0001,
            child: TextButton(
              onPressed: (){
                print('height : ${height} + width : ${width}');
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //       builder: (context) =>
                //       receiptWeb(imageurl: globalImageUrl, title: globalTitle, price: globalPrice, number: globalNumber)));
              },
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff438bff),
                alignment: AlignmentDirectional.center,
              ),
              child: Text('Complete purchase',
                textScaleFactor: 1.0,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 23.775, //height * 0.01,
                  fontFamily: 'NotoSansCJKkr',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}