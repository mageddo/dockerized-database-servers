jdk-install(){
  jdkId=$(sdk list java | awk -F '|' '{print $6}' | sed 's/\s//g' | grep -oE "($1)" | head -1);
  jdkVersion="$2"
  if [ -z "$2" ]; then
    jdkVersion=$(echo "$jdkId" | grep -oE '([0-9]+)' | head -1);
  fi
  echo "Installing ${jdkId} at user home ${HOME}, version = '$jdkVersion'"
  sdk install java "${jdkId}";
  ln -sfn "$HOME/.sdkman/candidates/java/${jdkId}" "$HOME/.sdkman/candidates/java/${jdkVersion}";
  echo "Installed ${jdkVersion}"
}

jdk-6(){
  export JAVA_HOME=~/.sdkman/candidates/java/6
  export PATH="$JAVA_HOME/bin:$PATH"
}

jdk-7(){
  export JAVA_HOME=~/.sdkman/candidates/java/7
  export PATH="$JAVA_HOME/bin:$PATH"
}

jdk-8(){
  export JAVA_HOME=~/.sdkman/candidates/java/8
  export PATH="$JAVA_HOME/bin:$PATH"
}

jdk-11(){
  export JAVA_HOME=~/.sdkman/candidates/java/11
  export PATH="$JAVA_HOME/bin:$PATH"
}

jdk-15(){
  export JAVA_HOME=~/.sdkman/candidates/java/15
  export PATH="$JAVA_HOME/bin:$PATH"
}

jdk-17(){
  export JAVA_HOME=~/.sdkman/candidates/java/17
  export PATH="$JAVA_HOME/bin:$PATH"
}

grl-19(){
  export JAVA_HOME=~/.sdkman/candidates/java/grl-19
  export PATH="$JAVA_HOME/bin:$PATH"
}