import 'package:flutter/services.dart';
import 'package:purewallet_search_engine/WebScreen/DrawerPageWeb.dart';
import 'package:purewallet_search_engine/List/Product_list.dart';
import 'package:flutter/material.dart';
import '../main.dart';

String globalNumber = '';
String globalTitle = '';
String globalImageUrl = '';
String globalPrice = '';

//────────────────────────────────────WebPage_UI────────────────────────────────────
class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController _controller = TextEditingController();
  String searchTerm = '';
  bool _isListView = true;

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  void handleSearch() {
    generateText(_controller.text.trim());
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size sizeDisplay = MediaQuery.of(context).size;
    double devicePixelRatio = 2.5;
    double height = sizeDisplay.height * devicePixelRatio;
    double width = sizeDisplay.width * devicePixelRatio;

// ──────────────────────────────Product_number 순으로 정렬──────────────────────────────
    products.sort((a, b) {
      final aContainsSearchTerm = a.search.contains(searchTerm.toLowerCase());
      final bContainsSearchTerm = b.search.contains(searchTerm.toLowerCase());
      if (aContainsSearchTerm == bContainsSearchTerm) {
        final aValue = int.tryParse(a.number) ?? 0;
        final bValue = int.tryParse(b.number) ?? 0;
        return aValue.compareTo(bValue);
      } else if (aContainsSearchTerm) {
        return -1;
      } else {
        return 1;
      }
    });

    return SizedBox(
      width: double.infinity,
      // ──────────────────────────────Scaffold──────────────────────────────
      child: Scaffold(
          key: _scaffoldKey,
          drawer: Drawer(
              child: DrawerPageWeb(
            imageurl: globalImageUrl,
            title: globalTitle,
            price: globalPrice,
          )),
          backgroundColor: Colors.grey[200],
          body: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //──────────────────────────────메인 사진──────────────────────────────
              const SizedBox(
                height: 40,
              ),
              Stack(
                alignment: AlignmentDirectional.center,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: height * 0.076,
                    width: width * 0.37,
                    decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                          image: const AssetImage('assets/images/로봇팔엔진공정2.png'),
                          fit: BoxFit.fill,
                        )),
                  ),
                  Align(
                    alignment: AlignmentDirectional.center,
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: height * 0.001,
                          left: width * 0.023,
                          right: width * 0.023,
                          bottom: height * 0.00),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          color: Colors.grey.withOpacity(0.5),
                        ),
                        child: Text(
                            "Search the smart manufacturing model you want!",
                            style: TextStyle(
                              color: const Color(0xfffdfdfd),
                              fontWeight: FontWeight.w600,
                              fontFamily: "Roboto",
                              fontStyle: FontStyle.normal,
                              fontSize: height * 0.012,
                            ),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //──────────────────────────────검색창──────────────────────────────
              TextField(
                controller: _controller,
                decoration: const InputDecoration(hintText: '검색어를 입력해주세요.'),
                onChanged: (value) {
                  setState(() {
                    num = -1;
                    searchTerm = value.toLowerCase();
                  });
                },
                onSubmitted: (value) {
                  //엔터를 눌렀을 시 유사어 출력
                  generateText(_controller.text.trim());
                  setState(() {});
                },
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(
                      r'[a-z|A-Z|0-9|ㄱ-ㅎ|ㅏ-ㅣ|가-힣|ᆞ|ᆢ|ㆍ|ᆢ|ᄀᆞ|ᄂᆞ|ᄃᆞ|ᄅᆞ|ᄆᆞ|ᄇᆞ|ᄉᆞ|ᄋᆞ|ᄌᆞ|ᄎᆞ|ᄏᆞ|ᄐᆞ|ᄑᆞ|ᄒᆞ|\s]'))
                ],
              ),
              //──────────────────────────────상품 출력──────────────────────────────
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('상품 :'),
                  IconButton(
                    icon: _isListView
                        ? const Icon(Icons.grid_on)
                        : const Icon(Icons.list),
                    onPressed: () {
                      setState(() {
                        _isListView = !_isListView;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: _isListView
                    //──────────────────────────────List──────────────────────────────
                    ? ListView.builder(
                        itemCount: products.length * 2,
                        itemBuilder: (BuildContext ctx, index) {
                          if (index >= products.length) {
                            if (num > -1) {
                              final product = products[index - products.length];
                              // if (!product.search.contains(searchTerm.toLowerCase()) &&
                              //     (product.title.toLowerCase() == relatedWords[num]['tag1'] ||
                              //         product.title.toLowerCase() == relatedWords[num]['tag2'] ||
                              //         product.title.toLowerCase() == relatedWords[num]['tag3'] ||
                              //         product.title.toLowerCase() == relatedWords[num]['tag4'] ||
                              //         product.title.toLowerCase() == relatedWords[num]['tag5'])) {
                                if (!product.search.contains(searchTerm.toLowerCase()) &&
                                    (product.search.contains(relatedWords[num]['tag1']) ||
                                        product.search.contains(relatedWords[num]['tag2']) ||
                                        product.search.contains(relatedWords[num]['tag3']) ||
                                        product.search.contains(relatedWords[num]['tag4']) ||
                                        product.search.contains(relatedWords[num]['tag5']))) {
                                return GestureDetector(
                                  onTap: () {
                                    _openDrawer();
                                    globalNumber = product.number;
                                    globalTitle = product.title;
                                    globalImageUrl = product.imageurl;
                                    globalPrice = product.price;
                                  },
                                  child: Container(
                                    height: height * 0.09,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(8),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color(0x29afafaf),
                                          offset: Offset(0, 6),
                                          blurRadius: 12,
                                          spreadRadius: 0,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      children: [
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Image.asset(
                                          product.imageurl,
                                          height: height * 0.08,
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "#${product.number}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: height * 0.015),
                                            ),
                                            Text(
                                              product.title,
                                              style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.013,
                                                fontFamily: 'Roboto',
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.022,
                                            ),
                                            Text(
                                              '                     Price',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: height * 0.008),
                                            ),
                                            Text(
                                              '                     ${product.price} ETH',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: height * 0.008),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            } else {
                              return const SizedBox.shrink(); // 빈 위젯
                            }
                          } else {
                            final product = products[index];
                            if (product.search.contains(searchTerm.toLowerCase())) {
                              // ProductItem(product: product, scaffoldKey: _scaffoldKey);
                              return GestureDetector(
                                onTap: () {
                                  _openDrawer();
                                  globalNumber = product.number;
                                  globalTitle = product.title;
                                  globalImageUrl = product.imageurl;
                                  globalPrice = product.price;
                                },
                                child: Container(
                                  height: height * 0.09,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Color(0x29afafaf),
                                        offset: Offset(0, 6),
                                        blurRadius: 12,
                                        spreadRadius: 0,
                                      ),
                                    ],
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Image.asset(
                                        product.imageurl,
                                        height: height * 0.08,
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            "#${product.number}",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.015),
                                          ),
                                          Text(
                                            product.title,
                                            style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.013,
                                              fontFamily: 'Roboto',
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.022,
                                          ),
                                          Text(
                                            '                     Price',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.008),
                                          ),
                                          Text(
                                            '                     ${product.price} ETH',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: height * 0.008),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox.shrink();
                            }
                          }
                        },
                      )
//───────────────────────────────────Grid───────────────────────────────────
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 한 줄에 4개의 항목을 표시
                          childAspectRatio: 1, // 각 항목의 가로/세로 비율
                          crossAxisSpacing: 10, // 아이템 간의 가로 간격
                          mainAxisSpacing: 10, // 아이템 간의 세로 간격
                        ),
                        // itemCount: products.where((product) => product.search.contains(searchTerm.toLowerCase()) ||
                        //         (num > -1 &&
                        //             (product.title.toLowerCase() == relatedWords[num]['tag1'] ||
                        //                 product.title.toLowerCase() == relatedWords[num]['tag2'] ||
                        //                 product.title.toLowerCase() == relatedWords[num]['tag3'] ||
                        //                 product.title.toLowerCase() == relatedWords[num]['tag4'] ||
                        //                 product.title.toLowerCase() == relatedWords[num]['tag5']))).length,
                        // itemBuilder: (BuildContext ctx, index) {
                        //   final product = products.where((product) => product.search.contains(searchTerm.toLowerCase()) ||
                        //           (num > -1 &&
                        //               (product.title.toLowerCase() == relatedWords[num]['tag1'] ||
                        //                   product.title.toLowerCase() == relatedWords[num]['tag2'] ||
                        //                   product.title.toLowerCase() == relatedWords[num]['tag3'] ||
                        //                   product.title.toLowerCase() == relatedWords[num]['tag4'] ||
                        //                   product.title.toLowerCase() == relatedWords[num]['tag5']))).elementAt(index);
                        itemCount: products.where((product) => product.search.contains(searchTerm.toLowerCase()) ||
                            (product.search.contains(relatedWords[num]['tag1']) ||
                                product.search.contains(relatedWords[num]['tag2']) ||
                                product.search.contains(relatedWords[num]['tag3']) ||
                                product.search.contains(relatedWords[num]['tag4']) ||
                                product.search.contains(relatedWords[num]['tag5']))).length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products.where((product) => product.search.contains(searchTerm.toLowerCase()) ||
                              (product.search.contains(relatedWords[num]['tag1']) ||
                                  product.search.contains(relatedWords[num]['tag2']) ||
                                  product.search.contains(relatedWords[num]['tag3']) ||
                                  product.search.contains(relatedWords[num]['tag4']) ||
                                  product.search.contains(relatedWords[num]['tag5']))).elementAt(index);
                          return GestureDetector(
                            onTap: () {
                              _openDrawer();
                              globalNumber = product.number;
                              globalTitle = product.title;
                              globalImageUrl = product.imageurl;
                              globalPrice = product.price;
                            },
                            child: Image.asset(
                              product.imageurl,
                              key: ValueKey(product.number),
                            ),
                          );
                        },
                      ),
              ),
            ],
          )),
    );
  }
}
