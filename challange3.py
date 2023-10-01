#Melakukan import mysql connector
import mysql.connector

#Melakukan percobaan koneksi
conn = mysql.connector.connect(
    host="localhost", user="root", password="32fdd6ff", database="KALBE3"
)

#membuat objek cursor sebagai penanda
cursor = conn.cursor()

#Deklarasi SQL Query untuk memasukan record ke DB (KARYAWAN)
sql = "INSERT INTO karyawan (FIRST_NAME, LAST_NAME, AGE, SEX, INCOME) VALUES (%s, %s, %s, %s, %s)"
values = ("Risqi", "Permana", 22, "Male", 7000000.0)

try:
    #Eksekusi SQL Command
    cursor.execute(sql, values)

    #Melakukan perubahan (commit) pada DB
    conn.commit()

except:
    #Roll Back apabila ada issue
    conn.rollback()

#Menutup koneksi
conn.close()