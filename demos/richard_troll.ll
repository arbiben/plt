; ModuleID = 'Fi'

%file = type <{ i8*, i8*, i1 }>

@to_concat = global { i32, i8** } zeroinitializer
@0 = global [1 x i8] zeroinitializer
@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt.2 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@1 = global [1 x i8] zeroinitializer
@tmp = private unnamed_addr constant [10 x i8] c"trollin! \00"
@tmp.3 = private unnamed_addr constant [24 x i8] c"demos/about_Richard.txt\00"
@fmt.4 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.5 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt.6 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@fmt.7 = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.8 = private unnamed_addr constant [3 x i8] c"%s\00"
@fmt.9 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp.10 = private unnamed_addr constant [2 x i8] c";\00"
@tmp.11 = private unnamed_addr constant [2 x i8] c";\00"
@tmp.12 = private unnamed_addr constant [24 x i8] c"demos/troll_richard.txt\00"
@tmp.13 = private unnamed_addr constant [2 x i8] c";\00"

define i32 @main() {
entry:
  %malloccall = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 10))
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
  %otherTmp6 = getelementptr i8*, i8** %tmpArr, i32 6
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp6
  %otherTmp7 = getelementptr i8*, i8** %tmpArr, i32 7
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp7
  %otherTmp8 = getelementptr i8*, i8** %tmpArr, i32 8
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp8
  %otherTmp9 = getelementptr i8*, i8** %tmpArr, i32 9
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @0, i32 0, i32 0), i8** %otherTmp9
  %malloccall10 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8** }* getelementptr ({ i32, i8** }, { i32, i8** }* null, i32 1) to i32))
  %arr_literal = bitcast i8* %malloccall10 to { i32, i8** }*
  %fs = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 0
  %ss = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal, i32 0, i32 1
  store i32 10, i32* %fs
  store i8** %tmpArr, i8*** %ss
  %al = load { i32, i8** }, { i32, i8** }* %arr_literal
  store { i32, i8** } %al, { i32, i8** }* @to_concat
  %malloccall11 = tail call i8* @malloc(i32 mul (i32 ptrtoint (i1** getelementptr (i1*, i1** null, i32 1) to i32), i32 10))
  %tmpArr12 = bitcast i8* %malloccall11 to i8**
  %otherTmp13 = getelementptr i8*, i8** %tmpArr12, i32 0
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp13
  %otherTmp14 = getelementptr i8*, i8** %tmpArr12, i32 1
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp14
  %otherTmp15 = getelementptr i8*, i8** %tmpArr12, i32 2
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp15
  %otherTmp16 = getelementptr i8*, i8** %tmpArr12, i32 3
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp16
  %otherTmp17 = getelementptr i8*, i8** %tmpArr12, i32 4
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp17
  %otherTmp18 = getelementptr i8*, i8** %tmpArr12, i32 5
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp18
  %otherTmp19 = getelementptr i8*, i8** %tmpArr12, i32 6
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp19
  %otherTmp20 = getelementptr i8*, i8** %tmpArr12, i32 7
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp20
  %otherTmp21 = getelementptr i8*, i8** %tmpArr12, i32 8
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp21
  %otherTmp22 = getelementptr i8*, i8** %tmpArr12, i32 9
  store i8* getelementptr inbounds ([1 x i8], [1 x i8]* @1, i32 0, i32 0), i8** %otherTmp22
  %malloccall23 = tail call i8* @malloc(i32 ptrtoint ({ i32, i8** }* getelementptr ({ i32, i8** }, { i32, i8** }* null, i32 1) to i32))
  %arr_literal24 = bitcast i8* %malloccall23 to { i32, i8** }*
  %fs25 = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal24, i32 0, i32 0
  %ss26 = getelementptr inbounds { i32, i8** }, { i32, i8** }* %arr_literal24, i32 0, i32 1
  store i32 10, i32* %fs25
  store i8** %tmpArr12, i8*** %ss26
  %al27 = load { i32, i8** }, { i32, i8** }* %arr_literal24
  %original = alloca %file
  %i = alloca i32
  store i32 0, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i30 = load i32, i32* %i
  %tmp31 = icmp slt i32 %i30, 10
  br i1 %tmp31, label %while_body, label %merge

while_body:                                       ; preds = %while
  %i28 = load i32, i32* %i
  %tmp_concating = load { i32, i8** }, { i32, i8** }* %arr_literal24
  %eptr = extractvalue { i32, i8** } %tmp_concating, 1
  %ev = getelementptr i8*, i8** %eptr, i32 %i28
  store i8* getelementptr inbounds ([10 x i8], [10 x i8]* @tmp, i32 0, i32 0), i8** %ev
  %i29 = load i32, i32* %i
  %tmp = add i32 %i29, 1
  store i32 %tmp, i32* %i
  br label %while

merge:                                            ; preds = %while
  %tmp32 = getelementptr inbounds %file, %file* %original, i32 0, i32 2
  store i1 true, i1* %tmp32
  %tmp33 = getelementptr inbounds %file, %file* %original, i32 0, i32 0
  store i8* getelementptr inbounds ([24 x i8], [24 x i8]* @tmp.3, i32 0, i32 0), i8** %tmp33
  %tmp34 = getelementptr inbounds %file, %file* %original, i32 0, i32 1
  %original35 = load %file, %file* %original
  %tmp36 = getelementptr inbounds %file, %file* %original, i32 0, i32 0
  %tmp37 = load i8*, i8** %tmp36
  %readFile = call i8* @readFile(i8* %tmp37)
  store i8* %readFile, i8** %tmp34
  %tmp_concating38 = load { i32, i8** }, { i32, i8** }* %arr_literal24
  %original39 = load %file, %file* %original
  %tmp40 = getelementptr inbounds %file, %file* %original, i32 0, i32 1
  %tmp41 = load i8*, i8** %tmp40
  %split_on_semi_result = call { i32, i8** } @split_on_semi(i8* %tmp41, { i32, i8** } %tmp_concating38)
  store { i32, i8** } %split_on_semi_result, { i32, i8** }* @to_concat
  %tmp42 = getelementptr inbounds %file, %file* %original, i32 0, i32 1
  %merge_concat_strs_result = call i8* @merge_concat_strs()
  store i8* %merge_concat_strs_result, i8** %tmp42
  %original43 = load %file, %file* %original
  %tmp44 = getelementptr inbounds %file, %file* %original, i32 0, i32 2
  %tmp45 = load i1, i1* %tmp44
  %tmp46 = icmp eq i1 %tmp45, true
  br i1 %tmp46, label %then, label %else

