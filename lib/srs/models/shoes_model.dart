class NikeShoes {
  final String model;
  final List<String> image;
  final int oldPrice;
  final int price;
  final List<String> sizes;
  final String vulgo;
  final String imagem;
  final int color;

  NikeShoes({
    this.imagem,
    this.sizes,
    this.model,
    this.image,
    this.oldPrice,
    this.price,
    this.vulgo,
    this.color,
  });
}

final shoes = <NikeShoes>[
  NikeShoes(
      imagem: 'assets/images/shoes10_200.png',
      model: 'NIKE AIR MAX ZEPHYR',
      price: 142,
      oldPrice: 190,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'AIR MAX',
      image: [
        'assets/images/shoes10_t.png',
        'assets/images/shoes10_ls.png',
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      imagem: 'assets/images/shoes6_200.png',
      model: 'NIKE AIR ZOOM ALPHAFLY',
      price: 275,
      oldPrice: 320,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'ZOOM',
      image: [
        'assets/images/shoes6_t.png',
        'assets/images/shoes6_ls.png',
        'assets/images/shoes6_tt.png',
        'assets/images/shoes6_c.png',
        'assets/images/shoes6_b.png'
      ],
      color: 0xFFFCF5EB),
  /*NikeShoes(
      model: 'PG 5 "LA DRIP"',
      price: 110,
      oldPrice: 180,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'LA',
      image: [
        'assets/images/shoes7_t.png',
        'assets/images/shoes7_ls.png',
        'assets/images/shoes7_tt.png',
        'assets/images/shoes7_c.png',
        'assets/images/shoes7_b.png'
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      model: 'NIKE SPACE HIPPIE',
      price: 73,
      oldPrice: 130,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'SPACE',
      image: [
        'assets/images/shoes8_t.png',
        'assets/images/shoes8_ls.png',
        'assets/images/shoes8_tt.png',
        'assets/images/shoes8_c.png',
        'assets/images/shoes8_b.png'
      ],
      color: 0xFFFCF5EB),*/
  NikeShoes(
      imagem: 'assets/images/shoes9_200.png',
      model: 'PG 4',
      price: 89,
      oldPrice: 120,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'LA',
      image: [
        'assets/images/shoes9_t.png',
        'assets/images/shoes9_ls.png',
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      imagem: 'assets/images/shoes2_200.png',
      model: 'NIKE AIR ZOOM TEMPO',
      price: 200,
      oldPrice: 299,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'ZOOM',
      image: [
        'assets/images/shoes2_t.png',
        'assets/images/shoes2_ls.png',
        'assets/images/shoes2_tt.png',
        'assets/images/shoes2_b.png'
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      imagem: 'assets/images/shoes4_200.png',
      model: 'AIR JORDAN XXXV',
      price: 180,
      oldPrice: 299,
      sizes: ['US5', 'US6', 'US7', 'US9', 'US11'],
      vulgo: 'XXXV',
      image: [
        'assets/images/shoes4_t.png',
        'assets/images/shoes4_ls.png',
        'assets/images/shoes4_tt.png',
        'assets/images/shoes4_c.png',
        'assets/images/shoes4_b.png'
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      imagem: 'assets/images/shoes3_200.png',
      model: 'GO FLYEASE',
      price: 120,
      oldPrice: 200,
      sizes: ['US5', 'US6', 'US7', 'US8', 'US9', 'US10', 'US11'],
      vulgo: 'FLYEASE',
      image: [
        'assets/images/shoes3_t.png',
        'assets/images/shoes3_ls.png',
        'assets/images/shoes3_tt.png',
        'assets/images/shoes3_l.png',
      ],
      color: 0xFFFEF7ED),
  NikeShoes(
      imagem: 'assets/images/shoes5_200.png',
      model: 'NIKE COSMIC UNITY',
      price: 160,
      oldPrice: 250,
      sizes: ['US5', 'US6', 'US7', 'US8', 'US9', 'US10', 'US11'],
      vulgo: 'AMALGAM',
      image: [
        'assets/images/shoes5_t.png',
        'assets/images/shoes5_ls.png',
        'assets/images/shoes5_tt.png',
        'assets/images/shoes5_c.png',
        'assets/images/shoes5_b.png',
      ],
      color: 0xFFFEF7ED),
  NikeShoes(
      imagem: 'assets/images/shoes2_200.png',
      model: 'NIKE AIR ZOOM TEMPOO',
      price: 200,
      oldPrice: 299,
      sizes: ['US6', 'US8', 'US9', 'US10', 'US11'],
      vulgo: 'ZOOOM',
      image: [
        'assets/images/shoes2_t.png',
        'assets/images/shoes2_ls.png',
        'assets/images/shoes2_tt.png',
        'assets/images/shoes2_b.png'
      ],
      color: 0xFFFCF5EB),
  NikeShoes(
      imagem: 'assets/images/shoes1_200.png',
      model: 'NIKE AIR VAPORMAX EVO',
      price: 200,
      oldPrice: 299,
      sizes: ['US6', 'US8', 'US9', 'US11'],
      vulgo: 'EVO',
      image: [
        'assets/images/shoes1_t.png',
        'assets/images/shoes1_l.png',
        'assets/images/shoes1_c.png',
        'assets/images/shoes1_b.png'
      ],
      color: 0xFFF6F6F6),
];
