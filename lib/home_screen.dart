import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final TextEditingController _amountOfGlassTEController = TextEditingController(text: '1');
  List<WaterTrack> waterConsumeList = [];
  int totalAmount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Tracker'),
        //backgroundColor: Colors.green,
        //foregroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Total Consume',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  '$totalAmount',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 100,
                      child: TextField(
                        controller: _amountOfGlassTEController,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          int amount = int.tryParse(_amountOfGlassTEController.text.trim()) ?? 1;
                          WaterTrack waterTrack = WaterTrack(DateTime.now(), amount);
                          totalAmount += amount;
                          waterConsumeList.add(waterTrack);
                          setState(() {});
                          }, child: const Text('Add')
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
                // shrinkWrap: true,
                // primary: false,
              itemCount: waterConsumeList.length,
                //reverse: true,
                itemBuilder: (context,index){
              return Card(
                elevation: 4,
                child: ListTile(
                  onLongPress: (){
                    print('on long press');
                    Navigator.pop(context);
                  },
                  leading: CircleAvatar(
                    //backgroundColor: Colors.green,
                    //foregroundColor: Colors.black,
                    child: Text('${index+1}'),
                  ),
                  title: Text(DateFormat('HH:mm:ss a dd-MM-yyyy')
                      .format(waterConsumeList[index].time)),
                  trailing: Text('${waterConsumeList[index].noOfGlass}',style: Theme.of(context).textTheme.headlineSmall),
                )
              );
            }
            ),
          ),
        ],
      ),
    );
  }
}

class WaterTrack{
  final DateTime time;
  final int noOfGlass;

  WaterTrack(this.time, this.noOfGlass);
}