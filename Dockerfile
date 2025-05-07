# 기본 이미지 설정
FROM python:3.13-slim

# 패키지 인덱스 갱신 && curl과 nginx 설치
RUN apt update && apt install -y curl nginx

# 부모 PC의 파일을 자식 PC(컨테이너)로 복사
COPY ./django-server /app
COPY ./requirements.txt /app/requirements.txt 
COPY ./run.sh /app/run.sh

# nginx 설정
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf

# 작업 디렉토리 설정
# 이후 모든 명령은 /app 디렉터리 기준으로 실행됨.
WORKDIR /app

# 복사한 requirements.txt 파일을 읽어서 패키지 설치
RUN pip install -r requirements.txt

# 복사한 run.sh 스크립트에 실행 권한 부여
RUN chmod +x run.sh

# 컨테이너 실행 시 run.sh 스크립트 실행
CMD ["./run.sh"]
