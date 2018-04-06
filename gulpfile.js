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
            '!./{ADB-Push-Latest.bat}',
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
            opt.basename = opt.basename.replace(/IBMPlexSans/g, 'Roboto');
            opt.basename = opt.basename.replace(/FiraSans/g, 'Roboto');
            opt.basename = opt.basename.replace(/SFCompactDisplay/g, 'RobotoCondensed');
            opt.basename = opt.basename.replace(/SF-Pro-Display/g, 'Roboto');
            opt.basename = opt.basename.replace(/SFProDisplay/g, 'Roboto');
        }))
        .pipe(rename(function (opt) {
            // Replace function needs to be edited based on font naming convention
            opt.extname = opt.extname.replace(/\.otf/g, '.ttf');
            return opt;
        }))
        .pipe(gulp.dest('system/fonts'))
});