@languages ||= []
@languages +=
[
  {
    id: 43,
    name: "Plain Text",
    is_archived: false,
    source_file: "text.txt",
    run_cmd: "/bin/cat text.txt"
  },
  {
    id: 44,
    name: "Executable",
    is_archived: false,
    source_file: "a.out",
    run_cmd: "/bin/chmod +x a.out && ./a.out"
  },
  {
    id: 89,
    name: "Multi-file program",
    is_archived: true,
  },
  {
    id:90,
    name: "Bash (5.3)",
    is_archived: false,
    source_file: "script.sh",
    run_cmd: "/usr/local/bash-5.3/bin/bash script.sh"
  },
  # -------------------------------------------------------------------------
  # C Language (GCC 15.2.0)
  # -------------------------------------------------------------------------
  {
    id: 91,
    name: "C (GCC 15.2.0)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/local/bin/gcc %s main.c",
    run_cmd: "./a.out"
  },
  {
    id: 92,
    name: "C (GCC 15.2.0 C99)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/local/bin/gcc -std=c99 %s main.c",
    run_cmd: "./a.out"
  },
  # -------------------------------------------------------------------------
  # C++ Language (GCC 15.2.0)
  # -------------------------------------------------------------------------
  {
    id: 93,
    name: "C++ (GCC 15.2.0)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/local/bin/g++ -static-libgcc -static-libstdc++ %s main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 94,
    name: "C++ 17 (GCC 15.2.0)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/local/bin/g++ -std=c++17 -static-libgcc -static-libstdc++ %s main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 95,
    name: "C++ 20 (GCC 15.2.0)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/local/bin/g++ -std=c++20 -static-libgcc -static-libstdc++ %s main.cpp",
    run_cmd: "./a.out"
  },
  # -------------------------------------------------------------------------
  # Java (OpenJDK 25 & 21)
  # -------------------------------------------------------------------------
  {
    id: 96,
    name: "Java (OpenJDK 25)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "/usr/local/openjdk25/bin/javac %s Main.java",
    run_cmd: "/usr/local/openjdk25/bin/java Main"
  },
  {
    id: 97, 
    name: "Java (OpenJDK 21)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "/usr/local/openjdk21/bin/javac %s Main.java",
    run_cmd: "/usr/local/openjdk21/bin/java Main"
  },
  # -------------------------------------------------------------------------
  # Python (3.14.2)
  # -------------------------------------------------------------------------
  {
    id: 98,
    name: "Python (3.14.2)",
    is_archived: false,
    source_file: "script.py",
    run_cmd: "/usr/local/bin/python3 script.py"
  },
  # -------------------------------------------------------------------------
  # Kotlin (2.3.0 & 1.9.0)
  # -------------------------------------------------------------------------
  {
    id: 99,
    name: "Kotlin (2.3.0)",
    is_archived: false,
    source_file: "Main.kt",
    compile_cmd: "/usr/local/kotlin-2.3.0/bin/kotlinc %s Main.kt",
    run_cmd: "/usr/local/kotlin-2.3.0/bin/kotlin MainKt"
  },
  {
    id: 100,
    name: "Kotlin (1.9.0)",
    is_archived: false,
    source_file: "Main.kt",
    compile_cmd: "/usr/local/kotlin-1.9.0/bin/kotlinc %s Main.kt",
    run_cmd: "/usr/local/kotlin-1.9.0/bin/kotlin MainKt"
  }

]