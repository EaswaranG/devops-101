FROM nginx
COPY default.conf /etc/nginx/conf.d/default.conf
RUN apt-get update && \
    apt-get install -y git
WORKDIR /usr/share/nginx/html
RUN git clone https://github.com/cloudacademy/static-website-example.git
RUN rm -rf .git
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
