# syntax=docker/dockerfile:1.3

FROM nginx:alpine AS production

# Tạo thư mục làm việc
WORKDIR /app

# Copy toàn bộ source code
COPY . .

########################
# 2. Serve stage
########################

# Copy file build từ stage builder
COPY /app /usr/share/nginx/html

# Copy config nginx (tuỳ chọn)
# Nếu không có thì Nginx sẽ dùng default
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# Mở port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
