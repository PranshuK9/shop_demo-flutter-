import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_demo/cartProvider.dart';
import 'package:shop_demo/global_variables.dart';

class Cartpage extends StatelessWidget {
  const Cartpage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cartprovider>(context).cart;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context,index){
          final cartItem = cart[index];

          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 35,
            ),
            trailing: IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text('Delete Product',
                          style: Theme.of(context).textTheme.titleMedium,
                          ),
                          content: Text('Are you sure you want to remove the product'),
                          actions: [
                            TextButton(
                                onPressed:(){
                                  Navigator.of(context).pop();
                                },
                                child: const Text('No',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),)
                            ),
                            TextButton(
                                onPressed:(){
                                  Provider.of<Cartprovider>(context,listen: false)
                                      .removeProduct(cartItem);
                                  Navigator.of(context).pop();

                                },
                                child: const Text('Yes',
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.bold,
                                  ),)
                            )
                          ],
                        );
                      }
                  );
                },
                icon: Icon(Icons.delete , color: Colors.red,)
            ),
            title: Text(
              cartItem['title'].toString(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text('Size: ${cartItem['size']}'),
          );
        },
      ),
    );
  }
}
