import 'package:flutter/material.dart';

class EditCart extends StatefulWidget {
  const EditCart({super.key});

  @override
  State<EditCart> createState() => _EditCartState();
}

class _EditCartState extends State<EditCart> {
  bool _valueCheck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff3B3B1A),
        centerTitle: true,
        title: Text(
          'EpruvShop',
          style: TextStyle(
            fontFamily: 'Gilroy',
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 12),
          Text(
            'EditCart',
            style: TextStyle(
              fontFamily: 'Gilroy',
              fontSize: 36,
              color: Color(0xff3B3B1A),
            ),
          ),
          SizedBox(height: 12),
          Expanded(
            child: ListView.builder(
              // shrinkWrap: true,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [
                    Card(
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/image/pro4.jpg'),
                        ),
                        title: Text(
                          'data',
                          style: TextStyle(fontFamily: 'Gilroy'),
                        ),
                        subtitle: Text('data\ndata\ndata'),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Checkbox(
                              activeColor: Color(0xff3B3B1A),
                              value: _valueCheck,
                              onChanged: (value) {
                                setState(() {
                                  _valueCheck = value!;
                                });
                              },
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
