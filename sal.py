# !/usr/bin/python3
# C. Nahuel Baglietto
# www.baglietto.ar
from email.message import EmailMessage
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
import smtplib
from datetime import date, time,timedelta, date, datetime
from Empleados import *
import mysql.connector
from coneccion import *
import datetime 
import time
import re
import sys
import os
from dotenv import dotenv_values
load_dotenv()  
config = dotenv_values(".env") 
usuarioMail = os.getenv('USUARIOMAIL')
servidorSMTP = os.getenv('SERVIDORSMTP')
passwd = os.getenv('PASSWD')
hostdb = os.getenv('HOSTDB')
entradas= os.getenv('ENTRADAS')
arrayEmpleados = [nahuel, juan, marco, agustin,gustabo, julian, mariana, judit, agustina, prueba1, prueba2]
fecha_ahora = datetime.datetime.now()
today = date.today()
x = datetime.date.today()
diaHoy = x.strftime("%d")
mesHoy = x.strftime("%m")
anoHoy = x.strftime("%Y")
hora = x.strftime("%H:%M")
lector = open("/home/nbaglietto/zkRRHHbiometrico/control/salidas.txt", "r")
for linea in lector:
    
  for empleado in arrayEmpleados:
              
        if re.search('^'+str(empleado.leg)+':'+str(diaHoy)+':'+str(mesHoy)+':'+str(anoHoy), linea):
          separador = ":"
          datos = linea.split(separador)
          fecha_ahora = datetime.datetime.now()
          today = date.today()
          x = datetime.date.today()
          HORAS_DE_TRABAJO = 700
          legajo = datos[0]
          dia = datos[1]
          mes = datos[2]
          ano = datos[3]
          horas = datos[4]
          minutos = datos[5]
          reloj_entrada = datos[7]
          sali = (horas)+':'+(minutos)
          calSalida = horas + minutos
          salida = int(calSalida) + int(HORAS_DE_TRABAJO)
          exit = str(salida)
          andate = (exit[0]+exit[1]+":"+exit[2]+exit[3])
          hoy=(str(anoHoy)+'-'+str(mesHoy)+'-'+str(diaHoy))
          fhoy=(str(anoHoy)+'-'+str(mesHoy)+'-'+str(diaHoy))
          format_hora='%H:%M' 
          Salida = datetime.datetime.strptime(sali, format_hora)#converti sali de str a time
          exec(open("coneccion.py").read())
          sqlUpdate =f"""UPDATE registros SET horasalida = "{Salida}" WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg}"""
          cursor = conexion.cursor()
          cursor.execute(sqlUpdate)
          conexion.commit()
          cursor.close()
          
          exec(open("coneccion.py").read())
          sqlUpdatehtra =f"""UPDATE registros SET horastrabajadas = SEC_TO_TIME(TIMESTAMPDIFF(SECOND, horaentrada, horasalida)) WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg}"""
          cursor = conexion.cursor()
          cursor.execute(sqlUpdatehtra)
          conexion.commit()
          cursor.close()
          
          exec(open("coneccion.py").read())
          sqlUpdatesaldo =f"""UPDATE registros SET saldoHoras = DATE_SUB(horastrabajadas, INTERVAL 7 HOUR) WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg}"""
          cursor = conexion.cursor()
          cursor.execute(sqlUpdatesaldo)
          conexion.commit()
          cursor.close()
          
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
          sqlselec =f"""SELECT id, legajo, fechahoy, esdia, esmes, horaentrada, horasalida , salidaprogramada, horastrabajadas, saldohoras FROM registros  WHERE fechahoy = "{fhoy}" and legajo = {empleado.leg};""" #mes="{mes}"  and 
          cursor = conexion.cursor()
          cursor.execute(sqlselec)
          consulta1 = cursor.fetchall()
          
          
          for fila in consulta1:
              C1legajo=[1]
              C1fechahoy=[2]
              C1esdia=fila[3]
              C1esmes=fila[4]
              C1horaentrada=fila[5]
              C1horasalida=fila[6]
              C1salidaprogramada=fila[7]
              C1horastrabajadas=fila[8]
              C1saldohoras=fila[9]
              C1HoraEntrada=(str(C1horaentrada))
              C1SaldoHoras = (str(C1saldohoras))
              exec(open("coneccion.py").read())
              sqlselecdiastrabajados =f"""SELECT count(*)as diastrabajados FROM registros  WHERE esmes="{C1esmes}"  and esano="{ano}" and legajo = {empleado.leg};""" #mes="{mes}"  and 
              cursor = conexion.cursor()
              cursor.execute(sqlselecdiastrabajados)
              resultado = cursor.fetchall()
              
              for fila2 in resultado:
                diastrabajados=fila2[0]        
                mensaje = ("Buenas tardes " + (empleado.nombre) + " hoy "+ (C1esdia) +" "+ (fhoy)+ " llegaste a las: "+(str(C1horaentrada) )+  " y salistes a las: " + (str(C1horasalida)) + " hs."+"\n" + "Trabajaste un total de: "+ (str(C1horastrabajadas))+ " llevas registrados "+ (str(diastrabajados)) + " dias trabajados en el mes." +"\n \n \n\n\n\n\n\n\n\nSistema de autocontrol horario del personal en su fase beta 0.1b ❚█══█❚"+"\n"+"Si detecta algun error envienos su reporte  a sistemas@espaciomemoria.ar. Gracias!!!" +"\nEspacio Memoria y Derechos Humanos | Av. del Libertador 8151 | Tel. 4702-9920 www.espaciomemoria.ar" )
                remitente = usuarioMail
                mensajeSalida=mensaje
                asuntoSalida = "Salida biometrica del día " + C1esdia +" "+ dia + "/" + mes + "/" + ano
                print(mensajeSalida)
                destinatario = str(empleado.carta)
                mensaje = mensajeSalida
                email = EmailMessage()
                email["From"] = remitente
                email["To"] = destinatario
                email["Subject"] = asuntoSalida
                email.set_content(mensaje)
                smtp = smtplib.SMTP_SSL(servidorSMTP)
                smtp.login(remitente, passwd)
                smtp.sendmail(remitente, destinatario, email.as_string())
                smtp.quit()
                          
          conexion.commit()
          cursor.close()
lector.close()
sys.exit()