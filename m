Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795296282;
	b=0ySCtd8E+GwX8lN5KMUyPhnDKqtWYmW0Hq3OUIH1w69xKPL7BUHSu+gx0HzP32IWhTuW
	 Zy92O+s/pjhDP26j7BzDPpOLyMFFbxcAbCKjZ26R/OjJKl0Hfhdv0wnbhvLWY7ctU8NkH
	 ivt+pt8LjycFvaJVT7P8Vkw1g++VTchQBO31jaY4coiQFOFYiTisWKRrM9GCAZXgCcZNk
	 nw98RkgSocw5US7+OKiiQfkWqMoo2xna8L4wL+O5t2KHw5/PMG3zWmwKVegvdF7gN2OKw
	 qeE62gxe5zx7ptORkR7LuHTGPO6yAXHr0HgThzYZDic2eCt05O2TE3I2+WDV9KVXM6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795296282;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=qPv/aRybxiihzTHTiKkFME6FpgXCP+REMbbDc/0fYE8=;
	b=U/FK1f90ShMjYQx/xL/Fwb9cZJT/HyRO+iC/TUYcw5vsb49ojXnfb9eDYHnpNguHBL8j
	 GnXomyhU/73KpeilBCym9HHTWoDfbEUJyzn9BNq0dLtN7yqCHIj/wuHeKKoU7DDWBtsqm
	 vgHxXVx/rv6zHLrVKqBWvxSiPoRyO49JcHXHe7TjxPuL0t0I2wGV0pNsfcGRuEVYSunrV
	 g4uUZkx80MXxg73sBf8hBvS//lp6fBy9/Yui7jai/KpwwtF/NvERGlwFjuF+J5vNrPvcW
	 82iqcFqJ4Mhm4LNxqhTxz8gHtSoaRwEnQskOGtSuP/RpzRYaY2ghSbm7/Pr+VhnXb5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJqs8GGY;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F184606A332
	for <devicetree@vger.kernel.org>; Sat, 21 Nov 2026 21:24:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F184606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=AJqs8GGY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qPv/
	aRybxiihzTHTiKkFME6FpgXCP+REMbbDc/0fYE8=; b=AJqs8GGYNI1DF6qNJeT9
	gyjB3dc6oXz4D+Yz/Qu+w02FrCzwj8AHpHK0fH6BeLfjG77NqlYQkpC3PnjCG92A
	tGtT44cHaEKXQxziL01NLdBOJsvmclbSlpav6UUGWBRwlJmGHoHsgwOhISrn9uEE
	fIp2eXF8iUGnlgLm56VCvglKYYvAcQx/O4G/w7AmpTw0JdjJV5aHFFZOls9s7VU5
	diZ730+ilaxa6udyF0BVGbHNDiiEjL8n3yden5w4wI9YvSZAwHDs6DbP3dF2CAzl
	U1uHwNFnxnbRRDCntrrlEgmN3udg9q6oA39xHetZr2yPK7N1dCq2oo/gToOVOYd2
	tQ==
Received: (qmail 1945706 invoked from network); 21 Nov 2026 22:24:28 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 21 Nov 2026 22:24:28 +0100
X-UD-Smtp-Session: l3s3148p1@betU/M9gntsgAwDpTyYqANgHwk2rnHm5
Date: Sat, 21 Nov 2026 22:24:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
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
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awIMBj_7OLrlM5G-@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
 <awGV8BU_AfaXQyBv@maple.netwinder.org>
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
	protocol="application/pgp-signature"; boundary="fv0MbHVxiEYH6cP3"
Content-Disposition: inline
In-Reply-To: <awGV8BU_AfaXQyBv@maple.netwinder.org>

--fv0MbHVxiEYH6cP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thinking about it some more, perhaps instead of using 0 as the special case
> for "no parent", we could set .source to match .index. In other words a
> clock pointing to itself means "no parent". Worth changing?

What would be the gain? As you said before we can't update the values
because they are already in DTBs.


--fv0MbHVxiEYH6cP3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsCDAYACgkQFA3kzBSg
KbaxSQ//cizj5OOLsgYrAxaW1EKGn9YvmafR+RlvEqb8FlFxWBREKwon8e0FF3gu
2Jpvaf/tOsiK1NhtQ/eTuYRfJ89p1XpJXX0tA+oTBv8eYdCEik3NV7hBMMNAXb7G
EA/K0pyjN4k+UqvQMWP6h+WodMzFfNvLyu8aVMaNyGfC2Bjii/GKUAfJAUcR6ZTK
McT0/W4e4kvFRKJQ0Lq1vQjzins0eQhFtTDnGd9hqDakYfbKFYE6TZQ/GuiQdfuf
1+2wk+shbGWC1D1zk2kzHx+QCYxAZnNnFtF+XPtgorT6XKucDDgeeZ2A0qXpT1+z
TVL6DMGWPaC78QHXrDuh52k8IgpB9EMAPksX+GcLlHdbSwjxtbGVcg6RoyVQH+dQ
RQ+QHRgQtuw48k/SdZ6AILxxgUGGM5wWfn/xUWz7HF6kekq91GVIDraIEhpe5M1r
32mie0F8Ej8YQj5Tpc5MSNrtRRLAKDQFnd95BmRvZeM7dZtHo5ajZWiRq8BMFaix
VVJk+y6dxOXlZfm6I1rZYRnz0etxZhfYaUh3xth557wkLrXft4r5x1Gyr/G2xA9U
uh5AhXZO5WMo7H9sv6XX7KnH640ry/gJpkK4G4qcS7KrFMddn2zhFG3pDpwxMdpR
oCQzd28u2Kelvnez5qwBUf7Y/E48ehv8YgVjkAeHbFCtHVnMbqY=
=0+NB
-----END PGP SIGNATURE-----

--fv0MbHVxiEYH6cP3--
