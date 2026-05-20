# Sử dụng image Node.js nhẹ (Alpine) phiên bản 18 (hoặc 20)
# Image này tự động hỗ trợ kiến trúc ARM của Armbian
FROM node:18-alpine

# Cài đặt thư mục làm việc trong container
WORKDIR /app

# Copy package.json và package-lock.json vào trước để tận dụng cache của Docker
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install --production

# Copy toàn bộ mã nguồn còn lại vào container
COPY . .

# Mở port 3001 (theo cấu hình trong server.js)
EXPOSE 3001

# Lệnh khởi chạy ứng dụng
CMD ["npm", "start"]