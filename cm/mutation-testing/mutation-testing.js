const Random = require('random-js');
const fs = require('fs');
const path = require('path');
const stackTrace = require('stacktrace-parser');
const execSync = require('child_process').execSync;

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
        var array = val.split('\n');
        var copy = [];
        array.forEach(elem => {
            if(!isHeader(elem.trim())){
                elem = elem.replace(/0/g,'1');
                elem = elem.replace(/==/g,'!=');
                elem = elem.replace(/\s>=?\s/g," < ");
                elem = elem.replace(/\s<=?\s/g," > ");
                if( elem.includes('\"') && fuzzer.random().bool(0.25))
                {
                    // mutate strings
                    elem = elem.replace(/"(.*?)"/g,
                     `"${fuzzer._random.string(fuzzer._random.integer(0,elem.length + 10))}"`);
                }
            }
            copy.push(elem);
        });
        return copy.join('\n');
    }
};


function isHeader(content){
    if(content.startsWith("package") || content.startsWith("import") || content.startsWith("@")
        || content.startsWith("/*") || content.startsWith("*") || content.startsWith("//"))
            return true;
    return false;

}

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

    console.log("MODIFIED FILES:\n");
    for (var i = 0; i < modified_files; i++) {
        var filepath = paths[fuzzer._random.integer(0,paths.length-1)];
        console.log(filepath);
        var filesplit = filepath.split("\\");
        var filename = filesplit[filesplit.length-1];

        var src = fs.readFileSync(filepath,'utf-8');

        var dstpath = path.join(tmpdirpath, filename);
        modfilescache[dstpath] = filepath;
        fs.copyFileSync(filepath,dstpath, (err) => {
            if (err) throw err;
          });
        mutuatedString = fuzzer.mutateString(src);
        //console.log(mutuatedString);
        fs.writeFileSync(filepath, mutuatedString, (err) => {
            if (err) throw err;
        });
    }

    try
    {
            //TO DO : Adjust path on server
            var srcdirpath = path.join(__dirname, '..', '..','..','iTrust2-v6','iTrust2')
            var output = execSync(`cd ${srcdirpath} && mvn -f pom-data.xml process-test-classes`, { encoding: 'utf-8' });
            console.log('BUILD SUCCESFULL:\n', output);
            output = execSync(`cd ${srcdirpath} && mvn clean test verify org.apache.maven.plugins:maven-checkstyle-plugin:3.1.0:checkstyle`, { encoding: 'utf-8' });
            console.log('Output was:\n', output);
            //passedTests++;
    }
    catch(e)
    {
            console.log(e);
            //revertfiles(modfilescache,tmpdirpath);
            failedTests.push( {input:"xxx", stack: e.message} );
    }

    console.log(failedTests);

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

    console.log("Resetting files\n");
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
    //TO DO : Adjust path on server
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