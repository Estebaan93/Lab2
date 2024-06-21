document.addEventListener('DOMContentLoaded', () => {
  console.log('Home page loaded');

  const searchInput = document.getElementById('search-input');
  const patientsList = document.getElementById('patients-list');

  if (searchInput && patientsList) {
    searchInput.addEventListener('input', () => {
      const searchTerm = searchInput.value;

      // Realizar una solicitud AJAX al servidor
      fetch(`/search?q=${searchTerm}`)
        .then(response => response.json())
        .then(data => {
          // Limpiar la lista actual de pacientes
          while (patientsList.firstChild) {
            patientsList.removeChild(patientsList.firstChild);
          }

          // Añadir los resultados de búsqueda a la lista
          data.forEach(patient => {
            const listItem = document.createElement('li');
            listItem.textContent = `${patient.nombre} ${patient.apellido} - Documento: ${patient.documento}`;
            listItem.setAttribute('data-name', `${patient.nombre} ${patient.apellido}`);
            patientsList.appendChild(listItem);
          });
        })
        .catch(error => {
          console.error('Error:', error);
        });
    });
  }
});
