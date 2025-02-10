# Build stage
FROM --platform=$BUILDPLATFORM node:22-alpine AS builder

WORKDIR /app

# Install Git
RUN apk add --no-cache git

# Clone WebVOWL Github Repo
RUN git clone https://github.com/VisualDataWeb/WebVOWL.git .

# Install dependencies and build
RUN npm install
RUN npm run-script release

# Production stage
FROM nginx:alpine
COPY --from=builder /app/deploy /usr/share/nginx/html

# Optional: Custom nginx configuration if needed
# COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
