<!-- Use this file to provide workspace-specific custom instructions to Copilot. For more details, visit https://code.visualstudio.com/docs/copilot/copilot-customization#_use-a-githubcopilotinstructionsmd-file -->

# Instrucciones del Proyecto - Validación de Login con Playwright

Este proyecto utiliza Playwright para validar el sistema de login de Asistencia DT (https://asistenciadt.baplicada.cl/Login.aspx?FiscalizacionDT=Login).

## Contexto del Proyecto

- **Objetivo**: Automatizar la validación del formulario de login y verificar la funcionalidad de autenticación
- **Tecnología**: Playwright con Node.js/JavaScript
- **Página objetivo**: Sistema de asistencia DT de Baplica

## Estructura de Pruebas

### Archivos de Test:
- `tests/login-validation.spec.js`: Pruebas básicas de validación de login
- `tests/advanced-validation.spec.js`: Pruebas avanzadas de accesibilidad, rendimiento y estructura

### Casos de Prueba Incluidos:
1. **Carga de página**: Verificación de carga correcta del login
2. **Elementos de UI**: Validación de campos de usuario, contraseña y botones
3. **Validación de campos**: Pruebas con campos vacíos
4. **Seguridad**: Verificación HTTPS y headers de seguridad
5. **Accesibilidad**: Validación de labels y atributos accesibles
6. **Rendimiento**: Medición de tiempos de carga
7. **Compatibilidad móvil**: Pruebas en viewport móvil

## Comandos Disponibles

```bash
npm test                 # Ejecutar todas las pruebas
npm run test:headed      # Ejecutar con navegador visible
npm run test:ui          # Abrir interfaz de usuario de Playwright
npm run test:login       # Ejecutar solo pruebas básicas de login
npm run test:advanced    # Ejecutar pruebas avanzadas
npm run test:report      # Mostrar reporte HTML
```

## Configuración

- La configuración principal está en `playwright.config.js`
- Variables de entorno de ejemplo en `.env.example`
- Capturas de pantalla y videos se guardan automáticamente en fallos

## Notas para Desarrollo

- Las pruebas están diseñadas para ser robustas y manejar diferentes estructuras de formulario
- Se utilizan múltiples selectores para encontrar elementos dinámicamente
- Las credenciales de prueba no deben ser reales por seguridad
- Los reportes incluyen screenshots y videos para debugging

## Buenas Prácticas

- Siempre usar `await page.waitForLoadState('networkidle')` antes de interactuar con elementos
- Implementar múltiples selectores para mayor robustez
- Incluir logging detallado para facilitar debugging
- Manejar errores de red y timeouts adecuadamente
