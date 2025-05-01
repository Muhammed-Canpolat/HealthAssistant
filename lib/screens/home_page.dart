import 'package:flutter/material.dart';
import 'package:kronik_hasta_takip/screens/line_chart_sample.dart';

class TrianglePainter extends CustomPainter {
  final Color color;
  TrianglePainter({this.color = Colors.red});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color
          ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(size.width / 2, size.height);
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _bpmController = PageController();
  final PageController _tansiyonController = PageController();

  bool _hastaKoduGoster = false;
  int _bpmSayfa = 0;
  int _tansiyonSayfa = 0;

  @override
  void initState() {
    super.initState();
    _bpmController.addListener(_updateBpmPage);
    _tansiyonController.addListener(_updateTansiyonPage);
  }

  void _updateBpmPage() {
    setState(() {
      _bpmSayfa = _bpmController.page?.round() ?? 0;
    });
  }

  void _updateTansiyonPage() {
    setState(() {
      _tansiyonSayfa = _tansiyonController.page?.round() ?? 0;
    });
  }

  @override
  void dispose() {
    _bpmController.removeListener(_updateBpmPage);
    _tansiyonController.removeListener(_updateTansiyonPage);
    _bpmController.dispose();
    _tansiyonController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF4F4),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        title: Text(
          'Merhaba',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildProfileRow(),
            SizedBox(height: 20),
            _buildBpmSection(),
            SizedBox(height: 20),
            _buildTansiyonSection(),
            SizedBox(height: 20),
            _buildAltKonteyner(
              "Adım Sayısı",
              "1200",
              "Adım",
              "images/ayak.png",
            ),
            _buildAltKonteyner(
              "Vücut Isısı",
              "37",
              "Derece",
              "images/termostat.png",
            ),
            _buildAltKonteyner(
              "Kan Oksijen Seviyesi",
              "96",
              "%",
              "images/oksijen.png",
            ),
            _buildAltKonteyner(
              "Stres Seviyesi",
              "Düşük",
              "",
              "images/stres.png",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 30,
              backgroundImage: AssetImage('images/person.png'),
            ),
            SizedBox(width: 10),
            Text(
              'Sudenaz Kartal',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        _buildHastaKoduButton(),
      ],
    );
  }

  Widget _buildHastaKoduButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Row(
        children: [
          Text(
            _hastaKoduGoster ? "KOD123" : "Hasta Kodu",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          SizedBox(width: 8),
          GestureDetector(
            onTap: () => setState(() => _hastaKoduGoster = !_hastaKoduGoster),
            child: Icon(
              _hastaKoduGoster ? Icons.visibility : Icons.visibility_off,
              size: 20,
              color: Colors.grey[700],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBpmSection() {
    return SizedBox(
      height: 220,
      child: PageView(
        controller: _bpmController,
        children: [_buildBpmCard(67, _bpmSayfa), _buildBpmGraphCard()],
      ),
    );
  }

  Widget _buildBpmCard(int bpm, int sayfa) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "bpm",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  "$bpm",
                  style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Image.asset('images/kalp.png', width: 52, height: 52),
              ],
            ),
            SizedBox(height: 16),
            Container(
              height: 16,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.green,
                    Colors.orange,
                    Colors.red,
                  ],
                ),
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [Text("Yavaş"), Text("Normal"), Text("Hızlı")],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBpmGraphCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "23 Nisan 2025",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 12),
            SizedBox(height: 100, child: LineChartSample()),
            SizedBox(height: 12),
            Text(
              "#Kalp atış ritmi kaydı. Veriler örnek olarak gösterilmiştir.",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTansiyonSection() {
    return SizedBox(
      height: 240,
      child: PageView(
        controller: _tansiyonController,
        children: [
          _buildTansiyon1(126, 96, _tansiyonSayfa),
          _buildTansiyon2(126, 96, _tansiyonSayfa),
        ],
      ),
    );
  }

  Widget _buildTansiyon2(int buyuk, int kucuk, int sayfa) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "1 Mayıs 2025",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Büyük Tansiyon
                  Column(
                    children: [
                      Text(
                        "Büyük Tansiyon",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Max", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text(
                                "142",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text("Min", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text(
                                "109",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 80,
                    width: 1.5,
                    color: Colors.grey,
                    margin: EdgeInsets.symmetric(horizontal: 16),
                  ),
                  Column(
                    children: [
                      Text(
                        "Küçük Tansiyon",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text("Max", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text(
                                "98",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 20),
                          Column(
                            children: [
                              Text("Min", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 4),
                              Text(
                                "68",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTansiyon1(int buyuk, int kucuk, int sayfa) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 6,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset('images/tansiyon.png', width: 52, height: 52),
                SizedBox(width: 10),
                Text(
                  "Tansiyon",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
                ),
              ],
            ),
            SizedBox(height: 15),
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey[50],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Büyük Tansiyon
                  Column(
                    children: [
                      Text(
                        "Büyük Tansiyon",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        buyuk.toString(), // 126
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  // Küçük Tansiyon
                  Column(
                    children: [
                      Text(
                        "Küçük Tansiyon",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        kucuk.toString(), // 96
                        style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAltKonteyner(
    String baslik,
    String deger,
    String birim,
    String imagePath,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 66, 60, 60).withOpacity(0.4),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            baslik,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(imagePath, width: 40, height: 40),
              Text(
                "$deger $birim",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.w800,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
