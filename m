Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BE4384254;
	Thu,  2 Jul 2026 19:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020051; cv=none; b=I1ZE742uOEoacHXGEOSKK9zp78oVUtFZ6UQ+YMPuSgXZzp+E74+ja/6O6OxnoO4hAGKwtCEmcI/IylnI67cPSE8ev1aFGy96us76w+vwVpJJ1c24gUJc37+djWqIn4MQukcDa+brlv+GYb236VKNZD0u/A1lDtjkkfLMugR2VSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020051; c=relaxed/simple;
	bh=njfPjw1vasZGkorgQQZuLlIvQZGHbLEOYPgFiYzXTGo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UhNJe4k2Qr/DwYzi4R6XffASgXvnfOwsQEXrJf1jGr4zHMJRRu1bmnd9S5h2D8yCx++akr0FatJgcGzX6Pvn0ox8IcE/I6aFwZgFfusiFk/keX45IR5u3XQxnP/h+htuHI+2djcZ6PCB1wcJNohAhN9CyBKh6AMB2HJ8zzEv8gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhL15kIA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhL15kIA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C5C31F000E9;
	Thu,  2 Jul 2026 19:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783020050;
	bh=njfPjw1vasZGkorgQQZuLlIvQZGHbLEOYPgFiYzXTGo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dhL15kIAeCEM6Q2xLbK9Fz0jxb31bAoaOluoJ142BMOB/CiCEYMXT6QdA0v/os1DJ
	 4TMWT9nYv6cOdJVJtk4nC6ZSeWI2zuM3eyb+fQICdrpGxOENMhYFChTZMyxf2svkd1
	 r/E15ndzcvvmkHu70spN8+QKqJQ1cJ5suouyohJPZaBg9ajfInMDFsB/YYaQgC95GK
	 wjBeSRMobUNOog0cnLy3rzMW1ptP/oRxCefDI0L545l/VoFn0EkvOOEfkqW5xQM6YR
	 vf2P3GjMytzjLSyRmYb8MYkGT0RlsuHE2EDcfho8/SeJL+X+4hx0OdFYWnFBhrXneK
	 vd7cjFTqTbLcw==
Date: Thu, 2 Jul 2026 20:20:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
	Matti Vaittinen <matti.vaittinen@linux.dev>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: regulator: ROHM PMIC state-machine voltages
Message-ID: <20260702-dispute-licorice-85e7f5cd875e@spud>
References: <akZGe1CaQFDd3idm@mva-rohm>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KbV0JeECpGI9R6zI"
Content-Disposition: inline
In-Reply-To: <akZGe1CaQFDd3idm@mva-rohm>

--KbV0JeECpGI9R6zI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--KbV0JeECpGI9R6zI
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaka6DgAKCRB4tDGHoIJi
0qdRAQD62ru9rTB6kSWBWsULelX51zbPDOK/8oCxjX/miMYwkwD+PqfkL0xtI1xM
mTZe4kcjO7d4gZDpvS9oe/bJjWlw8wM=
=SXon
-----END PGP SIGNATURE-----

--KbV0JeECpGI9R6zI--
