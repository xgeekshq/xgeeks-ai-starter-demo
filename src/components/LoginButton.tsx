import Link from "next/link";

export default function LoginButton() {
  function loginHandler() {}
  return (
    <div className="text-center pt-8">
      <Link
        href="/api/auth/login"
        className="flex-none rounded-md bg-white px-3.5 py-2.5 text-sm font-semibold text-gray-900 shadow-sm hover:bg-gray-100 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-white"
      >
        Login
      </Link>
    </div>
  );
}
