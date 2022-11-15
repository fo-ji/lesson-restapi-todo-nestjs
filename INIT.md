### Docker
```zsh
$ docker-compose build
```

### Nest
```zsh
$ docker-compose run --rm server nest new .
```

#### tsconfig.json
```diff
{
  "compilerOptions": {
    "module": "commonjs",
    "declaration": true,
    "removeComments": true,
    "emitDecoratorMetadata": true,
    "experimentalDecorators": true,
    "allowSyntheticDefaultImports": true,
    "target": "es2017",
    "sourceMap": true,
    "outDir": "./dist",
    "baseUrl": "./",
    "incremental": true,
    "skipLibCheck": true,
    "strictNullChecks": false,
-   "noImplicitAny": false,
+   "noImplicitAny": true,
    "strictBindCallApply": false,
    "forceConsistentCasingInFileNames": false,
    "noFallthroughCasesInSwitch": false,
+   "strict": true
  }
}
```

#### main.ts
```diff
import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
- await app.listen(3000);
+ await app.listen(3005);
}
bootstrap();
```

### Prisma
```zsh
$ docker-compose run --rm server yarn add -D prisma
$ docker-compose run --rm server yarn add @prisma/client
$ docker-compose run --rm server npx prisma init
```

### Postgres
#### .env
```diff
# Environment variables declared in this file are automatically made available to Prisma.
# See the documentation for more detail: https://pris.ly/d/prisma-schema#accessing-environment-variables-from-the-schema

# Prisma supports the native connection string format for PostgreSQL, MySQL, SQLite, SQL Server, MongoDB and CockroachDB.
# See the documentation for all the connection string options: https://pris.ly/d/connection-strings

- DATABASE_URL="postgresql://johndoe:randompassword@localhost:5432/mydb?schema=public"
+ DATABASE_URL="postgresql://user:password@host:port_number/db_name?schema=public"
```

### [sample] prisma migrate and type generation
#### schema.prisma
```diff
：
+ model User {
+   id Int @id @default(autoincrement())
+   createdAt DateTime @default(now())
+   updatedAt DateTime @updatedAt
+   email String @unique
+   hashdPassword String
+   tasks Task[]
+ }
+
+ model Task {
+   id Int @id @default(autoincrement())
+   createdAt DateTime @default(now())
+   updatedAt DateTime @updatedAt
+   title String
+   description String?
+   userId Int
+   user User @relation(fields: [userId], references: [id], onDelete: Cascade)
+ }
```
```zsh
$ docker exec -it server sh
$ npx prisma migrate dev
$ npx prisma studio
$ npx prisma generate
```

### install packages
```zsh
$ docker-compose run --rm server yarn add @nestjs/config @nestjs/jwt @nestjs/passport
$ docker-compose run --rm server yarn add cookie-parser csurf passport passport-jwt bcrypt class-validator class-transformer
$ docker-compose run --rm server yarn add -D @types/express @types/cookie-parser @types/csurf @types/passport-jwt @types/bcrypt
```

### [sample] Create module, controller, service
```zsh
$ docker exec -it server sh
$ nest g module auth
$ nest g module user
$ nest g module todo
$ nest g module prisma
$ nest g controller auth --no-spec
$ nest g controller user --no-spec
$ nest g controller todo --no-spec
$ nest g service auth --no-spec
$ nest g service user --no-spec
$ nest g service todo --no-spec
$ nest g service prisma --no-spec
```

### update schema
```zsh
$ docker exec -it server sh
$ npx prisma migrate dev
$ npx prisma generate
```