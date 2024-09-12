import 'dart:async'; // 타이머를 사용하기 위해 추가
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // url_launcher 패키지 임포트

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '중고 화물차 매물 앱',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(), // 로딩 화면을 시작화면으로 설정
    );
  }
}

// 로딩 화면 (스플래시 화면)
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3초 후에 메인 화면으로 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // 배경색을 흰색으로 설정
      body: Center(
        child: Text(
          '중고 화물차 1등 플랫폼 빽트럭',
          style: TextStyle(
            fontSize: 60, // 큰 글씨
            fontWeight: FontWeight.bold,
            color: Colors.black, // 검은색 텍스트
          ),
        ),
      ),
    );
  }
}

// 메인 화면
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // 배경색을 블랙으로 설정
      body: Column(
        children: [
          // 상단 로고가 화면을 덮도록 확장
          Expanded(
            flex: 2,
            child: Image.asset(
              'assets/images/your_logo.png', // 로고 이미지 경로
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          // 중앙의 버튼 영역
          Expanded(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // 상품 신청과 상품 목록 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 상품 신청 버튼 (전화 걸기 기능 추가)
                    ElevatedButton(
                      onPressed: () {
                        _makePhoneCall('tel:010-4555-1954'); // 전화 걸기
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 흰색 배경
                        minimumSize: const Size(150, 80),
                        textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      child: const Text('상품신청'),
                    ),
                    // 상품 목록 버튼
                    ElevatedButton(
                      onPressed: () {
                        // 상품목록 화면으로 이동
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const TruckListPage(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white, // 흰색 배경
                        minimumSize: const Size(150, 80),
                        textStyle: const TextStyle(fontSize: 18, color: Colors.black),
                      ),
                      child: const Text('상품목록'),
                    ),
                  ],
                ),
                // 블로그와 밴드 버튼
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // 블로그 버튼 (이미지로 표시)
                    GestureDetector(
                      onTap: _launchBlogURL, // 이미지 터치 시 블로그로 이동
                      child: Image.asset(
                        'assets/images/blog_icon.png', // 블로그 버튼 이미지 경로
                        width: 150,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    // 밴드 버튼 (이미지로 표시)
                    GestureDetector(
                      onTap: _launchBandURL, // 이미지 터치 시 밴드로 이동
                      child: Image.asset(
                        'assets/images/band_icon.png', // 밴드 버튼 이미지 경로
                        width: 150,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // 전화 걸기 함수
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 네이버 블로그로 이동하는 함수
  void _launchBlogURL() async {
    const url = 'https://blog.naver.com/truck6006';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // 네이버 밴드로 이동하는 함수
  void _launchBandURL() async {
    const url = 'https://band.us/@qtruck4443'; // 네이버 밴드 URL
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

// 상품 목록 페이지 클래스
class TruckListPage extends StatefulWidget {
  const TruckListPage({super.key});

  @override
  State<TruckListPage> createState() => _TruckListPageState();
}

class _TruckListPageState extends State<TruckListPage> {
  // 물품 리스트 (24개로 확장)
  final List<Map<String, String>> truckList = [
    {'title': '만 TGX 640 투데후', 'image': 'assets/images/TGX640.png', 'url': 'https://blog.naver.com/truck6006/223574742244'},
    {'title': 'YNG투축콤바인', 'image': 'assets/images/1.png', 'url': 'https://blog.naver.com/truck6006/223573460764'},
    {'title': '대우 블랙타이탄', 'image': 'assets/images/DAEWOOBLACK.png', 'url': 'https://blog.naver.com/truck6006/223569741007'},
    {'title': '만 580 XXL', 'image': 'assets/images/MAN580XXL.png', 'url': 'https://blog.naver.com/truck6006/223565499326'},
    {'title': 'a', 'image': 'assets/images/a.png', 'url': 'https://blog.naver.com/truck6006/223564172901'},
    {'title': 'b', 'image': 'assets/images/b.png', 'url': 'https://blog.naver.com/truck6006/223556083381'},
    {'title': 'c', 'image': 'assets/images/c.png', 'url': 'https://blog.naver.com/truck6006/223555041982'},
    {'title': 'd', 'image': 'assets/images/d.png', 'url': 'https://blog.naver.com/truck6006/223538808994'},
    {'title': 'e', 'image': 'assets/images/e.png', 'url': 'https://blog.naver.com/truck6006/223538793217'},
    {'title': 'f', 'image': 'assets/images/f.png', 'url': 'https://blog.naver.com/truck6006/223530003168'},
    {'title': 'g', 'image': 'assets/images/g.png', 'url': 'https://blog.naver.com/truck6006/223525890071'},
    {'title': 'h', 'image': 'assets/images/h.png', 'url': 'https://blog.naver.com/truck6006/223522041027'},
    {'title': 'i', 'image': 'assets/images/i.png', 'url': 'https://blog.naver.com/truck6006/223517442635'},
    {'title': 'j', 'image': 'assets/images/j.png', 'url': 'https://blog.naver.com/truck6006/223513857455'},
    {'title': 'k', 'image': 'assets/images/k.png', 'url': 'https://blog.naver.com/truck6006/223510551107'},
    {'title': 'l', 'image': 'assets/images/l.png', 'url': 'https://blog.naver.com/truck6006/223507373361'},
    {'title': 'm', 'image': 'assets/images/m.png', 'url': 'https://blog.naver.com/truck6006/223506076348'},
    {'title': 'n', 'image': 'assets/images/n.png', 'url': 'https://blog.naver.com/truck6006/223499099385'},
    {'title': 'o', 'image': 'assets/images/o.png', 'url': 'https://blog.naver.com/truck6006/223492361424'},
    {'title': 'p', 'image': 'assets/images/p.png', 'url': 'https://blog.naver.com/truck6006/223489710553'},
    {'title': 'q', 'image': 'assets/images/q.png', 'url': 'https://blog.naver.com/truck6006/223484727469'},
    {'title': 'r', 'image': 'assets/images/r.png', 'url': 'https://blog.naver.com/truck6006/223477416825'},
    {'title': 's', 'image': 'assets/images/s.png', 'url': 'https://blog.naver.com/truck6006/223468171819'},
    {'title': 't', 'image': 'assets/images/t.png', 'url': 'https://blog.naver.com/truck6006/223464104084'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('상품 목록'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 한 줄에 2개의 물품
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1.0, // 사진을 더 크게 만들기 위해 비율 조정 (1.0 = 정사각형)
        ),
        itemCount: truckList.length,
        itemBuilder: (context, index) {
          final truck = truckList[index];
          return GestureDetector(
            onTap: () => _launchURL(truck['url']!),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Image.asset(
                      truck['image']!, // 차량 이미지
                      fit: BoxFit.cover, // 이미지를 전체적으로 채우도록 설정
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
