from email.message import EmailMessage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from datetime import date
from datetime import datetime
from Empleados import *
from coneccion import *
#import coneccion
import datetime
import time
import re
import sys
import os
from dotenv import dotenv_values
from dotenv import load_dotenv
load_dotenv()  
import mysql.connector

config = dotenv_values(".env") 
usuarioMail = os.getenv('USUARIOMAIL')
servidorSMTP = os.getenv('SERVIDORSMTP')
passwd = os.getenv('PASSWD')

hostdb = os.getenv('HOSTDB')
entradas= os.getenv('ENTRADAS')


fecha_ahora = datetime.datetime.now()
today = date.today()
x = datetime.date.today()
arrayEmpleados = [nahuel, juan, marco, agustin,gustabo, julian, mariana, judit, agustina, prueba1, prueba2]
HORAS_DE_TRABAJO = 700
diaHoy = x.strftime("%d")
mesHoy = x.strftime("%m")
anoHoy = x.strftime("%Y")
hora = x.strftime("%H:%M")
lector = open("/home/nbaglietto/zkRRHHbiometrico/control/entradas.txt", "r")
for linea in lector:
  for empleado in arrayEmpleados:

        if re.search('^'+str(empleado.leg)+':'+str(diaHoy)+':'+str(mesHoy)+':'+str(anoHoy), linea):
            separador = ":"
            datos = linea.split(separador)
            legajo = datos[0]
            dia = datos[1]
            mes = datos[2]
            ano = datos[3]
            horas = datos[4]
            minutos = datos[5]
            reloj_entrada = datos[7]
            hora = int(horas)
            minuto = int(minutos)
            entre = (horas)+':'+(minutos)
            calSalida = horas + minutos
            salida = int(calSalida) + int(HORAS_DE_TRABAJO)
            exit = str(salida)
            andate = (exit[0]+exit[1]+":"+exit[2]+exit[3])
            fhoy=(str(anoHoy)+'-'+str(mesHoy)+'-'+str(diaHoy))
            format_hora='%H:%M' 
            salidaprogramada = datetime.datetime.strptime(andate, format_hora) ##converti el str andate a formato time
            print (type(salidaprogramada), salidaprogramada, 'salidaprogramada')
            print(linea)
            print (fhoy)
            #conexion = coneccion.mysql.connector.connect
            #abrir=(coneccion.conexion)
            
            exec(open("coneccion.py").read())
            sqlInsertarRegistro = f"""INSERT IGNORE INTO registros  (id, fechahoy, esano,  legajo, horaentrada, salidaprogramada) VALUES ({0},"{fhoy}","{ano}", {empleado.leg},"{entre}","{salidaprogramada}")"""
            cursor = conexion.cursor()      
            cursor.execute(sqlInsertarRegistro)
            conexion.commit()
            cursor.close()
            conexion.close()
            
            exec(open("coneccion.py").read())
            sqlUpdatemes =f"""UPDATE registros SET esmes = CONCAT(ELT(MONTH(fechahoy), 'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre','Diciembre' )) WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg}"""
            cursor = conexion.cursor()
            cursor.execute(sqlUpdatemes)
            conexion.commit()
            cursor.close()
          
            exec(open("coneccion.py").read())
            sqlUpdatedia =f"""UPDATE registros SET esdia = CONCAT(ELT(WEEKDAY(fechahoy) +1, 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes', 'Sabado', 'Domingo')) WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg}"""
            cursor = conexion.cursor()
            cursor.execute(sqlUpdatedia)
            conexion.commit()
            cursor.close()
            
            exec(open("coneccion.py").read())
            sqlselec =f"""SELECT esdia FROM registros  WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg};""" 
            cursor = conexion.cursor()
            cursor.execute(sqlselec)
            consulta1 = cursor.fetchall()
            
            
            for fila in consulta1:
                C1esdia=fila[0]

            mensajeEntrada = ("Buenos dias " + empleado.nombre + " hoy "+C1esdia+" "+dia+"/"+mes+"/"+ano +
                          " llegaste a las: "+entre+" hs. La jornada laboral concluye a las: " + andate+" Hs."+"\n \n \n\n\n\n\n\n\n\nSistema de autocontrol horario del personal en su fase beta 0.1b ❚█══█❚"+"\n"+"Si detecta algun error envienos su reporte  a sistemas@espaciomemoria.ar. Gracias!!!" +"\nEspacio Memoria y Derechos Humanos | Av. del Libertador 8151 | Tel. 4702-9920 www.espaciomemoria.ar")
           
            asuntoEntrada = ("Entrada biometrica del día: "+C1esdia +" "+ dia + "/" + mes + "/" + ano)
            print(mensajeEntrada)

            
            remitente = usuarioMail

            destinatario = str(empleado.carta)
            mensaje2 = mensajeEntrada


            email = EmailMessage()
            email["From"] = remitente
            email["To"] = destinatario
            email["Subject"] = asuntoEntrada
            email.set_content(mensaje2)
            smtp = smtplib.SMTP_SSL(servidorSMTP)
            smtp.login(remitente, passwd)
            smtp.sendmail(remitente, destinatario, email.as_string())
            smtp.quit()
            
lector.close()


sys.exit()