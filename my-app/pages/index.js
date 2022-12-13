import NavBar from '../components/NavBar'


export default function Home() {
  return (
    <div>
      <NavBar />
      <div>
        <h2 className='font-bold py-8 px-4 text-2xl'>
          The NFT Place
        </h2>
        <p className='px-4 text-lg '>
          Welcome to the NFT Auction Place,
          you are welcome to create an Auction or place a bid
          just go ahead and connect your wallet and you are all set to roll
        </p>
      </div>

    </div>
  )
}
