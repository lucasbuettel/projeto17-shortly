CREATE DATABASE shortly;

CREATE TABLE "users_data" (
	"id" SERIAL PRIMARY KEY,
	"name" VARCHAR(50) NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
	"confirmPassword" TEXT NOT NULL UNIQUE
);

CREATE TABLE "sign_in" (
	"id" SERIAL PRIMARY KEY,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL UNIQUE,
);

CREATE TABLE "shortLink" (
    "id" SERIAL PRIMARY KEY,
    "userId" TEXT NOT NULL UNIQUE,
    "shortUrl" TEXT NOT NULL,
    "url" TEXT NOT NULL UNIQUE
)

