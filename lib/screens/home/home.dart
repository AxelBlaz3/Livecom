import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:live_com/colors.dart';
import 'package:live_com/constants.dart';
import 'package:live_com/models/announcement.dart';
import 'package:live_com/models/home_banner.dart';
import 'package:live_com/models/person.dart';
import 'package:live_com/models/stream.dart';
import 'package:live_com/screens/bottom_nav_bar.dart';
import 'package:live_com/screens/home/home_view_model.dart';
import 'package:live_com/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: kSellerProfileBackgroundColor,
        bottomNavigationBar: BottomNavigation(),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const HomeBanner(),
              Container(
                margin: EdgeInsets.only(top: deviceSize.height * .3),
                height: deviceSize.height * .14,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.transparent,
                      kSellerProfileBackgroundColor
                    ])),
              ),
              Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(
                    top: deviceSize.height * .38,
                  ),
                  child: Consumer<HomeViewModel>(
                      builder: (context, homeViewModel, child) => DotsIndicator(
                            dotsCount: 3,
                            position: homeViewModel.currentIndex.toDouble(),
                            decorator: DotsDecorator(
                                size: const Size(20, 7),
                                spacing: EdgeInsets.all(4),
                                activeSize: const Size(36.0, 7.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16)),
                                activeColor: Color(0xFFEC0000),
                                color: Color(0xFF505D75)),
                          ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: deviceSize.height * .38),
                    height: 6,
                    width: 96,
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(offset: Offset(-1, -1), blurRadius: 12),
                      BoxShadow(offset: Offset(1, 2), blurRadius: 12)
                    ]),
                  ),
                ],
              ),
              Column(
                children: [
                  const HomeAppBar(),
                  SizedBox(
                    height: deviceSize.height * .33,
                  ),
                  AnnouncementList(),
                  LiveStreamFeaturedCategory(),
                  LiveStreamCategory(
                    title: 'Following',
                  ),
                  LiveStreamCategory(
                    title: 'New & Upcoming',
                  ),
                  PeopleCategory()
                ],
              ),
            ],
          ),
        ));
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
              onPressed: () => {}, icon: SvgPicture.asset('assets/search.svg')),
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('assets/home/notification.svg')),
          IconButton(
              onPressed: () => {},
              icon: SvgPicture.asset('assets/home/cart.svg')),
        ],
        leadingWidth: 56,
        leading: Row(
          children: [
            SizedBox(
              width: 24,
            ),
            Image.asset(
              'assets/profile_image.png',
              height: 32,
              width: 32,
            ),
          ],
        ));
  }
}

class HomeBanner extends StatefulWidget {
  const HomeBanner({Key? key}) : super(key: key);

  @override
  _HomeBannerState createState() => _HomeBannerState();
}

class _HomeBannerState extends State<HomeBanner> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
    final homeViewModel = Provider.of<HomeViewModel>(context, listen: false);
    controller.addListener(() {
      homeViewModel.setCurrentIndex(controller.page!.toInt());
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    final sampleList = <HomeBannerData>[
      HomeBannerData(
          title: '30% discount across all electronics',
          bannerImage: 'assets/home/banner_image.png'),
      HomeBannerData(
          title: '30% discount across all electronics',
          bannerImage: 'assets/home/banner_image.png'),
      HomeBannerData(
          title: '30% discount across all electronics',
          bannerImage: 'assets/home/banner_image.png')
    ];

    return SizedBox(
        height: deviceSize.height * .43,
        child: PageView.builder(
            controller: controller,
            scrollDirection: Axis.horizontal,
            itemCount: sampleList.length,
            itemBuilder: (context, index) => SizedBox(
                width: deviceSize.width,
                child: Stack(
                  children: [
                    Image.asset(
                      sampleList[index].bannerImage!,
                      fit: BoxFit.cover,
                      width: deviceSize.width,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 16, bottom: 48),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              sampleList[index].title!,
                              style: kAnnouncementTextStyle.copyWith(
                                  color: kTextColor),
                            ),
                            GestureDetector(
                                onTap: () => {},
                                child: Padding(
                                    padding:
                                        EdgeInsets.only(bottom: 16, top: 8),
                                    child: Image.asset(
                                      'assets/home/more_info.png',
                                      fit: BoxFit.fill,
                                      height: 16,
                                      width: 96,
                                    )))
                          ],
                        ))
                  ],
                ))));
  }
}

