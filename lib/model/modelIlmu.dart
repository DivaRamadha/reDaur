class OrganikdanNon{
  final int id;
  final String kategori;
  final String desc;
  final String imgUrl;
  final String desc2;
  final String imgUrl2;
  final String desc3;

  OrganikdanNon({this.id, this.kategori, this.desc,this.imgUrl, this.desc2, this.imgUrl2, this.desc3, });
}

final List<OrganikdanNon> listOrgaNon = [
  OrganikdanNon(
    id: 0,
    kategori: 'Organik',
    desc: 'Sampah organik dapat digolongkan menjadi dua kategori'
    + ' yaitu sampah organik basah (pembusukan buah-buahan dan sisa sayuran) dan sampah organik kering (kertas, kayu, ranting pohon, dan daun kering). Keduanya memiliki manfaat bagi kehidupan sehari-hari seperti : \n\n'
    + '1. Dapat diolah menjadi kompos dan pupuk sederhana\n\n'
    + 'Sebagaimana kita ketahui, sampah organik dapat dijadikan kompos, namun masih banyak yang belum tahu cara pengolahannya dan dimanfaatkan untuk pertanian, sebab butuh ketelatenan dan melalui tahapan yang benar. Apabila tidak telaten, sampah organik bisa diolah menjadi pupuk sederhana. Hanya diperlukan suatu lubang untuk pembuangan sampah organik di tanah dan tunggu hingga membusuk hingga menyerupai tanah. Unsur hara yang dihasilkan tersebut dapat digunakan untuk menyuburkan tanaman. \n\n'
  ),
  OrganikdanNon(
    id: 1,
    kategori: 'Sampah AnOrganik',
    desc2: 'Sampah'
  )
];

class ModelSampahOrganik{
  final String kategori;
  final String desc;
  final String imgUrl;
  final String url;


  ModelSampahOrganik({this.url,  this.kategori, this.desc, this.imgUrl});
}

final List<ModelSampahOrganik> sampahOrganik = [
  ModelSampahOrganik(
    kategori: 'Pupuk Kompos',
    desc: 'Salah satu manfaat sampah organik yang sudah dikenal adalah dapat diolah menjadi kompos. Pupuk kompos merupakan pupuk alami untuk tanaman.',
    imgUrl: 'https://i0.wp.com/f1-styx.imgix.net/article/2020/02/28172417/pp1-pupuk-kompos-di-atas-kedua-telapak-tangan-seseorang.jpg?fit=1432%2C1074&ssl=1',
    url: 'https://www.dekoruma.com/artikel/97765/cara-membuat-pupuk-kompos'
  ),
  ModelSampahOrganik(
    kategori: 'Dapat Diolah Menjadi Pakan Ternak',
    desc: 'Tidak hanya dimanfaatkan untuk pupuk kompos, sampah yang berasal dari bahan-bahan organis ini ternyata juga bisa dimanfaatkan untuk tambahan pakan ternak.',
    imgUrl: 'https://www.pertanianku.com/wp-content/uploads/2017/02/Membuat-Pakan-Ikan-dari-Sampah-Organik-Kenapa-Tidak.jpg',
    url: 'https://www.pertanianku.com/membuat-pakan-ikan-dari-sampah-organik-kenapa-tidak/' 
  ),
  ModelSampahOrganik(
    kategori: 'Biogas',
    desc: 'Manfaat lain dari sampah organik adalah dapat dimanfaatkan menjadi biogas. Sampah dari kotoran hewan, limbah tahu, atau limbah tempe bisa dimanfaatkan untuk membuat biogas karena menghasilkan gas metana.',
    imgUrl: 'https://bacaterus.com/wp-content/uploads/2015/03/Cara-Membuat-Biogas-Dari-Sampah-Organik.jpg',
    url: 'https://bacaterus.com/cara-membuat-biogas-dari-sampah-organik/'
  ),
  ModelSampahOrganik(
    kategori: 'Bahan Kerajinan Tangan',
    desc: 'Banyak yang mengira jika pemanfaatan sampah untuk kerajinan tangan atau souvenir hanya dapat dilakukan dari sumber sampah anorganik, misalnya plastik. Padahal, sampah organik juga bisa dimanfaatkan untuk membuat kerajinan tangan yang memiliki nilai jual tinggi.',
    imgUrl: 'https://3.bp.blogspot.com/-cS748kwmJro/WIBer0ru7EI/AAAAAAAACCM/ClrhObWpT3wn4sA9ncB23sZseKtBLHjFACLcB/s400/kerajinan-limbah-organik-2_opt.jpg',
    url: 'http://tecknosia.blogspot.com/2017/01/45-ide-kerajinan-tangan-dari-bahan.html'
  ),

];

class ModelSampahKaca{
  final String kategori;
  final String desc;
  final String imgUrl;
  final String url;


  ModelSampahKaca({this.url,  this.kategori, this.desc, this.imgUrl});
}

final List<ModelSampahKaca> sampahKaca = [
  ModelSampahKaca(
    kategori: 'Vas Bunga',
    desc: 'Membuat Vas Bunga Cantik dari Daur Ulang Botol Kaca',
    imgUrl: 'https://3.bp.blogspot.com/-morKN73Mh6c/VparbgYGW6I/AAAAAAAAGzU/hBCE7Eq9fwY/s640/How-to-DIY-Nice-Vase-from-Recycled-Glass-Bottle-6.jpg',
    url: 'http://permudah-hidup.blogspot.com/2016/12/membuat-vas-bunga-cantik-dari-daur.html'
  ),
  ModelSampahKaca(
    kategori: 'Lampu Hias',
    desc: 'Membuat lampu hias sederhana dari botol kaca dan lilin',
    imgUrl: 'https://lh3.googleusercontent.com/-O17rEbcAdbI/V8w3rbbHmTI/AAAAAAAAAYI/tB6-f7Ed-3M/s1600/image%25255B3%25255D.png',
    url: 'http://www.carabuatsendiri.com/2016/09/membuat-lampu-hias-sederhana-dari-botol.html'
  ),
  ModelSampahKaca(
    kategori: 'Bahan Kerajinan Tangan',
    desc: 'Menyulap Sampah Kaca menjadi Bisnis Daur Ulang',
    imgUrl: 'https://bisnisukm.com/uploads/2009/07/menarakaca05.jpg',
    url: 'https://bisnisukm.com/sulap-sampah-kaca-menjadi-bisnis-daur-ulang.html'
  ),

];