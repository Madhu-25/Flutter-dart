class ScaffoldExample extends StatelessWidget {
  const ScaffoldExample({Key key}) : super(key: key);

  _tapButton()
  {
    debugPrint("Icon tapped");
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.teal.shade200,
        actions: [
          IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint("Email tapped...")),
          IconButton(icon: Icon(Icons.work), onPressed: _tapButton)
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () => debugPrint('Floating action button') , backgroundColor: Colors.indigoAccent,
      child: Icon(Icons.info),),
      bottomNavigationBar: BottomNavigationBar( items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), title: Text("Account")),
        BottomNavigationBarItem(icon: Icon(Icons.work), title: Text("tasks"))

      ], onTap: (int index) => debugPrint('Tapped on item ${index}'),),

      body: Container(
        alignment: Alignment.center ,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // InkWell(
            //   child: Text("Tap me!", style: TextStyle(fontSize: 30.8),),
            //
            //   onTap: () => debugPrint("Tapped!"),
            // )
            CustomButton()
          ],
        ),
      ),
    );
  }
}
