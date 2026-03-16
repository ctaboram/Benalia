# Benalia - Landing Page 🚀

Una landing page moderna y minimalista para Benalia, desarrollada con Astro y diseñada con un enfoque en la experiencia del usuario y una elegante paleta de azules y grises.

## ✨ Características

- **Diseño Minimalista**: Interfaz elegante con paleta azules y grises
- **Tipografía Premium**: Fuente Inter para máxima legibilidad
- **Totalmente Responsivo**: Optimizada para todos los dispositivos
- **Animaciones Suaves**: Transiciones elegantes activadas por scroll
- **Integración Calendly**: Widget funcional para agendar citas
- **Gradientes Perfectos**: Transiciones suaves azul-gris entre secciones
- **SEO Optimizada**: Meta tags y estructura semántica
- **Carga Rápida**: Optimizada para rendimiento

## 🎯 Secciones

### 🏠 Hero
- Presentación principal con llamada a la acción
- Tarjetas flotantes animadas
- Estadísticas destacadas
- Gradiente de fondo sutil

### 🛠️ Servicios
- Grid de 6 servicios principales:
  - Desarrollo Web
  - Marketing Digital (destacado)
  - Automatización
  - Diseño UX/UI
  - Consultoría Digital
  - Mantenimiento Web
- Precios transparentes
- Animaciones escalonadas

### 👥 Sobre Nosotros
- Información del equipo
- Valores de la empresa
- Estadísticas de experiencia
- Tarjetas de miembros del equipo

### 📞 Contacto
- **Calendly integrado** para agendar citas
- Múltiples formas de contacto:
  - Email
  - Teléfono
  - WhatsApp
  - Redes sociales
- Formulario de contacto funcional
- Información de consulta gratuita

## 🎨 Tecnologías

- **Astro** - Framework estático moderno
- **CSS3** - Estilos modernos con variables CSS
- **JavaScript** - Interacciones y animaciones
- **Google Fonts** - Tipografía Inter
- **Calendly** - Sistema de agendamiento

## 🧞 Comandos

| Comando                   | Acción                                           |
| :------------------------ | :----------------------------------------------- |
| `npm install`             | Instala dependencias                             |
| `npm run dev`             | Servidor de desarrollo en `localhost:4321`      |
| `npm run build`           | Construye el sitio para producción              |
| `npm run preview`         | Previsualiza el build localmente                |

## 📱 Responsive Design

El sitio está optimizado para:
- 📱 Móviles (320px+)
- 📱 Tablets (768px+) 
- 💻 Desktop (1200px+)

## ⚡ Características Técnicas

### Animaciones
- **Intersection Observer** para detectar elementos en viewport
- **CSS Transitions** suaves con cubic-bezier
- **Keyframes** personalizadas para efectos especiales
- **Delays escalonados** para animaciones en secuencia

### Calendly Integration
- Widget inline completamente funcional
- Fallback para casos de error
- Configuración personalizable
- Responsive en todos los dispositivos

## 🎯 Personalización

### Calendly
Para usar tu propio Calendly, cambia la URL en `src/components/Contact.astro`:

```javascript
data-url="https://calendly.com/tu-usuario/tu-evento"
```

### Colores
Paleta elegante azules y grises definida en `src/layouts/Layout.astro`:

```css
:root {
  --primary-color: #3b82f6;      /* Azul principal */
  --primary-dark: #1e40af;       /* Azul oscuro */
  --primary-light: #60a5fa;      /* Azul claro */
  --secondary-color: #6b7280;    /* Gris medio */
  --accent-color: #1e293b;       /* Gris oscuro */
  --text-primary: #1e293b;       /* Texto principal */
  --text-secondary: #64748b;     /* Texto secundario */
  --background-blue: #eff6ff;    /* Fondo azul suave */
  --background-gray: #f8fafc;    /* Fondo gris claro */
}
```

## 🌐 Despliegue

El proyecto está listo para desplegarse en:
- **Netlify** (recomendado)
- **Vercel**
- **GitHub Pages**
- Cualquier hosting estático

---

**Benalia - Elevamos tu presencia digital** 🚀
