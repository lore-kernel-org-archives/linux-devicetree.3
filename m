Received: from sender4-op-o11.zoho.com (sender4-op-o11.zoho.com [136.143.188.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018B23537F6
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780953636; cv=pass; b=EsfKHg/olfphHMwSTWxUt1FwCtYZ/PFE8zS0bbzb0C3y8t7x/W1gqCgGwx6o5Ep5FmKdP6MBs0EHJTA+2fqVmb7fHAr+EfluMdKVjW1I7z1mKRlEq+8/ibUG+YsbDz3VEJpzeA3xM++1tbs3eMb8GbyIzgB3bbU53PChuOPyPpk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780953636; c=relaxed/simple;
	bh=Fbq3L9uslUZP6/MxYkNop66Bc4o36H00ZRlvwFVzCLQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gOwcbvk4FWKjKUyhL5aHfRS2tqk7NLZ8opCo2pRddcfGQnVLp4J+CdXRbp61TNvMZn4hu1UZdmp9Ym4MTIImoh9JBkvJj6/OgjvZRxfOOon2OG3UiQZjBWEtsmWeufy84Hi1WJgC7tpBfTnPpEtrPe5Yio1ogpxboyWv/VfXuio=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=KZW2Jf+v; arc=pass smtp.client-ip=136.143.188.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="KZW2Jf+v"
ARC-Seal: i=1; a=rsa-sha256; t=1780953606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jG263+DS9Fw87K4TA1LVvSQ3CZfSIbUqza/lKyY0kZ2S4ElrbRwDA96RZg0kCoe5spvpW0mkcVttUg+omXpIDFpDaMynvEOxU+WQvtnVMU/n++oOBoKfPLSavRBXxLf0Ce/nWyunfDfOy0IIUBmvP6m/VdwqTT/LOdBE2El8yxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1780953606; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IQjvXllQJscKn7i+I8ubhM+/AQ6Ry31b6cOUj9O+wgc=; 
	b=LcbRC4uwRv8P29gQAJ/ug2fZjjFp+tFGVMcmRU8106J8SpCuGCP06P+svfwxC1j7lh6NYQwiKNInG3jYgDI4BtGQxjdZH2P4GDrLTUeIolpHQ46xf1iQ27tjcj/Pol7/E/H78Lryj1KxBOvG7a/s0+UFz2fkNcAiQQRqRwhZMkc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1780953606;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=IQjvXllQJscKn7i+I8ubhM+/AQ6Ry31b6cOUj9O+wgc=;
	b=KZW2Jf+vXOkFIASURHjPh/X/dSiiGlAn1x2ghD3lYZQB00/52cSvS33lxyMeIx3y
	i/ptQk0anJ4+AYPchEvxHK22DeeVgi0vwN+YZhklFOr00VNefdwSWMKp0dYrD5QH1Oz
	ICnu0utgu4dt98T9rahDvs+ejrDZdohNWefJNVxU=
Received: by mx.zohomail.com with SMTPS id 1780953604718869.7760144683933;
	Mon, 8 Jun 2026 14:20:04 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id B0DC8180380; Mon, 08 Jun 2026 23:19:54 +0200 (CEST)
Date: Mon, 8 Jun 2026 23:19:54 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Chris Morgan <macroalpha82@gmail.com>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	xsf@rock-chips.com, simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de, 
	mripard@kernel.org, maarten.lankhorst@linux.intel.com, jesszhan0024@gmail.com, 
	neil.armstrong@linaro.org, heiko@sntech.de, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org, Chris Morgan <macromorgan@hotmail.com>
Subject: Re: [PATCH V6 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
Message-ID: <aicv4neDA5Ke0FAB@venus>
References: <20260608175521.67449-1-macroalpha82@gmail.com>
 <20260608175521.67449-3-macroalpha82@gmail.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jdqx244eltbi25x2"
Content-Disposition: inline
In-Reply-To: <20260608175521.67449-3-macroalpha82@gmail.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.10.1.5.2/280.943.11
X-ZohoMailClient: External


--jdqx244eltbi25x2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH V6 2/6] power: supply: sgm41542: Add SG Micro sgm41542
 charger
MIME-Version: 1.0

Hi,

On Mon, Jun 08, 2026 at 12:55:17PM -0500, Chris Morgan wrote:
> Add support for the SG Micro SGM41542 charger/boost converter.
> Driver was adapted from Rockchip BSP driver [1] and confirmed
> with vendor datasheet [2].
>=20
> [1] https://github.com/rockchip-linux/kernel/blob/develop-6.6/drivers/pow=
er/supply/sgm41542_charger.c
> [2] https://www.sg-micro.de/rect/assets/1e8de70b-657e-4156-be68-a64fdbe8e=
418/SGM41541_SGM41542.pdf
>=20
> Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> ---
>  drivers/power/supply/Kconfig            |    8 +
>  drivers/power/supply/Makefile           |    1 +
>  drivers/power/supply/sgm41542_charger.c | 1057 +++++++++++++++++++++++
>  3 files changed, 1066 insertions(+)
>  create mode 100644 drivers/power/supply/sgm41542_charger.c
> [...]
> +static int sgm4154x_set_recharge_volt_ua(struct sgm4154x_device *sgm, in=
t recharge_volt)
> +{
> +	int reg_val;
> +	int ret;
> +
> +	recharge_volt =3D recharge_volt / 1000;
> +
> +	reg_val =3D (recharge_volt - SGM4154X_VRECHRG_OFFSET_MV) / SGM4154X_VRE=
CHRG_STEP_MV;

These are the only millivolt offset/steps, so drop the 1000 divison
and simply do:

#define SGM4154X_VRECHRG_OFFSET_UV      100000
#define SGM4154X_VRECHRG_STEP_UV        100000

reg_val =3D (recharge_volt - SGM4154X_VRECHRG_OFFSET_UV) / SGM4154X_VRECHRG=
_STEP_UV;

Otherwise LGTM.

> [...]

Greetings,

-- Sebastian

--jdqx244eltbi25x2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmonMfcACgkQ2O7X88g7
+pqYYg/+LcYsNUAi80bpA0ntxXi9FElhS41n8dRtZW7Urt+idmo3tajin08Embdn
F2UPWJ0+MmkKco54E1yzeUQrJHobFqIFgzCEwN8f5JqpapWAdr+hFmPmmVQh+sAT
xkbegwQroiSGlr9HuOqwbKMb9Rqt1XzDfGMEJUrxQIZr2zDzHkm8yd0UPu/72+mh
0evgdTzyXH0RF5hkOUOg183dbqpZie9wZqF0uKc092WvrRmuRmWgTXcKfFzBHNka
6WWuMioOqEIk1jlLk5HUNMsWBMyuMxsfLZ0zVJei/dA+5lT64jgmnQh5Y4rdI+Q8
HTwTloR7Eb97iULL5y+qf8501nJnBvUMxr1p7W5gHWfDqyqiZYOAzzQ3gz5+QSQF
yBD8JqjVMl49apI+uDWN+WVtYbwoH5jm4eSwFaBrtWashjohqEvBOwiHp+2pWiZF
q9bEqoXn9vDGZppFqNFHb+9KojnmikN1WVZCZTFpgzqR048ximCynEl/VY2m0Syt
UEls9M5WdMDKUQ4z1N2uh/Tn0Zq1kMhT2IvN+jQYC2QJnZUqBb+OwoV8KzrNfSuR
CiMCl9+YmwYlrqKy7cxNFco3gum/gW+dDctBANB7+Me2ehhQDxuAJb5rENRviy/g
s+oizR8vQ3mNnlWLz57M5Co9TrEjwIqT10ujLy1jnIkVGMdZMJc=
=8RYq
-----END PGP SIGNATURE-----

--jdqx244eltbi25x2--
