import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final String deskripsi;

  DetailPage({
    required this.title,
    required this.price,
    required this.image,
    required this.deskripsi,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.network(
                  image,
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.width * 0.8,
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
                      size: MediaQuery.of(context).size.width * 0.8,
                    );
                  },
                ),
              ),
              SizedBox(height: 16),
              Text(
                title,
                style: Theme.of(context).textTheme.headlineMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                price,
                style: TextStyle(color: Colors.red, fontSize: 24),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                deskripsi,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
