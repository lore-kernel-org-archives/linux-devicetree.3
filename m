Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B72E7378;
	Wed,  8 Jul 2026 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530166; cv=none; b=AgyhBZ6UtfSEFFSUIkeewvyItkQbmHaMv0WsPwwU5vBOT/U1uEZDaFzMxXuHxcaeKyxZYaWwlQ7cs8jKbLf4ilBUrdKOyDnAD9llOmpLYYE7IkxETP8HpxKQbjtWg3CJW4qU0DdDJGMicvyaacgwTxXOawYOQRiv6qQo4234I5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530166; c=relaxed/simple;
	bh=sEwrp/LaBE/zxNaamUzW0zBzsAUq/lOTN7jOlM5GIKU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eiihRtiF6k8UoAwQgS4JBs0rb4GN1+Ix8LY+e0MMlEAheU2FYIUH/w7uCx4/QOZIIUXezKCMBIr89/HSyINEgoA5bO1FfCCsuYC3z5lrrop2NkMTEO9Y5asKZ5IU7OgxildYRT36YG0UZDl2DPXvOM1q+9/IjnygalU3/HWh2G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6fa3pWd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6fa3pWd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED481F00A3A;
	Wed,  8 Jul 2026 17:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783530162;
	bh=taTRrd8ynJiQtg1nEq8mKKLb4b0tfXhztWPfnuT6Mqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g6fa3pWdQrqbNrNqbAyb3VdZQcDkuWY37YF/LQh5mmuh4JWCiANh37z3FMgJKlRyO
	 erwdXh05Ygq6yOW11UGw868GE3duuGvBJn5vwM8k5bC1M+o5MW5YgXTJvmv7wao0GN
	 nSaUDNrv8z3qCKiowiP9WQZQRWwILJeIMvFVFhtN5U9UHF1zV/nKDwWkOZ8ffaaC4+
	 QU+/Y4Eym+aAb0/mrbzVazGlV7qoShEORP8U+WxRtWLidjofDIOD7acqsSZYr0jy7x
	 r4QzmFaJjorL8gsG4JScAcSVraiUbgG1kfHAnQZqz+K0ZOBSv6XUDYi+sI/RipigN/
	 7RTnWhlCvRMpA==
Date: Wed, 8 Jul 2026 18:02:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: nicolas.ferre@microchip.com, claudiu.beznea@tuxon.dev, robh@kernel.org,
	krzk+dt@kernel.org, broonie@kernel.org,
	alexandre.belloni@bootlin.com, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	daniel.machon@microchip.com, luka.perkov@sartura.hr
Subject: Re: [PATCH 3/4] spi: atmel-quadspi: add LAN969x QSPI support
Message-ID: <20260708-guide-outing-b471d0dc92c9@spud>
References: <20260708165201.624271-1-robert.marko@sartura.hr>
 <20260708165201.624271-3-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HaSM35XyRalX3Hcv"
Content-Disposition: inline
In-Reply-To: <20260708165201.624271-3-robert.marko@sartura.hr>

--HaSM35XyRalX3Hcv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 08, 2026 at 06:51:10PM +0200, Robert Marko wrote:
> Microchip LAN969x has two QSPI controllers based on SAMA7G5 QSPI.
>=20
> It requires pad calibration, supports DMA, and supports 100 MHz operation.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

> @@ -1708,7 +1769,10 @@ static const struct of_device_id atmel_qspi_dt_ids=
[] =3D {
>  		.compatible =3D "microchip,sama7d65-qspi",
>  		.data =3D &atmel_sama7d65_qspi_caps,
>  	},
> -
> +	{
> +		.compatible =3D "microchip,lan9691-qspi",

Where is this compatible string documented?

> +		.data =3D &atmel_lan969x_qspi_caps,
> +	},
> =20
>  	{ /* sentinel */ }
>  };
> --=20
> 2.55.0
>=20

--HaSM35XyRalX3Hcv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCak6CrgAKCRB4tDGHoIJi
0ko3AP9HSVFq5dJ+A0+8dCRDWOsvo1ptqe3CSfu1QcwdvjOn2wEA3telxRqOywsj
EwpDQ1eAtlU2IMR0ePTgoux3C0RuiQ8=
=UUHj
-----END PGP SIGNATURE-----

--HaSM35XyRalX3Hcv--
