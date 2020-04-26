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

localhost:port_num으로 접속하게 된다면 지구촌 친구들 확인 가능함. 후술 routes.rb 참조

rails generate controller "Controller_name"
> Controller_name이라는 controller를 생성한다. /app/controllers에서 확인할 수 있으며 matching되는 view 폴더가 /app/view/에 생성됨을 확인할 수 있다.

rails g model "Model_name"
> Model_name 이라는 model을 생성한다. generate는 g로 줄여서 사용 가능하다. model은 후술 참조


**routes.rb**
routes.rb 파일에서는 어떠한 url이 view와 매칭되는지를 설정한다. 초기에 설정이 없다면 지구촌 친구들을 localhost:3000에서 확인할 수 있다.
: ex) 초기화면을 /app/view/home/index.html.erb 로 바꾸고 싶다면 Rails.application.routes.draw do 하단에 _roots "home#index"_ 를 추가한다.

만약 /pokemon url과 /pokemon/index.html.erb을 매칭하기 위해서는 _get "/pokemon" => "pokemon#index"_ 추가

### 참고

* https://guides.rubyonrails.org/getting_started.html
