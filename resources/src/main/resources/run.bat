@echo off

rem Default properties file name
set PROPERTYFILE=default.properties

rem Base directory - directory where run.bat resides
set BASEDIR=%~dp0

rem Current directory
set CURRENTDIR=%CD%

rem Path to Java executable
if "x%JAVA_HOME%" == "x" (
    set JAVA_COMMAND="java"
) else (
    set JAVA_COMMAND="%JAVA_HOME%\bin\java"
)

rem Include property file if it exists in current or base directory
if exist "%CURRENTDIR%\%PROPERTYFILE%" (
    set JAVA_OPTS=-D%PROPERTYFILE%="%CURRENTDIR%\%PROPERTYFILE%"
) else (
    if exist %BASEDIR%\%PROPERTYFILE% (
        set JAVA_OPTS=-D%PROPERTYFILE%="%BASEDIR%\%PROPERTYFILE%"
    )
)

rem JPDA options
rem JAVA_OPTS=%JAVA_OPTS% -agentlib:jdwp=transport=dt_socket,server=y,suspend=y,address=5005

rem Set classpath and other JVM properties
set JAVA_OPTS=%JAVA_OPTS% -ea -cp %BASEDIR%\lib\*;%BASEDIR%\resources
