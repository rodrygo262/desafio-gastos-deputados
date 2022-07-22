var form = document.getElementById('form-arquivo');
var arquivo = document.getElementById('arquivo_csv');
var importaButton = document.getElementById('realiza_importacao');

form.onsubmit = function (event) {
  event.preventDefault();

  var files = arquivo.files;
  var formData = new FormData();
  var file = files[0];

  if (file == undefined) {
    alert('Favor selecionar um arquivo.');
    return;
  }

  if (!file.type.match('csv.*')) {
    alert('O arquivo selecionado não é um CSV.');
    return;
  }

  formData.append('arquivo_importacao', file, file.name);

  var xhr = new XMLHttpRequest();
  xhr.open('POST', 'gastos_deputados/upload', true);

  xhr.onload = function () {
    if (xhr.status === 200) {
      alert('Arquivo importado com sucesso.');
    } else {
      alert('Ocorreu algum erro na importação.');
    }
  };

  xhr.send(formData);
};