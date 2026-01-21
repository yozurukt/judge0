@languages ||= []
@languages +=
[

  {
    id:90,
    name: "Bash (5.2.37)",
    is_archived: false,
    source_file: "script.sh",
    run_cmd: "/bin/bash script.sh"
  },
  # -------------------------------------------------------------------------
  # C Language (GCC 15.2.0)
  # -------------------------------------------------------------------------
  {
    id: 91,
    name: "C (GCC 15.2)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/local/bin/gcc -std=c17 -O2 -g1 -fsanitize=address -include /var/local/lib/includes/std.h %s main.c",
    run_cmd: "./a.out"
  },
  {
    id: 92,
    name: "C 23 (GCC 15.2)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/local/bin/gcc -std=c23 -O2 -g1 -fsanitize=address -include /var/local/lib/includes/std.h %s main.c",
    run_cmd: "./a.out"
  },
  # -------------------------------------------------------------------------
  # C++ Language (GCC 15.2)
  # -------------------------------------------------------------------------
  {
    id: 93,
    name: "C++ (GCC 15.2)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/local/bin/g++ -std=c++23 -O2 -g1 -fsanitize=address -include /var/local/lib/includes/stdc++.h %s main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 94,
    name: "C++ 17 (GCC 15.2)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/bin/clang++ -std=c++17 -O2 -gline-tables-only -fsanitize=address -include /var/local/lib/includes/stdc++.h %s main.cpp",
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
    compile_cmd: "/bin/bash -c \"cat /var/local/lib/includes/java_preamble.java Main.java > /tmp/Main.java && JAVA_OPTS='-Xmx256m' /usr/local/openjdk25/bin/javac %s /tmp/Main.java && mv /tmp/Main.class Main.class\"",
    run_cmd: "JAVA_OPTS='-Xmx256m' /usr/local/openjdk25/bin/java Main"
  },
  {
    id: 97, 
    name: "Java (OpenJDK 21)",
    is_archived: false,
    source_file: "Main.java",
    compile_cmd: "/bin/bash -c \"cat /var/local/lib/includes/java_preamble.java Main.java > /tmp/Main.java && JAVA_OPTS='-Xmx256m' /usr/local/openjdk21/bin/javac %s /tmp/Main.java && mv /tmp/Main.class Main.class\"",
    run_cmd: "JAVA_OPTS='-Xmx256m' /usr/local/openjdk21/bin/java Main"
  },
  # -------------------------------------------------------------------------
  # Python (3.14.2)
  # -------------------------------------------------------------------------
  {
    id: 98,
    name: "Python (3.14.2)",
    is_archived: false,
    source_file: "main.py",
    run_cmd: "/usr/local/bin/python3 <(cat /var/local/lib/includes/python_preamble.py main.py)"
  },
  # -------------------------------------------------------------------------
  # Kotlin (2.3.0 & 1.9.0)
  # -------------------------------------------------------------------------
  {
    id: 99,
    name: "Kotlin (2.3.0)",
    is_archived: false,
    source_file: "Main.kt",
    compile_cmd: "/bin/bash -c \"cat /var/local/lib/includes/kotlin_preamble.kt Main.kt > /tmp/Main.kt && JAVA_OPTS='-Xmx256m' JAVA_HOME=/usr/local/openjdk21 /usr/local/kotlin-2.3.0/bin/kotlinc %s /tmp/Main.kt\"",
    run_cmd: "JAVA_OPTS='-Xmx256m' JAVA_HOME=/usr/local/openjdk21 /usr/local/kotlin-1.9.0/bin/kotlin MainKt"
  },
  {
    id: 100,
    name: "Kotlin (1.9.0)",
    is_archived: false,
    source_file: "Main.kt",
    compile_cmd: "/bin/bash -c \"cat /var/local/lib/includes/kotlin_preamble.kt Main.kt > /tmp/Main.kt && JAVA_OPTS='-Xmx256m' JAVA_HOME=/usr/local/openjdk21 /usr/local/kotlin-2.3.0/bin/kotlinc %s /tmp/Main.kt\"",
    run_cmd: "JAVA_OPTS='-Xmx256m' JAVA_HOME=/usr/local/openjdk21 /usr/local/kotlin-2.3.0/bin/kotlin MainKt"
  },
  # -------------------------------------------------------------------------
  # C Language (Clang 21)
  # -------------------------------------------------------------------------
  {
    id: 101,
    name: "C (Clang 21)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/bin/clang -std=c17 -O2 -g1 -fsanitize=address -include /var/local/lib/includes/std.h %s main.c",
    run_cmd: "./a.out"
  },
  {
    id: 102,
    name: "C 23 (Clang 21)",
    is_archived: false,
    source_file: "main.c",
    compile_cmd: "/usr/bin/clang -std=c23 -O2 -g1 -fsanitize=address -include /var/local/lib/includes/std.h %s main.c",
    run_cmd: "./a.out"
  },
  # -------------------------------------------------------------------------
  # C++ Language (Clang 21)
  # -------------------------------------------------------------------------
  {
    id: 103,
    name: "C++ (Clang 21)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/bin/clang++ -std=c++23 -O2 -gline-tables-only -fsanitize=address -include /var/local/lib/includes/stdc++.h %s main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 104,
    name: "C++17 (Clang 21)",
    is_archived: false,
    source_file: "main.cpp",
    compile_cmd: "/usr/bin/clang++ -std=c++17 -O2 -gline-tables-only -fsanitize=address -include /var/local/lib/includes/stdc++.h %s main.cpp",
    run_cmd: "./a.out"
  },
  {
    id: 105,
    name: "Node.js (24.13.0)",
    is_archived: false,
    source_file: "main.js",
    run_cmd: "/usr/local/bin/node --harmony main.js"
  }
]