import 'package:flutter/material.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  State<AlarmScreen> createState() => _AlarmScreenState();
}

class _AlarmScreenState extends State<AlarmScreen> {
  String? date;
  String? time;

  List listDate = [];
  List listTime = [];

  void addToList() {
    listDate.add(date);
    listTime.add(time);
  }

  bool switched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.teal,
          onPressed: () {
            ShowDateDialog().then((value) {
              setState(() {
                print(value);
                date = value;
              });

              showTimeDilog().then((value) {
                setState(() {
                  time = value;
                });

                addToList();
              });
            });
          },
          child: Icon(Icons.add),
        ),
        body: listTime.isEmpty
            ? Center(
                child: Text(
                "No Alarm , Please Enter Some of Them",
                maxLines: 2,
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal),
              ))
            : ListView.builder(
                itemBuilder: (context, index) => buildItem(
                  listDate[index],
                  listTime[index],
                ),
                itemCount: listTime.length,
              ));
  }

  Widget buildItem(String date, String time) => Padding(
        padding: const EdgeInsets.all(5.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.label,
                            color: Colors.grey,
                            size: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Alarm",
                              style:
                                  TextStyle(color: Colors.teal, fontSize: 17),
                            ),
                          ),
                          Text(date,
                              style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black)),
                        ],
                      ),
                      Text(
                        "$time",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Center(
                    child: Container(
                      child: Switch(
                        activeColor: Colors.teal,
                        inactiveThumbColor: Colors.grey,
                        value: switched,
                        onChanged: (value) {
                          setState(() {
                            switched = value;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Future ShowDateDialog() async {
    var date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    print(date);
    return date.toString().substring(0, 10);
  }

  Future showTimeDilog() async {
    var time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    var locailzation = MaterialLocalizations.of(context);
    locailzation.formatTimeOfDay(time!).toString();

    print(time);
    print(locailzation.formatTimeOfDay(time).toString());

    return locailzation.formatTimeOfDay(time).toString();
  }
}
