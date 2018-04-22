; ModuleID = 'Fi'

@0 = global [1 x i8] zeroinitializer
@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@1 = global [1 x i8] zeroinitializer
@tmp = private unnamed_addr constant [4 x i8] c"you\00"
@tmp.2 = private unnamed_addr constant [4 x i8] c"are\00"
@tmp.3 = private unnamed_addr constant [3 x i8] c"an\00"
@tmp.4 = private unnamed_addr constant [6 x i8] c"array\00"
@tmp.5 = private unnamed_addr constant [5 x i8] c"some\00"
@tmp.6 = private unnamed_addr constant [8 x i8] c"strings\00"
@tmp.7 = private unnamed_addr constant [5 x i8] c"here\00"

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 6))
  %tmpArr = bitcast i8* %malloccall to i8**
  %otherTmp = getelementptr i8*, i8** %tmpArr, i32 0
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp
  %otherTmp1 = getelementptr i8*, i8** %tmpArr, i32 1
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp1
  %otherTmp2 = getelementptr i8*, i8** %tmpArr, i32 2
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp2
  %otherTmp3 = getelementptr i8*, i8** %tmpArr, i32 3
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp3
  %otherTmp4 = getelementptr i8*, i8** %tmpArr, i32 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp4
  %otherTmp5 = getelementptr i8*, i8** %tmpArr, i32 5
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp5
  %malloccall6 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8** }* getelementptr ({ i32, i8** }, { i32, i8** }* null, i32 1) to i32))
  %arr_literal = bitcast i8* %malloccall6 to { i32, i8** }*
  %fs = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 0
  %ss = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 1
  store i32 6, i32* %fs
  store i8** %tmpArr, i8*** %ss
  %al = load { i32, i8** }, { i32, i8** }* %arr_literal
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
  %malloccall20 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 3))
  %tmpArr21 = bitcast i8* %malloccall20 to i8**
  %otherTmp22 = getelementptr i8*, i8** %tmpArr21, i32 0
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp22
  %otherTmp23 = getelementptr i8*, i8** %tmpArr21, i32 1
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp23
  %otherTmp24 = getelementptr i8*, i8** %tmpArr21, i32 2
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp24
  %malloccall25 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8** }* getelementptr ({ i32, i8** }, { i32, i8** }* null, i32 1) to i32))
  %arr_literal26 = bitcast i8* %malloccall25 to { i32, i8** }*
  %fs27 = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal26, i32 0, i32 0
  %ss28 = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal26, i32 0, i32 1
  store i32 3, i32* %fs27
  store i8** %tmpArr21, i8*** %ss28
  %al29 = load { i32, i8** }, { i32, i8** }* %arr_literal26
  %a = load { i32, i32* }, { i32, i32* }* %arr_literal16
  %tmpArr30 = extractvalue { i32, i32* } %a, 1
  %otherTmp31 = getelementptr i32, i32* %tmpArr30, i32 0
  store i32 2, i32* %otherTmp31
  %tmpArr32 = extractvalue { i32, i32* } %a, 1
  %otherTmp33 = getelementptr i32, i32* %tmpArr32, i32 1
  store i32 3, i32* %otherTmp33
  %tmpArr34 = extractvalue { i32, i32* } %a, 1
  %otherTmp35 = getelementptr i32, i32* %tmpArr34, i32 2
  store i32 4, i32* %otherTmp35
  %tmpArr36 = extractvalue { i32, i32* } %a, 1
  %otherTmp37 = getelementptr i32, i32* %tmpArr36, i32 3
  store i32 5, i32* %otherTmp37
  %tmpArr38 = extractvalue { i32, i32* } %a, 1
  %otherTmp39 = getelementptr i32, i32* %tmpArr38, i32 4
  store i32 6, i32* %otherTmp39
  %b = load { i32, i8** }, { i32, i8** }* %arr_literal
  %tmpArr40 = extractvalue { i32, i8** } %b, 1
  %otherTmp41 = getelementptr i8*, i8** %tmpArr40, i32 0
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @tmp, i32 0, i32 0), i8** %otherTmp41
  %tmpArr42 = extractvalue { i32, i8** } %b, 1
  %otherTmp43 = getelementptr i8*, i8** %tmpArr42, i32 1
  store i8* getelementptr inbounds ([4 x i8], [4 x i8]* @tmp.2, i32 0, i32 0), i8** %otherTmp43
  %tmpArr44 = extractvalue { i32, i8** } %b, 1
  %otherTmp45 = getelementptr i8*, i8** %tmpArr44, i32 2
  store i8* getelementptr inbounds ([3 x i8], [3 x i8]* @tmp.3, i32 0, i32 0), i8** %otherTmp45
  %tmpArr46 = extractvalue { i32, i8** } %b, 1
  %otherTmp47 = getelementptr i8*, i8** %tmpArr46, i32 3
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp.4, i32 0, i32 0), i8** %otherTmp47
  %c = load { i32, i8** }, { i32, i8** }* %arr_literal26
  %tmpArr48 = extractvalue { i32, i8** } %c, 1
  %otherTmp49 = getelementptr i8*, i8** %tmpArr48, i32 0
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @tmp.5, i32 0, i32 0), i8** %otherTmp49
  %tmpArr50 = extractvalue { i32, i8** } %c, 1
  %otherTmp51 = getelementptr i8*, i8** %tmpArr50, i32 1
  store i8* getelementptr inbounds ([8 x i8], [8 x i8]* @tmp.6, i32 0, i32 0), i8** %otherTmp51
  %tmpArr52 = extractvalue { i32, i8** } %c, 1
  %otherTmp53 = getelementptr i8*, i8** %tmpArr52, i32 2
  store i8* getelementptr inbounds ([5 x i8], [5 x i8]* @tmp.7, i32 0, i32 0), i8** %otherTmp53
  ret i32 0
}

declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare i8* @readFile(i8*)

declare i32 @writeFile(i8*, i8*)

declare i8* @concat(i8*, i8*)

declare i32 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

declare i8* @getLow(i8*)

declare i8* @getUp(i8*)
