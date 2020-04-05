const esprima = require("esprima")
const options = {tokens:true, tolerant: true, loc: true, range: true };
const fs = require("fs")
const path = require("path")

getSourcePath = () => {
    let srcDirPath = path.join(__dirname, '..', '..', '..', 'var', 'lib', 'jenkins','workspace', 'checkbox.io', 'server-side', 'site')
    let srcPaths = []
    traverseDir(srcDirPath, srcPaths)
    return srcPaths
}

traverseDir = (dir, srcPaths) => {
    fs.readdirSync(dir).forEach(file => {
        let fullPath = path.join(dir, file)

        if(!fullPath.includes("node_modules")){
            if(fs.lstatSync(fullPath).isDirectory()){
                traverseDir(fullPath, srcPaths)
            }else{
                let pathSplit = fullPath.split('.')
    
                if(pathSplit[pathSplit.length - 1] == 'js'){
                    srcPaths.push(fullPath)
                }
            }
        }
    })
}

let builders = {}


function FunctionBuilder()
{

    this.StartLine = 0
    this.EndLine = 0
    this.LOC = 0
    this.FunctionName = ""
    this.MaxNestingDepth = 0
    this.MaxChains = 0

    this.report = () => {
        console.log(
            (
                "{0}():\n" + 
                "============\n" +
                "Start Line: {1}\t" +
                "End Line: {2}\t" +
                "LOC: {3}\t" +
                "Max Chains: {4}\t" +
                "MaxNestingDepth: {5}\n"
            )
            .format(this.FunctionName, this.StartLine, this.EndLine, this.LOC, this.MaxChains,this.MaxNestingDepth)
        )
    }
}

function FileBuilder()
{
    
    this.FileName = ""
    this.ImportCount = 0;

    this.report = () => {
        console.log(
            ("{0}\n" +
             "~~~~~~~~~~~~\n" +
             "Import Count {1}\t"
            ).format(this.FileName, this.ImportCount)
        )
    }
}

traverseWithParents = (object, visitor) => {
    let key, child;

    visitor.call(null, object);

    for (key in object) {
        if (object.hasOwnProperty(key)) {
            child = object[key];
            if (typeof child === 'object' && child !== null && key != 'parent') 
            {
            	child.parent = object;
					traverseWithParents(child, visitor);
            }
        }
    }
}



complexity = (filePath) => {
    let buffer = fs.readFileSync(filePath, "utf8")
    let ast = esprima.parseModule(buffer, options)

    let fileBuilder = new FileBuilder()
    fileBuilder.FileName = filePath
    fileBuilder.ImportCount = 0
    builders[filePath] = fileBuilder

    traverseWithParents(ast, (node) => {

        if(node.type === 'FunctionDeclaration'){

            
            let builder = new FunctionBuilder()

            builder.FunctionName = functionName(node)
            builder.StartLine = node.loc.start.line
            builder.EndLine = node.loc.end.line
            builder.LOC = builder.EndLine - builder.StartLine + 1
            builders[builder.FunctionName] = builder


            //Max Chain calculation
            let localChainCount = 0

            traverseWithParents(node, (nodeChild) =>{

                if(nodeChild.type == 'MemberExpression'){


                    traverseWithParents(nodeChild, (nodeChildChild) =>{
                        if(nodeChildChild.type == 'MemberExpression'){
                            localChainCount++
                        }
                    })
                }

                builder.MaxChains = Math.max(builder.MaxChains, localChainCount)
                localChainCount = 0

            })

            
            //Max Nesting Depth Calculation
            let maxdepth
			let subtract
			traverseWithParents(node, (nodeChild) => {
				//First check whether it is if, for or while loop or not
				if (isIfStatement(nodeChild)) {
					traverseWithParents(nodeChild, (nodeChildChild) => {
						//First check whether it is if, for or while loop or not
						if (isIfStatement(nodeChildChild)) {
							
							if(nodeChildChild.nextSibling){
								subtract++
							}
							maxdepth++
						}
					})
					maxdepth = maxdepth - subtract
					subtract = 0
					if (maxdepth > builder.MaxNestingDepth) {
						builder.MaxNestingDepth = maxdepth
                    }
				}
				maxdepth = 0
			})
            

            
        }
        if(node.name === 'require'){
            fileBuilder.ImportCount++
        }

    })

}


// Helper function to check if the node is an IF Statement
function isIfStatement(node)
{
	if( node.type == 'IfStatement')
	{
		return true;
	}
	return false;
}

// Helper function for allowing parameterized formatting of strings.
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

// Helper function for printing out function name.
function functionName( node )
{
	if( node.id )
	{
		return node.id.name;
	}
	return "anon function @" + node.loc.start.line;
}

main = () => {
    
    let paths = getSourcePath()
    console.log(paths)

    for(let path of paths){
        complexity(path)
    }

    for(let node in builders )
	{
		let builder = builders[node];
		builder.report();
	}
}

main()