# Flutter JsonPlaceholder App

Esta es una aplicación Flutter que muestra posts de la API JsonPlaceholder y permite la autenticación simulada. 

## Requisitos

- Flutter 3.0 o superior
- Dart 2.14 o superior
- Dependencias de la API (ver detalles en `pubspec.yaml`)

## Instrucciones para Correr la App

1. **Clonar el Repositorio**

   Clona este repositorio usando git:

   ```bash
   git clone https://github.com/guadafermani/flutter-jsonplaceholder-app.git
   ```

2. **Instalar Dependencias**

    Navega al directorio del proyecto e instala las dependencias:

    ```bash
    cd flutter-jsonplaceholder-app
    flutter pub get
    ```

3. **Ejecutar la Aplicación**

    Conéctate a un dispositivo o emulador y ejecuta la aplicación:

    ```bash
    flutter run
    ```

## Cómo Construir el APK
Para construir el APK de la aplicación, usa el siguiente comando:

```bash
flutter build apk --release
```

El APK se generará en el directorio build/app/outputs/flutter-apk/.

## Instrucciones para Ejecutar el APK
1. **Instalar el APK en un Dispositivo**

    Puedes instalar el APK manualmente en tu dispositivo Android utilizando el siguiente comando:

    ```bash
    adb install build/app/outputs/flutter-apk/app-release.apk
    ````

    Asegúrate de que *adb* (Android Debug Bridge) esté instalado y configurado en tu sistema.

2. **Abrir la Aplicación**

    Una vez instalado, abre la aplicación en tu dispositivo.

    - Pantalla de Inicio de Sesión: Usa el siguiente usuario y contraseña para autenticarte:
        - Usuario: challenge@fudo
        - Contraseña: password

    - Pantalla de Publicaciones: Después de iniciar sesión, podrás ver todas las publicaciones. Utiliza el botón flotante para crear nuevas publicaciones (próximamente) y la barra de búsqueda para filtrar publicaciones por nombre de usuario.

## Notas
La aplicación maneja el modo offline, mostrando datos previamente obtenidos si la API no está disponible.
En caso de problemas de conexión o errores en la API, se mostrará un mensaje de error.
