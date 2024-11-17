import 'package:flutter/material.dart';
import 'detail_page.dart';

class GridViewDataScreen extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      "title": "Baju 1",
      "price": "Rp. 2.150.000",
      "image":
          "https://images.footballfanatics.com/chelsea/chelsea-nike-third-stadium-shirt-2024-25_ss5_p-201095792+pv-1+u-9pcsrtraivp8vxgua7h8+v-wvzugqafwht2axshsu0w.jpg?_hv=2&w=900",
      "deskripsi": "Deskripsi untuk Baju 1"
    },
    {
      "title": "Baju 2",
      "price": "Rp. 2.220.000",
      "image":
          "https://images.footballfanatics.com/chelsea/chelsea-nike-away-stadium-shirt-2024-25_ss5_p-201095783+pv-2+u-vfx0sc8fgctpjop9net3+v-jivdoxhzhgke4obbsryt.jpg?_hv=2&w=900",
      "deskripsi": "Deskripsi untuk Baju 2"
    },
    {
      "title": "Bola",
      "price": "Rp. 200.000",
      "image":
          "https://images.footballfanatics.com/chelsea/chelsea-tracer-football-size-5_ss4_p-13398126+u-vhphu2ictuct71qn1iqj+v-bbc31912c7c3477990045c47f9cd1c1a.jpg?_hv=2&w=900",
      "deskripsi": "Deskripsi untuk Bola"
    },
    {
      "title": "Topi",
      "price": "Rp. 250.000",
      "image":
          "https://images.footballfanatics.com/chelsea/chelsea-new-era-seasonal-9forty-black-adults_ss5_p-201523551+pv-3+u-sl4vfmgxyyhb5zrk3key+v-glbh7rfroeze2xr8dwbw.jpg?_hv=2&w=900",
      "deskripsi": "Deskripsi untuk Topi"
    },
    // Tambahkan data sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grid View Data'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(
                    title: data[index]['title']!,
                    price: data[index]['price']!,
                    image: data[index]['image']!,
                    deskripsi:
                        data[index]['deskripsi'] ?? 'Tidak ada deskripsi',
                  ),
                ),
              );
            },
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      data[index]['image']!,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      (loadingProgress.expectedTotalBytes ?? 1)
                                  : null,
                            ),
                          );
                        }
                      },
                      errorBuilder: (BuildContext context, Object error,
                          StackTrace? stackTrace) {
                        return Icon(
                          Icons.error,
                          color: Colors.red,
                          size: 120,
                        );
                      },
                    ),
                    SizedBox(height: 8),
                    Text(
                      data[index]['title']!,
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 8),
                    Text(
                      data[index]['price']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      data[index]['deskripsi'] ?? 'Tidak ada deskripsi',
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
