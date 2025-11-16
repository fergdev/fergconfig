import com.dorongold.gradle.tasktree.TaskTreePlugin
initscript {
    repositories {
        gradlePluginPortal()
        mavenCentral()
    }
    dependencies {
        classpath("com.dorongold.plugins:task-tree:4.0.1")
    }
}

gradle.rootProject {
    apply<TaskTreePlugin>()
}
