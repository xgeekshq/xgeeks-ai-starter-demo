import { UserProfile } from "@auth0/nextjs-auth0/client";
import Link from "next/link";

interface ComponentProps {
  afterSignOutUrl: string;
  authUser: UserProfile;
}
export default function UserNavButton(props: ComponentProps) {
  return (
    <>
      <button className="rounded-md py-2 px-3 text-sm font-medium text-white">
        {props.authUser.name}
      </button>
      <Link
        href={props.afterSignOutUrl}
        className="rounded-md bg-gray-800 py-2 px-3 text-sm font-medium text-white hover:bg-gray-700 focus:outline-none focus:ring-2 focus:ring-white focus:ring-offset-2 focus:ring-offset-gray-800"
      >
        Logout
      </Link>
    </>
  );
}
