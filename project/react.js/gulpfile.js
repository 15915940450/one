var gulp=require('gulp');
var htmlmin=require('gulp-htmlmin');
var exReplace=require('gulp-ex-replace');
var uglify=require('gulp-uglify');
// babel
var babel = require("gulp-babel");


gulp.task('html',function(){
  return gulp.src('index.html')
    .pipe(exReplace(/<script src="js\/.+?"><\/script>/g,''))
    .pipe(exReplace(/<\/body>/g,'<script src="https://cdn.bootcss.com/react/15.6.1/react.min.js"></script><script src="https://cdn.bootcss.com/react/15.6.1/react-dom.min.js"></script><script src="app.js"></script></body>'))
    .pipe(htmlmin({collapseWhitespace:true}))
    .pipe(gulp.dest('dist/'));
});

gulp.task("babel", function () {
  return gulp.src("js/app.js")
    .pipe(babel())
    .pipe(uglify())
    .pipe(gulp.dest("dist/"));
});



//============default
gulp.task('default',['html','babel'],function(){
  //将你的默认的任务代码放在这
  console.log("--------------okay----------------------");
});
