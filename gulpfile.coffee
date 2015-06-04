require('coffee-script/register')
gulp = require('gulp')
$ = require('gulp-load-plugins')()
browserSync = require('browser-sync')

gulp.task 'html', ->
    gulp.src(['index.html'])
        .pipe(browserSync.reload({stream: true}))

gulp.task 'stylus', ->
    gulp.src(['assets/**/*.styl', '!assets/**/_*.styl'])
        .pipe($.plumber())
        .pipe($.sourcemaps.init())
        .pipe($.stylus())
        # .pipe($.autoprefixer('last 3 version'))
        # .pipe($.sourcemaps.write('.'))
        .pipe(gulp.dest('assets'))
        .pipe(browserSync.reload({stream: true}))

gulp.task 'server', ->
    browserSync({
        server: {
            baseDir: '.'
        }
    })

gulp.task 'watch', ->
    gulp.watch('assets/**/*.styl', ['stylus'])
    gulp.watch(['index.html', 'assets/img/*'], ['html'])

gulp.task 'default', ['server', 'stylus', 'watch']