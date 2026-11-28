// Arranque y navegación
// Responsable: Persona C · Frontend/Docs · Semana 1
import { getHealth } from './api.js';

const estadoEl = () => document.getElementById('health-status');
const detalleEl = () => document.getElementById('health-detalle');
const botonEl = () => document.getElementById('btn-health');

function pintarEstado(clase, texto, detalle = '') {
  const el = estadoEl();
  el.className = `estado ${clase}`;
  el.textContent = texto;
  detalleEl().textContent = detalle;
}

async function comprobarBackend() {
  botonEl().disabled = true;
  pintarEstado('estado-cargando', 'Comprobando...');
  try {
    const data = await getHealth();
    const extra = data ? JSON.stringify(data) : '';
    pintarEstado('estado-ok', 'Backend en línea', extra);
  } catch (err) {
    const motivo = err.status ? `El backend respondió ${err.status}` : 'No se pudo conectar con el backend';
    pintarEstado('estado-error', 'Backend no disponible', motivo);
  } finally {
    botonEl().disabled = false;
  }
}

export function init() {
  botonEl().addEventListener('click', comprobarBackend);
  comprobarBackend();
}

export function navigate() {
  // TODO (Semana 2): cambiar entre las vistas de apuntes, resumen, quiz y progreso
}

init();
