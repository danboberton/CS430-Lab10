#!/bin/bash
tar -xvf lab10_dbutcher.tar
javac -cp lib/mysql-connector-java-8.0.27.jar:lib/jdom/jdom-2.0.6.1.jar -d target $(find src/ -name "*.java")
java -cp target:lib/mysql-connector-java-8.0.27.jar:lib/jdom/jdom-2.0.6.1.jar lab10.Main