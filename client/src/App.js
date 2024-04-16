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

  return (
    <div>
      {(typeof backendData.title === 'undefined') ? (
        <p>Spinning up cape fans...</p>
      ) : (
        <div>
          <h1>{backendData.title}</h1>
          <p>{backendData.briefing}</p>
          {/* This time calc isn't working right... */}
          <p>Operation expires in {new Date((new Date(backendData.expiration) - new Date()) * 1000).toISOString().slice(11, 16)}</p>
          <br></br>
        </div>
      )}

    </div>
  )
}

export default App