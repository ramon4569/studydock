-- Esquema inicial · Responsable: Persona A · Semana 1
-- Cambios que afecten a varios requieren RFC

CREATE TABLE documents ( -- TODO columnas
  id SERIAL PRIMARY KEY
);

CREATE TABLE summaries (
  id SERIAL PRIMARY KEY
);

CREATE TABLE quizzes (
  id SERIAL PRIMARY KEY
);

CREATE TABLE quiz_attempts ( -- progreso
  id SERIAL PRIMARY KEY
);
