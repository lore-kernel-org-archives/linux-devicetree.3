Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794997625;
	b=G0h2IjpkqWLnFbkFfaw0aa9ANK5241zWQbrDYOd3YxMOzAzxX9YJnnA7WgFxyr4kU+0u
	 kfKU8F4vtwrppa8jm0btIJGznS7tTfjELp2TWfJRQ8PhAOgWDszE65YKU55FoAZ0YmMJa
	 ehjF7qc9tHoyoQlwGQA1aCZh8pWrQmkJLUGiAaYLLVjSwiJFzCmswpER8/m5IdP5vcKV9
	 M/KepSXrrpoEPhzBu65iqpBp8przx0TykM6lvOKa2lXlcfTt9WZ/AaA1kDRhESNLkpCS1
	 vh5aad6dvBv+Z+3HO2bSsZGBrOVWjzEqQomr3qRw94CaoiSnWdtgRSb38LD6d5ZeX8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794997625;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=i9D3FjkLfYPSTdei45bQlEx7WvqZqfPDZxNohyDEg1k=;
	b=QQPgfFPSV6XNl1uDjE8AZbq4qz8bIirCzqCO07CiZPgkUSesItMBCmOOkGU1qoh6zk4m
	 XMenCY0Q1mhCiQnqWYGZ2x6rDhKUR0JNQ7f8/ihNien1Vkz24xFkBHgOZaV6BhOigBpUW
	 ZtsQMu+U569DDVl/vyA3t+BLxshiHvOS0FNABv84b3BlHknDhE6F1zCDKE5WvrboT024R
	 kIk16BuR8YlbMz/wgo0Ub1ciYYF6NFKOExy4FrH/dHWP5ZEm3Za/0Z6sNBos1Ysijxlg8
	 aX/FQbTk4toigUo0kTNMo+Hsn2TEp3KBr5U9zAiocCH8iHzGOHXwwweaq3Q0MF2elaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=aRTvwNsx;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D3D606A32A
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 10:27:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87D3D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=aRTvwNsx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i9D3
	FjkLfYPSTdei45bQlEx7WvqZqfPDZxNohyDEg1k=; b=aRTvwNsxNWSIAQKnbg8y
	CREq05UiAMceZGfiRN20p7OOOml+GunXax3jFBwsGP3H85Zs6Bt1HERjMxhA+L0z
	h3fWiLM7ISIHhK+BDsaH977cujSzjLGgqivalts34j59dnQ1rfz01wgv/BaSONgU
	cof2oFyLY72SHwVc5REEFSKCRVGineSB/xYqHL3QLBbRkliwaAKasuMFemxDdu/D
	pd1B2T9TKEmZoRH9GEPohMX8onrO9x6Gnm70HdcfIRlygq7lv3zSDQcmZJdy+1Fz
	+FiBoqIb7mQKGl7wQajfSXqfKefAqXJ1hYH6GNk7ouH0slyVpl+a9HFxbOEPuDzQ
	ZQ==
Received: (qmail 613653 invoked from network); 18 Nov 2026 11:27:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2026 11:27:02 +0100
X-UD-Smtp-Session: l3s3148p1@K7Cjc4pgZsoujnsi
Date: Wed, 18 Nov 2026 11:27:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Louvel <paul.louvel@bootlin.com>
Cc: Borislav Petkov <bp@alien8.de>, Tony Luck <tony.luck@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-edac@vger.kernel.org,
	devicetree@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v8 3/3] ARM: dts: renesas: r9a06g032: add EDAC node
Message-ID: <av19dZeraUiSEzyi@shikoro>
References: <20261118-paul-v7-3-rc1-edac-v8-0-ed791084cc19@bootlin.com>
 <20261118-paul-v7-3-rc1-edac-v8-3-ed791084cc19@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="VBm/YAgMbcVHdp09"
Content-Disposition: inline
In-Reply-To: <20261118-paul-v7-3-rc1-edac-v8-3-ed791084cc19@bootlin.com>

--VBm/YAgMbcVHdp09
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +		edac: memory-controller@4000d000 {
> +			compatible = "renesas,r9a06g032-ddr-edac", "cdns,ddr-edac";
> +			reg = <0x4000d000 0x1000>;
> +			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&sysctrl R9A06G032_CLK_DDRC>, <&sysctrl R9A06G032_HCLK_DDRC>;
> +			clock-names = "ddrc", "pclk";
> +		};

Dunno if we still want to keep the 'edac' label. Currently not needed,
but might be in the future? I'll leave this to Geert.


--VBm/YAgMbcVHdp09
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr9fXUACgkQFA3kzBSg
KbaMvA/7B8Z4dcvBaxxcDL55zgR3FmtZ5EbUnUKeq6FHDZjiEYOVIhv2O723ghhO
QJGp2KwPBb4ahYSp0+0/w79DDSdctY5ZljsOhvRj9jFK1EgqOqoibmbWmdOY5zft
WoRWzvX5zwHaq3Wdrs3RoP3vTACIcQBOiXc+rf5gamHuG67YGQHHH23BSGaB9Fmy
76qDyCAGUQPpq3mg/yrwuikaJLT0NV+fxLTXQ54NXUgfuKMaxiiwYsCWdnehhLmN
Zz/j+/tm58sRbC/dQ4y1dB7cnbu2kNygC5j+YM6J1RvVK7RCDtA8ZbqM+0e9mipy
0sEKEImcjkrr+ADGInt916OQb09dbXFxy+37qFuOn7j6fmv7pfzBezWLRV8UY/t9
heRObcuRvus7l45V4JgeitJeASdZy+jlBblXiFnfwlT3R+JqPh3eoFiEmLXUZwKa
7iXoZzF28rO2YTNBGncZ4Jig9AoEfoDQf/8dC5Di0QVXmqunbMM1C5XeRTKnK6ij
Ad1Fr18FH6VP8om5/kK6406+yShfnGc+m3o4lOYk0Ov+oBctOf1WL4iVY7XYj9fv
l9vOpgR7HkL4BsCd+38ZnWkF4pU1NcHIIER0t9Gv/NVObnEnlCHmUzHSx3jxCgt+
n4SrabWdXl4IDZ1zIIz4zlkQZjE/GHS6VDMhgVhtcD/DbE5V01c=
=zwkY
-----END PGP SIGNATURE-----

--VBm/YAgMbcVHdp09--
