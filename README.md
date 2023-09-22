# 💡 SpartaCoding-Project-ToDoList

메모앱(My Todo List) 만들기 + 네트워크와 데이터 저장 + 인스타 프로필 페이지 클론

<br/>

# 💻  About Program

1. `Userdefaults`를 사용해서 Create, Read, Delete 기능 구현
2. `TableView`의 `Header`를 사용해서 Section 구분, 생성 가능
3. `URL Session`을 사용해서 홈 화면에 URL로 되어 있는 외부 `API`호출, `JSON`데이터 Parsing 후 랜덤 고양이 사진 보여주기
<br/>(Placeholder 이미지(스켈레톤 UI) 구현)
4. `App Icon`, `Launch Screen` 설정
6. `Core Data`를 사용해서 `User Profile` 정보 저장

<br/>

# ✅  ToDo Page 구성
<img width="648" alt="image" src="https://github.com/Leehan-sol/swift_ToDoList/assets/139109343/15f41341-39b8-4905-bb70-8828e9cd466a">
<br/>
<br/>

`Model` : 앱의 데이터와 로직 관리<br/>

`View` : UI 담당<br/>
User의 Interaction에 따라 데이터를 표시하고 변경된 내용을 화면에 반영<br/>

`Controller` : Model과 View사이의 인터페이스 역할<br/>
User의 Interaction에 따라 Controller는 Model을 통해서 데이터를 가져와 그 정보를 바탕으로 View를 제어해서 User에게 전달<br/>

<img width="309" alt="image" src="https://github.com/Leehan-sol/swift_MyToDoList_assignment/assets/139109343/1767eb07-780e-4660-9af9-f9075374737a">

<br/>
<br/>

# ✅ Profile Page 구성
<img width="648" alt="image" src="https://github.com/Leehan-sol/MyToDoList_assignment/assets/139109343/abce4ab0-6a74-4e28-a7e5-51e4951ad789">

<br/>
<br/>

`Model` : 데이터 구조를 정의<br/>

`View` : UI 담당<br/>
User의 Interaction에 따라 데이터를 표시하고 변경된 내용을 화면에 반영<br/>
> ViewModel을 참조하도록 설계

`ViewModel` : Model과 View사이의 인터페이스 역할<br/>
User의 Interaction에 따라 ViewModel은 Model을 통해서 데이터를 가져와 그 정보를 바탕으로 View를 제어해서 User에게 전달<br/>
> Model을 참조하도록 설계<br/>
> UIKit 프레임워크, View를 참조하지않도록 설계<br/>

`MVVM`의 장점<br/>
1. MVVM은 View 로직과 비즈니스 로직을 분리할 수 있어 생산성이 높다.<br/>
2. 의존성이 없기 때문에 테스트가 수월해지고 View와 ViewModel이 1:N 관계이므로 중복되는 로직을 모듈화해서 여러 View에 재사용할 수도 있다.<br/>

`MVVM`의 단점<br/>
1. MVVM은 MVC에 비해 설계가 복잡하므로 간단한 프로젝트는 오히려 MVC보다 생산성이 떨어질 수 있다.<br/>

<br/>

# 🛠️ UserDefaults와 CoreData의 차이점

- UserDefaults: 데이터 저장을 위한 가장 기초적인 방법이다.
1. 싱글턴 객체이다.
2. Key-Value 쌍으로 데이터를 저장하는 방식이다.
3. UserDefaults는 plist에 XML 형태로 데이터가 저장되기 때문에 데이터 크기가 커지면 파일 크기가 커져서 앱이 실행될때 저장된 데이터를 모두 메모리에 올리기 때문에 메모리 성능에 악영향을 줄 수 있다. <br/>
대신 데이터를 Read/Write를 할 때 다시 메모리에 접근하지 않아도 되니 추가적인 오버헤드가 발생하지 않아서 소규모 데이터 저장에 사용 시 속도도 빠르고 메모리에 부담되지않게 기능을 구현할 수 있으므로 소규모 데이터를 저장하는데 적합하다.
4. UserDefaults의 장점은 Thread-Safe 하다는 것이다. <br/>
CoreData와 Realm은 Thread-Safe 하지 않기 때문에 멀티 스레드 환경에서 주의를 해야하지만, UserDefaults는 Thread-Safe 하기 때문에 별도의 처리가 필요 없다. <br/>
대신, plist에 데이터가 저장되기 때문에 앱이 삭제되면 데이터도 모두 삭제된다. 또한, 암호화해서 저장하지 않기 때문에 보안이 좋지 않다.
> 💡 종합하면 간단한 소규모 데이터를 쉽게 저장하고 싶을 때 UserDefaults를 사용하는 것이 좋다. <br/>
만약 데이터가 앱이 삭제되도 남아있어야 하거나, 보안이 중요하다면 UserDefaults는 적합하지 않다.
<br/>

- CoreData : 데이터베이스 기능을 지원하는 프레임워크이다. <br/>
공식 문서에서 CoreData의 5가지 기능 <br/>

1. 영속성(Persistence)
2. 변경사항의 Undo, Redo
3. 백그라운드 데이터 작업 기능
4. 동기화 기능
5. 버전 관리 및 마이그레이션(Migration)

이 중 데이터베이스는 1번 영속성 기능이다. 이 영속성 기능은 SQLite를 기반으로 지원하는데 일반적인 데이터베이스와는 차이가 있다. <br/>
CoreData는 객체 그래프 관리자로, 객체를 직접적으로 연결해서 관리합니다. <br/>
데이터베이스는 행렬 관계를 이용해 데이터를 읽고 쓰는 반면 CoreData는 객체를 연속적으로 탐색해야 한다는 점이 차이점입니다. <br/>
링크드 리스트처럼 객체를 탐색하다보니 탐색 성능은 비교적 나쁘고, Thread-Safe 하지 않아 Lock으로 동기화 처리를 해줘야 합니다. <br/>
대신, 원하는 데이터가 메모리에 올릴 수 있기 때문에 대규모 데이터를 저장해도 메모리 효율이 떨어지지 않습니다.
> 💡 종합하면 대규모 데이터를 저장해야하는 상황에서 영속성 기능을 포함한 CoreData의 다른 기능도 필요하다면 CoreData를 선택하는 것이 적절하다.

<br/>

# 📱 UI 화면 구성
<img width="200" height="300" src="https://github.com/Leehan-sol/swift_ToDoList/assets/139109343/dabc7ef3-be61-45b5-a4c1-c03b18bafe75">
<img width="200" height="300" src="https://github.com/Leehan-sol/swift_ToDoList/assets/139109343/3af3c1c8-a555-4d96-9702-297c3fa2ef8d">
<img width="200" height="300" src="https://github.com/Leehan-sol/swift_ToDoList/assets/139109343/38ced4e3-fb10-4537-b8e3-270f5995d715">
<img width="200" height="300" src="https://github.com/Leehan-sol/swift_ToDoList/assets/139109343/c095342e-5c3b-4bf2-be1b-b4eed61c42e7">
<img width="200" height="300" src="https://github.com/Leehan-sol/MyToDoList_assignment/assets/139109343/a186519e-25f8-4e5b-beb3-ebe6c071e061">
<img width="200" height="300" src="https://github.com/Leehan-sol/MyToDoList_assignment/assets/139109343/6f2773d6-e289-4787-8385-f273174a0685">


<br/>









