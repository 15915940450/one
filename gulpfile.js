var gulp=require('gulp');

var traditionalized=require('./fplugin/traditionalized.js');

gulp.task('traditionalized',function(){
  gulp.src('./index.html')
      .pipe(traditionalized())
      .pipe(gulp.dest('dist/zh-HK/'));
});


gulp.task('default',['traditionalized'],function(){
  console.log('okay.');
});
