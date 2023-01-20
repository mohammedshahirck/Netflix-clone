import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_app/core/colors/colors.dart';
import 'package:netflix_app/core/constands.dart';
import 'package:netflix_app/presentation/widgets/appbar.dart';

class Downloads extends StatelessWidget {
  const Downloads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(
            50,
          ),
          child: Appbar(
            title: 'Downloads',
          )),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: [
          const _SmartDownloads(),
          Section2(),
          const Section3(),
        ],
      ),
    );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});
  final List imagelist = [
    'https://cdn.cinematerial.com/p/136x/u9juzjtv/joker-movie-poster-sm.jpg?v=1567014206',
    'https://cdn.cinematerial.com/p/136x/rnuyzjhd/avengers-endgame-movie-poster-sm.jpg?v=1564264140',
    'https://cdn.cinematerial.com/p/297x/nyt7hmpg/fast-furious-presents-hobbs-shaw-movie-poster-md.jpg?v=1561790306',
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        const Text(
          "Indroducing Downloads for you",
          // textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.bold),
        ),
        kKeight,
        const Text(
          'we\'ll download a personalised selection of movies and shows for you,so there\'s always something to watch on your device',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
          ),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.5),
                  radius: size.width * 0.4,
                ),
              ),
              DownloadImageWidget(
                size: Size(size.width * 0.9, size.width * .6),
                imagelist: imagelist[0],
                angle: -20 * pi / 180,
                margin: const EdgeInsets.only(bottom: 25, right: 155),
              ),
              DownloadImageWidget(
                size: Size(size.width * 0.9, size.width * 0.6),
                imagelist: imagelist[1],
                angle: 20 * pi / 180,
                margin: const EdgeInsets.only(bottom: 25, left: 155),
              ),
              DownloadImageWidget(
                size: Size(size.width * 1.04, size.width * 0.8),
                imagelist: imagelist[2],
                angle: 0 * pi / 180,
                margin: const EdgeInsets.only(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: SizedBox(
            width: double.infinity,
            child: MaterialButton(
              color: Colors.blue,
              onPressed: () {},
              child: const Text(
                'set up',
                style: TextStyle(
                    color: kwhite, fontSize: 20, fontWeight: FontWeight.w800),
              ),
            ),
          ),
        ),
        MaterialButton(
          color: Colors.white,
          onPressed: () {},
          child: const Text(
            'See what you can download',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        KWidth,
        Icon(
          Icons.settings_outlined,
          color: kwhite,
        ),
        KWidth,
        Text('Smart Downloads'),
        SizedBox(
          height: 40,
        )
      ],
    );
  }
}

class DownloadImageWidget extends StatelessWidget {
  const DownloadImageWidget(
      {Key? key,
      required this.size,
      required this.imagelist,
      required this.angle,
      required this.margin,
      this.radius = 1})
      : super(key: key);

  final Size size;
  final String imagelist;
  final double angle;
  final EdgeInsets margin;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: angle,
      child: Container(
        margin: margin,
        height: size.width * 0.6,
        width: size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imagelist),
          ),
        ),
      ),
    );
  }
}

// class ScreenDownloads extends StatelessWidget {
//   ScreenDownloads({super.key});

//   final _widgetList = [
//     const _SmartDownloads(),
//     Section2(),
//     const Section3(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: const PreferredSize(
//           preferredSize: Size.fromHeight(50),
//           child: Appbar(
//             title: 'Downloads',
//           ),
//         ),
//         body: ListView.separated(
//             padding: const EdgeInsets.all(10),
//             itemBuilder: (ctx, index) => _widgetList[index],
//             separatorBuilder: (ctx, index) => const SizedBox(
//                   height: 25,
//                 ),
//             itemCount: _widgetList.length));
//   }
// }

// class Section2 extends StatelessWidget {
//   Section2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     print('image hai $imageAppendUrl');
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       BlocProvider.of<DownloadsBloc>(context)
//           .add(const DownloadsEvent.getDownloadsImages());
//     });
//     // BlocProvider.of<DownloadsBloc>(context)
//     //     .add(const DownloadsEvent.getDownloadsImages());
//     final Size size = MediaQuery.of(context).size;
//     return Column(
//       children: [
//         const Text(
//           'Introducing Downloads for you',
//           textAlign: TextAlign.center,
//           style: TextStyle(
//               color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         kKeight,
//         const Text(
//           "We will download a personalised selection of\n movies and shows for you, so there's\n always something to watch on your\n device",
//           textAlign: TextAlign.center,
//           style: TextStyle(color: Colors.grey, fontSize: 15),
//         ),
//         kKeight,
//         BlocBuilder<DownloadsBloc, DownloadsState>(
//           builder: (context, state) {
//             return SizedBox(
//               width: size.width,
//               height: size.height * 0.45,
//               child: state.isLoading
//                   ? const Center(child: CircularProgressIndicator())
//                   : Stack(
//                       alignment: Alignment.center,
//                       children: [
//                         CircleAvatar(
//                           radius: size.width * 0.4,
//                           backgroundColor: Colors.grey.withOpacity(0.5),
//                         ),
//                         DownloadsImageWidget(
//                           imageLst:
//                               '$imageAppendUrl${state.downloads[0].posterPath}',
//                           margin: const EdgeInsets.only(left: 170, top: 40),
//                           angle: 25,
//                           size: Size(size.width * 0.35, size.width * 0.55),
//                         ),
//                         DownloadsImageWidget(
//                           imageLst:
//                               '$imageAppendUrl${state.downloads[1].posterPath}',
//                           margin: const EdgeInsets.only(right: 170, top: 40),
//                           angle: -20,
//                           size: Size(size.width * 0.35, size.width * 0.55),
//                         ),
//                         DownloadsImageWidget(
//                           imageLst:
//                               '$imageAppendUrl${state.downloads[2].posterPath}',
//                           margin: const EdgeInsets.only(bottom: 30, top: 40),
//                           size: Size(size.width * 0.4, size.width * 0.6),
//                         ),
//                       ],
//                     ),
//             );
//           },
//         ),
//       ],
//     );
//   }
// }

// class Section3 extends StatelessWidget {
//   const Section3({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: double.infinity,
//           child: MaterialButton(
//             onPressed: () {},
//             color: Colors.blue,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10),
//             ),
//             child: const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Text(
//                 'Set up',
//                 style: TextStyle(
//                     color: kwhite, fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         ),
//         MaterialButton(
//           onPressed: () {},
//           color: kwhite,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: const Padding(
//             padding: EdgeInsets.symmetric(vertical: 10),
//             child: Text(
//               'See what you can download',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

// class _SmartDownloads extends StatelessWidget {
//   const _SmartDownloads({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: const [
//         KWidth,
//         Icon(
//           Icons.settings,
//           color: kwhite,
//         ),
//         KWidth,
//         Text('Smart Downloads'),
//       ],
//     );
//   }
// }

// class DownloadsImageWidget extends StatelessWidget {
//   const DownloadsImageWidget({
//     Key? key,
//     required this.imageLst,
//     this.angle = 0,
//     required this.margin,
//     required this.size,
//     this.radius = 10,
//   }) : super(key: key);

//   final String imageLst;
//   final double angle;
//   final EdgeInsets margin;
//   final Size size;
//   final double radius;
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: margin,
//       child: Transform.rotate(
//         angle: angle * pi / 180,
//         child: ClipRRect(
//           borderRadius: BorderRadius.circular(radius),
//           child: Container(
//             width: size.width,
//             height: size.height,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: NetworkImage(
//                   imageLst,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
