Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167260;
	b=xyuzMvbUnkYV9Ya5GOSzCHr54Xf9C/kwl2Jtd6gLUAtHO9sP0hDDpeS3MYF+qsXKHueA
	 dqvw0EcKFBIA07c3uoTxPhWwag0SPqWTk1rURTzAZoWt6qERlJKPPH0PuMGGhD1lf+HDh
	 W0eqJkp/5qIWjCGmQhKfkPCcRmamf1xfXet0077/AW2WZeKMV5j7bOR14aNk48XfxnhSB
	 fRg8IQB7oUuv0yjE3tVCUTj91n+zo4QS7rmHRcEMRif/fAidot7xR8ABMbw4h0EaZjLla
	 LYCZ0+qVsZMtDB3WV1FVoOS2kwD04gXmXWFHeMKyY/725xQcrzTM0hKJ2vDhiB5888w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167260;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=cm66rIDm0mspQZkDd07/nYM38ZnF3/ekQp9ChnXHpk4=;
	b=JCzmCKBGDqupMDhYA14eelV3DDmNID/yJ90/JAj0Tbf2O+7wbEHi/Y8NKFV/PKy8TReB
	 WJiM55ocvnnMyYyXJyKA9QfIMJjo4LdfTIOfo57DsHRohrvfeW5zA+wWKIqdUU0YpCtAm
	 7WuxvDQcMRdZSK2kIlkL64fAnyeU9zWXY62Xco0HwLme65t3aDujvcH4pcd0eVjyWl4HN
	 4gCYXFs4xMNCHvk2ot2evKc5kZYqh8+VetU9qbrk1rpNe9swVa4APL16mIhh3fFna06Js
	 t6kZv/admwYlK4BoMUThhxNIfIApL0N0LV/vB0gmh3LlqYi+OdljYWyfjmoFMyxtaXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=EYfbxfWc;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C846606A32C
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:34:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C846606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=EYfbxfWc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=cm66
	rIDm0mspQZkDd07/nYM38ZnF3/ekQp9ChnXHpk4=; b=EYfbxfWcu9Jo7SpjGnsX
	HqFU9vohB3/40LCwE0O4/pYOAXqwoztdZxpdU1iPcYpiR8HSJpNfTefJiETTeO83
	VJm+sX8kUj51mJM+H75N7htaWItwTXLrw/Y+jLZi/Cns/Kz8XrMADMrHW9OYqFhB
	xyMQmm5fo8KHOte3sln7SgYNBuNUgowgd9/ZWbf1RepgVbFPyzt2EgzgieP7++/M
	jmCv2gjh+cRxVBqaGiAi2niKBoig6ZMYG/vNReNseMxnWSLrapr9s7jZKFtax09v
	J5qqDYp3FAgORaz+upSOq4vXlOT/0EHORBceo30RknlWCIaJmiQU71QG4utjQL7t
	EQ==
Received: (qmail 1417621 invoked from network); 20 Nov 2026 10:34:16 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 10:34:16 +0100
X-UD-Smtp-Session: l3s3148p1@W8ul8rFgZt4ujnuU
Date: Fri, 20 Nov 2026 10:34:14 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 6/6] ARM: dts: renesas: r9a06g032: Add resets to mii
 converter
Message-ID: <awAUFvXzkAlHMOsw@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-6-feee2bb28bb4@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="0VmP1Vxr58+Mf2ir"
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-6-feee2bb28bb4@reliablecontrols.com>

--0VmP1Vxr58+Mf2ir
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 19, 2026 at 09:57:48AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> Add references to the resets in the system driver that the miic needs
>=20
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--0VmP1Vxr58+Mf2ir
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAFBYACgkQFA3kzBSg
KbYx6w/+LrrsV2Dv4U+RN4ZZTaWUZoegihR9ijHXb1Y+KgI0n8aHjlp0SenehE/K
FZaPUJEGMx6Dk2MmIU4IKHqjB9oC02IS0D7T6GRzPOTaHpXg014FQhVOXDDMOMD8
wruMfqvaxyIqolSxfSWuAcvAPtJKGfR1Tw1MEFhmNfPZFeN0ChNni4UHNabWB/xK
67ySya+itOctg3LnB0LbZBMjjHzBViagNsXTLsxzAZx8glCPsrs2FeWh6n4yFRyo
VKhvTZRD6IxIn2jy9ijfLZ1z01/3u9mz0CiXBqcduL5UXyMbMhhUfpcuzkgHD2Ti
IY+ZTqnql8kGZ86HaAsYMM2jCix3RlcI0KwrJBq0ONGVJe3DRiyN50oW5PTzj9xM
jLJ9MGs2f/sq1AnMZPIhon1SLNuI804tEWHEjlXYSzzwY6nSyZa1cIe4vNJa2pJp
8ugxKOGg9UZmfshjiJjyVrFcOJWYxYpwjsSmzio38qYloTJLhjnYtfhvt4J05pVa
BA4hm/+CauVkreBEPXuY2zb5uHB4h3cDH1Yb3R99+BOrIAKceYEn98ttnY2hmbdD
q4mVsx+8nD0QwtmwLinqdCHzI6K+iF5/VNiTGtt8ylj29hAkhiFS22LWwTVErAku
H7I5Us6IYWf7KVI6hVw7rI8XYUok5xu2XWfw/EAZrJs3L638d2M=
=0QzY
-----END PGP SIGNATURE-----

--0VmP1Vxr58+Mf2ir--
