FROM node:18.12.0

WORKDIR /usr/src/app

# Copy package.json and pnpm-lock.yaml from the root directory
COPY ../../package.json ../../pnpm-lock.yaml ./

# Install pnpm
RUN npm install -g pnpm

# Install project dependencies
RUN pnpm install

# Copy the rest of the application code
COPY . .

# Command to run database migrations
CMD ["pnpm", "run", "migrate"]
