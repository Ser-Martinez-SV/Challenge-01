// Esperar a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', () => {
    const contactForm = document.getElementById('contactForm');
    const feedbackMessage = document.getElementById('formFeedback');

    if (contactForm) {
        contactForm.addEventListener('submit', function(event) {
            // Evitar que la página se recargue automáticamente al enviar
            event.preventDefault();

            // Capturar los valores de los campos
            const nombre = document.getElementById('nombre').value.trim();
            const email = document.getElementById('email').value.trim();
            const mensaje = document.getElementById('mensaje').value.trim();

            // Simulación de envío de datos o validación adicional
            if (nombre && email && mensaje) {
                // Mostrar mensaje de éxito dinámico en el HTML
                feedbackMessage.textContent = `¡Gracias, ${nombre}! Hemos recibido tu solicitud. Nos pondremos en contacto contigo pronto.`;
                feedbackMessage.className = "feedback-message feedback-success";
                feedbackMessage.style.display = "block";

                // Limpiar el formulario
                contactForm.reset();

                // Ocultar la notificación automáticamente después de 5 segundos
                setTimeout(() => {
                    feedbackMessage.style.display = "none";
                }, 5000);
            }
        });
    }
});
