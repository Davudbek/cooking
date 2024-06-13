import 'package:cooking/img/img.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Beginning extends StatefulWidget {
  const Beginning({super.key});

  @override
  State<Beginning> createState() => _BeginningState();
}

class _BeginningState extends State<Beginning> {
  final image = ImageFromNetvork();
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber[500],
        title: const Text(
          'Готовим',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3), // Цвет тени
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    suffixIcon: Icon(Icons.search,
                        color: Colors.grey), // Иконка с цветом
                    hintText: 'Поиск рецептов...',
                    border: InputBorder.none, // Убираем черную рамку
                    contentPadding: EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 20), // Отступы внутри поля ввода
                  ),
                ),
              ),
            ),

            SizedBox(
              height: h * 0.74,
              width: w,
              child: GridView.builder(
                itemCount: ImageFromNetvork().homimag.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  // final images = ImageFromNetvork(

                  // );
                  return Container(
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(24)),
                    margin:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    height: h * 0.39,
                    width: w * 0.2,
                    child: Column(
                      children: [
                        SizedBox(
                          width: w,
                          height: h * 0.12,
                          child: Image.network(image.homimag[index]),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
