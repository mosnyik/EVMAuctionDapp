import Link from 'next/link'
const NavBar = () => {
    return ( 
        <div className= 'p-10 flex flex-nowrap space-x-4 drop-shadow-lg bg-slate-100 h-10 justify-around ' >
            <div>NFT Auction Place</div>
            <div className='px-10 flex flex-row justify-around space-x-6'>  
                <div className='hover:underline '>
                    <Link href = {'/'}>
                        Home
                    </Link>
                </div>
                <div className='hover:underline '>
                    <Link href = {'/auction'}>
                        Create Auction
                    </Link>
                </div>
                <div className='hover:underline '>
                    <Link href = {'/bid'}>
                        Bid
                    </Link>
                </div>
            </div>
            <div>
            <button className='bg-white hover:bg-gray-100 px-4 py-1 border border-blue-400 text-gray-400 hover:text-gray-800 round shadow justify-start mb-4 round-full'>
                Connect Wallet
            </button>
            </div>
        </div>
     );
}
 
export default NavBar;