Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830229;
	b=aTJopYZzjfgro4Bmv2KZ5p7WR0NnWhOL8x36aBpbJ0xTgE3w1tbBlbUwYM+Mqq8oKVIc
	 n3CjbiuDlGjeb7b4VfBpG/7z275pdOi37tPPIqKBRzkbneSVfNEzhVdYCF6wNptL2gK9z
	 hyrzVdQsvALRC3B8Eu+mgOzgDxlgjeBAMUi+d0ADdO+9CfV4oQc/UlUBXROH5sDHRpZGq
	 Wx5T97ujaDsYa2/TKCo1Tv3XJJAVpLoH7OOP/xGXLp/QiYgFToVMXLFu9u7HlR6mnvGH/
	 fdb72fxbMbqWxeIDKSXL3hnhDQXtY3i/TEcFk0I/D+GIe1i0/6h29KRyAJzCYexHz5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830229;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=XPQ1wIXQCkQXPiny6s36FrRzIlHdxNRjUMbMmTa47BM=;
	b=MSLemOKuNM4VRNg82QyBXTSBGw8PYp445NSwKcTurUM5m7QHPArEhRMIs3f0AHFrdrHm
	 o9nmThVDyqaSRonQ3XmmDqAeqebc3ZYZFH3cEKxeMKXcalJ3O0ljKAS6Su1GnIuOLeHmH
	 aIyF6KvSuZ9aP7MZZdBbLxJH2ga/H3RB13umuolpAQHJYJZp1YB3r0qjMJ8wm44+1QwaA
	 EddYZC6tCbMmMZ9ImH2wcmraOFGh/Ubmp+NIKcPhDoulXrkO641FJZSTGkm91psUInzbu
	 4BXNMlufF45UA9ThFyPE+wnTxADXcsjZp18KXTPyEpIeRU8fShCEB2vkCbhNRMx2vFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=e9qWIYEX;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB13606A323
	for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 11:57:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB13606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=e9qWIYEX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=XPQ1
	wIXQCkQXPiny6s36FrRzIlHdxNRjUMbMmTa47BM=; b=e9qWIYEXxZMCm4mjbaNR
	tIAuQ88fKvTqH2QXOgyN+ul9rRhg8zCINmvw0JrCYMVcuLesFPYJPV7n/AlQ5Nh5
	l13ZH1zIYMg8Ej612P1Cx8ds4HMmJuTccH+O9Z5yYcDO/AN/YuEtCS3gHo6aKxAo
	3Hym1+hpIRbccoC2k0uPKclf5drzr3x9cUC4bUbCZMAQZqcqich9RkCuzzAwTWmE
	Kj0cYhJY774UDulZ13WJlzrvYRxQl1XuxUxYDcIvBZXikVLuo6vEFr04iNDc91KY
	mP75UbhLQiocWrytPsAhr/za892hAvl9/HQ1/DWC/UcuYOw3nVL2l/FOBWn5vFIz
	jQ==
Received: (qmail 1270761 invoked from network); 16 Nov 2026 12:57:03 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Nov 2026 12:57:03 +0100
X-UD-Smtp-Session: l3s3148p1@WLLmeWNgjMgujnv5
Date: Mon, 16 Nov 2026 12:57:02 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: renesas: beacon: Increase sdhi speeds
Message-ID: <avrvis4phg1v-Uxw@ninjato>
References: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>
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
	protocol="application/pgp-signature"; boundary="KhGI/zD6So15lITj"
Content-Disposition: inline
In-Reply-To: <20261116104427.5152-2-wsa+renesas@sang-engineering.com>

--KhGI/zD6So15lITj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> [Severity: High]
> Does enabling mmc-hs400-1_8v here break eMMC HS400 transfers on
> r8a774a1-beacon-rzg2m-kit with RZ/G2M ES1.3 or ES3.0?

Dunno which ES versions this SoM can carry. I will drop the relevant
hunk and leave the addition for a party really having the HW.


--KhGI/zD6So15lITj
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr674oACgkQFA3kzBSg
KbZJIw//akK9tTqEjgihe5aLlFrEUl5fXdImqi2/3bHhmA7T+M56aYeqy85ii1b8
ct0HDw2/tSkX+tm2Vc/ALoPrp89prWvXQc3cat9SJzcNHJXnUF/rn7z2kOEMBhn4
Aab05/Vw8VyQszUJSJqKVAPVtXCKgP724PxHCoIvjS5rsSXsYn6X7SpRHkLd1koU
pOO+u0B/S//ijlzrOuizCdTDo1uTppuTDAM1DyDAC+5R1yZP7h551ycOmlLftkuc
1SZXXG2uRBLJK8ZQv8bxO7EbLW/zadLCTYPyeAGmGlUSI/6FM8o3lzGYQtNhUzvN
xW5+tVbnqQ95bRKNZDbfZoCFc9PhTRGIkasCFcdaS0Lp4I3uKr7CJ9PxeFNv8dv5
FR1HbYC7dacT618o7KlgeZ21Ry29UbcvrJbgrroYA8ykZUN+gBwTO8CR1EP8Xdtd
nFRPNjqNuQSdMXMHBdSGgOU+CQHdQwVN5e/88YSVw3dK5Zb3P4Qj1nslvrMgdbLH
xnyKDBGTKlSeoC2cBG1ILql7c3yrpHeIUbjVQxAN3x8VB77LtRyEfhdYUJPOqpHP
VLJX1hAFeAz0CKXs78qZBv48fKSvgUH3edld1dDG+fqbh7m4A36uKL04/wLdnQ/W
BUNinlyXH+hJxgyYJPbvC8djUD5jvET8qM8ndiNCYDAYCdr0J10=
=ACCe
-----END PGP SIGNATURE-----

--KhGI/zD6So15lITj--
