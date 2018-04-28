; ModuleID = 'Fi'

%file = type <{ i8*, i8*, i1 }>

@0 = global [1 x i8] zeroinitializer
@original = global i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0)
@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp = private unnamed_addr constant [15 x i8] c"demos/rick.txt\00"
@tmp.3 = private unnamed_addr constant [16 x i8] c"demos/clone.txt\00"
@tmp.4 = private unnamed_addr constant [19 x i8] c"demos/notclone.txt\00"
@tmp.5 = private unnamed_addr constant [20 x i8] c"demos/notclone2.txt\00"
@tmp.6 = private unnamed_addr constant [1 x i8] zeroinitializer
@tmp.7 = private unnamed_addr constant [36 x i8] c"checking clones for original file: \00"
@tmp.8 = private unnamed_addr constant [1 x i8] zeroinitializer
@tmp.9 = private unnamed_addr constant [1 x i8] zeroinitializer
@tmp.10 = private unnamed_addr constant [1 x i8] zeroinitializer
@tmp.11 = private unnamed_addr constant [1 x i8] zeroinitializer
@fmt.12 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.13 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt.14 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp.15 = private unnamed_addr constant [11 x i8] c"for file: \00"
@tmp.16 = private unnamed_addr constant [27 x i8] c"string length comparison: \00"
@tmp.17 = private unnamed_addr constant [28 x i8] c"they have the same length! \00"
@tmp.18 = private unnamed_addr constant [45 x i8] c"they don't have the same length. Not clones!\00"
@tmp.19 = private unnamed_addr constant [41 x i8] c"they are clones! here is their content: \00"
@tmp.20 = private unnamed_addr constant [45 x i8] c"their content differs. Can you spot the dif?\00"

define i32 @main() {
entry:
  %og = alloca %file
  %tocheck1 = alloca %file
  %tocheck2 = alloca %file
  %tocheck3 = alloca %file
  %tmp = alloca i8*
  %tmp1 = getelementptr inbounds %file, %file* %og, i32 0, i32 0
  store i8* getelementptr inbounds ([15 x i8], [15 x i8]* @tmp, i32 0, i32 0), i8** %tmp1
  %tmp2 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 0
  store i8* getelementptr inbounds ([16 x i8], [16 x i8]* @tmp.3, i32 0, i32 0), i8** %tmp2
  %tmp3 = getelementptr inbounds %file, %file* %tocheck2, i32 0, i32 0
  store i8* getelementptr inbounds ([19 x i8], [19 x i8]* @tmp.4, i32 0, i32 0), i8** %tmp3
  %tmp4 = getelementptr inbounds %file, %file* %tocheck3, i32 0, i32 0
  store i8* getelementptr inbounds ([20 x i8], [20 x i8]* @tmp.5, i32 0, i32 0), i8** %tmp4
  %tmp5 = getelementptr inbounds %file, %file* %og, i32 0, i32 1
  %og6 = load %file, %file* %og
  %tmp7 = getelementptr inbounds %file, %file* %og, i32 0, i32 0
  %tmp8 = load i8*, i8** %tmp7
  %readFile = call i8* @readFile(i8* %tmp8)
  store i8* %readFile, i8** %tmp5
  %og9 = load %file, %file* %og
  %tmp10 = getelementptr inbounds %file, %file* %og, i32 0, i32 1
  %tmp11 = load i8*, i8** %tmp10
  store i8* %tmp11, i8** @original
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @tmp.6, i32 0, i32 0))
  %og12 = load %file, %file* %og
  %tmp13 = getelementptr inbounds %file, %file* %og, i32 0, i32 0
  %tmp14 = load i8*, i8** %tmp13
  %concat = call i8* @concat(i8* getelementptr inbounds ([36 x i8], [36 x i8]* @tmp.7, i32 0, i32 0), i8* %tmp14)
  store i8* %concat, i8** %tmp
  %tmp15 = load i8*, i8** %tmp
  %printf16 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* %tmp15)
  %printf17 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @tmp.8, i32 0, i32 0))
  %tocheck118 = load %file, %file* %tocheck1
  %check_clone_result = call i1 @check_clone(%file %tocheck118)
  %printf19 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @tmp.9, i32 0, i32 0))
  %tocheck220 = load %file, %file* %tocheck2
  %check_clone_result21 = call i1 @check_clone(%file %tocheck220)
  %printf22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @tmp.10, i32 0, i32 0))
  %tocheck323 = load %file, %file* %tocheck3
  %check_clone_result24 = call i1 @check_clone(%file %tocheck323)
  %printf25 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.2, i32 0, i32 0), i8* getelementptr inbounds ([1 x i8], [1 x i8]* @tmp.11, i32 0, i32 0))
  ret i32 0
}