merge47:                                          ; preds = %else, %then
  %original54 = load %file, %file* %original
  %tmp55 = getelementptr inbounds %file, %file* %original, i32 0, i32 1
  %tmp56 = load i8*, i8** %tmp55
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt.1, i32 0, i32 0), i8* %tmp56)
  ret i32 0

then:                                             ; preds = %merge
  %original48 = load %file, %file* %original
  %tmp49 = getelementptr inbounds %file, %file* %original, i32 0, i32 0
  %tmp50 = load i8*, i8** %tmp49
  %original51 = load %file, %file* %original
  %tmp52 = getelementptr inbounds %file, %file* %original, i32 0, i32 1
  %tmp53 = load i8*, i8** %tmp52
  %writeFile = call i32 @writeFile(i8* %tmp50, i8* %tmp53)
  br label %merge47

else:                                             ; preds = %merge
  br label %merge47
}

define i8* @merge_concat_strs() {
entry:
  %i = alloca i32
  %tmp = alloca i8*
  %to_concat = load { i32, i8** }, { i32, i8** }* @to_concat
  %eptr = extractvalue { i32, i8** } %to_concat, 1
  %ev = getelementptr i8*, i8** %eptr, i32 0
  %val = load i8*, i8** %ev
  store i8* %val, i8** %tmp
  store i32 1, i32* %i
  br label %while

while:                                            ; preds = %while_body, %entry
  %i9 = load i32, i32* %i
  %tmp10 = icmp slt i32 %i9, 5
  br i1 %tmp10, label %while_body, label %merge

while_body:                                       ; preds = %while
  %tmp1 = load i8*, i8** %tmp
  %i2 = load i32, i32* %i
  %to_concat3 = load { i32, i8** }, { i32, i8** }* @to_concat
  %eptr4 = extractvalue { i32, i8** } %to_concat3, 1
  %ev5 = getelementptr i8*, i8** %eptr4, i32 %i2
  %val6 = load i8*, i8** %ev5
  %concat = call i8* @concat(i8* %tmp1, i8* %val6)
  store i8* %concat, i8** %tmp
  %i7 = load i32, i32* %i
  %tmp8 = add i32 %i7, 1
  store i32 %tmp8, i32* %i
  br label %while

merge:                                            ; preds = %while
  %tmp11 = load i8*, i8** %tmp
  ret i8* %tmp11
}

define { i32, i8** } @split_on_semi(i8* %og, { i32, i8** } %buffers) {
entry:
  %og1 = alloca i8*
  store i8* %og, i8** %og1
  %buffers2 = alloca { i32, i8** }
  store { i32, i8** } %buffers, { i32, i8** }* %buffers2
  %og3 = load i8*, i8** %og1
  %split = call i8* @split(i8* %og3, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @tmp.10, i32 0, i32 0), i32 0)
  %buffers4 = load { i32, i8** }, { i32, i8** }* %buffers2
  %eptr = extractvalue { i32, i8** } %buffers4, 1
  %ev = getelementptr i8*, i8** %eptr, i32 1
  store i8* %split, i8** %ev
  %og5 = load i8*, i8** %og1
  %split6 = call i8* @split(i8* %og5, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @tmp.11, i32 0, i32 0), i32 1)
  %buffers7 = load { i32, i8** }, { i32, i8** }* %buffers2
  %eptr8 = extractvalue { i32, i8** } %buffers7, 1
  %ev9 = getelementptr i8*, i8** %eptr8, i32 2
  store i8* %split6, i8** %ev9
  %readFile = call i8* @readFile(i8* getelementptr inbounds ([24 x i8], [24 x i8]* @tmp.12, i32 0, i32 0))
  %buffers10 = load { i32, i8** }, { i32, i8** }* %buffers2
  %eptr11 = extractvalue { i32, i8** } %buffers10, 1
  %ev12 = getelementptr i8*, i8** %eptr11, i32 3
  store i8* %readFile, i8** %ev12
  %og13 = load i8*, i8** %og1
  %split14 = call i8* @split(i8* %og13, i8* getelementptr inbounds ([2 x i8], [2 x i8]* @tmp.13, i32 0, i32 0), i32 2)
  %buffers15 = load { i32, i8** }, { i32, i8** }* %buffers2
  %eptr16 = extractvalue { i32, i8** } %buffers15, 1
  %ev17 = getelementptr i8*, i8** %eptr16, i32 4
  store i8* %split14, i8** %ev17
  %buffers18 = load { i32, i8** }, { i32, i8** }* %buffers2
  ret { i32, i8** } %buffers18
}

declare noalias i8* @malloc(i32)

declare i32 @printf(i8*, ...)

declare i8* @readFile(i8*)

declare i32 @writeFile(i8*, i8*)

declare i8* @concat(i8*, i8*)

declare i8* @split(i8*, i8*, i32)

declare i32 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

declare i8* @getLow(i8*)

declare i8* @getUp(i8*)
