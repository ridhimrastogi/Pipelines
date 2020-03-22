const Random = require('random-js');
//const marqdown = require('./marqdown.js');
const fs = require('fs');
const path = require('path');
const stackTrace = require('stacktrace-parser');


var iterations;

if(process.argv.length >= 3)
{
    iterations = process.argv[2];
}

class fuzzer {
    static random() {
        return fuzzer._random || fuzzer.seed(0)
    }

    static seed (kernel) {
        fuzzer._random = new Random.Random(Random.MersenneTwister19937.seed(kernel));
        return fuzzer._random;
    }

    static mutateString (val) {
        // MUTATE IMPLEMENTATION HERE
        var array = val.split('');
        do{
            if( fuzzer.random().bool(0.05) )
            {
                // REVERSE
                array.reverse();
            }
            // With 25% chance, remove a random set of characters, from a random start position
            if( fuzzer.random().bool(0.25) )
            {
                //fuzzer.random.integer(0,99)
                var start = fuzzer._random.integer(0,array.length);
                var end = fuzzer._random.integer(0,array.length);
                array.splice(start,end);
            }
            if( fuzzer.random().bool(0.25))
            {
                // add random characters
                // fuzzer.random().string(10)
                array.splice(fuzzer._random.integer(0,array.length),0,fuzzer._random.string(10))
            }
        }while(fuzzer.random().bool(0.05));
        return array.join('');
    }
};

function mutationTesting(paths,iterations)
{
    var failedTests = [];
    var reducedTests = [];
    var modfilescache = {};
    var tmpdirpath = path.join(__dirname,'tmp');
    var modified_files = paths.length/10;
    passedTests = 0;

    if (!fs.existsSync(tmpdirpath)) {
        fs.mkdirSync(tmpdirpath);
    }

    for (var i = 0; i < modified_files; i++) {
        var filepath = paths[fuzzer._random.integer(0,paths.length)];
        var filesplit = filepath.split("\\");
        var filename = filesplit[filesplit.length-1];

        var src = fs.readFileSync(filepath,'utf-8');

        var dstpath = path.join(tmpdirpath, filename);
        modfilescache[dstpath] = filepath;
        console.log(dstpath);
        console.log(filepath)
        fs.copyFileSync(filepath,dstpath, (err) => {
            if (err) throw err;
          });
        mutuatedString = fuzzer.mutateString(src);
        //console.log(mutuatedString);
    }
    // try
    // {
    //         marqdown.render(mutuatedString);
    //         passedTests++;
    // }
    // catch(e)
    // {
    //         failedTests.push( {input:mutuatedString, stack: e.stack} );
    // }

    // reduced = {};
    // // RESULTS OF FUZZING
    // for( var i =0; i < failedTests.length; i++ )
    // {
    //     var failed = failedTests[i];

    //     var trace = stackTrace.parse( failed.stack );
    //     var msg = failed.stack.split("\n")[0];
    //     console.log( msg, trace[0].methodName, trace[0].lineNumber );

    //     let key = trace[0].methodName + "." + trace[0].lineNumber;
    //     if( !reduced.hasOwnProperty( key ) )
    //     {
    //     }
    // }

    // console.log( "passed {0}, failed {1}, reduced {2}".format(passedTests, failedTests.length, reducedTests.length) );

    // for( var key in reduced )
    // {
    //     console.log( reduced[key] );
    // }

    revertfiles(modfilescache,tmpdirpath);
}

function revertfiles(modfilescache, dirpath){
    if (fs.existsSync(dirpath)) {
        fs.readdirSync(dirpath).forEach((file, index) => {
            const curPath = path.join(dirpath, file);
            console.log(curPath);
            fs.copyFileSync(curPath, modfilescache[curPath] , (err) => {
                 if (err) throw err;
                 });
            fs.unlinkSync(curPath);
        });
        fs.rmdirSync(dirpath);
    }
}

function getsourcepath(){
    //var srcdirpath = path.join(__dirname, '..', 'iTrust2-v6','iTrust2','src','main','java');
    var srcdirpath = path.join(__dirname, '..', '..','..','iTrust2-v6','iTrust2','src','main','java');
    var srcpaths = [];
    traverseDir(srcdirpath, srcpaths);
    return srcpaths;
}

function traverseDir(dir,srcpaths) {
    fs.readdirSync(dir).forEach(file => {
      let fullPath = path.join(dir, file);
      if (fs.lstatSync(fullPath).isDirectory()) {
         traverseDir(fullPath , srcpaths);
       } else {
         let path_split = fullPath.split(".");
         if(path_split[path_split.length-1] == 'java')
            srcpaths.push(fullPath);
       }
    });
  }

function main(){
    fuzzer.seed(0);
    paths = getsourcepath();
    console.log(paths);
    console.log(paths.length);
    console.log(iterations);
    mutationTesting(paths,iterations);
}


exports.mutationTesting = mutationTesting;
exports.fuzzer = fuzzer;

if (!String.prototype.format) {
  String.prototype.format = function() {
    var args = arguments;
    return this.replace(/{(\d+)}/g, function(match, number) {
      return typeof args[number] != 'undefined'
        ? args[number]
        : match
      ;
    });
  };
}

if (require.main === module){
    main();
}