import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/elements/grey_button.dart';
import 'package:live_com/elements/header_back_button.dart';
import 'package:live_com/elements/large_grey_button.dart';
import 'package:live_com/elements/red_button.dart';
import 'package:live_com/models/store.dart';
import 'package:live_com/models/stream.dart';
import 'package:live_com/screens/bottom_nav_bar.dart';
import 'package:live_com/screens/seller_profile/seller_provider_viewmodel.dart';
import 'package:live_com/theme.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

import '../../helpers.dart';

class SellerProfilePage extends StatefulWidget {
  final bool isSeeAll;
  final bool isFollowing;
  final bool isStoreSeeAll;

  const SellerProfilePage(
      {Key? key,
      this.isSeeAll = false,
      this.isFollowing = false,
      this.isStoreSeeAll = true})
      : super(key: key);

  @override
  _SellerProfilePageState createState() => _SellerProfilePageState(
      isSeeAll: isSeeAll,
      isStoreSeeAll: isStoreSeeAll,
      isFollowing: isFollowing);
}

class _SellerProfilePageState extends State<SellerProfilePage> {
  final bool isSeeAll;
  final bool isStoreSeeAll;
  bool isFollowing;
  SellerProfileViewModel? sellerProfileViewModel;
  final text =
      'Lorem ipsum dolor sit amet, dolor sit amet, Lorem ipsum dolor sit amet, dolor sit amet,Lorem ipsum dolor sit amet,dolor sit amet, Lorem ipsum dolor sit amet, dolor sit amet Lorem ipsum';
  final superLongDescription =
      'This is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............\nThis is a super long Seller description.............';

  _SellerProfilePageState(
      {Key? key,
      this.isSeeAll = false,
      this.isFollowing = false,
      this.isStoreSeeAll = true});

  @override
  void initState() {
    super.initState();
    sellerProfileViewModel =
        Provider.of<SellerProfileViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kSellerProfileBackgroundColor,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset(
                isSeeAll
                    ? 'assets/seller_profile/see_all_bg.png'
                    : 'assets/seller_profile/unfollowing_bg.png',
                fit: BoxFit.cover,
                height: deviceSize.height * .45,
                width: deviceSize.width,
              ),
              Container(
                margin: EdgeInsets.only(top: deviceSize.height * .45 / 2),
                height: deviceSize.height * .45 / 2,
                width: deviceSize.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      kSellerProfileBackgroundColor
                    ])),
              ),
              Column(children: [
                SellerProfileHeader(
                  title: 'Lee',
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/profile_image.png',
                      height: 65,
                      width: 65,
                    ),
                    InfoColumn(
                      title: 'Rating',
                      info: '4.6',
                    ),
                    InfoColumn(
                      title: 'Products',
                      info: '380',
                    ),
                    InfoColumn(
                      title: 'Followers',
                      info: '200',
                    )
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 6,
                        child: Container(
                            margin: EdgeInsets.only(left: 16),
                            child: ReadMoreText(
                              text,
                              trimMode: TrimMode.Length,
                              trimLength: 183,
                              trimCollapsedText: 'more',
                              trimExpandedText: 'more',
                              style: kBody2TextStyle,
                              moreStyle: kBody2TextStyle.copyWith(
                                  color: Color(0xFF7889A9)),
                              lessStyle: kBody2TextStyle.copyWith(
                                  color: Color(0xFF7889A9)),
                              callback: (val) =>
                                  showAlert(context, superLongDescription),
                            ))),
                    Expanded(
                        flex: 5,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              isFollowing = !isFollowing;
                            });
                          },
                          child: !isFollowing
                              ? RedButton(
                                  text: 'FOLLOW',
                                )
                              : GreyButton(text: 'UNFOLLOW'),
                        ))
                  ],
                ),
                Consumer<SellerProfileViewModel>(
                    builder: (context, value, child) =>
                        sellerProfileViewModel!.getIsSearchTextEmpty
                            ? Column(
                                children: [
                                  AnnouncementCard(
                                    announcementText: 'ANNOUNCEMENT\nONE',
                                  ),
                                  isSeeAll
                                      ? SeeAllGrid(
                                          isStoreSeeAll: isStoreSeeAll,
                                          storeList: sampleStoreList,
                                          liveStreamList: sampleStreamList,
                                        )
                                      : SizedBox(),
                                  !isSeeAll
                                      ? StoreCategory(
                                          isFollowing: isFollowing,
                                        )
                                      : SizedBox(),
                                  !isSeeAll
                                      ? StreamCategory(
                                          isFollowing: isFollowing,
                                          categoryTitle: 'Live Stream',
                                        )
                                      : SizedBox(),
                                  !isSeeAll
                                      ? StreamCategory(
                                          isFollowing: isFollowing,
                                          categoryTitle: 'New & Upcoming',
                                        )
                                      : SizedBox(),
                                  SizedBox(
                                    height: 24,
                                  )
                                ],
                              )
                            : EmptySearchResult(
                                searchText: sellerProfileViewModel!.searchText,
                              ))
              ])
            ],
          ),
        ));
  }
}

