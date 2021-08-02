import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:mylist/model/entry.dart';
import 'package:mylist/providers/entry.provider.dart';
import 'package:provider/provider.dart';

class DailyPage extends StatefulWidget {
  final Entry entry;

  DailyPage({this.entry});

  @override
  _DailyPageState createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  final entryController = TextEditingController();

  @override
  void dispose() {
    entryController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    final entryProvider = Provider.of<EntryProvider>(context, listen: false);
    if (widget.entry != null) {
      //edit
      entryController.text = widget.entry.entry;

      entryProvider.loadAll(widget.entry);
    } else {
      //add
      entryProvider.loadAll(null);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final entryProvider = Provider.of<EntryProvider>(context);
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(125),
        child: AppBar(
          title: Center(
            child: Text(
              formatDate(entryProvider.date, [MM, ' ', d, ', ', yyyy]),
              style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 23,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.calendar_today_rounded),
              onPressed: () {
                _pickDate(context, entryProvider).then((value) {
                  if (value != null) {
                    entryProvider.changeDate = value;
                  }
                });
              },
            ),
          ],
          backgroundColor: Colors.blueAccent.shade400,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          elevation: 0.5,
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.only(top: 20, left: 50, right: 50),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Your Activities',
                labelStyle: TextStyle(
                  color: Colors.blueAccent.shade400,
                  fontFamily: 'Montserrat',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                border: InputBorder.none,
              ),
              maxLines: 12,
              minLines: 10,
              onChanged: (String value) => entryProvider.changeEntry = value,
              controller: entryController,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, right: 5),
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30,
                            vertical: 15,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            'Save',
                            style: TextStyle(
                              color: Colors.white70,
                              fontFamily: 'Montserrat',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          color: Colors.blueAccent.shade400,
                          onPressed: () {
                            entryProvider.saveEntry();
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 10, left: 5),
                        child: (widget.entry != null)
                            // ignore: deprecated_member_use
                            ? RaisedButton(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontFamily: 'Montserrat',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                color: Colors.blueAccent.shade400,
                                onPressed: () {
                                  entryProvider
                                      .removeEntry(widget.entry.entryId);
                                  Navigator.of(context).pop();
                                },
                              )
                            : Container(),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Future<DateTime> _pickDate(
      BuildContext context, EntryProvider entryProvider) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: entryProvider.date,
        firstDate: DateTime(2019),
        lastDate: DateTime(2050));

    if (picked != null) return picked;
  }
}
