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

### 실행

> ```
> bundle
> yarn install
> rails db:migrate
> ```

##### Pokemon error!

> ```
> rails c
> Pokemon.create name : "Pikachu", hp:100
> ```


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

### Destroy Action(Put, Patch)

show, update, destroy action은 모두 동일한 path를 사용하지만, 각각의 format에 따라 action이 다르게 변한다. 따라서 action에 맞는 format을 설정해줄 필요가 있다

> 따라서 jquery를 사용해야 했다

#### jquery 사용법

1. application.js에 jquery와 jquery-ui를 추가해주어야 한다.
>```
>//= require jquery
>//= require jquery-ui
>```

2. Gemfile에도 설치를 위해 지정해주어야 한다.

>```
>gem 'jquery-rails'
>gem 'jquery-ui-rails'
>```

3. Gemfile에 지정된 내용(jquery)를 설치하기 위해 'bundle' or 'bundle install'를 실행한다.

##### <%= link_to "삭제", post_path(post), method: :delete %> 와 같이 사용하면 된다

### .erb : Ruby의 템플릿 엔진

ERB를 사용하면 루비 코드의 값을 포함하는 문서를 만들 수 있다. index.html에 ruby 코드를 넣고 싶다면 index.html.erb로 파일명을 변경한 후 <% %>, <%= %>와 같은 태그를 이용해 사용한다.

자세한건 참고항목의 erb관련 url참고. 

### Partial

비슷한 View를 가지는 경우가 있다. 이럴 경우 코드의 중복성이 올라가고 View를 수정해야 하는 경우 일일이 수정해야 하는 번거로움이 있다.

Rails에서는 Partial을 두어 이러한 중복성을 방지하고 재사용성을 높여 수정 시 용이성을 제공할 수 있다.

#### 사용 방법

1. Partial 을 진행할 파일을 _name.html.erb 라는 이름으로 생성한다.(ex) _form.html.erb)

2. view를 작성하고, patameter를 두어야 하는 부분은 변수명을 이용해 생성한다 (ex) post)

3. view를 사용할 때에는 render를 이용하여 form과 변수들을 지정한다.)

( ex) <%=render "form", post:Post.new %>)

### Devise - 인증 솔루션

설명 : Devise is a flexible authentication solution for Rails based on Warden.

Warden : Warden provides a mechanism for authentication in Rack based Ruby applications.

https://github.com/heartcombo/devise 참고해서 진행하기

Gemfile에 추가(gem 'devise') -> bundle install -> rails g devise:install -> rails g devise MODEL -> rails db:migrate

**current_user**를 통해 사용자가 로그인이 되어있는지를 확인할 수 있다.

### ActionAdmin - 관리자 UI 제공 FW

설명 : Active Admin is a framework for creating administration style interfaces.

https://github.com/heartcombo/devise 참고해서 진행하기

Gemfile에 추가(gem 'activeadmin') -> bundle install -> rails g active_admin:install->  rails db:migrate

참고 : Admin에서 관리할 내용들을 app/admin에 넣어주어야 한다. 파일을 생성해두어야 함.

### 참고

* https://guides.rubyonrails.org/getting_started.html
* https://medium.com/adventures-in-code/snow-white-the-7-restful-routes-afcf87bbe5bd
* https://github.com/rails/jquery-rails
* https://www.joinc.co.kr/w/Site/Ruby/ERB (erb)
* https://flearning-blog.tistory.com/38 (erb파일에서 <% %>, <%= %>)
* https://github.com/heartcombo/devise (Devise gem framework)
* https://activeadmin.info/documentation.html (ActionAdmin gem framework)