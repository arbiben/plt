; ModuleID = 'Fi'

%baby = type <{ i32, i8* }>

@x = global i32 0
@fmt = private unnamed_addr constant [3 x i8] c"%d\00"
@fmt.1 = private unnamed_addr constant [4 x i8] c"%s\0A\00"
@tmp = private unnamed_addr constant [6 x i8] c"world\00"
@tmp.2 = private unnamed_addr constant [12 x i8] c"hello world\00"

define i32 @main() {
entry:
  %p = alloca i8*
  %s = alloca i32
  %geffen = alloca %baby
  store i32 1, i32* %s
  store i8* getelementptr inbounds ([6 x i8], [6 x i8]* @tmp, i32 0, i32 0), i8** %p
  store i32 1, i32* @x
  %tmp = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  store i32 5, i32* %tmp
  %geffen1 = load %baby, %baby* %geffen
  %tmp2 = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  %tmp3 = load i32, i32* %tmp2
  store i32 %tmp3, i32* @x
  %x = load i32, i32* @x
  %geffen4 = load %baby, %baby* %geffen
  %tmp5 = getelementptr inbounds %baby, %baby* %geffen, i32 0, i32 0
  %tmp6 = load i32, i32* %tmp5
  %tmp7 = icmp eq i32 %x, %tmp6
  br i1 %tmp7, label %then, label %else

merge:                                            ; preds = %else, %then
  ret i32 0

then:                                             ; preds = %entry
  %printf = call i32 (i8*, ...) @printf(i8* getelementptr inbounds ([4 x i8], [4 x i8]* @fmt.1, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @tmp.2, i32 0, i32 0))
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
