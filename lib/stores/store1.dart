import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:store_app/componants/prod_card.dart';


List<Product> products = [
  Product(
      imagePath: 'images/Note8.jpg',
      price: 140,
      colorExist: [
        Colors.white,
        Colors.black,
        Colors.blue
      ],
      title: 'Redmi note8 Global version 4 Gb Ram 64Gb Rom '),
  Product(
      imagePath: 'images/Note8pro.jpg',
      price: 200,
      colorExist: [
        Colors.white,
        Colors.black,
        Colors.blue
      ],
      title: 'Redmi note 8 pro Global version 4 Gb Ram 64Gb Rom '),

  Product(
      colorExist: [
        Colors.white,
        Colors.black,
        Colors.blue
      ],
      imagePath: 'images/note9.jpeg',
      price: 115.37,
      title:
          'Redmi Note 9 Specs: ✓High performance Helio G85 ✓48MP Quad Camera Array ✓5020mAh Fast-Charging Battery ✓Aura Balance Design ✓16.58cm(6.53) FHD+‏'),
  Product(
      colorExist: [
        Colors.white,
        Colors.black,
        Colors.blue,
        Colors.green,
      ],
      imagePath: 'images/Note9promax.jpg',
      price: 213,
      title:
          'Redmi Note 9 Pro Specifications: ✓48MP AI Quad Camera Array ✓16.9cm (6.67) FHD+ DotDisplay ✓Qualcomm® Snapdragon™ 720G ✓5020mAh battery ✓Side-Mounted'),
  Product(
      colorExist: [
        Colors.white,
        Colors.black,
      ],
      imagePath: 'images/Note7.jpg',
      price: 120,
      title:
          'Redmi Note 7 Pro Specs: ✓48MP AI Dual camera ✓Qualcomm® Snapdragon™ 675, processor ✓Qualcomm®️ Quick Charge™️4 ✓Corning® ️Gorilla® ️Glass 5 ✓Type-C  '),
  Product(
      colorExist: [
        Colors.white,
        Colors.black,
        Colors.green,
        Colors.red,
        Colors.yellow,
        Colors.blue
      ],
      imagePath: 'images/redmi 9.jpg',
      price: 119,
      title:
          'Redmi 9 Specifications: ✓4GB RAM, 128GB Storage ✓Helio G35 Octa-core processor 2.3GHz ✓16.58 (6.53) HD+ IPS Display Immersive Screen ✓5000mAh '),
];
