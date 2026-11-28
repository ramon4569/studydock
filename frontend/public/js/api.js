// Llamadas al backend - Persona C

export async function getHealth() {
  const res = await fetch('/api/health');
  if (!res.ok) {
    throw new Error('Error ' + res.status);
  }
  return res.json();
}

// pendientes para la entrega 2

export function listDocuments() {
  // TODO
}

export function createDocument() {
  // TODO
}

export function requestSummary() {
  // TODO
}

export function requestQuiz() {
  // TODO
}

export function sendAttempt() {
  // TODO
}

export function getProgress() {
  // TODO
}
