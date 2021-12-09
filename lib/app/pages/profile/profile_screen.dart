import 'package:flutter/material.dart';
import 'package:tinder_clone/app/pages/profile/get_tinder_premium_carousel.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [profileDataColumn(), profileButtonRow()],
    );
  }

  Widget profileDataColumn() {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(
              "https://media.vanityfair.com/photos/5c0ef15ae2641b48c86501e9/1:1/w_1333,h_1333,c_limit/Megan-Fox-MeToo-Story%20(1).jpg"),
        ),
        Text("Megan Fox, 22"),
        Text("Mobile Developer")
      ],
    );
  }

  Widget profileButtonRow() {
    return Row(
      children: [
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.white, // foreground
          ),
          onPressed: () {},
          child: Text('Settings'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.red, // foreground
          ),
          onPressed: () {},
          child: Text('Add Media'),
        ),
        TextButton(
          style: TextButton.styleFrom(
            primary: Colors.red, // foreground
          ),
          onPressed: () {},
          child: Text('Safety'),
        )
      ],
    );
  }

  Widget tinderPremiumCarousel() {
    return GetTinderPremiumCarousel();
  }
}
