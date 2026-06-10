### To-Do List
A robust multi-list task manager implementing Apple's data persistence and clean state synchronization.
* **Architecture & Technical Highlights:**
  * **Data Persistence:** Built a custom `ListManager` using `UserDefaults` combined with Swift's `JSONEncoder`/`JSONDecoder` for lightweight local reactive caching.
  * **Dynamic Bindings:** Implemented custom multi-level sequential bindings (`Binding<ToDoList>`) to guarantee instant state synchronization between parent collections and child detail sheets.
  * **Real-time UX Metrics:** Leveraged Computed Properties for real-time progress calculations, feeding live data to SwiftUI `ProgressView` components.
  * **Advanced UI Kits:** Modeled native search interaction with `.searchable()`, context interactions using `.contextMenu()`, and contextual alert injectors.
  
    ---
  
  ## Requirements & Setup

* **OS:** macOS 14.0 or later.
* **IDE:** Xcode 15.0+ / 16.0.
* **Platform:** iOS 17.0+ deployment target.

To run these projects locally:
1. Clone the repository: `git clone https://github.com/isaSanchez-png/ToDoList-App.git`
2. Open the desired project folder in Xcode.
3. Select your preferred iOS Simulator and press `⌘R` (Run).


### Gestor de Tareas (To-Do List)
Un administrador de listas múltiples enfocado en la persistencia nativa de datos y sincronización limpia de estados.
* **Arquitectura y Aspectos Técnicos Destacados:**
  * **Persistencia de Datos:** Creación de un `ListManager` personalizado usando `UserDefaults` en combinación con `JSONEncoder`/`JSONDecoder` para un almacenamiento local reactivo.
  * **Bindings Dinámicos:** Implementación de enlaces multinivel avanzados (`Binding<ToDoList>`) para asegurar la actualización de información en tiempo real entre la vista principal y los detalles.
  * **Métricas en Tiempo Real:** Uso de Propiedades Computadas para calcular el progreso de tareas, conectado directamente a componentes `ProgressView`.
  * **UI Avanzada:** Integración de barra de búsqueda nativa con `.searchable()`, menús interactivos mediante `.contextMenu()` y alertas de inserción de datos dinámicas.
  
  ---

## 🛠️ Requisitos e Instalación

* **Sistema Operativo:** macOS 14.0 o superior.
* **IDE:** Xcode 15.0+ / 16.0.
* **Plataforma:** Target de despliegue para iOS 17.0+.

Para ejecutar estos proyectos localmente:
1. Clona el repositorio: `git clone https://github.com/isaSanchez-png/ToDoList-App.git`
2. Abre la carpeta del proyecto deseado en Xcode.
3. Selecciona tu simulador de iOS preferido y presiona `⌘R` (Run).
