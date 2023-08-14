// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:sdk/components/constants.dart';
// import 'package:sdk/components/network_helper.dart';
// import 'package:sdk/screens/webview_screen.dart';
// import 'package:webview_flutter/webview_flutter.dart';
// import 'package:flutter_webview_plugin_ios_android/flutter_webview_plugin_ios_android.dart';
// import 'package:xml/xml.dart';
// import 'package:flutter_dialogs/flutter_dialogs.dart';
// import 'dart:math';
// import 'dart:ui';
//
// class HomeScreen extends StatefulWidget {
//   static const String id = 'home_screen';
//
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final _amount = TextEditingController();
//   final _language = TextEditingController();
//   final _currency = TextEditingController();
//   var _url = '';
//   var random = new Random();
//
// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getCards();
//   }
//
//   void getCards()async{
//       NetworkHelper _networkhelper = NetworkHelper();
//       var response = await _networkhelper.getSavedcards();
//
//       print('Response : $response');
//       var SavedCardListResponse = response['SavedCardListResponse'];
//       print('Saved card esponse =  $SavedCardListResponse');
//       if(SavedCardListResponse['Status'] == 'Success')
//       {
//         //urlString = "https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=\(self.STOREID)&currency=\(currency)&test_mode=\ (mode)&saved_cards=\(cardDetails.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) ?? "")"
//         String currency = _currency.text;
//         String storeId = GlobalUtils.storeId; //'15996'
//         var data =  SavedCardListResponse['data'];
//         String nameString = jsonEncode(data);
//         print('data: $data');
//         print('nameString: $nameString');
//         String url = 'https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=${GlobalUtils.storeId}&currency=sar&test_mode=${GlobalUtils.testmode}&saved_cards=${encodeQueryString(nameString.toString())}';
//         // String url = 'https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=15996&currency=aed&test_mode=1&saved_cards=${encodeQueryString(data.toString())}';
//             print('url rl =  $url');
//            _url = url;
//
//           setState(() {
//             _apiLoaded = true;
//           });
//       }
//   }
//
//   static String encodeQueryString(String omponent,{Encoding encoding = utf8}){
//   return Uri.encodeComponent(omponent);
//   }
//
//   void alertShow(String text) {
//     showPlatformDialog(
//       context: context,
//       builder: (_) => BasicDialogAlert(
//         title: Text('$text', style: TextStyle(fontSize: 15),),
//         // content: Text('$text Please try again.'),
//         actions: <Widget>[
//           BasicDialogAction(
//               title: Text('Ok'),
//               onPressed: () {
//                 setState(() {
//                   // _showLoader = false;
//                 });
//                 Navigator.pop(context);
//               }),
//         ],
//       ),
//     );
//   }
//   bool _apiLoaded = false;
//   void pay(XmlDocument xml)async{
//
//     NetworkHelper _networkHelper = NetworkHelper();
//     var response =  await _networkHelper.pay(xml);
//     print(response);
//    if(response == 'failed' || response == null){
//      // failed
//      alertShow('Failed');
//    }
//    else
//      {
//        final doc = XmlDocument.parse(response);
//         final url = doc.findAllElements('start').map((node) => node.text);
//         final code = doc.findAllElements('code').map((node) => node.text);
//         print(url);
//         _url = url.toString();
//         String _code = code.toString();
//         if(_url.length>2){
//             _url =  _url.replaceAll('(', '');
//              _url = _url.replaceAll(')', '');
//              _code = _code.replaceAll('(', '');
//             _code = _code.replaceAll(')', '');
//               _launchURL(_url,_code);
//         }
//         print(_url);
//         final message = doc.findAllElements('message').map((node) => node.text);
//         print('Message =  $message');
//         if(message.toString().length>2){
//           String msg = message.toString();
//           msg = msg.replaceAll('(', '');
//           msg = msg.replaceAll(')', '');
//           alertShow(msg);
//         }
//
//
//      }
//   }
//
//   void _launchURL(String url, String code) async {
//     Navigator.push(
//         context,
//         MaterialPageRoute(
//             builder: (BuildContext context) => WebViewScreen(
//               url : url,
//               code: code,
//             )));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () async => false,
//       child: Scaffold(
//           body: SafeArea(
//             child: GestureDetector(
//                 onTap: () {
//                   FocusScope.of(context).requestFocus(new FocusNode());
//                 },
//               child: SingleChildScrollView(
//                 child: Center(
//                   child: Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text('Fill Amount:'),
//             ],
//           ),
//                     SizedBox(height: 10,),
//                     TextField(
//                       controller: _amount,
//                       textAlign: TextAlign.center,
//                       onChanged: (String val) {
//                         setState(() {
//                           if (val == '') {
//                             // _amountError = true;
//                           } else {
//                             // _amountError = false;
//                           }
//                         });
//                       },
//                       style: TextStyle(fontSize: 13,color: Colors.red),
//                       //  keyboardType: TextInputType.emailAddress,
//                       decoration: InputDecoration(
//                           hintText: "Enter Amount",
//                           errorStyle: TextStyle(fontSize: 10),
//                           // errorText: _amountError
//                           //     ? 'Please enter amount'
//                           //     : null
//                             ),
//                     ),
//           SizedBox(height: 10,),
//           TextField(
//                 controller: _language,
//                 textAlign: TextAlign.center,
//                 onChanged: (String val) {
//                   setState(() {
//                     if (val == '') {
//                       // _amountError = true;
//                     } else {
//                       // _amountError = false;
//                     }
//                   });
//                 },
//                 style: TextStyle(fontSize: 13),
//                 //  keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: "Enter currency language",
//                   errorStyle: TextStyle(fontSize: 10),
//                   // errorText: _amountError
//                   //     ? 'Please enter amount'
//                   //     : null
//                 ),
//           ),
//           SizedBox(height: 10,),
//           TextField(
//                 controller: _currency,
//                 textAlign: TextAlign.center,
//                 onChanged: (String val) {
//                   setState(() {
//                     if (val == '') {
//                       // _amountError = true;
//                     } else {
//                       // _amountError = false;
//                     }
//                   });
//                 },
//                 style: TextStyle(fontSize: 13),
//                 //  keyboardType: TextInputType.emailAddress,
//                 decoration: InputDecoration(
//                   hintText: "Enter currency",
//                   errorStyle: TextStyle(fontSize: 10),
//                   // errorText: _amountError
//                   //     ? 'Please enter amount'
//                   //     : null
//                 ),
//           ),
//           SizedBox(height: 10,),
//
//          _apiLoaded? Container(
//             height: 300,
//             width: 0,
//             child: WebView(
//               initialUrl: _url,
//               javascriptMode: JavascriptMode.unrestricted,
//               zoomEnabled: false,
//               onWebViewCreated: (WebViewController webViewController) {
//                 _controller.complete(webViewController);
//               },
//               navigationDelegate: (NavigationRequest request) {
//                 print('allowing navigation to $request');
//                 return NavigationDecision.navigate;
//               },
//               onPageStarted: (String url) {
//                 print('Page started loading: $url');
//
//                 if(url.contains('close')){
//                   print('call the api');
//                 }
//                 if(url.contains('abort')){
//                   print('show fail and pop');
//                 }
//               },
//               onPageFinished: (String url) {
//                 print('Page finished loading: $url');
//                 if(url.contains('close')){
//                   print('call the api');
//
//                 }
//                 if(url.contains('abort')){
//                   print('show fail and pop');
//                 }
//                 if(url.contains('telr://internal?payment_token=')){
//                   print('Token found');
//                   String finalurl = url;
//
//                   _token = finalurl.replaceAll('telr://internal?payment_token=', '');
//                   print('Response token = $_token');
//                   setState(() {
//                     _apiLoaded = false;
//                   });
//                  // getCards(); DIV
//                   print('DIV print before createXMLAfterGetCard');
//                   createXMLAfterGetCard();
//                 }
//                 else{
//                   _token = '';
//                 }
//
//
//               },
//               gestureNavigationEnabled: true,
//             ),
//           ): Container(),
//
//           CupertinoButton(
//               child: Container(
//                 height: 50,
//                 // color: Color(0xff006E4F),
//                 color: Colors.grey,
//                 child: Center(
//                     child: Text(
//                       'PAY',
//                       style: TextStyle(color: Colors.black, fontSize: 12),
//                     )),
//               ),
//               onPressed: () {
//                 print('DIV before on press');
//                 createXMLAfterGetCard();
//
//
//
//               }),
//         ],
//       ),
//                   ),
//                 ),
//               ),
//             ),
//           )),
//     );
//   }
//
//   String _token = '';
//   final Completer<WebViewController> _controller =
//   Completer<WebViewController>();
//
//
//   void createXMLAfterGetCard(){
//     final builder = XmlBuilder();
//     builder.processing('xml', 'version="1.0"');
//     builder.element('mobile', nest: () {
//       builder.element('store', nest: (){
//         builder.text(GlobalUtils.storeId);
//       });
//       builder.element('key', nest: (){
//         builder.text(GlobalUtils.key);
//       });
//
//       builder.element('device', nest: (){
//         builder.element('type', nest: (){
//           builder.text(GlobalUtils.devicetype);
//         });
//         builder.element('id', nest: (){
//           builder.text(GlobalUtils.deviceid);
//         });
//       });
//
//       // app
//       builder.element('app', nest: (){
//         builder.element('name', nest: (){
//           builder.text(GlobalUtils.appname);
//         });
//         builder.element('version', nest: (){
//           builder.text(GlobalUtils.version);
//         });
//         builder.element('user', nest: (){
//           builder.text(GlobalUtils.appuser);
//         });
//         builder.element('id', nest: (){
//           builder.text(GlobalUtils.appid);
//         });
//       });
//
//       //tran
//       builder.element('tran', nest: (){
//         builder.element('test', nest: (){
//           builder.text(GlobalUtils.testmode);
//         });
//         builder.element('type', nest: (){
//           builder.text(GlobalUtils.transtype);
//         });
//         builder.element('class', nest: (){
//           builder.text(GlobalUtils.transclass);
//         });
//         builder.element('cartid', nest: (){
//           builder.text(100000000 + random.nextInt(999999999));
//         });
//         builder.element('description', nest: (){
//           builder.text('Test for Mobile API order');
//         });
//         builder.element('currency', nest: (){
//           builder.text(_currency.text);
//         });
//         builder.element('amount', nest: (){
//           builder.text(_amount.text);
//         });
//         builder.element('language', nest: (){
//           builder.text(_language.text);
//         });
//         builder.element('firstref', nest: (){
//           builder.text(GlobalUtils.firstref);
//         });
//         builder.element('ref', nest: (){
//           builder.text('null');
//         });
//
//       });
//
//       //billing
//       builder.element('billing', nest: (){
//         // name
//         builder.element('name', nest: (){
//           builder.element('title', nest: (){
//             builder.text('');
//           });
//           builder.element('first', nest: (){
//             builder.text(GlobalUtils.firstname);
//           });
//           builder.element('last', nest: (){
//             builder.text(GlobalUtils.lastname);
//           });
//         });
//         // address
//         builder.element('address', nest: (){
//           builder.element('line1', nest: (){
//             builder.text(GlobalUtils.addressline1);
//           });
//           builder.element('city', nest: (){
//             builder.text(GlobalUtils.city);
//           });
//           builder.element('region', nest: (){
//             builder.text('');
//           });
//           builder.element('country', nest: (){
//             builder.text(GlobalUtils.country);
//           });
//         });
//
//         builder.element('phone', nest: (){
//           builder.text(GlobalUtils.phone);
//         });
//         builder.element('email', nest: (){
//           builder.text(GlobalUtils.emailId);
//         });
//
//       });
//
//       builder.element('custref', nest: (){
//         builder.text(GlobalUtils.custref);
//       });
//       builder.element('paymethod', nest: (){
//         builder.element('type', nest: (){
//           builder.text(GlobalUtils.paymenttype);
//         });
//         builder.element('cardtoken', nest: (){
//           builder.text(_token);
//         });
//       });
//
//     });
//
//     final bookshelfXml = builder.buildDocument();
//
//     print(bookshelfXml);
//     pay(bookshelfXml);
//   }
//
// }
import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sdk/components/constants.dart';
import 'package:sdk/components/network_helper.dart';
import 'package:sdk/screens/webview_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xml/xml.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';
import 'dart:math';
import 'dart:ui';

