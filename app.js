import express from 'express'

const app = express()

const port  = process.env['PORT'] || 8080

process.on('SIGTERM', async () => {
  console.info('[express] SIGTERM signal received.');
  console.info('[express] cleaning up.');
  await new Promise(resolve => setTimeout(resolve, 100))
  console.info('[express] exiting.');
  process.exit(0)
});

process.on('SIGINT', async () => {
  console.info('[express] SIGINT signal received.');
  console.info('[express] cleaning up.');
  await new Promise(resolve => setTimeout(resolve, 100))
  console.info('[express] exiting.');
  process.exit(0)
});


app.get('/healthcheck', (req, res) => {
  console.log('Got a healthcheck request')
  res.sendStatus(200)
})

app.get('/', (req, res) => {
  console.log('Got a request', req.params)
  res.send(JSON.stringify({message: 'Hi, there👋'}))
})

app.post('/', (req, res) => {
  console.log('Got a request', req.body)
  res.send(JSON.stringify({message: 'Hi, there👋'}))
})

app.listen(port, () => console.log(`App listening on ${port}`))