class EmptySearchResult extends StatelessWidget {
  final String? searchText;
  const EmptySearchResult({Key? key, this.searchText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16), topRight: Radius.circular(16)),
        ),
        child: Column(
          children: [
            SizedBox(
              height: deviceSize.height * .1,
            ),
            SizedBox(
                height: deviceSize.width * .3,
                width: deviceSize.width * .3,
                child: SvgPicture.asset(
                    'assets/seller_profile/empty_search_result_illustration.svg')),
            SizedBox(
              height: 16,
            ),
            Text(
              '${searchText!.toUpperCase()} NOT FOUND',
              textAlign: TextAlign.center,
              style: kAnnouncementTextStyle.copyWith(color: Color(0xFF2E394E)),
            )
          ],
        ));
  }
}

class SeeAllGrid extends StatelessWidget {
  final List<LiveStream>? liveStreamList;
  final List<Store>? storeList;
  final bool isStoreSeeAll;
  SeeAllGrid(
      {Key? key,
      this.liveStreamList,
      this.storeList,
      this.isStoreSeeAll = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final items = !isStoreSeeAll ? liveStreamList : storeList;
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        height: !isStoreSeeAll
            ? deviceSize.height * .4 * items!.length / 2
            : deviceSize.height * .5 * items!.length / 2,
        child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 4),
            itemCount: items.length,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: isStoreSeeAll ? 3 / 4 : 12 / 13,
            ),
            itemBuilder: (context, index) => Container(
                // color: Colors
                //     .primaries[random.nextInt(Colors.primaries.length)],
                alignment: Alignment.center,
                child: isStoreSeeAll
                    ? StoreCard(
                        cardDimensions: Size(
                            deviceSize.width * .44, deviceSize.width * .44),
                        store: items[index] as Store)
                    : StreamCard(
                        cardDimensions: Size(
                            deviceSize.width * .44, deviceSize.width * .44),
                        stream: items[index] as LiveStream,
                      ))));
  }
}

class InfoColumn extends StatelessWidget {
  final String? title;
  final String? info;
  const InfoColumn({Key? key, this.title, this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title!,
          style: kBody1TextStyle,
        ),
        Text(
          info!,
          style: kHeaderTextStyle,
        )
      ],
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String? announcementText;
  const AnnouncementCard({Key? key, this.announcementText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.all(16),
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  'assets/banner_1.png',
                  width: deviceSize.width,
                  height: deviceSize.height * .15,
                  fit: BoxFit.cover,
                )),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Text(
                  announcementText!,
                  style: kAnnouncementTextStyle,
                ))
          ],
        ));
  }
}

