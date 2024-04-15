import React, {useEffect, useState } from 'react'

function App() {
  const [backendData, setBackendData] = useState([{}])

  useEffect(() => {
    fetch("/api").then(
      response => response.json()
    ).then(
      data => {
        setBackendData(data)
      }
    )
  }, [])

  return (
    <div>

      {(typeof backendData.title === 'undefined') ? (
        <p>Loading capes...</p>
      ) : (
        <p>{backendData.title}</p>
      )}
      
    </div>
  )
}

export default App