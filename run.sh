#! /bin/bash

# 마이그레이션 실행
python manage.py makemigrations
# --no-input으로 사용자 입력 없이 자동으로 실행되게 함.
python manage.py migrate --no-input
# 정적 파일 수집
python manage.py collectstatic --no-input

# 8000 포트로 들어오는 요청은 gunicorn이 처리

# 컨테이너 외부에서 접근 가능하도록 8000 포트에 바인딩
# config 앱의 wsgi.py 파일에 있는 application 객체를 사용하여 서버 실행
gunicorn config.wsgi:application --bind 0.0.0.0:8000 &
unlink /etc/nginx/sites-enabled/default
# nginx를 포그라운드 모드로 실행하여, Docker 컨테이너가 꺼지지 않도록 함.
nginx -g "daemon off;"