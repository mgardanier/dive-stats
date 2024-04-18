import React, { useEffect, useState } from 'react'

function App() {
  const [backendData, setBackendData] = useState([{}])

  useEffect(() => {
    fetch("/orders").then(
      response => response.json()
    ).then(
      data => {
        setBackendData(data.orders[0])
      }
    )
  }, [])

  function getExpirationCountdown(expirationDate) {
    const today = new Date()
    const miliseconds = (expirationDate - today)
    const timeLeft = (miliseconds * 1000) > 3600 ? new Date(miliseconds).toISOString().substring(11, 16) : new Date(miliseconds).toISOString().substring(14, 19)
    return formatExpirationCountdown(timeLeft)
  }

  function formatExpirationCountdown(timeLeftString) {
    debugger
    const units = timeLeftString.split(':')
    return units.length === 3 ? `${units[0]}D ${units[1]}H ${units[2]}M` : `${units[0]}H ${units[1]}M`
  }

  return (
    <div>
      {(typeof backendData.title === 'undefined') ? (
        <p>Spinning up cape fans...</p>
      ) : (
        <div>
          <h1>{backendData.title}</h1>
          <p>{backendData.briefing}</p>
          {/* This time calc isn't working right... */}
          <p>Operation expires in {getExpirationCountdown(new Date(backendData.expiration))}</p>
          <br></br>
        </div>
      )}

    </div>
  )
}

export default App