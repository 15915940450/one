var gulp=require('gulp');
var htmlmin=require('gulp-htmlmin');
var exReplace=require('gulp-ex-replace');
var concatCss=require('gulp-concat-css');
var cleanCss=require('gulp-clean-css');
var concat=require('gulp-concat');
var uglify=require('gulp-uglify');
var imagemin=require('gulp-imagemin');


gulp.task('html',function(){
  return gulp.src('index.html')
    .pipe(exReplace(/<link rel="stylesheet".+?\/>/g,''))
    .pipe(exReplace(/<script src="js\/.+?"><\/script>/g,''))
    .pipe(exReplace(/<\/head>/g,'<link rel="stylesheet" href="project.css" /></head>'))
    .pipe(exReplace(/<\/body>/g,'<script src="project.js"></script></body>'))
    .pipe(htmlmin({collapseWhitespace:true}))
    .pipe(gulp.dest('dist/'));
});

gulp.task('css',function(){
  return gulp.src('css/*.css')
    .pipe(concatCss("project.css"))
    .pipe(cleanCss({compatibility:'ie8'}))
    .pipe(gulp.dest('dist/'));
});

gulp.task('js',function(){
  return gulp.src(['js/modernizr.js','js/clipboard.min.js','js/main.js'])
    .pipe(concat('project.js'))
    .pipe(uglify())
    .pipe(gulp.dest('dist/'));
});

gulp.task('img',function(){
  return gulp.src('img/*')
    .pipe(imagemin())
    .pipe(gulp.dest('./dist/img/'));
});



//============default
gulp.task('default',['html','css','js','img'],function(){
  //将你的默认的任务代码放在这
  console.log("--------------okay----------------------");
});
