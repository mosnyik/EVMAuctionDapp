import NavBar from '../components/NavBar'


export default function Home() {
  return (
    <div>
      <NavBar />
      <div className='py-16 '>
            <div>
                <h2 className='px-4 pb-6 font-bold text-xl'>
                    Place a bid, the highest bidder gets the NFT
                </h2>
                <p className='px-4 pb-4'>
                    Note: Once you place a bid, you can not widraw until the bid is over.
                </p>
            </div>

            <form className='lg:w-1/3 sm:w-2/3 '>
                <div className=' flex items-center border border-gray-600 my-4 mx-4 rounded'>
                    <div  className='flex-shrink-0 bg-gray-600 text-gray-100 text-sm py-2 px-6'>
                        Bid  
                    </div>
                    <input type='text' placeholder='Enter a bid amount eg 20 ETH' className='appearance-none bg-transparent border-none w-full text-gray-700 mr-3 py-1 px-2 leading-tight focus:outline-none' />
                </div>  
            </form>
            <div className='px-5 py-4 justify-evenly'>
                <button type='button' className='bg-gray-100 px-6 py-2 rounded-full border border-gray-600 hover:border-gray-100 hover:bg-gray-500 hover:text-gray-100 '>
                 Place Bid
                </button>
                <button type='button' className='bg-gray-100 px-6 py-2 rounded-full border border-gray-600 hover:border-gray-100 hover:bg-gray-500 hover:text-gray-100 mx-16 '>
                 Withdraw Bid
                </button>
            </div>
            
      </div>
    </div>
  )
}