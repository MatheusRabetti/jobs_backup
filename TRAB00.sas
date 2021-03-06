LIBNAME OUT 'C:\Projetos\Projeto a ser autorizado\Programas\Trabalho';
LIBNAME IN 'C:\Projetos\Projeto a ser autorizado\Programas\Base dom e pes 00';


DATA IBGE;
 SET IN.pesdom00;



********************;
 * VARIAVEIS DE     *;
 * SETOR CENSITARIO *;
 ********************;

UF=PUT(V0102,$2.);
DIST=PUT(V0104,$2.);
MUNIC=PUT(V0103,$4.);
SUBDIST=PUT(V0105,$2.);
SETOR=PUT(V0106,$4.);
QUEST=PUT(V0101,$4.);


 SETORC=UF!!MUNIC!!DIST!!SUBDIST!!SETOR;

 N_DOM=UF!!MUNIC!!DIST!!SUBDIST!!SETOR!!QUEST;



DATA PES;
SET IBGE;


PESOPES=P001;


********* tirando empregada doméstica e pensionista etc **********;
IF V0402<=08;

****** selecionando os dom particulares permanentes ****;
IF V0201=1;



*******;
* PIA *;
*******;

PIA=1;


********;
* OCUP *;
********;

SELECT;
 WHEN (V0439=1 OR V0440=1 OR V0441=1 OR V0442=1 OR V0443=1) OCUP=1;
 OTHERWISE                                                  OCUP=0;
END;


*******;
* DES *;
*******;

SELECT;
 WHEN (V0439=2 AND V0440=2 AND V0441=2 AND V0442=2 AND V0443=2 AND V0455=1) DES=1;
 OTHERWISE                                                                  DES=0;
END;


*******;
* PEA *;
*******;

SELECT;
 WHEN (OCUP=1 OR DES=1) PEA=1;
 OTHERWISE              PEA=0;
END;


**********CALCULANDO OS OCUPADOS E DESOCUPADOS - 10 A 14 ANOS ************;

 SELECT;
   WHEN (10<=V4752<=14) DO;
     SELECT;
       WHEN (PIA=1)  PIA1014=1;
       WHEN (PIA=0)  PIA1014=0;
       OTHERWISE     PIA1014=.;
     END;END;
   OTHERWISE         PIA1014=.;
 END;

 SELECT;
   WHEN (10<=V4752<=14) DO;
     SELECT;
       WHEN (OCUP=1)  OCUP1014=1;
       WHEN (OCUP=0)  OCUP1014=0;
       OTHERWISE      OCUP1014=.;
     END;END;
   OTHERWISE          OCUP1014=.;
 END;

  SELECT;
   WHEN (10<=V4752<=14) DO;
     SELECT;
       WHEN (DES=1)  DES1014=1;
       WHEN (DES=0)  DES1014=0;
       OTHERWISE     DES1014=.;
     END;END;
   OTHERWISE         DES1014=.;
 END;

  SELECT;
   WHEN (10<=V4752<=14) DO;
     SELECT;
       WHEN (PEA=1)  PEA1014=1;
       WHEN (PEA=0)  PEA1014=0;
       OTHERWISE     PEA1014=.;
     END;END;
   OTHERWISE         PEA1014=.;
 END;


