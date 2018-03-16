// Requires
const
    gulp = require('gulp'),
    archiver = require('gulp-archiver'),
    rename = require("gulp-rename"),
    filter = require('gulp-filter');

// Create a release
gulp.task('default', function () {
    return gulp.src([
            './**/*',
            '!./{node_modules,node_modules/**,releases,releases/**,.gitattributes,package*.json,gulpfile.js}',
            '!./{fontBase,fontBase/**}'
        ])
        .pipe(archiver('mia1module.zip'))
        .pipe(gulp.dest('releases'));
});

// Rename Font Files
gulp.task('fontRename', function () {
    return gulp.src('fontBase/**/*')
        .pipe(rename(function (opt) {
            // Replace function needs to be edited based on font naming convention
            opt.basename = opt.basename.replace(/Inter-UI/g, 'Roboto');
            return opt;
        }))
        .pipe(gulp.dest('system/fonts'))
});