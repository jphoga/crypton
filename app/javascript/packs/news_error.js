const setButtonToError = (button) => {
  const iframeLoad = document.querySelector("iframe");
  if (iframeLoad.innerHTML === "") {
      button.innerHTML = "Error";
    }
}

export default setButtonToError;
