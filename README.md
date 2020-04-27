# Rails study

Rails 스터디 Repository입니다.

localhost:your_port 에서 확인 가능합니다.

### 초기 설정

* window에서 진행할 시에 WSL 환경
* Ruby 설치
  * Ruby dependency 설치
  * rbenv 설치
  * ruby_build 설치
  * Ruby 설치
  * Ruby Library 설치
  * rbenv에 Ruby 등록

* Rails 설치
  * Rails dependency 설치 (nodejs)
  * rbenv에 등록

### 기초

rails new "Project_name"
> rails 프로젝트 생성. bundle install이 실행되서 rails 프로젝트에 기본으로 필요한 gem들이 Gemfile을 참고하여 자동으로 설치된다고 함.

bundle (optional)
> 위에서의 bundle install과 같다. Gemfile에 작성되어 있는 gem package install

rails s
> rails 서버 실행
>localhost:port_num으로 접속하게 된다면 지구촌 친구들 확인 가능함. 후술 routes.rb 참조

rails generate controller "Controller_name"
> Controller_name이라는 controller를 생성한다. /app/controllers에서 확인할 수 있으며 matching되는 view 폴더가 /app/view/에 생성됨을 확인할 수 있다.

rails g model "Model_name"
> Model_name 이라는 model을 생성한다. generate는 g로 줄여서 사용 가능하다. model은 후술 참조

#### routes.rb

routes.rb 파일에서는 어떠한 url이 view와 매칭되는지를 설정한다. 초기에 설정이 없다면 지구촌 친구들을 localhost:3000에서 확인할 수 있다.
: ex) 초기화면을 /app/view/home/index.html.erb 로 바꾸고 싶다면 Rails.application.routes.draw do 하단에 _roots "home#index"_ 를 추가한다.

만약 /pokemon url과 /pokemon/index.html.erb을 매칭하기 위해서는 _get "/pokemon" => "pokemon#index"_ 추가

만약 POST 형식으로 사용하고 싶다면 _post "/pokemon" => "pokemon#index"_ 추가

### model

rails g model "model_name" A:integer B:string C
> model_name이라는 model을 생성한다. 여러 attribute들을 생성할 수 있으며 default 값은 string이다.

##### 위의 명령어를 실행하면 model이 생성되지 않는다. /db/migrate/에 생성된 rb파일이 생성된다.

model의 생성을 바로 진행하는 것이 아니라 migration 파일을 생성한다. 명령서를 생성하고 이를 수행하면서 model이 생성된다고 생각하면 된다.

##### rails db:migrate 를 실행하자

실행 후에는 db 폴더에 schema.rb 파일이 생성된 것을 볼 수 있으며, 생성한 model의 정보를 확인할 수 있다.

또한 /app/model/ 에 해당 모델.rb 파일의 생성을 확인할 수 있다.

### action과 db

어떠한 view를 controll할 수 있는 action이 controller에 function으로 존재해야한다.
> ex) index.html.erb를 controll할 수 있는 index function 필요

변수는 @value와 같이 사용하고 find_by와 같은 function으로 접근한다.

@value.save로 db에 저장할 수 있다.

### CRUD
* Create : 생성(POST)
* Read : 조회(GET)
* Update : 수정(PUT or PATCH)
* Delete : 삭제(DELETE)

#### Rails에서의 CRUD - 7가지 Action

index, new, create, show, edit, update, destroy

* View가 필요한 action
  * index : model의 모든 instance 보여줌
  * new : 새로운 instance를 생성하기 위한 form 보여줌
  * show : 특정 instance를 보여줌(matching되는 id의)
  * edit : 특정 instance를 수정할 수 있는 form을 보여줌 (id 알아야 함)

* View가 필요하지 않은 action
  * create : new form을 통해 새로운 instance 생성
  * update : edit form 기반으로 특정 instance update (id 알아야 함)
  * destroy : db에서 instance 제거 (id 알아야 함)

| **URL** | **HTTP Verb** |  **Action**|
|------------|-------------|------------|
| /name/         | GET       | index  
| /name/new         | GET       | new   
| /name          | POST      | create   
| /name/:id      | GET       | show       
| /name/:id/edit | GET       | edit       
| /name/:id      | PATCH/PUT | update    
| /name/:id      | DELETE    | destroy  

### 참고

* https://guides.rubyonrails.org/getting_started.html
* https://medium.com/adventures-in-code/snow-white-the-7-restful-routes-afcf87bbe5bd