class AnnouncementList extends StatelessWidget {
  const AnnouncementList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    final sampleList = <Announcement>[
      Announcement(
          title: 'ANNOUNCEMENT\nONE', bannerImage: 'assets/banner_1.png'),
      Announcement(
          title: 'ANNOUNCEMENT\nTWO', bannerImage: 'assets/banner_2.png'),
      Announcement(
          title: 'ANNOUNCEMENT\nTHREE', bannerImage: 'assets/banner_1.png'),
    ];

    return SizedBox(
      height: deviceSize.width * .25,
      child: ListView.separated(
          separatorBuilder: (context, index) => SizedBox(
                width: 8,
              ),
          scrollDirection: Axis.horizontal,
          itemCount: sampleList.length,
          itemBuilder: (context, index) => index == 0
              ? Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: AnnouncementCard(
                    announcement: sampleList[index],
                  ))
              : index == sampleList.length - 1
                  ? Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: AnnouncementCard(
                        announcement: sampleList[index],
                      ))
                  : AnnouncementCard(
                      announcement: sampleList[index],
                    )),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final Announcement? announcement;
  const AnnouncementCard({Key? key, this.announcement}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: SizedBox(
        width: deviceSize.width * .42,
        height: deviceSize.width * .25,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(
              announcement!.bannerImage!,
              fit: BoxFit.cover,
              width: deviceSize.width * .42,
              height: deviceSize.width * .25,
            ),
            Container(
                margin: EdgeInsets.only(left: 16, bottom: 8),
                alignment: Alignment.bottomLeft,
                child: Text(
                  announcement!.title!,
                  style: announcement!.bannerImage! == 'assets/banner_1.png'
                      ? kAnnouncementTextStyle.copyWith(fontSize: 20)
                      : kAnnouncementTextStyle.copyWith(
                          fontSize: 20, color: kTextColor),
                ))
          ],
        ),
      ),
    );
  }
}

class LiveStreamFeaturedCategory extends StatelessWidget {
  const LiveStreamFeaturedCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 16,
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Featured',
              style: kTitleTextStyle,
            )),
        SizedBox(
          height: 8,
        ),
        LiveStreamFeaturedList()
      ],
    );
  }
}

class LiveStreamFeaturedList extends StatelessWidget {
  const LiveStreamFeaturedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Visibility(
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: false,
                child: FeaturedItem(
                  liveStream: sampleFeaturedItem,
                )),
            Positioned.fill(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => index == 0
                        ? Container(
                            margin: EdgeInsets.only(left: 16),
                            child: FeaturedItem(
                              liveStream: sampleFeaturedItem,
                            ))
                        : index == sampleStreamList.length - 1
                            ? Container(
                                margin: EdgeInsets.only(right: 16),
                                child: FeaturedItem(
                                  liveStream: sampleFeaturedItem,
                                ))
                            : FeaturedItem(
                                liveStream: sampleFeaturedItem,
                              ),
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: sampleStreamList.length))
          ],
        ));
  }
}

