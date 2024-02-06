import 'package:flutter/material.dart';
import 'package:flutter_e_commerce/constants/themes.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  final imageSvg = "assets/general/store_brand_white.svg";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: SvgPicture.asset(
          imageSvg,
          color: kWiteColor,
          width: 200,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.local_mall_outlined,
                  color: Colors.white,
                )),
          )
        ],
      ),
      drawer: Drawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              //Banner Ekleme
              Container(
                width: double.infinity,
                height: 180,
                decoration: BoxDecoration(
                  color: kPrimarycolor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                        child: Container(
                          padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("App Store",style: AppTheme.style),
                            Text("Find The Apple product and accessories you are looking for",style: AppTheme.style),
                            ElevatedButton(onPressed: (){}, child: Text("Shop New Year",style: AppTheme.style),)
                             
                        ],
                      ),
                    )),
                    Image.asset("assets/general/landing.png",fit: BoxFit.fill,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
