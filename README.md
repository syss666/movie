<h1>영화 정보 제공 사이트</h1>

<h2>프로젝트 소개</h2>
TMDB의 API를 이용하여 영화 정보를 보여주는 웹페이지 입니다.<br>
영화에 대한 정보(포스터,개봉일자, 간략한 줄거리,평가 점수, 예고편을 확인 할 수 있습니다
<br>
<h2>개발 환경</h2>
<li>eclipse</li>
<li>Apache Tomcat9</li>

<br>
<h2>사용 언어 및 기술</h2>
<li>HTML</li>
<li>CSS</li>
<li>JavaScript</li>
<li>JAVA</li>
<li>MYsql</li>
<li>JSP</li>
<li>Servlet</li>

<br>
<h2>구현 기능</h2>

* 계정
  - 회원가입(비밀번호 2차 확인)
  2차 비밀번호랑 비밀번호가 같아야 회원가입이 진행됩니다.
  ![signup](https://user-images.githubusercontent.com/69191696/163355840-e978a829-e83d-4953-b7e4-144a4e53ff1f.JPG)

  - 로그인 및 로그아웃
  ![login](https://user-images.githubusercontent.com/69191696/163355993-5edcf09e-9b8a-4028-971f-c2910938b6a2.JPG)
  
  
  로그인 시 위의 topmenu가 유저이름과 로그아웃 버튼 으로 변경됩니다.
  ![topmenu](https://user-images.githubusercontent.com/69191696/163356186-c7819378-fb1a-470e-848c-c998df70d688.JPG)
  ![topmenu_login](https://user-images.githubusercontent.com/69191696/163356203-ccfee50b-6c82-49ff-b50b-f6d510598722.JPG)
  
  - 회원정보 수정(topmenu에 유저 아이디 부분 클릭하면 메뉴 출력)
  ![mydata](https://user-images.githubusercontent.com/69191696/163356083-cd70568a-98ef-44b6-99eb-05248c629b0b.JPG)
  - 회원 삭제
  ![delete](https://user-images.githubusercontent.com/69191696/163356599-e760dffa-ef4a-4ea5-94c2-b53491a641ce.JPG)
  <br>
  
  - 관심 영화 등록
  
  영화 포스터를 클릭하게 되면 아래 그림처럼 영화 정보가 나오게 되는데 평가 점수 옆에 있는 관심 버튼을 클릭하면 관심 목록에 추가됩니다.
  
  ![item](https://user-images.githubusercontent.com/69191696/163356644-a5f7f1b6-02c4-45a3-b4af-9bb4b35d7713.JPG)
  
  추가된 영화 는 아래 그리멏럼 체크표시 모양이 바뀌게 됩니다.
  
  ![itemfav](https://user-images.githubusercontent.com/69191696/163356648-4a6c8c91-b607-422f-b257-ba2765c69d31.JPG)
  
  관심 목록은 아이디를 클릭하면 관심목록에서 확인 할 수 있습니다.
  
  ![myfav](https://user-images.githubusercontent.com/69191696/163358219-ad0f16be-70a5-4589-91c0-db5c23d8db32.JPG)
<br>
* 영화 정보
  - 현재 상영중 영화, 개봉예정작 , 평점 높은 영화
  <br>
  메인화면은 현재 상영중인 영화와 개봉예정작 영화 평점 높은 영화가 8개씩 표시 됩니다. <br>
  개봉예정작의 더보기 버튼을 누르면 개봉예정작 영화만 보여주게 됩니다.
  
  ![mainpage](https://user-images.githubusercontent.com/69191696/163356963-4980a2cf-e061-4b17-90e1-9ad2588fbc00.JPG)
  ![itemfav](https://user-images.githubusercontent.com/69191696/163357000-52d6a394-1348-4c25-b92a-e5dc637dfc35.JPG)
<br>
  - 장르별 영화 검색하기
  <br>
  장르별 영화 검색은 왼쪽에 있는 사이드 바에 있는 원하는 장르를 체크하여 검색하면 해당 장르의 영화만 보여줍니다.
  
  ![sidebar](https://user-images.githubusercontent.com/69191696/163357678-5f326fef-eb2e-4a1d-816b-c56fd21679a1.JPG)
  ![genre](https://user-images.githubusercontent.com/69191696/163357823-345ee88e-53bb-4629-9246-2586d5248cf7.JPG)
  <br>
  - 이름으로 영화 검색하기 
  <br>
  탑메뉴에 있는 검색창에 찾고 싶은 영화 명을 검색하면 아래 그림과 같이 검색한 내용을 보여줍니다.
  (스파이더맨 검색한 화면)
  
![searchpage](https://user-images.githubusercontent.com/69191696/163358104-d4a3b02d-aa93-46ec-b8f1-adf333e9566a.JPG)
  - 모든 화면에 해당 되는 페이지 수만큼 페이징 처리(페이지 수는 최대 10개이며 그 이하면 그이하만큼만 표시)
  
![page](https://user-images.githubusercontent.com/69191696/163358376-75b9dadd-9cbf-4252-90de-b4003ce743fb.JPG)
  <br>
  - 영화 정보
  <br>
  원하는 영화 포스터에 마우스를 올리면 아래 사진처럼 짧은 줄거리가 표시됩니다.
  
![main movie](https://user-images.githubusercontent.com/69191696/163358543-f1dd98ae-524f-4260-88f0-425060206f21.JPG)

  영화를 클릭할 경우 영화 포스터와, 개봉일자, 평점, 줄거리 등이 표시됩니다.
  
![item](https://user-images.githubusercontent.com/69191696/163356644-a5f7f1b6-02c4-45a3-b4af-9bb4b35d7713.JPG)

  해당영화 예고편이 있다면 아래부분에 예고편을 볼 수 있습니다.
  
![trailer](https://user-images.githubusercontent.com/69191696/163358750-b1e8a746-28ea-4c74-a204-1e9f73d0732b.JPG)1
  
  
  


