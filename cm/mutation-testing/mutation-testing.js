const Random = require('random-js');
const fs = require('fs');
const path = require('path');
const stackTrace = require('stacktrace-parser');
const spawnSync = require('child_process').spawnSync;

var iterations;
const srcDirPath = path.join("/var/lib/jenkins/workspace/iTrust/iTrust2");

if(process.argv.length >= 3)
{
    iterations = process.argv[2];
}

class fuzzer {
    static random() {
        return fuzzer._random || fuzzer.seed(0)
    }

    static seed (kernel) {
        fuzzer._random = new Random.Random(Random.MersenneTwister19937.autoSeed());
        return fuzzer._random;
    }

    static mutateString (val) {
        // MUTATION IMPLEMENTATION HERE
        var array = val.split('\n');
        var copy = [];
        array.forEach(elem => {
            if(!isHeader(elem.trim())){
                //replace 0 with 1
                elem = elem.replace(/\s0\s/g,' 1 ');
                //replace == with !=
                elem = elem.replace(/==/g,'!=');
                //replace >/>= with <
                elem = elem.replace("/\s>=?\s"," < ");
                //replace </<= with >
                elem = elem.replace("\s<=?\s"," > ");
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

//Check if a line start or contains these characters. Don't fuzz the line if it does
function isHeader(content){
    if(content.startsWith("package") || content.startsWith("import") || content.includes("@")
        || content.startsWith("/*") || content.startsWith("*") || content.startsWith("//"))
            return true;
    return false;

}

function mutationTesting(paths,iterations)
{
    var testResults = [];
    var tmpdirpath = path.join(__dirname,'tmp');
    var modified_files = paths.length/10;
    passedTests = 0;

    //Run the mutation fnction multiple times
    for (var iter = 1; iter <= iterations; iter++) {
        //Create a tmp directory if it doesn't exists
        if (!fs.existsSync(tmpdirpath)) {
            fs.mkdirSync(tmpdirpath);
        }
        var modfilescache = {};
        console.log(`\nModified Files in iteration ${iter}:\n`);
        for (var i = 0; i < modified_files; i++) {
            var filepath = paths[fuzzer._random.integer(0,paths.length-1)];
            console.log(filepath);
            var filesplit = filepath.split("/");
            var filename = filesplit[filesplit.length-1];
            var src = fs.readFileSync(filepath,'utf-8');
            var dstpath = path.join(tmpdirpath, filename);
            //If file already mutated, skip the file
            if(modfilescache.hasOwnProperty(dstpath))
                continue;
            //Store the path to modified files in a dict
            modfilescache[dstpath] = filepath;
            //Copy the original file to tmp folder
            fs.copyFileSync(filepath,dstpath, (err) => {
                if (err) throw err;
            });
            //Mutate the file
            mutuatedString = fuzzer.mutateString(src);
            //Write back the mutated file to original location
            fs.writeFileSync(filepath, mutuatedString, (err) => {
                if (err) throw err;
            });
        }

        try
        {
                //Run the test suite
                var output = spawnSync(`cd ${srcDirPath} && mvn clean test verify org.apache.maven.plugins:maven-checkstyle-plugin:3.1.0:checkstyle`, { encoding: 'utf-8', stdio: 'pipe' , shell: true });
                //Push the test results to the array
                testResults.push( {input: iter, stack: output.stdout} );
        }
        catch(e)
        {
                // If build fails restrart iteration
                console.log("Build error: Restarting iteration\n" + e);
                iter--;
        }

        console.log("\nResetting files\n");
        //Copy the original files back to the working directory
        revertfiles(modfilescache,tmpdirpath);
    }

    failedTests = {};
    //Get failed tests in each iteration
    for( var i =0; i < testResults.length; i++ )
    {
        var failed = testResults[i];
        var msg = failed.stack.split("\n");
        msg.filter(function(line) {
            if(line.endsWith("<<< FAILURE!") || line.endsWith("<<< ERROR!")){
                var temp = line.split(" ");
                var test =  temp[1].substring(temp[1].indexOf("(") + 1,temp[1].indexOf(")")) + "." + temp[1].split("(")[0];
                if (test in failedTests)
                    failedTests[test] += 1;
                else
                    failedTests[test] = 1;
            }
        });
    }

    // Create items array
    var items = Object.keys(failedTests).map(function(key) {
        return [key, failedTests[key]];
    });

    // Sort the array based on the second element
    items.sort(function(first, second) {
        return second[1] - first[1];
    });
    //Print test results
    items.forEach(item => console.log(`${item[1]}/${iterations} ` + item[0]));
}

function revertfiles(modfilescache, dirpath){
    if (fs.existsSync(dirpath)) {
        fs.readdirSync(dirpath).forEach((file, index) => {
            const curPath = path.join(dirpath, file);
            console.log(curPath + "\n" +modfilescache[curPath]);
            fs.copyFileSync(curPath, modfilescache[curPath] , (err) => {
                 if (err) throw err;
                 });
            fs.unlinkSync(curPath);
        });
        fs.rmdirSync(dirpath);
    }
}

function getsourcepath(){
    var srcdirpath = path.join(srcDirPath,'src','main','java');
    var srcpaths = [];
    //Get a list of source files
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

if (require.main === module){
    main();
}