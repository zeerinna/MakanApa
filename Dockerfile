# 1. Use a lightweight Nginx web server base image
FROM nginx:alpine

# 2. Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# 3. Remove default Nginx static files
RUN rm -rf ./*

# 4. Copy all project source files into the container
COPY . .

# 5. Expose application port
EXPOSE 8080

# 6. Reconfigure Nginx to listen on port 8080 instead of default 80
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# 7. Start Nginx server in the foreground
CMD ["nginx", "-g", "daemon off;"]
