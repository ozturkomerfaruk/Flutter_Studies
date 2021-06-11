import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(FalcinizGeldiHaniim());
}

class FalcinizGeldiHaniim extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      color: Colors.purple.shade900,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple.shade400,
        appBar: AppBar(
          backgroundColor: Colors.purple.shade600,
          title: Text(
            "Günün Falı",
            style: TextStyle(
              fontSize: 28,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
        ),
        body: FallarMekani(),
      ),
    );
  }
}

class FallarMekani extends StatefulWidget {
  @override
  _FallarMekaniState createState() => _FallarMekaniState();
}

class _FallarMekaniState extends State<FallarMekani> {
  List<String> yanitlar = [
    'TIKLA FALIN GELSİN',
    'AŞK: Bugün, aşk ve ilişki hayatınızda biraz daha temkinli olmalısın. Onu her konuda doğru anlamda anladığından da emin misin?',
    'AŞK: Aşk ve ilişki hayatınızda hakimiyeti eline almak ve birlikteliğinizi dilediğiniz gibi yönlendirmek isteyebilirsin. Bu isteğinin denge içerisindeki bir ilişkiye ne şekilde fayda edeceğini gözden geçirmelisin.',
    'AŞK: Duygularınızın bugün biraz düzensiz olduğunu görebilirsiniz. Güne, daha önce hiç yapmadığınız bir şekilde başlamanızı sağlayan doğal bir elektrik hissi var. Kalbiniz her zaman doğruyu söyler.',
    'AŞK: Duygularınız çoğu zaman rasyonel düşüncelerinize galip geliyor ve sonunda derinlerde duyguların beslediği bir karmaşa ortaya çıkıyor. Çok da mantıklı düşünerek kalbinizi görmezden gelmeyin. Amacınız bu ikisi arasında dengeyi bulmak.',
    'AŞK: Duygusal olarak kötü hissetmeyin, sezgileriniz güçlü durumda. Sevgilinizin hislerini bu sezgiler ile anlamaya çalışın. Bazen sadece eğlenmek gerekir, siz de rahatlayın ve birlikte eğlenin!',
    'PARA: Kafanıza uzun süredir koyduğunuz bazı harcamalar var, bugün kendinize bunlara gerçekten ne kadar ihtiyacınız olduğunu sorun ve bir kısmını iptal edin. Bugün bir hayır kurumuna küçücük bir bağış yapın, kendinizi çok daha iyi hissedeceksiniz.',
    'PARA: Nakit akışınızın dengesini bozabilecek dönemlere giriyoruz, bu aralar kesinlikle masa başına oturup bir bütçe hesabı yapmalısınız, önümüzdeki 3 ay boyunca gelir gider dengenizden emin olmadan hareket etmeyin',
    'PARA: Bugün, başkalarına yardım, destek ve hizmet duygunuzun yüksek olduğu bir gün olabilir, hayır, bağış işlerinde yer alabilirsiniz.',
    'PARA: Bugün kendinize güveniniz oldukça yüksek, ancak bu size pek fayda getirmeyebilir, bağlantılarınız size verdikleri destekten şüphelenebilirler. Sakin hareket edin, bir adım geri durun, ve paradan çok sağlığınızla ilgilenin.',
    'PARA: Para kaynaklarımız ile ilgili detaylar bu dönem dikkat etmelisiniz. Ayrıca maddi konularda ve harcamalarda uzun süredir sizi meşgul eden bir konuda karara varabilirsiniz, yakınlarınızdan veya eşinizden karar alırken yardım isteyin.',
    'TAVSİYE: Bugün meraklı kişiliğini ön plana çıkartarak insanlara soru sormaktan çekinme ',
    'TAVSİYE: Bugün daha önce hiç fark etmediğin şeylerin hep orada olduğunu fark edebilirsin, sadece biraz daha dikkatli olmaya çalış',
    'TAVSİYE: Bugün ikili ilişkilerinde daha aktif ve verici olmaya çalışabilirsin, aynı fikirde olduğun insanları daha dikkatli dinlemeye ve sorgulamaya başla',
    'TAVSİYE: Bugün sadece işine odaklan, dikkatini dağıtacak her türlü nesne ve sosyal medyadan uzaklaşmak kendini daha mutlu hissettirebilir',
    'TAVSİYE: Bugün tek başına biraz yürüyüş yap, çocukluğunda dinlediğin şarkıları aç ve o zamanlar oynadığın oyunları hayal et'
  ];

  int tiklaFalinGelsin = 0;
  Random rnd = new Random();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 150,
            margin: EdgeInsets.only(bottom: 20),
            child: Image.asset(
              "assets/images/falci.png",
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  tiklaFalinGelsin = 1 + rnd.nextInt(6 - 1);
                  print("tiklaFalinGelsin => $tiklaFalinGelsin");
                });
              },
              leading: Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              title: Text(
                "Aşk Durumu",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.red,
                ),
              ),
              tileColor: Colors.white,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  tiklaFalinGelsin = 6 + rnd.nextInt(11 - 6);
                  print("tiklaFalinGelsin => $tiklaFalinGelsin");
                });
              },
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.green,
              ),
              title: Text(
                "Para Durumu",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                ),
              ),
              tileColor: Colors.white,
            ),
          ),
          Card(
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
            child: ListTile(
              onTap: () {
                setState(() {
                  tiklaFalinGelsin = 11 + rnd.nextInt(16 - 11);
                  print("tiklaFalinGelsin => $tiklaFalinGelsin");
                });
              },
              leading: Icon(
                Icons.explore,
                color: Colors.blue,
              ),
              title: Text(
                "Günlük Tavsiye",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.blue,
                ),
              ),
              tileColor: Colors.white,
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 150,
            width: double.infinity,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
              child: Text(
                yanitlar[tiklaFalinGelsin],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
