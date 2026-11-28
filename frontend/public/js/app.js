// Pagina principal - Persona C
import { getHealth } from './api.js';

const estado = document.getElementById('health-status');
const boton = document.getElementById('btn-health');

async function revisarBackend() {
  estado.className = 'estado';
  estado.textContent = 'Comprobando...';

  try {
    await getHealth();
    estado.className = 'estado ok';
    estado.textContent = 'Backend en línea';
  } catch (error) {
    estado.className = 'estado error';
    estado.textContent = 'Backend no disponible';
  }
}

export function init() {
  boton.addEventListener('click', revisarBackend);
  revisarBackend();
}

export function navigate() {
  // TODO entrega 2
}

init();
