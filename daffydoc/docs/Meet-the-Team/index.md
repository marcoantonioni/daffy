<style>
/* Three columns side by side */
.column {
  float: left;
  width:35%;
  margin-bottom: 16px;
  padding: 0 8px;
}

/* Display the columns below each other instead of side by side on small screens */
@media screen and (max-width: 650px) {
  .column {
    width: 100%;
    display: block;
  }
}

/* Add some shadows to create a card effect */
.card {
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

/* Some left and right padding inside the container */
.container {
  padding: 0 16px;
}

/* Clear floats */
.container::after, .row::after {
  content: "";
  clear: both;
  display: table;
}

.title {
  color: grey;
}

.button {
  border: none;
  outline: 0;
  display: inline-block;
  padding: 8px;
  color: white;
  background-color: #000;
  text-align: center;
  cursor: pointer;
  width: 100%;
}

.button:hover {
  background-color: #555;
}
</style>
<div class="row">
  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Kyle.jpeg" style="width:100%">
      <div class="container">
        <h2>Kyle Dawson</h2>
        <p class="title">Principal Automation Technical Specialist, IBM Technology, US National Market</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/David.jpeg"style="width:100%">
      <div class="container">
        <h2>David Krier</h2>
        <p class="title">Principal Integration Technical Specialist, IBM Technology, US National Market</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Jeff.jpeg" style="width:100%">
      <div class="container">
        <h2>Jeff Imholz</h2>
        <p class="title">Principal Automation Technical Specialist, IBM Technology, US National Market</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Sunil.jpeg" style="width:100%">
      <div class="container">
        <h2>Sunil S. Patel</h2>
        <p class="title">Principal Technical Sales Manager, Data-AI-Automation Blackbelt team, IBM Technology, US National Market</p>
      </div>
    </div>
  </div>


  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Greta.jpeg"  style="width:100%">
      <div class="container">
        <h2>Greta Holland</h2>
        <p class="title">Associate AI Applications Technical Specialist, IBM Technology, US National Market Global Sales - Software Sales</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Taner.jpg" style="width:100%">
      <div class="container">
        <h2>Taner Avci</h2>
        <p class="title">Brand Technical Sales Specialist Intern</p>
      </div>
    </div>
  </div>

  <div class="column">
    <div class="card"style="width: 13rem;">
      <img src="./images/Daniel.jpg" style="width:100%">
      <div class="container">
        <h2>Daniel Schroedl</h2>
        <p class="title">Brand Technical Sales Specialist Intern</p>
      </div>
    </div>
  </div>

</div>
