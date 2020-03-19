// This procedure.dsl was generated automatically
// DO NOT EDIT THIS BLOCK === procedure_autogen starts ===
procedure 'Add API Product to Key', description: '''This procedure Add API Product to Key''', {

    step 'Add API Product to Key', {
        description = ''
        command = new File(pluginDir, "dsl/procedures/AddAPIProducttoKey/steps/AddAPIProducttoKey.pl").text
        shell = 'ec-perl'
        shell = 'ec-perl'

        postProcessor = '''$[/myProject/perl/postpLoader]'''
    }

    formalOutputParameter 'restResult',
        description: 'Rest Call Result'
// DO NOT EDIT THIS BLOCK === procedure_autogen ends, checksum: 8a36931cbede856f54b9075a3cd339fb ===
// Do not update the code above the line
// procedure properties declaration can be placed in here, like
// property 'property name', value: "value"
}