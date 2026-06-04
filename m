Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE38447D959
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780580700; cv=none; b=hZF/iOzZsAOI+oLmMe5shSp8EYTZtexysPmeQ41qFWKbk97dI5vMOlzcY/8lH4fbE76Tfe+udDAa1Q/ERgsKXmpCZL8X4AwB01s9lsGVbx/Ry835itu2m4G7vww/qkJ6AKY40K3/bKCdkq8FAdtbG43v+E6zbMqMGU74bnjkELg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780580700; c=relaxed/simple;
	bh=uJd0WjMrsXaQQnIp2QM24bY71Pb1ZOJy40sxvJ8TPzM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cUE5MmBuY07t05wgTNUR/Wlp80Vupw2aERA9MhKFVG2g+Iq6kfEUU81eI5vXyw9v3TNX8oPJjU/TwejdP21waZxgB6/zuBAWY2eZGDdhCGYbyMlvKBONwONeMLCckz1wzhG9/LAHhJwyb4GTMMT3IaXqvK39VhkQH9w/zcN93r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DKg2HkWN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DKg2HkWN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C311F00893;
	Thu,  4 Jun 2026 13:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580699;
	bh=ic3QQy90ZAY+oDkvHOUWU4oVvq7B5SGU79Eorx/sEu4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DKg2HkWNpjHr+whUKfJblGLmXB7D/WJtbh/2OyweWaswE61+BV4d1hcPyBl6n4BDO
	 llyxca5gU8ORonb9+2dKTRhtkdbip9pqX0A4KMbeqJLjIlixP+CK0Ac+nZVDSOrhSm
	 iKYqd/4xQS7ZaAPLGnveDyCkMiC2iaOKUAtNRts9XwEwjhD1jCnnkPWsXX1Ga8P7TO
	 DcU0AhKu21yzh37HJszL+RB2ZPR0aBxxwhUHoISM0d4AUTRgkZekQr/kfktyYS/N6k
	 IRBfhFudaTqPZ1BrbTg1IMGhRmZ99te+EHNBerM1qDYJaH9FqxATjATXxjrC4MVMMR
	 mitRS+TxpdfJg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 7/9] clk: eyeq: Convert clocks declaration to
 eqc_clock
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?QmVub8OudCBNb25pbg==?= <benoit.monin@bootlin.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260604-clk-eyeq7-v8-7-53f618174cf6@bootlin.com>
References: <20260604-clk-eyeq7-v8-7-53f618174cf6@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 13:44:58 +0000
Message-Id: <20260604134458.F1C311F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing Spinlock for Shared Register
--

commit 8a6ca96f73accf716971f013f35f97d51b0a39dd
Author: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

clk: eyeq: Convert clocks declaration to eqc_clock

Convert all declarations of PLLs, dividers, and fixed factors to struct
eqc_clock for the EyeQ5, EyeQ6H, EyeQ6L, and EyeQ6Lplus, both for the
match data used during probe and the early match data used in early
initialization.

> diff --git a/drivers/clk/clk-eyeq.c b/drivers/clk/clk-eyeq.c
> index 7b8de08388d3b..8a38ad9afb5ef 100644
> --- a/drivers/clk/clk-eyeq.c
> +++ b/drivers/clk/clk-eyeq.c
[ ... ]
> @@ -776,33 +715,10 @@ static const struct eqc_match_data eqc_eyeq6h_east_=
match_data =3D {
[ ... ]
> +static const struct eqc_clock eqc_eyeq6h_south_clks[] =3D {
> +	PLL_FRACG(EQ6HC_SOUTH_PLL_VDI, PARENT_BY_FWNAME, "pll-vdi", "ref", 0x00=
0),
> +	PLL_FRACG(EQ6HC_SOUTH_PLL_PCIE, PARENT_BY_FWNAME, "pll-pcie", "ref", 0x=
008),
> +	PLL_FRACG(EQ6HC_SOUTH_PLL_PER, PARENT_BY_FWNAME, "pll-per", "ref", 0x01=
0),
> +	PLL_FRACG(EQ6HC_SOUTH_PLL_ISP, PARENT_BY_FWNAME, "pll-isp", "ref", 0x01=
8),
> =20
> -static const struct eqc_div eqc_eyeq6h_south_divs[] =3D {
> -	{
[ ... ]
> +	DIV(EQ6HC_SOUTH_DIV_EMMC, EQ6HC_SOUTH_PLL_PER, "div-emmc", NULL, 0x070,=
 4, 4),
> +	DIV(EQ6HC_SOUTH_DIV_OSPI_REF, EQ6HC_SOUTH_PLL_PER, "div-ospi-ref", NULL=
, 0x090, 4, 4),
> +	DIV(EQ6HC_SOUTH_DIV_OSPI_SYS, EQ6HC_SOUTH_PLL_PER, "div-ospi-sys", NULL=
, 0x090, 8, 1),

[Severity: High]
This isn't a bug introduced by this patch, but since both "div-ospi-ref" and
"div-ospi-sys" share the same hardware register at 0x090, does this need a
spinlock?

Looking at eqc_probe_divider() in drivers/clk/clk-eyeq.c, it passes a NULL
spinlock argument to clk_hw_register_divider_table_parent_data():

drivers/clk/clk-eyeq.c:eqc_probe_divider() {
	...
	hw =3D clk_hw_register_divider_table_parent_data(dev, clk->name,
			&parent_data, 0, base + clk->div.reg, clk->div.shift,
			clk->div.width, clk->div.flags, clk->div.table, NULL);
	...
}

Will concurrent rate changes via clk_set_rate() execute unprotected
read-modify-write cycles on this shared register and cause register corrupt=
ion?

> +	DIV(EQ6HC_SOUTH_DIV_TSU, EQ6HC_SOUTH_PLL_PCIE, "div-tsu", NULL, 0x098, =
4, 8),
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-clk-eyeq7-=
v8-0-53f618174cf6@bootlin.com?part=3D7
