# purewallet_search_engine

## 2023-03-10
- 유사어를 알려주는 라이브러리 및 api 조사
- chat gpt를 이용하여 유의어를 보여주는 검색 페이지 구현

## 2023-03-24
- 1차로 구현한 검색 기능을 purewallet에 맞춰서 수정 및 적용
- Firebase에 유사어 저장
- Firebase의 데이터를 가져와서 relatedWords 리스트에 저장

## 2023-04-15
- 검색을 하면 유사어 UI도 출력
- 검색어의 테그값을 검색하여도 검색어 UI 출력
  예) {name: pencil, tag1: eraser, tag2:...}
      {name: eraser, tag1: pencil, tag2:...}

## 2023-04-28
- tag와 똑같은 이름을 가진 데이터만 UI출력이 되었지만,
  tag의 단어를 포함한 UI도 출력되게 변경하였음.

## 2023-04-30
- 28일 변경사항을 ListView만 적용을 하였었는데, GirdView에도 추가함

## 2023-05-05
- Firebase주소 단순화, creativia와 cloud firestore를 분활하였었는데 통합
