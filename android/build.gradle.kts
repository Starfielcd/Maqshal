allprojects {
    repositories {
        google()  // Asegúrate de que esté este repositorio
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

subprojects {
    project.evaluationDependsOn(":app")
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}

buildscript {
    repositories {
        google()  // Asegúrate de tener este repositorio
        mavenCentral()
    }
    dependencies {
        classpath("com.android.tools.build:gradle:7.2.0")
        classpath("com.google.gms:google-services:4.3.15")  // Agregar el plugin de Google Services
    }
}
