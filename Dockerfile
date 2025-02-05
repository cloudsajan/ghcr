FROM node:20.17.0 AS build
WORKDIR /app
COPY tsconfig.json package*.json ./
RUN npm install --force

# Stage 2: Final
FROM node:20.17.0-alpine
WORKDIR /app
COPY --from=build /app/node_modules /app/node_modules
COPY . .

# Expose the port and set the command
EXPOSE 3000
CMD ["npm", "run", "start"]