class LiveStoreHeader extends StatelessWidget {
  final bool isFollowing;
  const LiveStoreHeader({Key? key, this.isFollowing = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Live Store',
              style: kTitleTextStyle,
            ),
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellerProfilePage(
                                isSeeAll: true,
                                isStoreSeeAll: true,
                                isFollowing: isFollowing,
                              )),
                    ),
                child: Text(
                  'See All',
                  style: kBody1TextStyle,
                ))
          ],
        ));
  }
}

class StoreCard extends StatelessWidget {
  final Store? store;
  final Size? cardDimensions;
  const StoreCard({Key? key, this.store, this.cardDimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: cardDimensions!.width,
        child: Column(children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  store!.imagePath!,
                  height: cardDimensions!.width,
                  width: cardDimensions!.width,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/clock.svg',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        store!.time!,
                        style: kBody2TextStyle,
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/red_arrow.svg')
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            store!.title!,
            style: kBody1TextStyle,
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Image.asset(
                'assets/coin.png',
                height: 16,
                width: 16,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                store!.price!,
                style: kPriceTextStyle,
              )
            ],
          )
        ]));
  }
}

class StoreList extends StatelessWidget {
  final List<Store>? storeItems;
  const StoreList({Key? key, this.storeItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        width: double.infinity,
        child: storeItems!.isEmpty
            ? SizedBox()
            : Stack(
                children: [
                  Visibility(
                      visible: false,
                      maintainAnimation: true,
                      maintainSize: true,
                      maintainState: true,
                      child: StoreCard(
                        cardDimensions:
                            Size(deviceSize.width * .4, deviceSize.width * .4),
                        store: storeItems![0],
                      )),
                  Positioned.fill(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                width: 8,
                              ),
                          scrollDirection: Axis.horizontal,
                          itemCount: storeItems!.length,
                          itemBuilder: (context, index) => index == 0
                              ? Container(
                                  margin: EdgeInsets.only(left: 16),
                                  child: StoreCard(
                                    cardDimensions: Size(deviceSize.width * .4,
                                        deviceSize.width * .4),
                                    store: storeItems![index],
                                  ))
                              : index == storeItems!.length - 1
                                  ? Container(
                                      margin: EdgeInsets.only(right: 16),
                                      child: StoreCard(
                                        cardDimensions: Size(
                                            deviceSize.width * .4,
                                            deviceSize.width * .4),
                                        store: storeItems![index],
                                      ),
                                    )
                                  : StoreCard(
                                      cardDimensions: Size(
                                          deviceSize.width * .4,
                                          deviceSize.width * .4),
                                      store: storeItems![index],
                                    )))
                ],
              ));
  }
}

class StoreCategory extends StatelessWidget {
  final bool isFollowing;
  const StoreCategory({Key? key, this.isFollowing = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LiveStoreHeader(
          isFollowing: isFollowing,
        ),
        StoreList(
          storeItems: sampleStoreList,
        )
      ],
    );
  }
}

class StreamCard extends StatelessWidget {
  final LiveStream? stream;
  final Size? cardDimensions;

  const StreamCard({Key? key, this.stream, this.cardDimensions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: cardDimensions!.width,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  stream!.imagePath!,
                  height: cardDimensions!.width,
                  width: cardDimensions!.width,
                ),
              ),
              Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/eye.svg',
                        height: 16,
                        width: 16,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        stream!.views!,
                        style: kBody2TextStyle,
                      ),
                      Spacer(),
                      SvgPicture.asset('assets/live_stream_red.svg')
                    ],
                  ))
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            stream!.title!,
            style: kBody1TextStyle,
          ),
        ]));
  }
}

class LiveStreamHeader extends StatelessWidget {
  final String? categoryTitle;
  final bool isFollowing;
  const LiveStreamHeader(
      {Key? key, this.categoryTitle, this.isFollowing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 4, top: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              categoryTitle!,
              style: kTitleTextStyle,
            ),
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SellerProfilePage(
                                isSeeAll: true,
                                isStoreSeeAll: false,
                                isFollowing: isFollowing,
                              )),
                    ),
                child: Text(
                  'See All',
                  style: kBody1TextStyle,
                ))
          ],
        ));
  }
}

