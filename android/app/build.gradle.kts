plugins {
    id("com.android.application")
    // START: Firebase Configuration
    id("com.google.gms.google-services")  // Esto habilita la integración con Firebase
    // END: Firebase Configuration
    id("kotlin-android")
    // El plugin de Flutter Gradle debe aplicarse después de los plugins de Android y Kotlin.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    namespace = "com.example.intento3"
    compileSdk = flutter.compileSdkVersion  // Usa la versión de SDK de Flutter

    ndkVersion = "26.3.11579264"  // Si tienes configurado un NDK específico

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()  // Asegúrate de que Kotlin use la versión correcta
    }

    defaultConfig {
        applicationId = "com.example.intento3"  // Tu ID de la aplicación (en el caso de Firebase, debe coincidir con el ID registrado en la consola de Firebase)
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            signingConfig = signingConfigs.getByName("debug")  // Si no tienes configuración de firmados, usa esta
        }
    }
}

flutter {
    source = "../.."  // Apunta a la raíz de tu proyecto Flutter
}
