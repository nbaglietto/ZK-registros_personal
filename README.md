ZK-registros_personal basicamen son 2 script que se ejecutan con cron, al medio dia ent.py lee el archivo entradas.txt con los registros biometricos de los empleados
ingresa los datos a una bd de mysql y envia un mail a cada usuario con la hora de ingreso y la hora en que se acaba su jornada laboral.
El segundo script cron lo ejecuta por la tarde luego que todos los empleados se retiraran lee el archivo salidas.txt carga los datos en 
la base de datos y le envia un mail a cada usuario con hora de ingreso hora de egreso y cantidad de horas trabajadas.

se utiliza Phyton 3.8.10 y base de datos Mariadb