class HomeScreen extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _amount = TextEditingController();
  final _language = TextEditingController();
  final _currency = TextEditingController();
  var _url = '';
  var random = new Random();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCards();
  }

  void getCards()async{
    NetworkHelper _networkhelper = NetworkHelper();
    var response = await _networkhelper.getSavedcards();

    print('Response : $response');
    var SavedCardListResponse = response['SavedCardListResponse'];
    print('Saved card esponse =  $SavedCardListResponse');
    if(SavedCardListResponse['Status'] == 'Success')
    {
      //urlString = "https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=\(self.STOREID)&currency=\(currency)&test_mode=\ (mode)&saved_cards=\(cardDetails.addingPercentEncoding(withAllowedCharacters:CharacterSet.urlQueryAllowed) ?? "")"
      String currency = _currency.text;
      String storeId = GlobalUtils.storeId; //'15996'
      var data =  SavedCardListResponse['data'];
      String nameString = jsonEncode(data);
      print('data: $data');
      print('nameString: $nameString');
      String url = 'https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=${GlobalUtils.storeId}&currency=sar&test_mode=${GlobalUtils.testmode}&saved_cards=${encodeQueryString(nameString.toString())}';
      // String url = 'https://secure.telr.com/jssdk/v2/token_frame.html?sdk=ios&store_id=15996&currency=aed&test_mode=1&saved_cards=${encodeQueryString(data.toString())}';
      print('url rl =  $url');
      _url = url;

      setState(() {
        _apiLoaded = true;
      });
    }
  }

  static String encodeQueryString(String omponent,{Encoding encoding = utf8}){
    return Uri.encodeComponent(omponent);
  }

  void alertShow(String text) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text('$text', style: TextStyle(fontSize: 15),),
        // content: Text('$text Please try again.'),
        actions: <Widget>[
          BasicDialogAction(
              title: Text('Ok'),
              onPressed: () {
                setState(() {
                  // _showLoader = false;
                });
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
  bool _apiLoaded = false;
  void pay(XmlDocument xml)async{

    NetworkHelper _networkHelper = NetworkHelper();
    var response =  await _networkHelper.pay(xml);
    print(response);
    if(response == 'failed' || response == null){
      // failed
      alertShow('Failed');
    }
    else
    {
      final doc = XmlDocument.parse(response);
      final url = doc.findAllElements('start').map((node) => node.text);
      final code = doc.findAllElements('code').map((node) => node.text);
      print(url);
      _url = url.toString();
      String _code = code.toString();
      if(_url.length>2){
        _url =  _url.replaceAll('(', '');
        _url = _url.replaceAll(')', '');
        _code = _code.replaceAll('(', '');
        _code = _code.replaceAll(')', '');
        _launchURL(_url,_code);
      }
      print(_url);
      final message = doc.findAllElements('message').map((node) => node.text);
      print('Message =  $message');
      if(message.toString().length>2){
        String msg = message.toString();
        msg = msg.replaceAll('(', '');
        msg = msg.replaceAll(')', '');
        alertShow(msg);
      }


    }
  }

  void _launchURL(String url, String code) async {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => WebViewScreen(
              url : url,
              code: code,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: SafeArea(
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(new FocusNode());
              },
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Fill Amount:'),
                          ],
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: _amount,
                          textAlign: TextAlign.center,
                          onChanged: (String val) {
                            setState(() {
                              if (val == '') {
                                // _amountError = true;
                              } else {
                                // _amountError = false;
                              }
                            });
                          },
                          style: TextStyle(fontSize: 13,color: Colors.red),
                          //  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter Amount",
                            errorStyle: TextStyle(fontSize: 10),
                            // errorText: _amountError
                            //     ? 'Please enter amount'
                            //     : null
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: _language,
                          textAlign: TextAlign.center,
                          onChanged: (String val) {
                            setState(() {
                              if (val == '') {
                                // _amountError = true;
                              } else {
                                // _amountError = false;
                              }
                            });
                          },
                          style: TextStyle(fontSize: 13),
                          //  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter currency language",
                            errorStyle: TextStyle(fontSize: 10),
                            // errorText: _amountError
                            //     ? 'Please enter amount'
                            //     : null
                          ),
                        ),
                        SizedBox(height: 10,),
                        TextField(
                          controller: _currency,
                          textAlign: TextAlign.center,
                          onChanged: (String val) {
                            setState(() {
                              if (val == '') {
                                // _amountError = true;
                              } else {
                                // _amountError = false;
                              }
                            });
                          },
                          style: TextStyle(fontSize: 13),
                          //  keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: "Enter currency",
                            errorStyle: TextStyle(fontSize: 10),
                            // errorText: _amountError
                            //     ? 'Please enter amount'
                            //     : null
                          ),
                        ),
                        SizedBox(height: 10,),

                        _apiLoaded? Container(
                          height: 300,
                          width: 0,
                          child: WebView(
                            initialUrl: _url,
                            javascriptMode: JavascriptMode.unrestricted,
                            zoomEnabled: false,
                            onWebViewCreated: (WebViewController webViewController) {
                              _controller.complete(webViewController);
                            },
                            navigationDelegate: (NavigationRequest request) {
                              print('allowing navigation to $request');
                              return NavigationDecision.navigate;
                            },
                            onPageStarted: (String url) {
                              print('Page started loading: $url');

                              if(url.contains('close')){
                                print('call the api');
                              }
                              if(url.contains('abort')){
                                print('show fail and pop');
                              }
                            },
                            onPageFinished: (String url) {
                              print('Page finished loading: $url');
                              if(url.contains('close')){
                                print('call the api');

                              }
                              if(url.contains('abort')){
                                print('show fail and pop');
                              }
                              if(url.contains('telr://internal?payment_token=')){
                                print('Token found');
                                String finalurl = url;

                                _token = finalurl.replaceAll('telr://internal?payment_token=', '');
                                print('Response token = $_token');
                                setState(() {
                                  _apiLoaded = false;
                                });
                                // getCards(); DIV
                                print('DIV print before createXMLAfterGetCard');
                                createXMLAfterGetCard();
                              }
                              else{
                                _token = '';
                              }


                            },
                            gestureNavigationEnabled: true,
                          ),
                        ): Container(),

                        CupertinoButton(
                            child: Container(
                              height: 50,
                              // color: Color(0xff006E4F),
                              color: Colors.grey,
                              child: Center(
                                  child: Text(
                                    'PAY',
                                    style: TextStyle(color: Colors.black, fontSize: 12),
                                  )),
                            ),
                            onPressed: () {
                              print('DIV before on press');
                              createXMLAfterGetCard();



                            }),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )),
    );
  }

  String _token = '';
  final Completer<WebViewController> _controller =
  Completer<WebViewController>();


  void createXMLAfterGetCard(){
    final builder = XmlBuilder();
    builder.processing('xml', 'version="1.0"');
    builder.element('mobile', nest: () {
      builder.element('store', nest: (){
        builder.text(GlobalUtils.storeId);
      });
      builder.element('key', nest: (){
        builder.text(GlobalUtils.key);
      });

      builder.element('device', nest: (){
        builder.element('type', nest: (){
          builder.text(GlobalUtils.devicetype);
        });
        builder.element('id', nest: (){
          builder.text(GlobalUtils.deviceid);
        });
      });

      // app
      builder.element('app', nest: (){
        builder.element('name', nest: (){
          builder.text(GlobalUtils.appname);
        });
        builder.element('version', nest: (){
          builder.text(GlobalUtils.version);
        });
        builder.element('user', nest: (){
          builder.text(GlobalUtils.appuser);
        });
        builder.element('id', nest: (){
          builder.text(GlobalUtils.appid);
        });
      });

      //tran
      builder.element('tran', nest: (){
        builder.element('test', nest: (){
          builder.text(GlobalUtils.testmode);
        });
        builder.element('type', nest: (){
          builder.text(GlobalUtils.transtype);
        });
        builder.element('class', nest: (){
          builder.text(GlobalUtils.transclass);
        });
        builder.element('cartid', nest: (){
          builder.text(100000000 + random.nextInt(999999999));
        });
        builder.element('description', nest: (){
          builder.text('Test for Mobile API order');
        });
        builder.element('currency', nest: (){
          builder.text(_currency.text);
        });
        builder.element('amount', nest: (){
          builder.text(_amount.text);
        });
        builder.element('language', nest: (){
          builder.text(_language.text);
        });
        builder.element('firstref', nest: (){
          builder.text(GlobalUtils.firstref);
        });
        builder.element('ref', nest: (){
          builder.text('null');
        });

      });

      //billing
      builder.element('billing', nest: (){
        // name
        builder.element('name', nest: (){
          builder.element('title', nest: (){
            builder.text('');
          });
          builder.element('first', nest: (){
            builder.text(GlobalUtils.firstname);
          });
          builder.element('last', nest: (){
            builder.text(GlobalUtils.lastname);
          });
        });
        // address
        builder.element('address', nest: (){
          builder.element('line1', nest: (){
            builder.text(GlobalUtils.addressline1);
          });
          builder.element('city', nest: (){
            builder.text(GlobalUtils.city);
          });
          builder.element('region', nest: (){
            builder.text('');
          });
          builder.element('country', nest: (){
            builder.text(GlobalUtils.country);
          });
        });

        builder.element('phone', nest: (){
          builder.text(GlobalUtils.phone);
        });
        builder.element('email', nest: (){
          builder.text(GlobalUtils.emailId);
        });

      });

      builder.element('custref', nest: (){
        builder.text(GlobalUtils.custref);
      });
      builder.element('paymethod', nest: (){
        builder.element('type', nest: (){
          builder.text(GlobalUtils.paymenttype);
        });
        builder.element('cardtoken', nest: (){
          builder.text(_token);
        });
      });

    });

    final bookshelfXml = builder.buildDocument();

    print(bookshelfXml);
    pay(bookshelfXml);
  }

}
