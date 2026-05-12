Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E76DA383336
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 16:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778604562; cv=none; b=BFTld0Cil3eQG3m0H0f3nABHTDercgUH/bO7BpRj+iKVzTFoUaPIrRsyoar46s2Hi8fDbWLHiOoscd4oCTyoGuG31SxRxW7xAaEAbjTFP2OTRj2I8cZQ6O69LR9kqOnhd4bCdQcJtYpi8ZayZhyJtrAzlr5rPveG+6kQjS7XARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778604562; c=relaxed/simple;
	bh=vvYMQHdBZEqGzBawmr9Gw02WHVWC9PayzIDZ5dyRHng=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kxnm1kw4aB0AtuYyrxpS5xiw8B/AdxOUuYrDzabBxUYTtBvWNmCr/ByGeuZe2ISQBzLb3p2dDnPA9amlzIAub0JJT0WpJddRPybr44Ht0LooheAF1XeTLJc4JQlbYlVgvTtr/lijYhJ6hzJCuC0TGgTOxKvquw9ycP78lGUOVoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJ4sF+jC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJ4sF+jC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48017C2BCB0;
	Tue, 12 May 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778604561;
	bh=vvYMQHdBZEqGzBawmr9Gw02WHVWC9PayzIDZ5dyRHng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJ4sF+jCApAHi+fcoc4m5jK1MV1/W4U7OWT7fjskKKlypFOZYh2TcvpdPuKvxed/b
	 scsVFb+T3ZFZgkNoB7r3fPB3I1rMwv8EnTVVgCLmhXnLvzvmP3b/EgN++yib6tmAkZ
	 7g7ZjjlfhXW7b9hed+zUmVcQ5XVfe93ylni8jx7ub1E9SQ0suT7xpw5/w7TaAH4Kv+
	 DnqzWpY/h9Z6vHLT3kyG/Ma6ag4BgZ9VVRQjfSevL2ShY/ty6PAqZD3Co8BJ5VsyVa
	 jpIV5XcetdR1gEiVesxRBI+txoGtsi3e7SjLBt3Qvh1WetvPbM2IYqdarWljFgzNLi
	 4gtkvhf1I1qWA==
Date: Tue, 12 May 2026 17:49:18 +0100
From: Conor Dooley <conor@kernel.org>
To: sashiko-bot@kernel.org
Cc: Alexandre Hamamdjian via B4 Relay <devnull+azkali.limited.gmail.com@kernel.org>,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: add Rohm BM92TXX Type-C
 controller
Message-ID: <20260512-sighing-riverside-d9a1aa21a385@spud>
References: <20260511-bm92t-v2-2-2145e4f4386b@gmail.com>
 <20260511220506.C54B0C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75cVY2nGM3WcKa9n"
Content-Disposition: inline
In-Reply-To: <20260511220506.C54B0C2BCB0@smtp.kernel.org>


--75cVY2nGM3WcKa9n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 11, 2026 at 10:05:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
> - [Low] Missing type definitions and non-standard unit suffix for `rohm,p=
d-*v-current-limit-ma`.
> - [Low] Invalid Devicetree property naming with underscores (`pd_bat_chg-=
supply`).
> - [Low] Use of deprecated singular GPIO property suffix (`rohm,vconn-en-g=
pio`).
> --
>=20
> commit 482fd67d1e5e9ceafc592495c4e2a23d21e35b0e
> Author: Alexandre Hamamdjian <azkali.limited@gmail.com>
>=20
> dt-bindings: usb: add Rohm BM92TXX Type-C controller
>=20
> Add the device-tree binding documentation for the Rohm BM92TXX family
> of USB Type-C and Power Delivery controllers.
>=20
> > diff --git a/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml b/Do=
cumentation/devicetree/bindings/usb/rohm,bm92t.yaml
> > new file mode 100644
> > index 0000000000000..007f70a8f5bb1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/usb/rohm,bm92t.yaml
>=20
> [ ... ]
>=20
> > +  vbus-source-supply:
> > +    description: VBUS source (provider) regulator.
> > +
> > +  pd_bat_chg-supply:
> > +    description: Battery charger regulator gated by Power Delivery sta=
te.
>=20
> Does this property name violate Devicetree naming conventions? Devicetree
> properties typically use hyphens instead of underscores (e.g.,
> pd-bat-chg-supply).
>=20
> > +
> > +  rohm,vconn-en-gpio:
> > +    maxItems: 1
> > +    description: GPIO controlling the external VCONN switch.
>=20
> Should this property use the standard -gpios suffix? Even for a single GP=
IO
> line, the standard suffix is -gpios rather than the deprecated -gpio.
>=20
> [ ... ]
>=20
> > +  rohm,dock-power-limit-disable:
> > +    type: boolean
> > +    description:
> > +      Disable the lower power limit applied when a dock is detected.
> > +
> > +  rohm,pd-5v-current-limit-ma:
> > +    description: Charging current limit in mA when 5V PD contract is a=
ctive.
>=20
> Does this property lack an explicit type definition? Custom properties wi=
thout
> standard unit suffixes require a type reference, otherwise schema validat=
ion
> will fail for integer array values. Also, the -ma suffix is not a standard
> unit suffix (such as -milliamp or -microamp).
>=20
> I see this schema validation failure is fixed later in the series by comm=
it
> 315ea48f16e75d9fc77bc6e2af87cacc47b7249f ("dt-bindings: usb: fix properti=
es
> type").

Properly suffixed properties should be used instead of making some up,
but also patches in a series that fix issues introduced by a series
should always be squashed..

--75cVY2nGM3WcKa9n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagNaDQAKCRB4tDGHoIJi
0h44AQD85f6o3zmGHW/2f46gxQ8O82uDCrcSP9XMDAMGAdSFBgD/dXLNMqL6eMB+
WPoPX7eSAvh/78u7A0SwD4PSMPRvvwo=
=9HAC
-----END PGP SIGNATURE-----

--75cVY2nGM3WcKa9n--
