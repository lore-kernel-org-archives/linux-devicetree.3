Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794396261;
	b=PhhuQk4mG9PCNsK7RZH6ETz7j/eSx9+hCs17szaIIRQJEtDHL3pmgnQ/dV8o5OdcKuAX
	 h2eRdXg5Ap8Gxy+pYKo+MRWAVkRHcDR1hGJWkZYTBeZZiB7O0hxSwmcTGu6c+rYfbUb21
	 TCybuu20aYa7jY2z8FdhA5vKgCyoM5dAXpEBYE86YAb1OIe3Og39+fkJec51pZPdINIoQ
	 7JDA3wSvugjXZWAMvT5FQWHGMZAnT4Gz7tjoGiIm8btzAlnGWOyHWV/p023rutkpfu5vp
	 txtTLzCyX3iWRY8+gvWDLCUsMcMjOwTTYKksZZ/OciDd4OAJuUFm7fwgTE8F3gkRRFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794396261;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=TyC5RG/xS6ek+VZLhU7M9QAvgJKCmjqZswCm4LBfDrM=;
	b=S98nPYdD9MCXvrel0V6WXsIV/b2zpcXZM/1A7HaBXGQpjIgJ9QjTK/AMr/WWP2c0Jmb6
	 x/HO6oertr1kEB1MNtto6LU6FxfB/DURtQNlejO95RiNrOKqyxiItp+WQr7mNXX0GFeH9
	 /5s1yIXOVmYHJjHbn84ENtkiCnUIwv4d1I452OO9ugkLrDyyGaB9YZ1ZErw7PDpA+mdhX
	 xncAfqgT4/S0s6jJ+gdVX3HFD14uWaFaGy9gplxlu4VIdcQ0jQLUOqd1RqgRobsrtVtnd
	 mL1IkdZGbv6t9yZEvT6firkP/IqOOivu/11kpnZysL59AFhBLwTc2CfjrkfKTysQFZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="AQ5+E/2N";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A44606A327
	for <devicetree@vger.kernel.org>; Wed, 11 Nov 2026 11:24:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A44606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AQ5+E/2N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=TyC5
	RG/xS6ek+VZLhU7M9QAvgJKCmjqZswCm4LBfDrM=; b=AQ5+E/2NMJbces3nNLB7
	Dhp+waLJGw1j50cO1JBzfY4d1iIDKC9tJdVFKJFRKAbN6RpKi235h/eVd1rCzcpk
	9pGbHjrWplc5sEuTwWsFZvbx+0IrBTSZBEVa4wWQkn8IKuw4lwDFlbbzJKKEHA+P
	gtPA53DgA/519DujpqPJx3D77/mfkho2wV/cIaz6i21QeWap/p4wkpRko/YtDZD0
	jlD2Gqz50Gi492U+ui3ZbtI0Yj888QDdhfWpR8hra68pZ5sgN16tmCw+k+pRjVy6
	wcvffTVy4yRWJPmGq3TNnhb5YjZ7kX3yYUVO+6/coo/pggt8mincU8ji9Xf7PC89
	Rg==
Received: (qmail 590099 invoked from network); 11 Nov 2026 12:24:15 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Nov 2026 12:24:15 +0100
X-UD-Smtp-Session: l3s3148p1@cp1bb/5fSuEujnun
Date: Wed, 11 Nov 2026 12:24:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Biju Das <biju.das.au@gmail.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v25 11/11] mmc: renesas_sdhi: Add RZ/G3L SDHI support
Message-ID: <avRQWlS4DsBDU5c5@shikoro>
References: <20261028-rzg3l_sdhi-v25-0-57f16691c2ed@bp.renesas.com>
 <20261028-rzg3l_sdhi-v25-11-57f16691c2ed@bp.renesas.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TDYaANhAGqmkt0P2"
Content-Disposition: inline
In-Reply-To: <20261028-rzg3l_sdhi-v25-11-57f16691c2ed@bp.renesas.com>

--TDYaANhAGqmkt0P2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 12:51:28PM +0000, Biju Das wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> The RZ/G3L SDHI is close to existing variants but differs in three
> ways the driver can't handle today:
>=20
> - It has an 11-bit clock divider. The upper bits live in CLK_CTL
>   bits [17:16], so the register must be written with a 32-bit access
>   on this SoC.
> - Tuning needs a second HW adjustment register (HWADJ2), programmed
>   together with TMPPORT2.
> - HWADJ4 must be cleared when tuning starts.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like the renesas_sdhi_sclken() helper.

All review done, congrats! I will run some tests on R-Car hardware in
a few minutes.


--TDYaANhAGqmkt0P2
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr0UFoACgkQFA3kzBSg
KbZXxA//VK0YsuDvIDhInLV9TiDuTr0cVWSPldJlUM9iuRmA4Aaq7btGKrKPziBE
4r7tGKTpARWrO1binEIwkZtBwBNCKWG59Vrn9WXV59LZ0mGu877aoyuCaNFvsDVo
TB3Slnt1jbp4c3zwk4XpRz84MNoxunbl4x6eIic7reJjpqGcOf4XRjQa1eNIQeTc
yAHuO9llw/AkfoAl2FGt7woiHcw5PQ0Nzi+BjZe8/PY6zbZPmmk326GasGsQbhaE
bScvVPSlhs/mgVDvEje0Q4qRyQNU2lOCSUAeW6HdXwTe9/JzB9wZALSOfXHLOX8l
imr16uKsiEimAS7C2dj6WioQoS2po/xN7dAhw+iqLRjiTGYBIuYAmv6aXSFm+eRH
zXj4Qo/gWILrUbvrTl0aC3saHyB6OjyYONvYalVF+jg18PxllDcUUhQlP6FS0oE5
UtoPMD6t7oYJe2ysfA4osTQrSu/KJMOK4Q9eNwLtraGcdadkkCTqMs2Lc7EscUVL
YWvK1mf2ZKxcDki5KsxlYKvg5GGQwaFLNtUzk3DxuYEzMcCcs6f7Huk2nIY6HkJz
LcthyifcBJDf641GeVdVU5Y9m9euxU7/SHwqAuMUWc02nGH4Z4vHQOodV7LgRxk/
bVZ5ZUUj7C3w2XRTItAl2dAwEKJ4FW+v/1mA9GaN11RSK/R0ebU=
=bwTq
-----END PGP SIGNATURE-----

--TDYaANhAGqmkt0P2--
