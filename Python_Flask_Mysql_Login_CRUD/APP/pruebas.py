file='imagen.png'
print(file)
file_name=file.rsplit('.',1)[0]
file_extencion=file.rsplit('.',1)[1]
ALLOWED_EXTENSIONS = {'png', 'jpg', 'jpeg', 'gif'}

def validar_archivo(file):
    return ('.' in file)and(file.rsplit('.',1)[1].lower() in ALLOWED_EXTENSIONS)

print(validar_archivo(file))