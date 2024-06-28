import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_first_app/Ai/views/CameraView.dart';
import 'package:my_first_app/Ai/views/siteObjects.dart';

class SiteZones extends StatefulWidget {
  const SiteZones({super.key});

  @override
  State<SiteZones> createState() => _SiteZoneState();
}

class _SiteZoneState extends State<SiteZones> with TickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
 Widget build(BuildContext context) {
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
  stops: [0.0, 0.1,0.2, 0.4,0.9, 1.0], 
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
                      'Site de Tunisie',
                      style: TextStyle(
                        fontFamily: 'Outfit',
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 40), 
                  ],
                ),
              ),
              Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SiteObjects(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: Color(0xFF249E8A),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      'Voir la liste des appareils de ce site',
                      style: TextStyle(
                        fontFamily: 'Readex Pro',
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GridView.count(
                  padding: const EdgeInsets.all(16.0),
                  crossAxisCount: 2,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                  children: [
                    buildZoneCard('Rez de Chaussée', '10','2000KW', context),
                    buildZoneCard('Zone ETG 1', '6','2000KW', context),
                    buildZoneCard('Zone ETG 2', '8','2000KW', context),
                    buildZoneCard('Zone ETG 3', '20','2000KW', context),
                    buildZoneCard('Zone ETG 4', '3','2000KW', context),
                    buildZoneCard('Zone Parking', '1','2000KW', context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildZoneCard(String zone, String numApp,String Consumption ,BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
         Row(
                children: [    
                   Text(
                zone,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
              ),
            
                      ],
                      ),
              Text(
                 'Consommation ',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 13,
                 color:Color(0xFF567BDC),
                 fontWeight: FontWeight.bold
                ),
              ),
               Text(
                 Consumption,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 12,
                 color:Color.fromRGBO(112, 112, 112, 1)
                ),
              ),
              Text(
                 'Appareils Connectées',
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 13,
                 color:Color(0xFF567BDC),
                 fontWeight: FontWeight.bold
                ),
              ),
               Text(
                 numApp,
                style: TextStyle(
                  fontFamily: 'Readex Pro',
                  fontSize: 12,
                 color:Color.fromRGBO(112, 112, 112, 1)
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        'Ajouter Appareil ',
                        style: TextStyle(fontSize: 12, color: Color(0xFF249E8A),  fontFamily: 'Readex Pro',  fontWeight: FontWeight.bold,),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 35, 
                        height: 35, 
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 206, 231, 227),
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt, color: Color.fromARGB(255, 110, 162, 153)),
                          iconSize: 20, 
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CameraView(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
