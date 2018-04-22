; ModuleID = 'Fi'

@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@0 = global [1 x i8] zeroinitializer
@tmp = private unnamed_addr constant [3 x i8] c"hi\00"
@tmp.2 = private unnamed_addr constant [4 x i8] c"bye\00"
@fmt.3 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.4 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp.5 = private unnamed_addr constant [11 x i8] c"new string\00"

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 2))
  %tmpArr = bitcast i8* %malloccall to i8**
  %otherTmp = getelementptr i8*, i8** %tmpArr, i32 0
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp
  %otherTmp1 = getelementptr i8*, i8** %tmpArr, i32 1
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp1
  %malloccall2 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8** }* getelementptr ({ i32, i8** }, { i32, i8** }* null, i32 1) to i32))
  %arr_literal = bitcast i8* %malloccall2 to { i32, i8** }*
  %fs = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 0
  %ss = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 1
  store i32 2, i32* %fs
  store i8** %tmpArr, i8*** %ss
  %al = load { i32, i8** }, { i32, i8** }* %arr_literal
  %strz = load { i32, i8** }, { i32, i8** }* %arr_literal
  %tmpArr3 = extractvalue { i32, i8** } %strz, 1
  %otherTmp4 = getelementptr i8*, i8** %tmpArr3, i32 0
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @tmp, i32 0, i32 0), i8** %otherTmp4
  %tmpArr5 = extractvalue { i32, i8** } %strz, 1
  %otherTmp6 = getelementptr i8*, i8** %tmpArr5, i32 1
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @tmp.2, i32 0, i32 0), i8** %otherTmp6
  %strz7 = load { i32, i8** }, { i32, i8** }* %arr_literal
  %changeString_result = call { i32, i8** } @changeString({ i32, i8** } %strz7)
  %strz8 = load { i32, i8** }, { i32, i8** }* %arr_literal
  %eptr = extractvalue { i32, i8** } %strz8, 1
  %ev = getelementptr i8*, i8** %eptr, i32 0
  %val = load i8*, i8** %ev
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* %val)
  ret i32 0
}

define { i32, i8** } @changeString({ i32, i8** } %x) {
entry:
  %x1 = alloca { i32, i8** }
  store { i32, i8** } %x, { i32, i8** }* %x1
  %x2 = load { i32, i8** }, { i32, i8** }* %x1
  %eptr = extractvalue { i32, i8** } %x2, 1
  %ev = getelementptr i8*, i8** %eptr, i32 0
  store i8* getelementptr inbounds ([11 x i8], [11 x i8]* @tmp.5, i32 0, i32 0), i8** %ev
  %x3 = load { i32, i8** }, { i32, i8** }* %x1
  ret { i32, i8** } %x3
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
