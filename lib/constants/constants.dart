import 'package:brave_girls/models/album_model.dart';
import 'package:brave_girls/models/profile_model.dart';
import 'package:brave_girls/resources/resources.dart';

List<ProfileModel> memberProfiles = [
  ProfileModel(
    memberName: '브레이브걸스 민영',
    image: Assets.werideMinyoung,
    profile: Profile(
      name_ko: '김민영',
      name_en: 'Min Young Kim',
      birth: '1990년 9월 12일 (30세)',
      ancestry: '경기도 성남시',
      country: '대한민국',
      school: '한양대학교 ERICA캠퍼스 (생활무용예술학 / 휴학)',
      height: '165cm',
      blood: 'AB형',
      debut: "2016년 브레이브걸스 앨범 <변했어>",
      agency: 'Brave Entertainment',
      group: 'Brave Girls',
      position: '메인보컬, 메인댄서',
      mbti: 'INTP',
      nicknames: ['메보좌', '트로피칼칼언니', '미뇽', '망나뇽', '뇽뇽', '역삼동 황금발', '홍민영/흥민영'],
      ability: ['무용', '풋살'],
      link: Link(
        twitter: 'https://twitter.com/nyong2ya',
        instagram: 'https://www.instagram.com/nyong2ya/',
        youtube: 'https://www.youtube.com/channel/UCM7sspcSzirLxsfIUt6i3Vw',
        tiktok: 'https://www.tiktok.com/@bravegirls_my?',
      ),
    ),
  ),
  ProfileModel(
    memberName: '브레이브걸스 유정',
    image: Assets.werideYoujoung,
    profile: Profile(
      name_ko: '남유정',
      name_en: 'Yu Jeong Nam',
      birth: '1991년 5월 2일 (29세)',
      ancestry: '서울특별시',
      country: '대한민국',
      school: '성신여자대학교 (미디어커뮤니케이션학 / 학사)',
      height: '163cm',
      blood: 'AB형',
      debut: "2016년 브레이브걸스 앨범 <변했어>",
      agency: 'Brave Entertainment',
      group: 'Brave Girls',
      position: '센터, 서브보컬',
      mbti: 'ENTP',
      nicknames: ['꼬북좌', '꼬부기', '언니부기', '어니부기', '최번개', '쵸파', '유랄라'],
      ability: ['미식', '댄스', '주짓수'],
      link: Link(
        twitter: 'https://twitter.com/bgyjnice',
        instagram: 'https://www.instagram.com/braveg_yj/',
        youtube: 'https://www.youtube.com/channel/UC0rYv-5_Ce72wegF9_pmDpw/featured',
        tiktok: 'https://www.tiktok.com/@yjistimeless?',
      ),
    ),
  ),
  ProfileModel(
    memberName: '브레이브걸스 은지',
    image: Assets.werideEunji,
    profile: Profile(
      name_ko: '홍은지',
      name_en: 'Eun Ji Hong',
      birth: '1992년 7월 19일 (28세)',
      ancestry: '서울특별시 송파구 잠실본동',
      country: '대한민국',
      school: '명지대학교 (영화뮤지컬학부 뮤지컬공연전공 / 학사)',
      height: '168cm',
      blood: 'AB형',
      debut: "2016년 브레이브걸스 앨범 <변했어>",
      agency: 'Brave Entertainment',
      group: 'Brave Girls',
      position: '센터, 서브보컬, 메인래퍼',
      mbti: 'ESFP',
      nicknames: ['왕눈좌/왕눈이', '은로미', '페페', '은좌', '붕어', '붕어싸만코' '콘치좌', '홍은지', '홍또너', '호호좌', '따봉콘치'],
      ability: ['인터넷 쇼핑', '영화감상/스트레칭', '요가', 'MMA', '아이키도', '옆돌기', '박지윤 성대모사'],
      link: Link(
        twitter: '',
        instagram: 'https://www.instagram.com/bg_eunji92/',
        youtube: '',
        tiktok: 'https://www.tiktok.com/@bravegirls_eunji?',
      ),
    ),
  ),
  ProfileModel(
    memberName: '브레이브걸스 유나',
    image: Assets.werideYuna,
    profile: Profile(
      name_ko: '이유나',
      name_en: 'Yuna Lee',
      birth: '1993년 4월 6일 (27세)',
      ancestry: '경기도 부천시',
      country: '대한민국',
      school: '중흥고등학교 (졸업)',
      height: '164cm',
      blood: 'A형',
      debut: "2016년 브레이브걸스 앨범 <변했어>",
      agency: 'Brave Entertainment',
      group: 'Brave Girls',
      position: '리드보컬, 리드래퍼',
      mbti: 'ESFJ',
      nicknames: ['단발좌', '유나형', '칼단발러', '조정간 단발', '쪽팔림좌', '인조인간 18호', '오열좌/펑펑좌/이유냐/이우냐', '군바리스타'],
      ability: ['랩', '작사', '태권도', '발레'],
      link: Link(
        twitter: '',
        instagram: 'https://www.instagram.com/u.nalee/',
        youtube: 'https://www.youtube.com/channel/UCMLa547c-KJbOSzTf010Q1Q',
        tiktok: 'https://www.tiktok.com/@bravegirls_u_na?',
      ),
    ),
  ),
];

List<String> menus = [
  '음원 순위',
  '앨범 정보',
  '스케줄'
];

List<AlbumModel> albums = [
  AlbumModel(title: "Rollin'", artist: '브레이브걸스', albumCoverUrl: Assets.rollinAlbumCover, createdDate: '2017.03.07', reviewScore: 4.7),
  AlbumModel(title: 'We Ride', artist: '브레이브걸스', albumCoverUrl: Assets.werideAlbumCover2, createdDate: '2020.08.14', reviewScore: 4.8),
  AlbumModel(title: 'HIGH HEELS', artist: '브레이브걸스', albumCoverUrl: Assets.highHeelsAlbumCover, createdDate: '2016.06.27', reviewScore: 4.2),
  AlbumModel(title: 'The Difference', artist: '브레이브걸스', albumCoverUrl: Assets.theDifferenceAlbumCover, createdDate: '2011.04.08', reviewScore: 4.1),
  AlbumModel(title: '변했어', artist: '브레이브걸스', albumCoverUrl: Assets.byunhaeteoAlbumCover, createdDate: '2016.02.016', reviewScore: 4.1),
];