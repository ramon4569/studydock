// Cliente fetch de la API
// Responsable: Persona C · Frontend/Docs · Semana 1
// Todas las llamadas van a /api, nginx las pasa al backend (ver nginx.conf)

const API_BASE = '/api';

async function request(path, options = {}) {
  const res = await fetch(`${API_BASE}${path}`, {
    headers: { 'Content-Type': 'application/json' },
    ...options,
  });

  const texto = await res.text();
  let data = null;
  try {
    data = texto ? JSON.parse(texto) : null;
  } catch {
    data = { raw: texto };
  }

  if (!res.ok) {
    const error = new Error(`HTTP ${res.status}`);
    error.status = res.status;
    error.data = data;
    throw error;
  }
  return data;
}

export function getHealth() {
  return request('/health');
}

// Las siguientes se completan en la Semana 2, cuando B publique el contrato de la API

export function listDocuments() {
  // TODO (Semana 2)
}

export function createDocument() {
  // TODO (Semana 2)
}

export function requestSummary() {
  // TODO (Semana 2)
}

export function requestQuiz() {
  // TODO (Semana 2)
}

export function sendAttempt() {
  // TODO (Semana 2)
}

export function getProgress() {
  // TODO (Semana 2)
}
