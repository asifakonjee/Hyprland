import os

for i in os.listdir('/home/killown/numix-icon-theme-circle/Numix-Circle/48/apps/'):
    if os.path.isfile(i):
        continue
    else: 
        print("Arquivo: " + i + " Não existe no numix white")
        os.rename(os.path.join('/home/killown/numix-icon-theme-circle/Numix-Circle/48/apps/', i), os.path.join('/home/killown/icons', i)) 
