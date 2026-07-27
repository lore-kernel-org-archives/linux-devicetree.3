Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2BF3C13E3
	for <devicetree@vger.kernel.org>; Mon, 27 Jul 2026 18:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785175890; cv=none; b=fb6MJY3DjsINeyKNcJwg2Gx9gZlU43aMrBSWh/2U0HxtS8fAvWWFKM0QApU/85U3dbn6JdAF8WmMV3VsumAcTV8zeMjtbPBaWa2lJr+PrSZTNWyB37J2lHoBglPArJcaVkE52gdePQ9B8kbHb7Q0tth3Qa+cVdlcuVvOvn+iLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785175890; c=relaxed/simple;
	bh=uYbgIhsYMMsmXG16wVyVWhQ7XkyhUI+ShGreVWqmE7I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ei3aoyzUuudONeFxXT0dXyO+Nqu8vVcrnoRo775sZVV4Hpnc04firf5RwjX7PFPvK6Ft2qAdnCmUe7pgpZdFdQAJriK5Ebj218VZ7n6uATcABIB+gRKH/gXyKF6R6ZMRXKdJ98kA/aMbv7TVFmvxMOa/4jPq/gCAMClA6mHULto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c7twVte3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c7twVte3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C3D1F000E9;
	Mon, 27 Jul 2026 18:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785175888;
	bh=i9HrDsbVDM1uhspQpxqKrYx+bjGaQcr7XyP1uU+lbqw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c7twVte3wgmoRW90E+tqTyT4NrQ7qaqNV6b6pg0QjdRIrdhM+ItB15unaxgLJe52P
	 bg+MNeVuo7fApSX7ZlveD6ECD0EygBq9vT2wlh0ZvP2uu6ALgqa7spe2B0pvAUkTsq
	 RJXVZfJ/u5JTrjasbw3LlvG8MjQ3uC8L9O6cyPgWJXZuLcZm9/Gh7P/4MpkQzozAEy
	 yhvgqYOoJuqXhAsy+WR4GegNuohHKaB/mc/oqKM5Vsn39IVZgQFXK+xyEyErjIA7Ko
	 mvgk6+CSpwmSiLg6RYXJXPnPvrfQ+tUHdpCbehFhY6j1at4IE1KlHTbOQhGueNrsdx
	 6TAwgTqcYXj5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 29/35] pinctrl: airoha: an7583: add support for olt
 pinmux
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mikhail Kshevetskiy" <mikhail.kshevetskiy@iopsys.eu>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260727174141.664933-30-mikhail.kshevetskiy@iopsys.eu>
References: <20260727174141.664933-1-mikhail.kshevetskiy@iopsys.eu>
 <20260727174141.664933-30-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 18:11:28 +0000
Message-Id: <20260727181128.A0C3D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly added `olt` pin function does not mutually clear the con=
flicting `pon_alt` mode bit in the multiplexer register (and vice versa), w=
hich can lead to hardware contention on shared pins.
--

--- Patch [29]: [PATCH v8 29/35] pinctrl: airoha: an7583: add support for o=
lt pinmux ---
commit dfa91fb93c20433233178722bd1f6d37b1ea9b99
Author: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>

pinctrl: airoha: an7583: add support for olt pinmux
   =20
Add support for olt pin function for olt pin group.

> diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/ai=
roha/pinctrl-an7583.c
> index 7e94dcb3b61a5..74f93327d41a1 100644
> --- a/drivers/pinctrl/airoha/pinctrl-an7583.c
> +++ b/drivers/pinctrl/airoha/pinctrl-an7583.c

[ ... ]

> @@ -648,6 +652,19 @@ static const struct airoha_pinctrl_func_group pon_fu=
nc_group[] =3D {
>  	},
>  };
> =20
> +static const struct airoha_pinctrl_func_group olt_func_group[] =3D {
> +	{
> +		.name =3D "olt",
> +		.regmap[0] =3D {
> +			AIROHA_FUNC_MUX,
> +			REG_GPIO_PON_MODE,
> +			GPIO_OLT_MODE_MASK,
               ^^^^^^^^^^^^^^^^^^

[Severity: High]
Does this mask need to include GPIO_PON_ALT_MODE_MASK to prevent hardware
contention on shared pins 36-40?

If a bootloader previously configured the pins for pon_alt mode, both the
OLT and PON_ALT controllers might be routed to the same physical pins
simultaneously, because GPIO_PON_ALT_MODE_MASK wouldn't be cleared when
applying this OLT configuration.

Additionally, should the pre-existing pon_func_group be updated in this pat=
ch
to clear GPIO_OLT_MODE_MASK when configuring pon_alt, to prevent the reverse
conflict if switching dynamically from OLT back to PON_ALT?

> +			GPIO_OLT_MODE_MASK
> +		},
> +		.regmap_size =3D 1,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727174141.6649=
33-1-mikhail.kshevetskiy@iopsys.eu?part=3D29
