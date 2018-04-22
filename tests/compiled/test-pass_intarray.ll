; ModuleID = 'Fi'

%baby = type <{ { i32, i32* } }>

@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp = private unnamed_addr constant [12 x i8] c"should be 3\00"
@fmt.2 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 6))
  %tmpArr = bitcast i8* %malloccall to i32*
  %otherTmp = getelementptr i32, i32* %tmpArr, i32 0
  store i32 0, i32* %otherTmp
  %otherTmp1 = getelementptr i32, i32* %tmpArr, i32 1
  store i32 0, i32* %otherTmp1
  %otherTmp2 = getelementptr i32, i32* %tmpArr, i32 2
  store i32 0, i32* %otherTmp2
  %otherTmp3 = getelementptr i32, i32* %tmpArr, i32 3
  store i32 0, i32* %otherTmp3
  %otherTmp4 = getelementptr i32, i32* %tmpArr, i32 4
  store i32 0, i32* %otherTmp4
  %otherTmp5 = getelementptr i32, i32* %tmpArr, i32 5
  store i32 0, i32* %otherTmp5
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %arr_literal = bitcast i8* %malloccall6 to { i32, i32* }*
  %fs = getelementptr inbounds { i32, i32* }, { i32, i32* }* %arr_literal, i32 0, i32 0
  %ss = getelementptr inbounds { i32, i32* }, { i32, i32* }* %arr_literal, i32 0, i32 1
  store i32 6, i32* %fs
  store i32* %tmpArr, i32** %ss
  %al = load { i32, i32* }, { i32, i32* }* %arr_literal
  %geffen = alloca %baby
  %malloccall7 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i32* getelementptr (i32, i32* null, i32 1) to i32), i32 6))
  %tmpArr8 = bitcast i8* %malloccall7 to i32*
  %otherTmp9 = getelementptr i32, i32* %tmpArr8, i32 0
  store i32 0, i32* %otherTmp9
  %otherTmp10 = getelementptr i32, i32* %tmpArr8, i32 1
  store i32 0, i32* %otherTmp10
  %otherTmp11 = getelementptr i32, i32* %tmpArr8, i32 2
  store i32 0, i32* %otherTmp11
  %otherTmp12 = getelementptr i32, i32* %tmpArr8, i32 3
  store i32 0, i32* %otherTmp12
  %otherTmp13 = getelementptr i32, i32* %tmpArr8, i32 4
  store i32 0, i32* %otherTmp13
  %otherTmp14 = getelementptr i32, i32* %tmpArr8, i32 5
  store i32 0, i32* %otherTmp14
  %malloccall15 = tail call i8* @malloc(i32 ptrtoint ({ i32, i32* }* getelementptr ({ i32, i32* }, { i32, i32* }* null, i32 1) to i32))
  %arr_literal16 = bitcast i8* %malloccall15 to { i32, i32* }*
  %fs17 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %arr_literal16, i32 0, i32 0
  %ss18 = getelementptr inbounds { i32, i32* }, { i32, i32* }* %arr_literal16, i32 0, i32 1
  store i32 6, i32* %fs17
  store i32* %tmpArr8, i32** %ss18
  %al19 = load { i32, i32* }, { i32, i32* }* %arr_literal16
  %tmp = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  store { i32, i32* } %al19, { i32, i32* }* %tmp
  %a = load { i32, i32* }, { i32, i32* }* %arr_literal
  %tmpArr20 = extractvalue { i32, i32* } %a, 1
  %otherTmp21 = getelementptr i32, i32* %tmpArr20, i32 0
  store i32 1, i32* %otherTmp21
  %tmpArr22 = extractvalue { i32, i32* } %a, 1
  %otherTmp23 = getelementptr i32, i32* %tmpArr22, i32 1
  store i32 2, i32* %otherTmp23
  %tmpArr24 = extractvalue { i32, i32* } %a, 1
  %otherTmp25 = getelementptr i32, i32* %tmpArr24, i32 2
  store i32 3, i32* %otherTmp25
  %tmpArr26 = extractvalue { i32, i32* } %a, 1
  %otherTmp27 = getelementptr i32, i32* %tmpArr26, i32 3
  store i32 4, i32* %otherTmp27
  %tmpArr28 = extractvalue { i32, i32* } %a, 1
  %otherTmp29 = getelementptr i32, i32* %tmpArr28, i32 4
  store i32 5, i32* %otherTmp29
  %tmpArr30 = extractvalue { i32, i32* } %a, 1
  %otherTmp31 = getelementptr i32, i32* %tmpArr30, i32 5
  store i32 6, i32* %otherTmp31
  %a32 = load { i32, i32* }, { i32, i32* }* %arr_literal
  %addOne_result = call { i32, i32* } @addOne({ i32, i32* } %a32)
  %a33 = load { i32, i32* }, { i32, i32* }* %arr_literal
  %eptr = extractvalue { i32, i32* } %a33, 1
  %ev = getelementptr i32, i32* %eptr, i32 0
  %val = load i32, i32* %ev
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt, i32 0, i32 0), i32 %val)
  %geffen34 = load %baby, %baby* %geffen
  %tmp35 = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  %tmp36 = load { i32, i32* }, { i32, i32* }* %tmp35
  %tmpArr37 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp38 = getelementptr i32, i32* %tmpArr37, i32 0
  store i32 2, i32* %otherTmp38
  %tmpArr39 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp40 = getelementptr i32, i32* %tmpArr39, i32 1
  store i32 3, i32* %otherTmp40
  %tmpArr41 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp42 = getelementptr i32, i32* %tmpArr41, i32 2
  store i32 4, i32* %otherTmp42
  %tmpArr43 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp44 = getelementptr i32, i32* %tmpArr43, i32 3
  store i32 5, i32* %otherTmp44
  %tmpArr45 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp46 = getelementptr i32, i32* %tmpArr45, i32 4
  store i32 6, i32* %otherTmp46
  %tmpArr47 = extractvalue { i32, i32* } %tmp36, 1
  %otherTmp48 = getelementptr i32, i32* %tmpArr47, i32 5
  store i32 7, i32* %otherTmp48
  %geffen49 = load %baby, %baby* %geffen
  %tmp50 = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  %tmp51 = load { i32, i32* }, { i32, i32* }* %tmp50
  %addOne_result52 = call { i32, i32* } @addOne({ i32, i32* } %tmp51)
  %printf53 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @tmp, i32 0, i32 0))
  %geffen54 = load %baby, %baby* %geffen
  %tmp55 = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  %tmp56 = load { i32, i32* }, { i32, i32* }* %tmp55
  %eptr57 = extractvalue { i32, i32* } %tmp56, 1
  %ev58 = getelementptr i32, i32* %eptr57, i32 0
  %val59 = load i32, i32* %ev58
  %printf60 = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt, i32 0, i32 0), i32 %val59)
  ret i32 0
}

define { i32, i32* } @addOne({ i32, i32* } %x) {
entry:
  %x1 = alloca { i32, i32* }
  store { i32, i32* } %x, { i32, i32* }* %x1
  %x2 = load { i32, i32* }, { i32, i32* }* %x1
  %eptr = extractvalue { i32, i32* } %x2, 1
  %ev = getelementptr i32, i32* %eptr, i32 0
  %val = load i32, i32* %ev
  %tmp = add i32 %val, 1
  %x3 = load { i32, i32* }, { i32, i32* }* %x1
  %eptr4 = extractvalue { i32, i32* } %x3, 1
  %ev5 = getelementptr i32, i32* %eptr4, i32 0
  store i32 %tmp, i32* %ev5
  %x6 = load { i32, i32* }, { i32, i32* }* %x1
  ret { i32, i32* } %x6
}

declare i32 @printf(i8*, ...)

declare i8* @readFile(i8*)

declare i32 @writeFile(i8*, i8*)

declare i8* @concat(i8*, i8*)

declare i32 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

declare i8* @getLow(i8*)

declare i8* @getUp(i8*)

declare noalias i8* @malloc(i32)
