CREATE DATABASE shortly;

CREATE TABLE "users" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"confirmPassword" TEXT NOT NULL UNIQUE
);

CREATE TABLE "session" (
	"id" SERIAL PRIMARY KEY,
	"idUser" INTEGER NOT NULL UNIQUE REFERENCES "users"("id"),
	"token" TEXT NOT NULL UNIQUE
);

CREATE TABLE "shortLink" (
    "id" SERIAL PRIMARY KEY,
    "userId" INTEGER NOT NULL REFERENCES "users"("id"),
    "seesionId" INTEGER NOT NULL REFERENCES "session"("id"),
    "shortUrl" TEXT NOT NULL,
    "url" TEXT NOT NULL UNIQUE
)

