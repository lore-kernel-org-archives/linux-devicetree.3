Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795662341;
	b=X7gRLKHbMHbFgNh/r5V9edZw0x4HnB8fqx2nmS5CvyqKc8eOtZisnm7yFtjiTFmJ7KBc
	 BzC2wMXmgPHjKMzJtbwOMdCfnXZyDB3vtggv7CYx2MDenmeuUdEi6dh7yLSjrdFbSxYzv
	 HdE2x3bzisCkloKb2aLfsf6dYpJT18F2+Z+dm3e3IAdJrSAF3ChGI/WdBiblQnRW2MSEi
	 386EaCtyLtJzCAVxbA4Yda5Xd9FX1LaDGZtQZ7eDBsUguLNSHGrleK5FLsrPtodsjxZPj
	 +0l6kd2egQTSmepJdPvQZhNXnxJIU3NVL95rGfHozGmYZs5rxGUHAGxgl2MMe347tAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795662341;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp:
	 X-ZohoMailClient;
	bh=h5N4OA8SQE3E9YKn3UwdCPMRzewE8UsIoK77sNRV1p4=;
	b=SjWN0/XL/FcHMPe1qkcMNqs4ccaQAnvLulFE2hN4J6wJjFOeR6zDkOr1w2VqeoYfBYI9
	 jzGXBY9afLRfqABk1kPXbkS//Mf0y5atLMxR8uFbvJM52/Lk/cXPLD7Y5i0GgAwNx3lrf
	 hCZLj9CLMJZIFuUdxHBU+dGefyScoXQaUoAmeVkVSt/7YzdqsvcNsImy5fNJGkZiVoCzq
	 kMASD8BhGWglEpA+ufMkq2AtQZ/Bu2KHPM/fiMXAuNJRVw1MChK6q6AeGb/EabL65q0NJ
	 FWicF+A5rEiG6A1+wAiQBZ6+ARL4wEwQMnlOeu2m83y/LgyMsWbzSBRYsrIrmzWGctw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b="Mn/R+fv5";
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC27606A332;
	Thu, 26 Nov 2026 03:05:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FC27606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Mn/R+fv5
ARC-Seal: i=1; a=rsa-sha256; t=1795662304; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=beLjr7bzVwzb8QTPzpm/u2lBKzIZ6PGCUZKJDIR/7RgcrGtI0U2uhHB1rkHYXJv88StPFh2lZxXR+RBsNX8bjTJFVKWnd6FdgY0Cu7aTVSPL//hEnIOD4HLfMPvMsSE92r7lr9h69tsZtZSIMhjpOy2JsEHe6gFvRIceFRzEgpc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795662304; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=h5N4OA8SQE3E9YKn3UwdCPMRzewE8UsIoK77sNRV1p4=; 
	b=T0xzWQErG6L/rAVO4NEM7P0lOUZ4x6RgcxAQrijw4GrZlQri67VrJqelTZOTgNj604x3vwM7mVWVVibxxl9KDW0UdF6SylGc4gPr2MsCiGUirf2g10OIHRIfX7GbVyMrAnF4qXPkq4KEkKirMuH3ILlGif9N6q7ffZSB/DMeg+A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: a=rsa-sha256; b=Mn/R+fv5W0ghqtGrtEFpTU1CEG0/+f70dgkKuj8ZQS1BzA4XvccmFoq186sF2J4/2HXn1ivX5b+kFxGZTdWLox2Cr4ai2QpFm4Fw1nORmyCla0+uSWfc55pGA6g3HIkAZRUHZ9lifkCArTstePNv/toUhARTMWVa80qjZPrEtvs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=h5N4OA8SQE3E9YKn3UwdCPMRzewE8UsIoK77sNRV1p4=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795662301200627.4872012453012;
	Wed, 25 Nov 2026 19:05:01 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id CDF8A18044A; Thu, 26 Nov 2026 04:04:56 +0100 (CET)
Date: Thu, 26 Nov 2026 04:04:56 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Midgy Balon <midgy971@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>, 
	Elaine Zhang <zhangqing@rock-chips.com>, Freimut Diener <f.diener@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
Message-ID: <aweeQ2McnEE6yXvY@venus>
References: <20261125-rock5t-regulator-deps-v1-0-6a3470ad1855@pengutronix.de>
 <20261125-rock5t-regulator-deps-v1-1-6a3470ad1855@pengutronix.de>
 <oJj2NKd1Svmsn320H8YWrg@sntech.de>
 <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
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
	protocol="application/pgp-signature"; boundary="qemy2mlvuv3ghs56"
Content-Disposition: inline
In-Reply-To: <962182b2-6fa0-4aaa-a47a-f78339b5d89e@rock-chips.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/295.650.59
X-ZohoMailClient: External


--qemy2mlvuv3ghs56
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] dt-bindings: power: rockchip: Allow
 post-init-providers for domains
MIME-Version: 1.0

Hi,

