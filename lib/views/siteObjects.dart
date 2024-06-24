import 'package:flutter/material.dart';

class SiteObjects extends StatefulWidget {
  @override
  _SiteObjectsState createState() => _SiteObjectsState();
}

class _SiteObjectsState extends State<SiteObjects> {
  final List<Map<String, String>> objects = [
    {'name': 'Computer', 'Zone': 'zone Etage 1 ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Freezer', 'Zone': 'zone Etage 2 ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Printer', 'Zone': 'zone Etage 3 ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Photocopier', 'Zone': 'zone Etage 4 ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Fax Machine', 'Zone': 'Rez de chaussée ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Laptop', 'Zone': 'Parking', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
    {'name': 'Air Conditioner', 'Zone': 'zone Etage 4 ', 'image': 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8'},
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final filteredObjects = objects.where((object) {
      final nameLower = object['name']!.toLowerCase();
      final zoneLower = object['Zone']!.toLowerCase();
      final queryLower = searchQuery.toLowerCase();

      return nameLower.contains(queryLower) || zoneLower.contains(queryLower);
    }).toList();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 157, 233, 220),
                Colors.white,
                Colors.white,
                Colors.white,
                Colors.white,
                Color.fromARGB(255, 139, 212, 200),
              ],
              stops: [0.0, 0.2, 0.3, 0.4, 0.9, 1.0],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 30, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    Text(
                      'Tous les sites de Tunisie',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 40), // Adjust the space between back arrow and text
                  ],
                ),
              ),
           Padding(
  padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
  child: Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 5),
        ),
      ],
      borderRadius: BorderRadius.circular(12),
    ),
    child: TextField(
      onChanged: (query) {
        setState(() {
          searchQuery = query;
        });
      },
      decoration: InputDecoration(
        hintText: 'Search...',
        prefixIcon: Icon(Icons.search),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color.fromARGB(255, 255, 255, 255),
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
      ),
    ),
  ),
),

              Expanded(
                child: ListView.builder(
                  itemCount: filteredObjects.length,
                  itemBuilder: (context, index) {
                    final object = filteredObjects[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      object['image']!,
                                      width: 70,
                                      height: 70,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        object['name']!,
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        object['Zone']!, // Replace this with the actual zone value if available
                                        style: TextStyle(
                                          fontFamily: 'Readex Pro',
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 35, // Taille du cercle
                                    height: 35, // Taille du cercle
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 206, 231, 227),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(Icons.delete_forever_outlined, color: Color.fromARGB(255, 110, 162, 153)),
                                        iconSize: 20, // Taille de l'icône
                                        onPressed: () {
                                          // Add your delete functionality here
                                        },
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 8), // Add some space between the icons
                                  Container(
                                    width: 35, // Taille du cercle
                                    height: 35, // Taille du cercle
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 206, 231, 227),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: IconButton(
                                        icon: Icon(Icons.edit, color: Color.fromARGB(255, 110, 162, 153)),
                                        iconSize: 20, // Taille de l'icône
                                        onPressed: () {
                                          // Add your edit functionality here
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}