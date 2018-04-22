; ModuleID = 'Fi'

%boss = type <{ i32, i1, i8* }>

@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"

define i32 @main() {
entry:
  %Richard = alloca %boss
  %tmp = getelementptr inbounds %boss, %boss* %Richard, i32 0, i32 1
  store i1 false, i1* %tmp
  %Richard1 = load %boss, %boss* %Richard
  %tmp2 = getelementptr inbounds %boss, %boss* %Richard, i32 0, i32 1
  %tmp3 = load i1, i1* %tmp2
  %tmp4 = icmp eq i1 %tmp3, false
  br i1 %tmp4, label %then, label %else

merge:                                            ; preds = %else, %then
  ret i32 0

then:                                             ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([3 x i8], [3 x i8]* @fmt, i32 0, i32 0), i32 1)
  br label %merge

else:                                             ; preds = %entry
  br label %merge
}

declare i32 @printf(i8*, ...)

declare i8* @readFile(i8*)

declare i32 @writeFile(i8*, i8*)

declare i8* @concat(i8*, i8*)

declare i32 @strlen(i8*)

declare i32 @strcmp(i8*, i8*)

declare i8* @getLow(i8*)

declare i8* @getUp(i8*)