**********CALCULANDO OS OCUPADOS E DESOCUPADOS - 15 A 17 ANOS ************;

 SELECT;
   WHEN (15<=V4752<=17) DO;
     SELECT;
       WHEN (PIA=1)  PIA1517=1;
       WHEN (PIA=0)  PIA1517=0;
       OTHERWISE     PIA1517=.;
     END;END;
   OTHERWISE         PIA1517=.;
 END;

 SELECT;
   WHEN (15<=V4752<=17) DO;
     SELECT;
       WHEN (OCUP=1)  OCUP1517=1;
       WHEN (OCUP=0)  OCUP1517=0;
       OTHERWISE      OCUP1517=.;
     END;END;
   OTHERWISE          OCUP1517=.;
 END;

  SELECT;
   WHEN (15<=V4752<=17) DO;
     SELECT;
       WHEN (DES=1)  DES1517=1;
       WHEN (DES=0)  DES1517=0;
       OTHERWISE     DES1517=.;
     END;END;
   OTHERWISE         DES1517=.;
 END;

  SELECT;
   WHEN (15<=V4752<=17) DO;
     SELECT;
       WHEN (PEA=1)  PEA1517=1;
       WHEN (PEA=0)  PEA1517=0;
       OTHERWISE     PEA1517=.;
     END;END;
   OTHERWISE         PEA1517=.;
 END;


 **********CALCULANDO OS OCUPADOS E DESOCUPADOS - 18 A 24 ANOS ************;

 SELECT;
   WHEN (18<=V4752<=24) DO;
     SELECT;
       WHEN (PIA=1)  PIA1824=1;
       WHEN (PIA=0)  PIA1824=0;
       OTHERWISE     PIA1824=.;
     END;END;
   OTHERWISE         PIA1824=.;
 END;

 SELECT;
   WHEN (18<=V4752<=24) DO;
     SELECT;
       WHEN (OCUP=1)  OCUP1824=1;
       WHEN (OCUP=0)  OCUP1824=0;
       OTHERWISE      OCUP1824=.;
     END;END;
   OTHERWISE          OCUP1824=.;
 END;

  SELECT;
   WHEN (18<=V4752<=24) DO;
     SELECT;
       WHEN (DES=1)  DES1824=1;
       WHEN (DES=0)  DES1824=0;
       OTHERWISE     DES1824=.;
     END;END;
   OTHERWISE         DES1824=.;
 END;

  SELECT;
   WHEN (18<=V4752<=24) DO;
     SELECT;
       WHEN (PEA=1)  PEA1824=1;
       WHEN (PEA=0)  PEA1824=0;
       OTHERWISE     PEA1824=.;
     END;END;
   OTHERWISE         PEA1824=.;
 END;


 **********CALCULANDO OS OCUPADOS E DESOCUPADOS - 25 A 29 ANOS ************;

 SELECT;
   WHEN (25<=V4752<=29) DO;
     SELECT;
       WHEN (PIA=1)  PIA2529=1;
       WHEN (PIA=0)  PIA2529=0;
       OTHERWISE     PIA2529=.;
     END;END;
   OTHERWISE         PIA2529=.;
 END;

 SELECT;
   WHEN (25<=V4752<=29) DO;
     SELECT;
       WHEN (OCUP=1)  OCUP2529=1;
       WHEN (OCUP=0)  OCUP2529=0;
       OTHERWISE      OCUP2529=.;
     END;END;
   OTHERWISE          OCUP2529=.;
 END;

  SELECT;
   WHEN (25<=V4752<=29) DO;
     SELECT;
       WHEN (DES=1)  DES2529=1;
       WHEN (DES=0)  DES2529=0;
       OTHERWISE     DES2529=.;
     END;END;
   OTHERWISE         DES2529=.;
 END;

  SELECT;
   WHEN (25<=V4752<=29) DO;
     SELECT;
       WHEN (PEA=1)  PEA2529=1;
       WHEN (PEA=0)  PEA2529=0;
       OTHERWISE     PEA2529=.;
     END;END;
   OTHERWISE         PEA2529=.;
 END;


 **********CALCULANDO OS OCUPADOS E DESOCUPADOS - 18 ANOS OU MAIS ************;

 SELECT;
   WHEN (V4752>=18) DO;
     SELECT;
       WHEN (PIA=1)  PIA18M=1;
       WHEN (PIA=0)  PIA18M=0;
       OTHERWISE     PIA18M=.;
     END;END;
   OTHERWISE         PIA18M=.;
 END;

 SELECT;
   WHEN (V4752>=18) DO;
     SELECT;
       WHEN (OCUP=1)  OCUP18M=1;
       WHEN (OCUP=0)  OCUP18M=0;
       OTHERWISE      OCUP18M=.;
     END;END;
   OTHERWISE          OCUP18M=.;
 END;

  SELECT;
   WHEN (V4752>=18) DO;
     SELECT;
       WHEN (DES=1)  DES18M=1;
       WHEN (DES=0)  DES18M=0;
       OTHERWISE     DES18M=.;
     END;END;
   OTHERWISE         DES18M=.;
 END;

  SELECT;
   WHEN (V4752>=18) DO;
     SELECT;
       WHEN (PEA=1)  PEA18M=1;
       WHEN (PEA=0)  PEA18M=0;
       OTHERWISE     PEA18M=.;
     END;END;
   OTHERWISE         PEA18M=.;
 END;



*************CALCULANDO OS OCUPADOS POR POSIÇÃO NA OCUPAÇÃO ***************;

IF (V0447=1 OR V0447=3) THEN TRABCC=1;
ELSE                         TRABCC=0;

IF (V0447=2 OR V0447=4) THEN TRABSC=1;
ELSE                         TRABSC=0;

IF (V0448=1) THEN TRABPUB=1;
ELSE              TRABPUB=0;

IF (V0447=6) THEN CPR=1;
ELSE              CPR=0;

IF (V0447=5) THEN EMP=1;
ELSE              EMP=0;

***********CALCULANDO OS OCUPADOS FORMAIS NO TRABALHO PRINCIPAL********************;

IF (TRABCC=1 OR TRABPUB=1 OR ((CPR=1 OR EMP=1) AND V0450=1))  THEN FORMAL=1;
ELSE                                                               FORMAL=0;


***********CALCULANDO OS OCUPADOS POR GRAU DE ESCOLARIDADE********************;

IF (1<=V0430<=7 OR V0432=1 OR V0432=2 OR (V0432=3 AND V0434=2) OR
    (V0432=5 AND V0434=2) OR V0432=9 OR V0429=4)                    THEN  FUNDIN=1;
ELSE                                                                      FUNDIN=0;


