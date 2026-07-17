Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3AD388E7A;
	Fri, 17 Jul 2026 12:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784292271; cv=none; b=eFaGe+4ikrwdZi7fld7zXZKFVJd7QTMXiar78zmOPmaPl3+c26pz1mrCLLP/EeAY24Rbi/RM3X/guLcJusW1BJKIvdmne4iEHkX8Bso9Sdf7FN88JUndVX1WzYzE/R3OPqgGo4PzCOj6Jvu4z7Q4Kk00WtysnAa47+vj2fJpiDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784292271; c=relaxed/simple;
	bh=As6RDX6p31gbcMsLLe8dj4wEfwwYenDNellDAaL46Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpFHgi1q4bsGv5LNmZXU6dbmy4KQeEeqezybV/PLA4de2WO2/UjKOzl4VpFArLhIBYukXav9yiW/MNjuq5feLdJMEEAlBRbgAXojUlrg7fj8JzVhmN+njrHmrcXRWrR8Y80rZviB6/DtWQzehl6K3eqgRb7aijJWuZFOWZbto9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=amH54H40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="amH54H40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B01521F000E9;
	Fri, 17 Jul 2026 12:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784292270;
	bh=As6RDX6p31gbcMsLLe8dj4wEfwwYenDNellDAaL46Ck=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=amH54H402cNrVhhUcwRafka0QURJ8F/JrZCSW7ryMeU4sqGURm1wFhB71cb4+l7nt
	 1Zd8Mljb6D+bPc4iM7UaQAQewljI3TgSCZnGFi0JPySah10aidQaTdOhLpirY/vtD6
	 N7+Hp0QNmlZa92iWyDYnimzHmZwcvw8wcfyUw6qHiQDLVj19Asq/7yOipNwvH/L4VB
	 jFc3MXKm7eP0ikDdxvQnpUrwDC8GmxUjox0l7BVA8y7nJz0xnUOA2mDVS7n9qr16Cm
	 n5305jckH4T/nySPp06eALVeK95OXBMfGY/oUvscaGhzGCoXfTuGRjEDMbloUGKSbu
	 tt7r6fsZi6xDQ==
Date: Fri, 17 Jul 2026 13:44:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Victor Krawiec <victor.krawiec@arturia.com>, lgirdwood@gmail.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
Message-ID: <38adfbda-2cdb-49bb-84d4-aae0a6258f68@sirena.org.uk>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
 <20260717-nostalgic-raptor-of-sunshine-1aba9a@quoll>
 <fd7d5b72-a400-435c-bbac-9e661d98e3c9@arturia.com>
 <94ce2136-3adc-40f5-946f-b56778f6343c@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ixPGCn6sCa7O3VG"
Content-Disposition: inline
In-Reply-To: <94ce2136-3adc-40f5-946f-b56778f6343c@kernel.org>
X-Cookie: Enjoy yourself while you're still old.


--/ixPGCn6sCa7O3VG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 02:31:51PM +0200, Krzysztof Kozlowski wrote:
> On 17/07/2026 14:02, Victor Krawiec wrote:

> > The underlying implementation in the driver (in fan53555_device_mode_ma=
p_setup() it the patch serie) is limited to=A0SYR82X because it is the only=
 hardware that I'm able to test. That's why the binding part was referring =
to this specific device.

> So you are adding constants for one device but used in the bindings and
> driver for other? Are they valid there?

It's one of these devices that's got a bunch of clones from various
manufacturers with minor differences and share a driver.

--/ixPGCn6sCa7O3VG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpaI6kACgkQJNaLcl1U
h9Bz/Af+JDp5Ibxu8Mzsa5wzSvHhAKXAFadewcTtuZKsb54Lrc8/K4t7aHfgtkp5
Zd7U3MHSig8BPzv7qLQJAZvgpaJlk/Eb/ADcOt/GuaF4oHdddGKG9OfvPEHbabkM
S4oHX0jKw6ortFitaG0TumZXLpCm0V+VczkZqlO+6b7XkTlJJwszN2lBQQg+aoZM
MtgDYvMx/veb6WOivl9c4CtG4Xep2bpkGM2+FvLrDcoSNkXgsHHG7ncaGS++EFSY
K+lUAV/OUWqwvfadKiWP58zv8GF+/L+VdQkExQr92BrlEYM70igAyChu3i8UrsLE
/TnMCwiXq3elzyKF2H01JLQ1lzftXA==
=swZq
-----END PGP SIGNATURE-----

--/ixPGCn6sCa7O3VG--
