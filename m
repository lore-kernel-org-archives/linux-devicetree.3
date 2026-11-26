Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795692070;
	b=REmF5qOKQTy4DdLx/YR18SypkeGDdLNZcPjPsRa31pQiZF16brnRGaNvfZiXaJjyAhS/
	 cYFiAbJkP+JN86aiFHOs8bVkr44P4KPQlcvggIEDw2yaEg7rh+dXrZN+VlY1P/D2Z0Un0
	 KFeFm+vFb/7zc9i2WUMicn8RpIG8/+4c5rcyuqhTfX8MJQiJILl1MJs41I44voMS8T8Ee
	 yAX2aqTGRVYk8Y9rxKJhXS7QvWUhy2cwBWNeBROwzwpBcVArqeIUqU+qty2OI+gqdkfQb
	 cwHqpqL+ovcjQZfayNpjexGhFkEidPBdHUJhuVfUDRlVlhGnP+PiFwR92ci6wlnwvSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692070;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=7/hs/MVV/u171MHZfbxcW7bNCuk/hpU5mbRf0FENAYM=;
	b=Kp7zQtAgrim4aeUA4e2H08YfwVQiNZSX747487vifbUo+7L9BlCqQmnnoKx5yI3Cho3k
	 4H3wd0ZeHV4CeACXwwPt9b4E/K6YaTQoelcI/kw54ZZ5G9ACVQoyo5zMw7HY5TGBjFzlt
	 JXdaa+7mc1ZTDh3b7ZJawIE8d9JW/4EkNW/J/esEnNVMXP+fp72vxkHoOpWCwgo7o0O9c
	 E36Kf8QhJfGUL0ASWJIYJVYSUGbTNkZphXamMRIKOw6Ze8axhxjfd8qoQgTsfOAaFeACC
	 t+D8ZD2I5xALQ2SmSjDR+bId/Ma2JwOXPRfNVAg3FiykKrXOGMuyZll0OnAI3vLzyYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HR7zEAtb;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47926606A338;
	Thu, 26 Nov 2026 11:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47926606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=HR7zEAtb
ARC-Seal: i=1; a=rsa-sha256; t=1795692034; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ek+UYjxkb+O5h1TyaLaLshnnt6B2gv7GjvrcgG6alx3oahVF+7U2Y0u+FACamB7p2tsTOlmkgvuwkh6pL7BRvA7ZmT4Qq3XO7S/icKfd4TTz9iI6MFtce+wolUaKJyXBQxOJup8JiauwSOFedPguXosbfnHNIC1xeJfOGr00EtY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795692034; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7/hs/MVV/u171MHZfbxcW7bNCuk/hpU5mbRf0FENAYM=; 
	b=e6kJo3a79dT63hOwxhefU1ON8CGVopKuVjQsCadgfiXQ2CMxsfyylI7YPtFRzBeB8u/qMR7Oe26RomtQ8ctY4vSEnPkot8m1bvUYgbOzd7GcHSgaCh4LdoEL12lgqpUvv9D730OvoLRs6rvd8dJZ/6yxHSmYjU7S6YOSB01omHQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=HR7zEAtb9iE1gygNpEiZUov2cBiGoqk0uRxdjOlIV1wWvcvlnSupTQA4yiZR2p+dGX7TS4j7VbkbRk3tlFxAJHEgwQLEqt8/BEm1o3krMc8UF6ey8Bcsi9xc9uvp8hOOQ2NKEAFwt1FiMeES7flJUlkU0LBxCEUx89Tgdl85vJw=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=7/hs/MVV/u171MHZfbxcW7bNCuk/hpU5mbRf0FENAYM=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 179569203157959.58715006715579;
	Thu, 26 Nov 2026 03:20:31 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 9520D18040B; Thu, 26 Nov 2026 12:20:26 +0100 (CET)
