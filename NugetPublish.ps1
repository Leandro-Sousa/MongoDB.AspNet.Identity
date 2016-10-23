#################################################################
#Definicoes
#################################################################
$includeReferencedProjects = $false
#################################################################


Remove-Item "*.nupkg"

foreach($project in Get-ChildItem "*.csproj") {

    If($includeReferencedProjects -eq $true)
    {
        nuget pack $project.name -IncludeReferencedProjects
    }
    Else
    {
        nuget pack $project.name
    }

}

foreach($package in Get-ChildItem "*.nupkg") {
    nuget push $package.name -Source https://www.myget.org/F/ipn/auth/6ff4fb05-49e4-43e8-a5a4-03e09af6d3d9/api/v3/index.json
}