class FeaturedItem extends StatelessWidget {
  final LiveStream? liveStream;
  const FeaturedItem({Key? key, this.liveStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: deviceSize.width * .65,
        height: deviceSize.width * .4,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset(
              liveStream!.imagePath!,
              width: deviceSize.width * .65,
              height: deviceSize.width * .4,
              fit: BoxFit.cover,
            ),
            Container(
              height: deviceSize.width * .4,
              color: Colors.black.withOpacity(.4),
            ),
            Container(
                height: deviceSize.width * .2,
                foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Colors.black.withOpacity(.7),
                      Colors.transparent
                    ]))),
            Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SvgPicture.asset('assets/clock.svg'),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          liveStream!.runtime!,
                          style: kBody2TextStyle,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset('assets/home/person_count.svg'),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          '${liveStream!.totalAudience!}/100',
                          style: kBody2TextStyle,
                        )
                      ],
                    ),
                    Spacer(),
                    Text(
                      liveStream!.title!,
                      style: kTitleTextStyle,
                    ),
                    SizedBox(
                      height: 8,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class LiveStreamCategory extends StatelessWidget {
  final String? title;
  const LiveStreamCategory({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 4),
            child: Text(
              title!,
              style: kTitleTextStyle,
            )),
        SizedBox(
          height: 8,
        ),
        LiveStreamList()
      ],
    );
  }
}

class LiveStreamList extends StatelessWidget {
  final LiveStream? liveStream;
  const LiveStreamList({Key? key, this.liveStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Visibility(
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: false,
                child: LiveStreamItem(
                  stream: sampleStreamList[0],
                )),
            Positioned.fill(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => index == 0
                        ? Container(
                            margin: EdgeInsets.only(left: 16),
                            child: LiveStreamItem(
                              stream: sampleStreamList[index],
                            ))
                        : index == sampleStreamList.length - 1
                            ? Container(
                                margin: EdgeInsets.only(right: 16),
                                child: LiveStreamItem(
                                  stream: sampleStreamList[index],
                                ))
                            : LiveStreamItem(
                                stream: sampleStreamList[index],
                              ),
                    separatorBuilder: (context, index) => SizedBox(width: 8),
                    itemCount: sampleStreamList.length))
          ],
        ));
  }
}

class LiveStreamItem extends StatelessWidget {
  final LiveStream? stream;
  const LiveStreamItem({Key? key, this.stream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return SizedBox(
        width: deviceSize.width * .4,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  stream!.imagePath!,
                  height: deviceSize.width * .4,
                  width: deviceSize.width * .4,
                ),
              ),
              Container(
                  height: deviceSize.width * .15,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8)),
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(.7),
                            Colors.transparent
                          ]))),
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
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Image.asset(
                stream!.sellerImagePath!,
                height: 32,
                width: 32,
              ),
              SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    stream!.sellerName!,
                    style: kBody1TextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        'assets/home/star.svg',
                        height: 12,
                        width: 12,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Text(
                        stream!.rating!,
                        style: kBody1TextStyle,
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      SvgPicture.asset(
                        stream!.flagImagePath!,
                        height: 12,
                        width: 12,
                      )
                    ],
                  )
                ],
              )
            ],
          )
        ]));
  }
}

class PeopleCategory extends StatelessWidget {
  const PeopleCategory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Text(
              'People',
              style: kTitleTextStyle,
            )),
        PersonList(),
        SizedBox(
          height: 16,
        ),
      ],
    );
  }
}

class PersonList extends StatelessWidget {
  const PersonList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Visibility(
                maintainAnimation: true,
                maintainSize: true,
                maintainState: true,
                visible: false,
                child: PersonItem(
                  person: personList[0],
                )),
            Positioned.fill(
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => index == 0
                        ? Container(
                            margin: EdgeInsets.only(left: 16),
                            child: PersonItem(
                              person: personList[index],
                            ))
                        : index == sampleStreamList.length - 1
                            ? Container(
                                margin: EdgeInsets.only(right: 16),
                                child: PersonItem(
                                  person: personList[index],
                                ))
                            : PersonItem(
                                person: personList[index],
                              ),
                    separatorBuilder: (context, index) => SizedBox(width: 10),
                    itemCount: personList.length))
          ],
        ));
  }
}

class PersonItem extends StatelessWidget {
  final Person? person;
  const PersonItem({Key? key, this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return SizedBox(
        width: deviceSize.width * .175,
        child: Column(
          children: [
            Image.asset(
              person!.imagePath!,
              width: deviceSize.width * .175,
              height: deviceSize.width * .175,
            ),
            Text(
              person!.name!,
              style: kBody1TextStyle,
            )
          ],
        ));
  }
}
