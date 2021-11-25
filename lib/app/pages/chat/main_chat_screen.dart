import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder_clone/app/pages/chat/UpperChatDetail.dart';

class MainChatScreen extends StatefulWidget {
  const MainChatScreen({Key? key}) : super(key: key);

  @override
  _MainChatScreenState createState() => _MainChatScreenState();
}

class _MainChatScreenState extends State<MainChatScreen> {
  var _searchView = new TextEditingController();

  bool _firstSearch = true;
  String _query = "";

  late List<String> _userDataList;
  late List<String> _userFilterList;

  List<String> _badgeList = ["Badge1", "Badge2", "Badge3", "Badge4"];
  List<UpperChatDetails> _matchesChatList = [
    UpperChatDetails(
        "https://m.media-amazon.com/images/M/MV5BMTQ3ODE2NTMxMV5BMl5BanBnXkFtZTgwOTIzOTQzMjE@._V1_.jpg",
        "Emma Watson",
        true,
        "Slytherin is also good tho"),
    UpperChatDetails(
        "https://media.allure.com/photos/613fed0b2c24d6a0f7e69a22/1:1/w_2124,h_2124,c_limit/megan%20fox%20met%20gala%202021%20bangs%20.jpg",
        "Megan Fox",
        true,
        "how about my new hair style"),
    UpperChatDetails("https://tinder.com/static/tinder.png", "Tinder", true,
        "New Updates..."),
    UpperChatDetails(
        "https://alphafirms.in/wp-content/uploads/2020/11/Groww_logo.png",
        "Grow",
        true,
        "Grow with us"),
  ];

  @override
  void initState() {
    super.initState();
    _userDataList = <String>[];
    _userDataList = [
      "Jesica",
      "Nancy",
      "Destiny",
      "angel",
      "sadaf",
      "Khushi",
      "pihu",
      "Roshni",
      "tracey"
    ];
    _userDataList.sort();
  }

  _MainChatScreenState() {
    _searchView.addListener(() {
      if (_searchView.text.isEmpty) {
        setState(() {
          _firstSearch = true;
          _query = "";
        });
      } else {
        setState(() {
          _firstSearch = false;
          _query = _searchView.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Screen, this will be removed soon"),
      ),
      body: new Container(
        margin: EdgeInsets.only(left: 10, top: 0, right: 10, bottom: 0),
        child: new Column(
          children: [
            _createSearchView(),
            _createNewMatchesTextHeading(),
            _createHorizontalCardList(),
            _createMessagesTextHeading(),
            _createChatItemCardViewList()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Do a action here
        },
        child: const Icon(Icons.shield),
        backgroundColor: Colors.white,
      ),
    );
  }

  /// Creating the SearchView Widget
  Widget _createSearchView() {
    return new Container(
      decoration: BoxDecoration(border: Border.all(width: 10)),
      child: new TextField(
        controller: _searchView,
        decoration: InputDecoration(
            hintText: "Search 1 matches",
            hintStyle: new TextStyle(color: Colors.pinkAccent)),
        textAlign: TextAlign.start,
      ),
    );
  }

  /// Creating the New matches Text Heading
  Widget _createNewMatchesTextHeading() {
    return new Text("New Matches");
  }

  /// Creating horizontal Card List to show badges
  Widget _createHorizontalCardList() {
    return new Container(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _badgeList.length,
          itemBuilder: (context, index) {
            return Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Card(
                color: Colors.blue,
                child: Container(
                  child: Center(
                      child: Text(
                    _badgeList[index].toString(),
                    style: TextStyle(color: Colors.white, fontSize: 36.0),
                  )),
                ),
              ),
            );
          }),
    );
  }

  /// Creating the Messages Text Heading
  Widget _createMessagesTextHeading() {
    return Text("Messages");
  }

  /// Creating the Chat Item CardView List
  Widget _createChatItemCardViewList() {
    return ListView(
      children: [
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Emma Watson'),
            subtitle: Text('Your thoughts on politics?'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
        Card(
          child: ListTile(
            leading: FlutterLogo(size: 56.0),
            title: Text('Megan Fox'),
            subtitle: Text('Looking for a new haircut'),
            trailing: Icon(Icons.more_vert),
          ),
        ),
      ],
    );
  }
}
