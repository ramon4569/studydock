-- StudyDock · Esquema inicial (RFC-0001)
-- Cambios que afecten a varios módulos requieren RFC.

CREATE TABLE IF NOT EXISTS documents (
  id          SERIAL PRIMARY KEY,
  title       VARCHAR(200) NOT NULL,
  content     TEXT         NOT NULL,
  created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS summaries (
  id           SERIAL PRIMARY KEY,
  document_id  INT          NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
  content      TEXT         NOT NULL,
  model        VARCHAR(100),
  created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- questions: [{ "question": "...", "options": ["a","b","c","d"], "answer": 0 }]
CREATE TABLE IF NOT EXISTS quizzes (
  id           SERIAL PRIMARY KEY,
  document_id  INT          NOT NULL REFERENCES documents(id) ON DELETE CASCADE,
  questions    JSONB        NOT NULL,
  model        VARCHAR(100),
  created_at   TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

-- answers: [0, 2, 1, ...] (índice elegido por pregunta)
CREATE TABLE IF NOT EXISTS quiz_attempts (
  id          SERIAL PRIMARY KEY,
  quiz_id     INT          NOT NULL REFERENCES quizzes(id) ON DELETE CASCADE,
  answers     JSONB        NOT NULL,
  score       INT          NOT NULL CHECK (score >= 0),
  total       INT          NOT NULL CHECK (total > 0),
  created_at  TIMESTAMPTZ  NOT NULL DEFAULT NOW()
);

CREATE INDEX IF NOT EXISTS idx_summaries_document ON summaries(document_id);
CREATE INDEX IF NOT EXISTS idx_quizzes_document   ON quizzes(document_id);
CREATE INDEX IF NOT EXISTS idx_attempts_quiz      ON quiz_attempts(quiz_id);
