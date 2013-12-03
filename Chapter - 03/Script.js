Qv.AddExtension("ET-HelloWorld",
        function () {

            // Set the extension object's inner Html, by referencing several properties
            this.Element.innerHTML =    'Title: ' +         this.Layout.Text0.text + '<br/>' +  
                                        'Color Title: ' +   this.Layout.Text1.text + '<br/>' +
                                        'Sub-Title:' +      this.Layout.Text2.text + '<br/>' +
                                        'Show Sub-Title: ' +this.Layout.Text3.text;

        });





