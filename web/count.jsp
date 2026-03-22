<jsp:useBean id="sessionCounter" class="library.CounterBean" scope="session"  />
<jsp:useBean id="applicationCounter" class="library.CounterBean" scope="application"  />
Session : ${applicationCounter} <br>
Applacation:${sessionCounter}