class StreamCategory extends StatelessWidget {
  final bool isFollowing;
  final String? categoryTitle;
  const StreamCategory({Key? key, this.categoryTitle, this.isFollowing = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        LiveStreamHeader(
          categoryTitle: categoryTitle,
          isFollowing: isFollowing,
        ),
        StreamList(
          streamItems: sampleStreamList,
        )
      ],
    );
  }
}

class StreamList extends StatelessWidget {
  final List<LiveStream>? streamItems;
  const StreamList({Key? key, this.streamItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        width: double.infinity,
        child: streamItems!.isEmpty
            ? SizedBox()
            : Stack(children: [
                Visibility(
                    visible: false,
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    child: StreamCard(
                      cardDimensions:
                          Size(deviceSize.width * .39, deviceSize.width * .39),
                      stream: streamItems![0],
                    )),
                Positioned.fill(
                    child: ListView.separated(
                        separatorBuilder: (context, index) => SizedBox(
                              width: 8,
                            ),
                        scrollDirection: Axis.horizontal,
                        itemCount: streamItems!.length,
                        itemBuilder: (context, index) => index == 0
                            ? Container(
                                margin: EdgeInsets.only(left: 16),
                                child: StreamCard(
                                  cardDimensions: Size(deviceSize.width * .39,
                                      deviceSize.width * .39),
                                  stream: streamItems![index],
                                ))
                            : index == streamItems!.length - 1
                                ? Container(
                                    margin: EdgeInsets.only(right: 16),
                                    child: StreamCard(
                                      cardDimensions: Size(
                                          deviceSize.width * .39,
                                          deviceSize.width * .39),
                                      stream: streamItems![index],
                                    ),
                                  )
                                : StreamCard(
                                    cardDimensions: Size(deviceSize.width * .39,
                                        deviceSize.width * .39),
                                    stream: streamItems![index],
                                  )))
              ]));
  }
}