Date: Thu, 26 Nov 2026 12:20:26 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Freimut Diener <f.diener@pengutronix.de>
Cc: Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Midgy Balon <midgy971@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
Message-ID: <awgSoZMgo-GaUOXx@venus>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
 <oJj2NKd1Svmsn320H8YWrg@sntech.de>
 <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
 <aweeQ2McnEE6yXvY@venus>
 <8733snj1tg.fsf@theta.mail-host-address-is-not-set>
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
	protocol="application/pgp-signature"; boundary="hxq6aiht4vag4qw6"
Content-Disposition: inline
In-Reply-To: <8733snj1tg.fsf@theta.mail-host-address-is-not-set>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.675.79
X-ZohoMailClient: External


--hxq6aiht4vag4qw6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 11:59:23AM +0100, Freimut Diener wrote:
> Sebastian Reichel <sebastian.reichel@collabora.com> writes:
>=20
> > [...] an alternative solution is moving [affected power domains] to a
> > separete device.
> > [...]
> > Now the kernel has dependency informations, which are also used for
> > suspend/resume. So the kernel knows it should resume the power
> > domains required for SPI/I2C (bus used by regulator) first, then the
> > regulator driver and then the power domains needing regulators.
>=20
> Since the power domains are managed by a single hardware power
> controller, would you envision splitting them into separate devices
> internally in the Rockchip power-domain driver while retaining the
> existing DT representation, or would this also require changing the DT
> bindings?

It should be possible to create the subdevices in the driver using
the current DT; there is a node for each power domain already. The
decision to create a sub-device can be made based on the regulator
property.

The part making it interesting is that all power domains are
accessed via phandles to the main node instead of referencing the
specific domain node. We cannot change that, as it would be a
massive ABI break. So this requires some extra work in the pmdomain
core code to allow partial registration of "early" power domains
with some stubs for the late domains. The late (regulator using)
domains can then probe later, once the regulator becomes available.
At this point they need to register their pmdomain subtree. This
setup also allows moving the regulator acquistion to probe like any
other device.

Greetings,

-- Sebastian

--hxq6aiht4vag4qw6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsIFfYACgkQ2O7X88g7
+pqFoQ//TJW+WHm9ovyjlgf4ZjKaP9RPRF+9OAyd0mYxCIcuD6SU61XG6V/YNfvJ
0lK7E6UINxvd2QcfHPlzJ4LoyW8X4eGctOxSaGCndYYDuK0vi2aqEncNi9+yivm5
BW+loHE3uyztrmnzeSr33AYSSLkfIQUtS25g2dt0f/OjA7Pyt1Q2ShydVBKB/qct
MAgXQaIJuL+OhvAWPqJdQUwNWxpcZANWIK8d6JCCtA5vGM044bLsfzsoKRe5Ahuk
Ya/+pETH/Aej30C9m2EmXTKw7dF675Um+OVINBX55K2DcuOtSsuzf9KpDxNbB3Z+
OyZGygOE8Vy/wdtLDd8j7X97ut6H6ASGYR1qyCBqxZynSDOE0qe485DyWNeYXzMj
N30l5y8DrD+O19leSKdyHg4d2zmcLSEHXKbuWK9GIphpDiDV1nhxW88ZWnVeZPZa
kOOLrkMsCl4rxTxNY1cCDFtGMpllmKWzRaya7iL5Rnv1rjGESC1ZJcAk6uI6mKod
L4bVxB75S4lyna9eAU+m1riizJ0qFWPkTHlZbXFg1fUAB8GEcWhey6nDyXOl1TSD
6EiVqQH2jRqSAY0REBQ9xlb1QzVuyCQSQO26m6Qwu4tWVbgko/sBtJ5wIuRXyhYG
sxRH8oM6CM2ok7DIbiiVf1cXC8xo8SieMQYAtrFjkP5xOFa3lbE=
=5BFT
-----END PGP SIGNATURE-----

--hxq6aiht4vag4qw6--
