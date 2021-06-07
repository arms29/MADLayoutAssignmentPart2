import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(LayoutAssignmentApp());

class LayoutAssignmentApp extends StatefulWidget {
  @override
  _LayoutAssignmentAppState createState() => _LayoutAssignmentAppState();
}

class _LayoutAssignmentAppState extends State<LayoutAssignmentApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 7,
        child: Scaffold(
          backgroundColor: Colors.blueAccent.shade100,
          appBar: AppBar(
            leading: Icon(Icons.touch_app_outlined),
            title: Text('My IoT Manager'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home)),
                Tab(icon: Icon(Icons.phone_iphone)),
                Tab(icon: Icon(CupertinoIcons.eyeglasses)),
                Tab(icon: Icon(Icons.tv)),
                Tab(icon: Icon(Icons.laptop)),
                Tab(icon: Icon(Icons.watch)),
                Tab(icon: Icon(Icons.camera)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Device_Card(
                          deviceIcon: Icons.phone_iphone,
                          deviceName: 'Smartphone',
                          deviceStatus: true,
                        ),
                        Device_Card(
                          deviceIcon: Icons.tv,
                          deviceName: 'Smart TV',
                          deviceStatus: false,
                        ),
                        Device_Card(
                          deviceIcon: Icons.watch,
                          deviceName: 'Smart watch',
                          deviceStatus: true,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Device_Card(
                          deviceIcon: CupertinoIcons.eyeglasses,
                          deviceName: 'Smart glasses',
                          deviceStatus: false,
                        ),
                        Device_Card(
                          deviceIcon: Icons.laptop,
                          deviceName: 'Smart laptop',
                          deviceStatus: true,
                        ),
                        Device_Card(
                          deviceIcon: Icons.camera,
                          deviceName: 'Smart camera',
                          deviceStatus: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Device_TabBarView(
                deviceIcon: Icons.phone_iphone,
                deviceFullName: 'Pixel 4a 5G',
              ),
              Device_TabBarView(
                deviceIcon: CupertinoIcons.eyeglasses,
                deviceFullName: 'iGlass',
              ),
              Device_TabBarView(
                deviceIcon: Icons.tv,
                deviceFullName: 'Samsung 8K QLED TV',
              ),
              Device_TabBarView(
                deviceIcon: Icons.laptop,
                deviceFullName: 'Google Pixelbook',
              ),
              Device_TabBarView(
                deviceIcon: Icons.watch,
                deviceFullName: 'iWear',
              ),
              Device_TabBarView(
                deviceIcon: Icons.camera,
                deviceFullName: 'Sony Camera 5.2.021',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Device_TabBarView extends StatelessWidget {
  IconData deviceIcon;
  String deviceFullName;

  Device_TabBarView({this.deviceIcon, this.deviceFullName});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          deviceIcon,
          size: 201.0,
        ),
        SizedBox(height: 50.0),
        Text(
          deviceFullName,
          style: TextStyle(fontSize: 33.0),
        ),
      ],
    );
  }
}

class Device_Card extends StatefulWidget {
  IconData deviceIcon;
  String deviceName;
  bool deviceStatus;
  Color cardColor;

  Device_Card({this.deviceIcon, this.deviceName, this.deviceStatus});

  @override
  _Device_CardState createState() => _Device_CardState();
}

class _Device_CardState extends State<Device_Card> {
  @override
  Widget build(BuildContext context) {
    if (widget.deviceStatus == true) {
      widget.cardColor = Colors.white;
      if (widget.deviceIcon == Icons.mobile_off)
        widget.deviceIcon = Icons.phone_iphone;
      if (widget.deviceIcon == Icons.visibility_off)
        widget.deviceIcon = CupertinoIcons.eyeglasses;
      if (widget.deviceIcon == Icons.tv_off) widget.deviceIcon = Icons.tv;
      if (widget.deviceIcon == Icons.phonelink_off)
        widget.deviceIcon = Icons.laptop;
      if (widget.deviceIcon == Icons.timer_off) widget.deviceIcon = Icons.watch;
      if (widget.deviceIcon == Icons.motion_photos_off)
        widget.deviceIcon = Icons.camera;
    } else {
      widget.cardColor = Colors.grey.shade400;
      if (widget.deviceIcon == Icons.phone_iphone)
        widget.deviceIcon = Icons.mobile_off;
      if (widget.deviceIcon == CupertinoIcons.eyeglasses)
        widget.deviceIcon = Icons.visibility_off;
      if (widget.deviceIcon == Icons.tv) widget.deviceIcon = Icons.tv_off;
      if (widget.deviceIcon == Icons.laptop)
        widget.deviceIcon = Icons.phonelink_off;
      if (widget.deviceIcon == Icons.watch) widget.deviceIcon = Icons.timer_off;
      if (widget.deviceIcon == Icons.camera)
        widget.deviceIcon = Icons.motion_photos_off;
    }

    return RaisedButton(
      color: widget.cardColor,
      child: Padding(
        padding: const EdgeInsets.all(33.0),
        child: Column(
          children: [
            Icon(widget.deviceIcon),
            Text(widget.deviceName),
            SizedBox(
              height: 11.0,
            ),
            Text(widget.deviceStatus == true ? 'ON' : 'OFF'),
          ],
        ),
      ),
      onPressed: () {
        setState(() {
          if (widget.deviceStatus == true) {
            widget.deviceStatus = false;
            widget.cardColor = Colors.blue;
          } else {
            widget.deviceStatus = true;
            widget.cardColor = Colors.white;
          }
        });
      },
    );
  }
}
