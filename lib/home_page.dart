import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:screenutil_poc/custom_expansion_tile_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('DECOUVRIR NAS PLAYLISTS',
                    style: TextStyle(fontSize: 16.sp)),
                const SizedBox(height: 16),
                Column(
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 137,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                              'https://images.pexels.com/photos/9737456/pexels-photo-9737456.jpeg?auto=compress&cs=tinysrgb&h=750&w=1260',
                              fit: BoxFit.cover)),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(
                          Icons.ac_unit,
                          size: 12.w,
                        ),
                        Icon(
                          Icons.ac_unit,
                          size: 12.w,
                        ),
                        Icon(
                          Icons.ac_unit,
                          size: 12.w,
                        ),
                      ],
                    ),
                    CustomExpansionTileWidget(
                      title: "Jeu d'exterieur",
                      children: [],
                    ),
                  ],
                ),
                Text('DECOUVRIR NAS PLAYLISTS',
                    style: TextStyle(fontSize: 12.sp)),
                Text('DECOUVRIR NAS PLAYLISTS',
                    style: TextStyle(fontSize: 14.sp)),
                Text(
                  'DECOUVRIR NAS PLAYLISTS',
                  style: TextStyle(fontSize: 16.sp),
                  textScaleFactor: 1.0,
                ),
                const SizedBox(height: 16),
                Container(
                  color: Colors.red,
                  width: 300.w,
                  height: 100.h,
                  child: const Center(
                    child: Text(
                        'sem constraints\n(nunca para de alterar o tamanho)'),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  constraints:
                      const BoxConstraints(maxHeight: 200, maxWidth: 400),
                  color: Colors.blue,
                  width: 300.w,
                  height: 100.h,
                  child: const Center(
                    child: Text('com constraints'),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
