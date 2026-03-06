---
-- 1. CREACIÓN DE TIPOS ENUM
---

-- Enum para el estado de un show en la lista del usuario
CREATE TYPE user_list_status AS ENUM ('Watching', 'Paused', 'Dropped', 'Completed');

-- Enum para el estado de emisión de un show
CREATE TYPE show_airing_status AS ENUM ('Airing', 'Finished', 'Paused');

-- Enum para los tipos de relación entre medios
CREATE TYPE media_relation_type AS ENUM ('Sequel', 'Prequel', 'Spin-off');

---
-- 2. TABLAS MAESTRAS
---

CREATE TABLE roles (
                       id BIGINT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL
);

CREATE TABLE "user" ( -- Usamos comillas porque user es palabra reservada en muchos SQL
                        id BIGINT PRIMARY KEY,
                        id_role BIGINT REFERENCES roles(id),
                        username VARCHAR(255) NOT NULL UNIQUE,
                        password VARCHAR(255) NOT NULL,
                        email VARCHAR(255) NOT NULL UNIQUE,
                        avatar VARCHAR(255),
                        is_active BIGINT DEFAULT 1
);

CREATE TABLE studio (
                        id BIGINT PRIMARY KEY,
                        name VARCHAR(255) NOT NULL,
                        logo VARCHAR(255)
);

CREATE TABLE staff (
                       id BIGINT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       image VARCHAR(255),
                       description VARCHAR(255)
);

CREATE TABLE character (
                           id BIGINT PRIMARY KEY,
                           name VARCHAR(255) NOT NULL,
                           image VARCHAR(255),
                           description VARCHAR(255)
);

CREATE TABLE actor (
                       id BIGINT PRIMARY KEY,
                       name VARCHAR(255) NOT NULL,
                       image VARCHAR(255),
                       description VARCHAR(255)
);

---
-- 3. TABLAS PRINCIPALES (Con ENUM de Shows)
---

CREATE TABLE shows (
                       id BIGINT PRIMARY KEY,
                       title VARCHAR(255) NOT NULL,
                       cover_image VARCHAR(255),
                       episodes SMALLINT,
                       id_studio BIGINT REFERENCES studio(id),
                       started_date DATE,
                       finished_date DATE,
                       status show_airing_status -- Aplicación del ENUM
);

---
-- 4. TABLAS DE RELACIÓN (Con ENUMs de List y Media)
---

CREATE TABLE friends (
                         id_user1 BIGINT REFERENCES "user"(id),
                         id_user2 BIGINT REFERENCES "user"(id),
                         PRIMARY KEY (id_user1, id_user2)
);

CREATE TABLE list (
                      id_user BIGINT REFERENCES "user"(id),
                      id_show BIGINT REFERENCES shows(id),
                      episodes_seen SMALLINT DEFAULT 0,
                      status user_list_status, -- Aplicación del ENUM
                      started_date DATE,
                      finished_date DATE,
                      is_favorite BOOLEAN DEFAULT FALSE,
                      rating FLOAT,
                      PRIMARY KEY (id_user, id_show)
);

CREATE TABLE related_media (
                               id_source BIGINT REFERENCES shows(id),
                               id_target BIGINT REFERENCES shows(id),
                               relation_type media_relation_type, -- Aplicación del ENUM
                               PRIMARY KEY (id_source, id_target)
);

CREATE TABLE review (
                        id_user BIGINT REFERENCES "user"(id),
                        id_show BIGINT REFERENCES shows(id),
                        rating SMALLINT,
                        body VARCHAR(255),
                        published_date DATE,
                        upvotes BIGINT DEFAULT 0,
                        is_active BIGINT DEFAULT 1,
                        PRIMARY KEY (id_user, id_show)
);

---
-- 5. TABLAS DE POSTS Y COMENTARIOS
---

CREATE TABLE post (
                      id BIGINT PRIMARY KEY,
                      id_user BIGINT REFERENCES "user"(id),
                      body VARCHAR(255) NOT NULL,
                      published_date DATE,
                      upvotes BIGINT DEFAULT 0,
                      is_active BOOLEAN DEFAULT TRUE
);

CREATE TABLE comment (
                         id BIGINT PRIMARY KEY,
                         id_user BIGINT REFERENCES "user"(id),
                         body VARCHAR(255) NOT NULL,
                         published_date DATE,
                         upvotes BIGINT DEFAULT 0,
                         parent_id BIGINT REFERENCES comment(id)
);

CREATE TABLE post_comment (
                              id_post BIGINT REFERENCES post(id),
                              id_comment BIGINT REFERENCES comment(id),
                              PRIMARY KEY (id_post, id_comment)
);

---
-- 6. TABLAS INTERMEDIAS RESTANTES
---

CREATE TABLE show_staff (
                            id BIGINT PRIMARY KEY,
                            id_staff BIGINT REFERENCES staff(id),
                            id_show BIGINT REFERENCES shows(id),
                            role VARCHAR(255)
);

CREATE TABLE show_character (
                                id BIGINT PRIMARY KEY,
                                id_show BIGINT REFERENCES shows(id),
                                id_character BIGINT REFERENCES character(id)
);

CREATE TABLE character_actor (
                                 id_character BIGINT REFERENCES character(id),
                                 id_actor BIGINT REFERENCES actor(id),
                                 PRIMARY KEY (id_character, id_actor)
);

CREATE TABLE favorite_character (
                                    id_user BIGINT REFERENCES "user"(id),
                                    id_character BIGINT REFERENCES character(id),
                                    PRIMARY KEY (id_user, id_character)
);

---
-- 7. ÍNDICES RECOMENDADOS
---
CREATE INDEX idx_shows_title ON shows(title);
CREATE INDEX idx_post_user ON post(id_user);
CREATE INDEX idx_comment_parent ON comment(parent_id);