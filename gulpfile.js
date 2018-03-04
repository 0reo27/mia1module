// Requires
var
    gulp = require('gulp'),
    archiver = require('gulp-archiver');


gulp.task('default', function () {
    return gulp.src([
            './**/*',
            '!./{node_modules,node_modules/**,releases,releases/**,.gitattributes,package*.json,gulpfile.js}'
        ])
        .pipe(archiver('mia1module.zip'))
        .pipe(gulp.dest('releases'));
});