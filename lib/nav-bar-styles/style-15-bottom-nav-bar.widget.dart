part of persistent_bottom_nav_bar_v2;

class BottomNavStyle15 extends StatelessWidget {
  final NavBarEssentials? navBarEssentials;
  final NavBarDecoration? navBarDecoration;

  BottomNavStyle15({
    Key? key,
    this.navBarEssentials = const NavBarEssentials(items: null),
    this.navBarDecoration = const NavBarDecoration(),
  });

  Widget buildItem(PersistentBottomNavBarItem item, bool isSelected,
      double? height, context) {
    return Padding(
      padding: EdgeInsets.only(
          top: this.navBarEssentials!.padding?.top ?? 0.0,
          bottom: this.navBarEssentials!.padding?.bottom ?? 0.0),
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Transform.translate(
            offset: Offset(0, -38),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: height,
                margin: EdgeInsets.only(top: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  boxShadow: this.navBarDecoration!.boxShadow,
                  border: Border.all(color: Color(0xFF3d9fa0), width: 1.0),
                ),
                child: Container(
                  alignment: Alignment.center,
                  height: height,
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: IconTheme(
                                data: IconThemeData(
                                    size: 16, color: Color(0xFF3d9fa0)),
                                child: item.icon,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Material(
                type: MaterialType.transparency,
                child: FittedBox(
                    child: Center(
                  child: Text(
                    item.title!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 12.0),
                  ),
                )),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: this.navBarEssentials!.navBarHeight,
      child: Row(
        children: this.navBarEssentials!.items!.map((item) {
          int index = this.navBarEssentials!.items!.indexOf(item);
          return Expanded(
              child: Center(
            child: GestureDetector(
                onTap: () {
                  print("hello $index");
                  if (this.navBarEssentials!.items![index].onPressed != null) {
                    this.navBarEssentials!.items![index].onPressed!(
                        this.navBarEssentials!.selectedScreenBuildContext);
                  } else {
                    print("hello $index");

                    this.navBarEssentials!.onItemSelected!(index);
                  }
                },
                child: buildItem(
                    this.navBarEssentials!.items![index],
                    this.navBarEssentials!.selectedIndex == index,
                    this.navBarEssentials!.navBarHeight,
                    context)),
          ));
        }).toList(),
      ),
    );
  }
}
