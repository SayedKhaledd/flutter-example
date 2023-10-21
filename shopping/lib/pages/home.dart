import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shopping/client/UserClient.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController controller = TextEditingController();
  final UserClient _userClient = UserClient();

  @override
  Widget build(BuildContext context) {
    // print("he");
    // getHttp();
    return Scaffold(
      appBar: appBar(),
      body: FutureBuilder(
          future: _userClient.getUsers(),
          builder: (context, snapshot) {
            return Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: const Color(0xff1D1617).withOpacity(0.11),
                      blurRadius: 40,
                      spreadRadius: 0.0,
                    )
                  ], shape: BoxShape.circle),
                  margin: const EdgeInsets.only(top: 40, left: 20, right: 20),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent)),
                        prefixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.yellow)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.transparent)),
                        errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.red)),
                        hintText: "search"),
                  ),
                ),

                // Card(
                //   margin: EdgeInsets.all(10),
                //   color: Colors.cyan,
                //   shape: CircleBorder(),
                //   child: Container(
                //       width: 200,
                //       decoration: BoxDecoration(
                //           shape: BoxShape.circle, color: Colors.red.withOpacity(0.7)),
                //       height: 200,
                //       child: Text("hello")),
                // ),
                Expanded(
                  child: Container(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return ListTile(
                              title: Text(snapshot.data![index].id.toString()));
                        },
                        itemCount: snapshot.data!.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true),
                  ),
                ),
                Text(snapshot.data![0].toString()),
              ],
            );
          }),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text('Breakfast',
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {},
        child: Container(
            margin: const EdgeInsets.all(10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: const Color(0xffF7F8F8),
                borderRadius: BorderRadius.circular(10)),
            child: SvgPicture.asset(
              'assets/icons/Arrow - Left 2.svg',
              height: 20,
              width: 20,
            )),
      ),
      actions: [
        GestureDetector(
          onTap: () {
            print("hello");
          },
          child: Container(
              width: 37,
              margin: const EdgeInsets.all(10),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xffF7F8F8),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/dots.svg',
                height: 5,
                width: 5,
              )),
        )
      ],
    );
  }
}