On Thu, Nov 26, 2026 at 09:50:56AM +0800, Chaoyi Chen wrote:
> On 11/26/2026 4:37 AM, Heiko Stuebner wrote:
> > Am Mittwoch, 25. November 2026, 11:33:57 Mitteleurop=E4ische Normalzeit=
 schrieb Freimut Diener:
> >> A Rockchip power domain can have a supply that is required when
> >> powering on the domain but is not required to initialize the power
> >> controller.
> >>
> >> Allow post-init-providers on power-domain child nodes to describe
> >> such dependencies.
> >>
> >> Signed-off-by: Freimut Diener <f.diener@pengutronix.de>
> >=20
> > Interesting that this exists since 2024 and this will be the first
> > user it seems.
> >=20
> > I've looked at the dtschema for it, and this looks really great for thi=
s.
> >=20
> > Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> >=20
>=20
> That's exactly what we want. :)
>=20
> I guess it's because the kernel doesn't include this part of the
> binding, and it's only included in the dt-schema repository,=20
> so nobody noticed it?
>=20
> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/po=
st-init-providers.yaml
>=20
> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>

I don't think that this is what we want. It just tells the kernel
how to break a cyclic dependency: Probe the power-controller before
the regulator. But things are already handled in the same way, so
the only result is that the boot warning goes away. But it does not
solve the fundamental problem:

What we would actually want is dependency tree information on
sub-device level, as the cyclic dependency only happens due to
clustering all power-domains together. But doing dependency tracking
on sub-device level in the kernel would be a *really* big task
(it was discussed at this years LPC in a talk from me and Angelo
on exactly this problem).

Fortunately, there is only a few affected power-domains on Rockchip
specifically, so an alternative solution is moving those to a
separete device. At this point there is no cyclic dependency and the
warning is also fixed. But there is a huge difference: Now the
kernel has dependency informations, which are also used for
suspend/resume. So the kernel knows it should resume the power
domains required for SPI/I2C (bus used by regulator) first, then the
regulator driver and then the power domains needing regulators.

If you just add the post-init-providers, you basically just got rid
of a kernel warning by adding a DT property that possibly becomes ABI.

Greetings,

-- Sebastian

>=20
> >=20
> >> ---
> >>  Documentation/devicetree/bindings/power/rockchip,power-controller.yam=
l | 3 +++
> >>  1 file changed, 3 insertions(+)
> >>
> >> diff --git a/Documentation/devicetree/bindings/power/rockchip,power-co=
ntroller.yaml b/Documentation/devicetree/bindings/power/rockchip,power-cont=
roller.yaml
> >> index b41db576f95de..d2b512dd95f63 100644
> >> --- a/Documentation/devicetree/bindings/power/rockchip,power-controlle=
r.yaml
> >> +++ b/Documentation/devicetree/bindings/power/rockchip,power-controlle=
r.yaml
> >> @@ -147,6 +147,9 @@ $defs:
> >>            A number of phandles to qos blocks which need to be saved a=
nd restored
> >>            while power domain switches state.
> >> =20
> >> +      post-init-providers:
> >> +        $ref: /schemas/post-init-providers.yaml#/properties/post-init=
-providers
> >> +
> >>        "#power-domain-cells":
> >>          enum: [0, 1]
> >>          description:
> >>
> >>
> >=20
>=20
> --=20
> Best,=20
> Chaoyi

--qemy2mlvuv3ghs56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmsHodUACgkQ2O7X88g7
+po/3RAAlzYSBqgLZ0niXp3v5QXc7ekGkVrhAWNv1J3U+rDhKNy7fG3mHOGg+rIP
dxa/MKFQC33DdBeTGGrmGpipUxbpSekApiWftLIvvcw70JHt7kpDAjDKQ1v/eudL
UQgMlqMr+GjVpGNNGSiPHf9iSpPF+lLl5cASvO4wopGGDitYvcJDbNSz3ZlVbrbF
ddXeuncx60pM1tKhuIg6P96ZMugn7iQBuZOvWYy89o2/Y/uFo79OQqx8EyUuwjmX
YcCJjHn/9YMi4K5O8HlaNo1aQxLDiPb22ro0ju172J7VdVo3Ok5aN7B35004OuxE
tD5xVw20QtghgtvogrB0iaESgTeupPeTImg5LTYzmETtAUAD7FGDGBIuJqZyFsmI
5Rnv7iKuhmtMi1poqCpc7S6PgzpNUVoRfhnBA5OH2i+reNsW62QJ7R6CHclBL0xn
lEzS3lD6hgF5Grmht9N8oUMI8sb8THb2/OGjlQ4LMXqVQ1rURH4/fd0GYETbE6bz
uqoSDdHBoRovFdJhMht4QPwUrXYVvt8ODzapLE9Rmzf0kDhDefiPBg19w1uolC9A
jECte6wVX33fz7LeItsy+K/DI4Ute2V9J029Ek8IWnz4Oi8mJ1fGNtohYTgsi5mj
KwXGbDQkLBeuqQJLKNkiUh+3T0SOz/UrtVTQbUnKPsW5S7r2yk0=
=WcPX
-----END PGP SIGNATURE-----

--qemy2mlvuv3ghs56--
