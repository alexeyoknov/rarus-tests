// Regular expression from W3C HTML5.2 input specification:
// https://www.w3.org/TR/html/sec-forms.html#email-state-typeemail
var emailRegExp = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/;

new Vue({
  // root node
  el: "#app",
  // the instance state
  data: function() {
    return {
      name: {
        value: "John Doe",
        valid:true
      },
      email: {
        value: "jo@hnd.oe",
        valid: true
      },
      address: "Севастополь",
      phone: {
        value: "+79781234567",
        valid: true
      },
      message: {
        text: '',
        maxlength: 255
      },
      feedbackStatus: {
        value:'Ok',
        valid:true
      },
      file:{
        file:'',
        isUploaded:false,
        uploadMessage: ''
      },
      submitted: false
    };
  },

  methods: {
    // submit form handler
    submit: function() {
      
      this.file.uploadMessage = '';

      let formData = new FormData(event.target);
      var formDataArray = {};     

      formData.forEach(function(value,key){
        if (key !== 'file')
          formDataArray[key] = value.replace('.','#_#')
            .replace('+','#-#')
            .replace(' ','#20#');
        else
          formDataArray[key] = value;
      });

      axios.post('feedback.php',JSON.stringify(formDataArray))
        .then(response => {
          this.feedbackStatus.value = response.data.status;
          this.feedbackStatus.valid = (this.feedbackStatus.value === 'Ok');
        })
        .catch(error => console.log(error))
        .finally(() => (this.fileUpload()));

     
      this.submitted = true;
    },

    fileUpload(){
      if (this.feedbackStatus.valid && (this.file.file !=='')){
        let formDataFile = new FormData();
        formDataFile.append('file',this.file.file);
        axios.post('upload.php',formDataFile,
          {
            headers:{'Content-Type': 'multipart/form-data'}
          })
        .then(response => {this.file.isUploaded = (response.data.error==='');
          this.file.uploadMessage = response.data.message;
        })
        .catch(error => {this.file.uploadMessage = error;});
      }
    },

    // validate by type and value
    validate: function(type, value) {
      if (type === "email") {
        this.email.valid = this.isEmail(value) ? true : false;
      };
      if (type === "name") {
        this.name.valid = (value!=='');
      };
      if (type === "phone") {
        this.phone.valid = (value!=='');
      }
    },
    // check for valid email address
    isEmail: function(value) {
      return emailRegExp.test(value) || (value === '');
    },
    handleFileUpload(){
      this.file.file = this.$refs.file.files[0];
      this.file.isUploaded = false;
      this.file.uploadMessage = '';
      //console.log(this.file.file);
    },

  },
  watch: {
    // watching nested property
    "email.value": function(value) {
      this.validate("email", value);
    },
    "name.value": function(value) {
      this.validate("name", value);
    },
    "phone.value": function(value) {
      this.validate("phone", value);
    },
    "feedbackStatus.value": function(value) {
      this.feedbackStatus.valid = (value === 'Ok');
    }
  }
});

