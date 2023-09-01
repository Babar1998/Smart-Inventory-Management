import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:simsfyp/vendpurchaseorder.dart';
import 'package:simsfyp/addpurchaseorder.dart';

class PurchaseInventory extends StatefulWidget {
  const PurchaseInventory({Key? key}) : super(key: key);

  @override
  State<PurchaseInventory> createState() => _PurchaseInventoryState();
}

class _PurchaseInventoryState extends State<PurchaseInventory> {
  final dbShowRefrence = FirebaseDatabase.instance.ref('Inventory');
  DatabaseReference ref = FirebaseDatabase.instance.ref('Inventory');
  //controllers
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => const VendorPurchase()));
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Text("Inventory"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: TextFormField(
              // keyboardType: TextInputType.phone,
              controller: searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: dbShowRefrence,
                itemBuilder: (context, snapshot, animation, index) {
                  final name = snapshot.child('name').value.toString();
                  final quantity = snapshot.child('quantity').value.toString();
                  final category = snapshot.child('category').value.toString();
                  final price = snapshot.child('price').value.toString();
                  final id = snapshot.child('id').value.toString();

                  if (searchController.text.isEmpty) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 12, left: 10, right: 12),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.all(08),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    quantity,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddPurchase(
                                          name, quantity, category, price, id),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else if (name
                      .toLowerCase()
                      .contains(searchController.text.toLowerCase())) {
                    return Container(
                      margin:
                          const EdgeInsets.only(top: 12, left: 10, right: 12),
                      // color: Colors.white,
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 255, 255, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue,
                            blurRadius: 3.0, // soften the shadow
                            spreadRadius: 2.0, //extend the shadow
                            offset: Offset(
                              2.0, // Move to right 5  horizontally
                              2.0, // Move to bottom 5 Vertically
                            ),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 10,
                                ),
                                padding: const EdgeInsets.all(08),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                child: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    category,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    quantity,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 20,
                                    ),
                                  ),
                                  Text(
                                    price,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      // fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AddPurchase(
                                          name, quantity, category, price, id),
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.shopping_cart),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }
}
