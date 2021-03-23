import 'dart:io';

abstract class Member {
  String? name;
  String? birth;
  String? education;
  String? physical;
  String? debut;
  String? position;
  String? mbti;
  String? nickname;
  String? speciality;
  String? imageFile;
}

class EunJi implements Member {
  String? name = "홍은지";

  String? birth = "1992, 07, 19";

  String? debut = "2016 브레이브 걸스 앨범 <변했어>";

  String? education = "명지대학교 (영화뮤지컬학부 뮤지컬공연전공/졸업)";

  String? mbti = "ESFP";

  String? nickname = "왕눈좌, 은로미, 붕어싸만코, 콘치좌, 호호좌";

  String? physical = "168cm, 48kg, AB형, 245mm";

  String? position = "서브보컬, 메인래퍼, 센터";

  String? speciality = "인터넷쇼핑, 영화감상/스트레칭, 요가, 옆돌기, 박지윤 성대모사";

  String? imageFile = "assets/images/weride_eunji.png";
}

class MinYoung implements Member {
  String? name = "김민영";

  String? birth = "1990, 09, 12";

  String? debut = "2016 브레이브 걸스 앨범 <변했어>";

  String? education = "한양대학교 ERICA캠퍼스 (생활무용예술학/휴학)";

  String? mbti = "INTP";

  String? nickname = "메보좌, 트로피칼칼 언니, 미뇽, 망나뇽";

  String? physical = "165cm, AB형";

  String? position = "메인 보컬, 서브 래퍼, 메인 댄서";

  String? speciality = "무용, 유연함";

  String? imageFile = "assets/images/weride_minyoung.png";
}

class Yuna implements Member {
  String? name = "이유나";
  String? birth = "1993, 04, 06";

  String? debut = "2016 브레이브 걸스 앨범 <변했어>";

  String? education = "중흥고등학교 (졸업)";

  String? imageFile = "assets/images/weride_yuna.png";

  String? mbti = "ESFJ";

  String? nickname = "단발좌, 유나형, 칼단발러, 조정간 단발, 쪽팔림좌, 인조인간 18호, '군'바리스타";

  String? physical = "164cm, A형, 240mm";

  String? position = "리드보컬, 리드래퍼";

  String? speciality = "커피 만들기";
}

class YouJoung implements Member {
  String? name = "남유정";
  String? birth = "1991, 05, 02";

  String? debut = "2016 브레이브 걸스 앨범 <변했어>";

  String? education = "성신여자대학교 (미디어커뮤니케이션학/학사)";

  String? imageFile = "assets/images/weride_youjoung.png";

  String? mbti = "ENTP";

  String? nickname = "꼬북좌, 꼬부기, 언니부기, 어니부기, 쵸파, 유랄라";

  String? physical = "163cm, 49kg, AB형";

  String? position = "센터, 서브보컬";

  String? speciality = "행복한 미소";
}
