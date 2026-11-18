Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003555;
	b=1Lr6s7CUQkQvaOiFJRQu19qvILJZLX/QBo1HoBVmngIbJMNCAi9PfyX6YBDqH5mj30LW
	 BgF71N84R615oX+ro6UVvV42CrOblNzim5wFa5Vsa67y+eNEWF9D1o/iv8YZB4XW07LE2
	 abjWkVbGu8bN7/D4FdCUvw3jDwOzanAjaZXLvr7ef2rsUCwVIGDoLcLDKI036QAMxPDyZ
	 mxI2ztaRRL5+EZaGWZnNbZpt5/JBxCxDrUCmUavUJoIS9RU6ff/eBDv9/+xztKbHGfMqO
	 1hc6UDNX0CjikbABbXFddBGwg4hdg6FeLmfhcjlXf/agByYB+RjXdnctTPC8q6A5eJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003555;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=0IHlYdsqTI5Vrn8R2+GHJnZCm0OJrTKPeh3UrUb0Leo=;
	b=c/9ELls7Tdju3qkJcgfvM7I4Ldk5PFUu70EMt80POoi8V76mfFyPM9/fZcks3gFGcEqe
	 X+reYHwn8ONoTCwZuc9naYp4mXRlFngVQmxiKx7dIdO5QBv91T6SNWJY9PCalR8Lm7i/5
	 DfE7ufAUVocTU/gwNlGG4u80ZScZtiQCe4MI+H1U4CCjFLXU+y43fxiSbnXRkEpCn0quK
	 4c6E6N8XaQpEyTtO/EwwcEB/hhyJj9uHKRBqrb8cFRlviZY1iPW8sU/+5rZaN0OXJ0j5+
	 COuFfyVl9ab2rrexhl2SwSaU1J4gbBSgm/37GhDHoiAmeamxWTE6XsfpewO3Xdagz7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=l1h30wly;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC237606A320
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 12:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC237606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=l1h30wly
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0IHl
	YdsqTI5Vrn8R2+GHJnZCm0OJrTKPeh3UrUb0Leo=; b=l1h30wlyh8A1A4Jhon00
	hyCuaYzRncPsqgErLDMqr0ywnaaS3MZiCnHEsxlgSWezsjneZDTrB9g2ivRLcD5j
	RTCbT26GHVsKqy1/IjCTVy9bmf0qCceMfGFh6g96KuexWuj7BPD7Bd+EnIGHmZxP
	HholVtFSre9xDr2DuhP7DR/GulfupM/n0mNam4DlbOqsCAwVvm7utIUDBj5F3lDQ
	ell2I7T4yjjJjyev5qXvXylFF2acYCqyHZrZTf+37WmZGShBphUvrnfMYtVLTHc8
	sFyVJF32IjrM2lGGYg9AhFvKd0XGp7eLUxsTDmEdd6tOdzI7mMpY6wQUCdpVXGZl
	gA==
Received: (qmail 645122 invoked from network); 18 Nov 2026 13:05:52 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 18 Nov 2026 13:05:52 +0100
X-UD-Smtp-Session: l3s3148p1@oesT1YtgnM8ujnsi
Date: Wed, 18 Nov 2026 13:05:51 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Herve Codina <herve.codina@bootlin.com>, Rob Herring <robh@kernel.org>,
	Luca Ceresoli <luca@lucaceresoli.net>,
	Andi Shyti <andi.shyti@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	=?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Jonas =?utf-8?B?U2Nod8O2YmVs?= <jonasschwoebel@yahoo.de>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 0/2 RESEND] i2c: muxes: Add GPIO-detected hotplug I2C
Message-ID: <av2Ummom57XArTHd@shikoro>
References: <w3bn5bqxqjhf4uvxov47rwlvmnbic6xnlk25xbpnbmi2eyup7q@tjuiu7pl3mmo>
 <CAPVz0n1-jN5WLFq4e0CZrneExrN_A=GNeGTwGHTCj14NAta+jQ@mail.gmail.com>
 <aPCfiJxyKOXsgNJe@shikoro>
 <20251021132529.GA4133357-robh@kernel.org>
 <CAPVz0n3jt04xEwGr1aiDTJ7OonYYgOy3QneteLXgdGruXGMP_A@mail.gmail.com>
 <20261118091334.3d51a5f0@bootlin.com>
 <CAPVz0n3=rL9jVc7DtG9FmcH0zs11+LXg1+HRRf9aagUqZf=+_g@mail.gmail.com>
 <av2Nb_likDLz1u2c@shikoro>
 <CAPVz0n2rZSRAz2NJsPUXYncgEAi9cFGM0ApfarFq5uMoO9LqsQ@mail.gmail.com>
 <av2RdnZofdcdU_td@shikoro>
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
	protocol="application/pgp-signature"; boundary="08h2Nl6XlzaOP5VJ"
Content-Disposition: inline
In-Reply-To: <av2RdnZofdcdU_td@shikoro>

--08h2Nl6XlzaOP5VJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 12:52:22PM +0100, Wolfram Sang wrote:
>=20
> > You are very "helpful".
>=20
> Yes, I am. And I am "honest" and "experienced".

You might try getting Hans de Goede <hansg@kernel.org> in the loop. He
is way more experienced in getting support for broken / strangely
designed HW into the Linux tree. Maybe he has an idea...


--08h2Nl6XlzaOP5VJ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmr9lJoACgkQFA3kzBSg
KbYUPA/9GAtQMCMej5RYs9mVr7dGMYAObTKhA9H3axj/WMiuVqyx+DRvjAqQFXj2
pCahYPdLRRIRFkxQfVnkYaNn97rAg9x4hydELiflOb8Xls0azptLht9nwhuELs4V
NBgxXs/8IDdZ22CHsb9mUB0spQXJWaCuRnXLYy8cenUFwG95bi6A+i23VRVCJKqR
rcwvkpmae40IX1AWGtqpoxaBh++s+qJ4FBJoWwH6Qli85OcrPUyBw3JbQXStPMTi
9z/8EDypaj0eNGOoknMofmXR9w+OfzlIwJR90nyZR2c9e7I2fkSI3HMRPtl5Ier8
scShqoIOZemgGwCgaOOxbLPI/L4xAS9vivvgGk7QPXqJpD6PN3+kzSaFhteew4mf
QgW3Xn7maP8uPveelPI4Zl6g7Zzn5nBLa+vDViomRK0Y2A6UC+cQpgamLVoyZ2EZ
T+BiBBg59MDfcyscEBBYKOPzK/d7I0P87sdN+xA90XWYWpgMhwj7u4xYo8+7HAhF
sVnBUN/7L4ckoKEvHBxWJ2pLo8Svu8B05L67x8dRhb1dFpxp/9ILmeWaxUEnyYzQ
OunwhsqUYctMwQNIPhAoEDNf1LGiHe+nqNKEyD8muw5+xVN/ND4UKAOaSfAhSvLv
0xZdOogI/aiH3cPuAal1QIk06Kr5kjwl0ga7fi1N5dK/xEmZPIQ=
=OuYR
-----END PGP SIGNATURE-----

--08h2Nl6XlzaOP5VJ--
