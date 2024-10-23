import 'package:flutter/material.dart';

class Resep extends StatefulWidget {
  const Resep({super.key});

  @override
  State<Resep> createState() => _ResepState();
}

class _ResepState extends State<Resep> {
  final List step = [
    {
      'title': 'Isi panci sekitar 400-500 ml',
      'check': Icons.check_box_outlined
    },
    {
      'title': 'Didihkan air menggunakan api dalam kompor yang sudah menyala',
      'check': Icons.check_box_outlined
    },
    {
      'title': 'Buka INDOMIE kesayangan kalian',
      'check': Icons.check_box_outlined
    },
    {
      'title':
          'Masukkan Mie kedalam air yang telah mendidih (bisa ditambah dengan sayur atau telur)',
      'check': Icons.check_box_outlined
    },
    {
      'title': 'Sembari menunggu mie matang siapkan piring dan bumbunya',
      'check': Icons.check_box_outlined
    },
    {
      'title':
          'Setelah mie matang, buang air rebusan (untuk varian INDOMIE goreng), dan sisakan air (untuk varian mie rebus)',
      'check': Icons.check_box_outlined
    },
    {
      'title':
          'Campurkan mie ke dalam piring dan bumbu yang telah disiapkan tadi',
      'check': Icons.check_box_outlined
    },
    {
      'title':
          'Sajikan INDOMIE dan nikmati rasanya!!! (ah jadi pengen makan INDOMIE juga)',
      'check': Icons.check_box_outlined
    },
  ];

  var _favoriteIcon = Icons.favorite_border_outlined;

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                //background
                Container(
                  width: double.infinity,
                  height: screen.height * 0.6,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 240, 109, 53),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/indomie_goreng.jpg',
                          scale: 2,
                          width: double.infinity,
                          height: 300,
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      //title
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Indomie',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      //description
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Text(
                          'Indomie adalah mie instan paling populer yang dikenal dengan rasa lezat dan bumbu khas. Mudah disajikan dan menjadi favorit di berbagai negara sebagai hidangan cepat dan nikmat',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                //rating and favorit
                Positioned(
                  top: 272,
                  left: 28,
                  child: SizedBox(
                    width: 380,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18)),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '4.7/5',
                                style: TextStyle(fontSize: 18),
                              ),
                              Icon(
                                Icons.star,
                                color: Colors.orange,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                if (_favoriteIcon ==
                                    Icons.favorite_border_outlined) {
                                  _favoriteIcon = Icons.favorite;
                                } else {
                                  _favoriteIcon =
                                      Icons.favorite_border_outlined;
                                }
                              });
                            },
                            icon: Icon(
                              _favoriteIcon,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //TO-DO
                Positioned(
                  top: 510,
                  left: 85,
                  child: Container(
                    width: 250,
                    height: 50,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                    ),
                    child: const Text(
                      'TO-DO',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: step.length,
                itemBuilder: (context, index) => Container(
                  height: 100,
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18)),
                  child: ListTile(
                    leading: Text(
                      '${index + 1}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    title: Text(
                      step[index]['title'],
                      style: const TextStyle(fontSize: 15),
                    ),
                    trailing: IconButton(
                      onPressed: () => {
                        setState(
                          () {
                            if (step[index]['check'] ==
                                Icons.check_box_outlined) {
                              step[index]['check'] = Icons.check_box;
                            } else {
                              step[index]['check'] = Icons.check_box_outlined;
                            }
                          },
                        )
                      },
                      icon: Icon(
                        step[index]['check'],
                        color: const Color.fromARGB(255, 244, 203, 156),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
