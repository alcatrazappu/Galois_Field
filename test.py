import fileinput 
import os
from io import StringIO
import sys
#import softposit as sp

def tcl_maker(tcl_template,tcl_out,Project_Name,Top_Module,Top_File,Run_Time="100ms"):
    f=open(tcl_template,'r')
    filedata=f.read()
    f.close()
    
    filedata2=filedata.replace("%Project_Name%",Project_Name)
    filedata3=filedata2.replace("%Top_Module%",Top_Module)
    filedata4=filedata3.replace("%Top_File%",Top_File)
    filedata5=filedata4.replace("%Run_Time%",Run_Time)
    
    f=open(tcl_out,'w')
    f.write(filedata5)
    f.close()
    
def tb_maker(tb_template,tb_out,output_txt,N,ES,INA_L,INA_H,INB_L,INB_H):
    f=open(tb_template,'r')
    filedata=f.read()
    f.close()
    
    filedata2=filedata.replace("%N%",str(N))
    filedata3=filedata2.replace("%ES%",str(ES))
    filedata4=filedata3.replace("%INA_L%",str(INA_L))
    filedata5=filedata4.replace("%INA_H%",str(INA_H))
    filedata6=filedata5.replace("%INB_L%",str(INB_L))
    filedata7=filedata6.replace("%INB_H%",str(INB_H))
    filedata8=filedata7.replace("%Output_txt%",output_txt)
    
    f=open(tb_out,'w')
    f.write(filedata8)
    f.close()
    
def batch_maker(batch_template,batch_out,vivado_tcl_shell,tcl_source):
    f=open(batch_template,'r')
    filedata=f.read()
    f.close()
    
    filedata2=filedata.replace("%Vivado_TCL%",vivado_tcl_shell)
    filedata3=filedata2.replace("%TCL_Source%",tcl_source)
    
    f=open(batch_out,'w')
    f.write(filedata3)
    
def std_extract(X):
    result=StringIO()
    old_stdout=sys.stdout
    sys.stdout=result
    X.toBinaryFormatted()
    sys.stdout=old_stdout
    y=result.getvalue()
    l=len(y)    
    ans=''    
    for i in range(0,l-2):
        if(y[i]=='m' and y[i+1]!='\x1b'):
            while(y[i]!='\x1b'):
                ans=ans+y[i]
                i=i+1
    finalans=''
    for c in ans:
        if(c=='1' or c=='0'):
            finalans=finalans+c
    return finalans

def compare(hp,sp,INA_L,INA_H,INB_L,INB_H):
    x=open(hp,"r")
    y=open(sp,"r")
    flag=0
    for i in range(INA_L,INA_H):
        for j in range(INB_L,INB_H):
            data_x=x.readline()
            data_y=y.readline()
            if(data_x!=data_y):
                flag=1
                print("Error: ",i,j)
    if(flag==0):
        print("No Error")
    
if __name__=='__main__':
    
    N=16
    ES=1
    
    INA_L=0
    INA_H=16
    INB_L=0
    INB_H=16
    
    batch_template="C:/Users/UUA4KOR/Documents/Test_Posit_Add/batch_template.bat"
    batch_out="C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.bat"
    vivado="C:/Xilinx/Vivado/2018.3/bin/vivado.bat"
    tcl="C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.tcl"
    
    tb_template="C:/Users/UUA4KOR/Documents/Test_Posit_Add/posit_add_tb_template.v"
    tb="C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v"
    hp_out="C:/Users/UUA4KOR/Documents/Test_Posit_Add/output.txt"
    
    tcl_template="C:/Users/UUA4KOR/Documents/Test_posit_Add/tcl_template.tcl"
    project="C:/Users/UUA4KOR/Documents/Posit_Adder/Posit_Adder/Posit_Adder.xpr"
    test_bench_module="Posit_Addition_Test_benchh"
    tb="C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v"
    
    bat_loc="C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.bat"
    
    #batch_maker("C:/Users/UUA4KOR/Documents/Test_Posit_Add/batch_template.bat","C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.bat","C:/Xilinx/Vivado/2018.3/bin/vivado.bat","C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.tcl")
    #tb_maker("C:/Users/UUA4KOR/Documents/Test_Posit_Add/posit_add_tb_template.v","C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v","C:/Users/UUA4KOR/Documents/Test_Posit_Add/output.txt",N,ES,INA_L,INA_H,INB_L,INB_H)
    #tcl_maker("C:/Users/UUA4KOR/Documents/Test_posit_Add/tcl_template.tcl","C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.tcl","C:/Users/UUA4KOR/Documents/Posit_Adder/Posit_Adder/Posit_Adder.xpr","Posit_Addition_Test_benchh","C:/Users/UUA4KOR/Documents/Test_Posit_Add/tb.v")
    #os.system("call C:/Users/UUA4KOR/Documents/Test_Posit_Add/test.bat")
    
    batch_maker(batch_template,batch_out,vivado,tcl)
    tb_maker(tb_template,tb,hp_out,N,ES,INA_L,INA_H,INB_L,INB_H)
    tcl_maker(tcl_template,tcl,project,test_bench_module,tb)
    os.system("call "+bat_loc)
    
    
    '''f=open("C:/Users/UUA4KOR/Documents/Test_Posit_Add/SP_result.txt","w")
    A=sp.posit16()
    B=sp.posit16()
    for i in range(INA_L,INA_H):
        for j in range(INB_L,INB_H):
            bin_i=bin(i)
            bin_j=bin(j)
            A.fromBits(int(str(bin_i[2:]),2))
            B.fromBits(int(str(bin_j[2:]),2))
            C=A+B
            out=std_extract(C)+'\n'
            f.writelines(out)
    f.close()'''
    compare("C:/Users/OJT1KOR/Documents/Test_Posit_Add/output.txt","C:/Users/OJT1KOR/Documents/Test_Posit_Add/SP_result.txt",INA_L,INA_H,INB_L,INB_H)
    