IF ((1<=V0430<=7) OR (V0430=8 AND 1<=V0431<=3) OR V0430=9 OR
     V0430=10 OR 1<=V0432<=3 OR V0432=5 OR V0432=9 OR
     (V0432=4 AND V0434=2) OR (V0432=6 AND (V0433<=2 OR V0433=9)
      AND V0434=2) OR V0429=4)                                      THEN  MEDIN=1;
ELSE                                                                      MEDIN=0;


IF (V0430=13 OR (V0432=7 AND V0434=1) OR V0432=8)   THEN  SUPER=1;
ELSE                                                      SUPER=0;


***********CALCULANDO OS OCUPADOS POR SETOR********************;

IF (01101<=V4462<=05002) THEN AGRO=1;
ELSE                          AGRO=0;

IF (10000<=V4462<=14004) THEN EXTR=1;
ELSE                          EXTR=0;

IF (15010<=V4462<=37000) THEN TRANSF=1;
ELSE                          TRANSF=0;

IF (40010<=V4462<=41000) THEN SIUP=1;
ELSE                          SIUP=0;

IF (45001<=V4462<=45999) THEN CONSTR=1;
ELSE                          CONSTR=0;

IF (V4462=50010 OR (50030<=V4462<=50050) OR (53010<=V4462<=53102) OR V4462=53999)  THEN  COM=1;
ELSE                                                                                     COM=0;

IF (V4462=50020 OR (53111<=V4462<=53113) OR (55010<=V4462<=95000))  THEN  SERV=1;
ELSE                                                                      SERV=0;


*************CALCULANDO O RENDIMENTO MÉDIO DOS OCUPADOS***********;

RENOCUP=V4525*1.95209;


*************CALCULANDO O % DOS OCUPADOS POR FAIXA DE RENDIMENTO EM SAL MÍNIMOS***********;

IF (RENOCUP=0)       THEN REN0=1;
IF ((RENOCUP/510)<1) THEN REN1=1;
IF ((RENOCUP/510)<2) THEN REN2=1;
IF ((RENOCUP/510)<3) THEN REN3=1;
IF ((RENOCUP/510)<5) THEN REN5=1;


IF (V4525>=0) THEN POPREN=1;


*************CALCULANDO O THEIL-L DOS RENDIMENTOS DOS OCUPADOS***********;

IF (V4525>0) THEN RTHEIL=V4525;
IF (V4525>0) THEN POPT=1;

LRTHEIL=LOG(RTHEIL);


PROC SORT DATA=PES;
BY SETORC;


PROC MEANS DATA=PES SUM NOPRINT;
VAR PIA PIA1014 PIA1517 PIA1824 PIA2529 PIA18M OCUP OCUP1014 OCUP1517 OCUP1824 OCUP2529 OCUP18M DES DES1014 DES1517
    DES1824 DES2529 DES18M PEA PEA1014 PEA1517 PEA1824 PEA2529 PEA18M;
OUTPUT OUT=SAI1(KEEP=SETORC PIA PIA1014 PIA1517 PIA1824 PIA2529 PIA18M OCUP OCUP1014 OCUP1517 OCUP1824 OCUP2529 OCUP18M DES DES1014 DES1517
                     DES1824 DES2529 DES18M PEA PEA1014 PEA1517 PEA1824 PEA2529 PEA18M)
           SUM=PIA PIA1014 PIA1517 PIA1824 PIA2529 PIA18M OCUP OCUP1014 OCUP1517 OCUP1824 OCUP2529 OCUP18M DES DES1014 DES1517
               DES1824 DES2529 DES18M PEA PEA1014 PEA1517 PEA1824 PEA2529 PEA18M;
WEIGHT PESOPES;
BY SETORC;


PROC MEANS DATA=PES SUM NOPRINT;
WHERE OCUP18M=1;
VAR TRABCC TRABSC TRABPUB CPR EMP FORMAL FUNDIN MEDIN
    SUPER AGRO EXTR TRANSF SIUP CONSTR COM SERV
    REN0 REN1 REN2 REN3 REN5 LRTHEIL POPT POPREN;
OUTPUT OUT=SAI2(KEEP=SETORC TRABCC TRABSC TRABPUB CPR EMP FORMAL FUNDIN MEDIN
                     SUPER AGRO EXTR TRANSF SIUP CONSTR COM SERV
                     REN0 REN1 REN2 REN3 REN5 LRTHEIL POPT POPREN)
           SUM=TRABCC TRABSC TRABPUB CPR EMP FORMAL FUNDIN MEDIN
               SUPER AGRO EXTR TRANSF SIUP CONSTR COM SERV
               REN0 REN1 REN2 REN3 REN5 LRTHEIL POPT POPREN;
WEIGHT PESOPES;
BY SETORC;


PROC MEANS DATA=PES MEAN NOPRINT;
WHERE OCUP18M=1;
VAR RENOCUP RTHEIL;
OUTPUT OUT=SAI3(KEEP=SETORC RENOCUP RTHEIL)
       MEAN=RENOCUP RTHEIL;
WEIGHT PESOPES;
BY SETORC;


DATA OUT.TRAB00;
MERGE SAI1 SAI2 SAI3;
BY SETORC;


RUN;