class ReportContent extends StatelessWidget {
  const ReportContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            'Report',
            style: kTitleTextStyle,
          ),
          GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                  backgroundColor: Color(0x80181E28),
                  radius: 16,
                  child: Center(
                      child: Icon(
                    Icons.close,
                    size: 16,
                    color: kTextColor,
                  )))),
        ]),
        SizedBox(
          height: 16,
        ),
        InkWell(
            onTap: () => triggerReportAlertDialog(context),
            child: LargeGreyButton(
              text: 'Seller is rude or indecent',
              color: kTextColor,
            )),
        SizedBox(
          height: 16,
        ),
        InkWell(
            onTap: () => triggerReportAlertDialog(context),
            child: LargeGreyButton(
                text: 'Seller sells counterfeit item', color: kTextColor)),
        SizedBox(
          height: 16,
        ),
        InkWell(
            onTap: () => triggerReportAlertDialog(context),
            child: LargeGreyButton(
                text: 'Copyright infringement', color: kTextColor)),
        SizedBox(
          height: 16,
        ),
        InkWell(
            onTap: () => triggerReportAlertDialog(context),
            child: LargeGreyButton(
                text: 'Suspect fraudulent activities', color: kTextColor)),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class MoreMenu extends StatelessWidget {
  const MoreMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerRight,
          child: GestureDetector(
              onTap: () => Navigator.of(context).pop(),
              child: CircleAvatar(
                  backgroundColor: Color(0x80181E28),
                  radius: 16,
                  child: Center(
                      child: Icon(
                    Icons.close,
                    size: 16,
                    color: kTextColor,
                  )))),
        ),
        SizedBox(
          height: 24,
        ),
        InkWell(
            onTap: () => triggerBlockAlertDialog(context),
            child: LargeGreyButton(
              text: 'BLOCK',
              color: Color(0xFFEC0000),
            )),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () => triggerBottomSheet(context, ReportContent()),
            child: LargeGreyButton(
              text: 'REPORT',
              color: Color(0xFFEC0000),
            )),
        SizedBox(
          height: 20,
        ),
        InkWell(
            onTap: () => Share.share('Hello'),
            child: LargeGreyButton(
              text: 'SHARE',
              color: kTextColor,
            )),
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  final String? hintText;
  final bool isInDialog;
  const SearchBar(
      {Key? key, this.hintText = 'Search in store', this.isInDialog = false})
      : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final searchController = TextEditingController();
  SellerProfileViewModel? sellerProfileViewModel;

  @override
  void initState() {
    super.initState();
    sellerProfileViewModel =
        Provider.of<SellerProfileViewModel>(context, listen: false);

    searchController.addListener(() {
      sellerProfileViewModel!.setSearchText(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Stack(children: [
      Container(
          padding: EdgeInsets.only(right: widget.isInDialog ? 0 : 16),
          alignment: Alignment.center,
          width: deviceSize.width * .8,
          child: TextField(
            style: kBody2TextStyle,
            controller: searchController,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: kTextColor),
                    borderRadius: BorderRadius.circular(24)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: kTextColor),
                    borderRadius: BorderRadius.circular(24)),
                border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: kTextColor),
                    borderRadius: BorderRadius.circular(24)),
                disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: kTextColor),
                    borderRadius: BorderRadius.circular(24)),
                filled: true,
                hintText: widget.hintText!,
                hintStyle: kBody1TextStyle,
                fillColor: Color(0xFF2E394E),
                contentPadding: EdgeInsets.all(12),
                isDense: true),
          )),
      Container(
        width: deviceSize.width * .75,
        height: 2,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(24), boxShadow: [
          BoxShadow(blurRadius: 12, offset: Offset(0, 2)),
          BoxShadow(blurRadius: 12, offset: Offset(0, 40))
        ]),
      )
    ]);
  }
}

class SellerProfileHeader extends StatefulWidget {
  final String? title;
  final Widget? child;
  final bool isSearching;
  const SellerProfileHeader(
      {Key? key, this.title, this.isSearching = false, this.child})
      : super(key: key);

  @override
  _SellerProfileHeaderState createState() => _SellerProfileHeaderState(
        title: title,
      );
}

class _SellerProfileHeaderState extends State<SellerProfileHeader> {
  final String? title;
  final Widget? child;
  bool isSearching;

  _SellerProfileHeaderState(
      {Key? key, this.title, this.isSearching = false, this.child})
      : super();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sellerProfileViewModel =
        Provider.of<SellerProfileViewModel>(context, listen: false);

    return AppBar(
        elevation: 0,
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        title: isSearching ? SizedBox() : Text(title!, style: kHeaderTextStyle),
        backgroundColor: Colors.transparent,
        leading: HeaderBackButton(),
        actions: isSearching
            ? [
                Stack(alignment: Alignment.centerRight, children: [
                  SearchBar(),
                  Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: IconButton(
                        icon: Icon(
                          Icons.close,
                          color: kTextColor,
                        ),
                        onPressed: () => updateSearchState(
                            context, sellerProfileViewModel, !isSearching),
                      ))
                ]),
              ]
            : [
                IconButton(
                    onPressed: () => updateSearchState(
                        context, sellerProfileViewModel, !isSearching),
                    icon: SvgPicture.asset('assets/search.svg')),
                IconButton(
                  onPressed: () => triggerBottomSheet(context, MoreMenu()),
                  icon: SvgPicture.asset('assets/horizontal_more.svg'),
                )
              ]);
  }

  void updateSearchState(BuildContext context,
      SellerProfileViewModel sellerProfileViewModel, bool newState) {
    sellerProfileViewModel.setSearchText('');

    setState(() {
      isSearching = newState;
    });
  }
}