define i1 @check_clone(%file %tocheck) {
entry:
  %tocheck1 = alloca %file
  store %file %tocheck, %file* %tocheck1
  %tmp = alloca i8*
  %tmp2 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 1
  %tocheck3 = load %file, %file* %tocheck1
  %tmp4 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 0
  %tmp5 = load i8*, i8** %tmp4
  %readFile = call i8* @readFile(i8* %tmp5)
  store i8* %readFile, i8** %tmp2
  %tocheck6 = load %file, %file* %tocheck1
  %tmp7 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 0
  %tmp8 = load i8*, i8** %tmp7
  %concat = call i8* @concat(i8* getelementptr inbounds ([11 x i8], [11 x i8]* @tmp.15, i32 0, i32 0), i8* %tmp8)
  store i8* %concat, i8** %tmp
  %tmp9 = load i8*, i8** %tmp
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %tmp9)
  store i8* getelementptr inbounds ([27 x i8], [27 x i8]* @tmp.16, i32 0, i32 0), i8** %tmp
  %tocheck10 = load %file, %file* %tocheck1
  %tmp11 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 1
  %tmp12 = load i8*, i8** %tmp11
  %strlen = call i32 @strlen(i8* %tmp12)
  %original = load i8*, i8** @original
  %strlen13 = call i32 @strlen(i8* %original)
  %tmp14 = icmp eq i32 %strlen, %strlen13
  br i1 %tmp14, label %then, label %else

merge:                                            ; preds = %then
  %original23 = load i8*, i8** @original
  %getLow = call i8* @getLow(i8* %original23)
  %tocheck24 = load %file, %file* %tocheck1
  %tmp25 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 1
  %tmp26 = load i8*, i8** %tmp25
  %getLow27 = call i8* @getLow(i8* %tmp26)
  %strcmp = call i32 @strcmp(i8* %getLow, i8* %getLow27)
  %tmp28 = icmp eq i32 %strcmp, 0
  br i1 %tmp28, label %then30, label %else34

then:                                             ; preds = %entry
  %tmp15 = load i8*, i8** %tmp
  %concat16 = call i8* @concat(i8* %tmp15, i8* getelementptr inbounds ([28 x i8], [28 x i8]* @tmp.17, i32 0, i32 0))
  store i8* %concat16, i8** %tmp
  %tmp17 = load i8*, i8** %tmp
  %printf18 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %tmp17)
  br label %merge

else:                                             ; preds = %entry
  %tmp19 = load i8*, i8** %tmp
  %concat20 = call i8* @concat(i8* %tmp19, i8* getelementptr inbounds ([45 x i8], [45 x i8]* @tmp.18, i32 0, i32 0))
  store i8* %concat20, i8** %tmp
  %tmp21 = load i8*, i8** %tmp
  %printf22 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %tmp21)
  ret i1 false

merge29:                                          ; No predecessors!
  ret i1 false

then30:                                           ; preds = %merge
  %printf31 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* getelementptr inbounds ([41 x i8], [41 x i8]* @tmp.19, i32 0, i32 0))
  %original32 = load i8*, i8** @original
  %printf33 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %original32)
  ret i1 true

else34:                                           ; preds = %merge
  %printf35 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* getelementptr inbounds ([45 x i8], [45 x i8]* @tmp.20, i32 0, i32 0))
  %original36 = load i8*, i8** @original
  %printf37 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %original36)
  %tocheck38 = load %file, %file* %tocheck1
  %tmp39 = getelementptr inbounds %file, %file* %tocheck1, i32 0, i32 1
  %tmp40 = load i8*, i8** %tmp39
  %printf41 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.14, i32 0, i32 0), i8* %tmp40)
  ret i1 false
}

declare i32 @printf(i8*, ...)

declare i8* @readFile(i8*)

declare i32 @writeFile(i8*, i8*)

declare i8* @concat(i8*, i8*)

declare i8* @split(i8*, i8*, i32)

declare i32 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

declare i8* @getLow(i8*)

declare i8* @getUp(i8*)
