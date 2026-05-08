Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E765C3659EE
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778284202; cv=none; b=hSpGOgu3quYXABjw9ExlZp6iO39xF8709AY3P8SU2p94V8oa7fPbOukTEGZ2L0Nzuk3XUvSnGg00t5QuNZY1XE+mHidN35dVnpm5ez8h6YwbteY+h+foVHWLbWPKC8MG3I8QwjMOjggLZhuW0cHgm227XpWkYUyCb8Mfd7Z0y9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778284202; c=relaxed/simple;
	bh=bIt8G2jp/dO8fyv2ysS9T+8b+ZyJHcgBirkRgg1+MZ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f8G4MkHqtoJXGXkYLYh+bocAvQwg+b6EgdQPtpkKeFNzlnH/0eX5A3J/K5tiSLVeT9lFy9qLhN5cd1bFk6v5/bDGim/D83fU57baPEPuJJCuzn8aMTxCVIt8BfJHIeQKOnigIbutgi7NB3OQrDZeI74XvAtDHOkQhxUzCbPu/jk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U8n+D9Ts; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U8n+D9Ts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E817C2BCB0;
	Fri,  8 May 2026 23:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778284201;
	bh=bIt8G2jp/dO8fyv2ysS9T+8b+ZyJHcgBirkRgg1+MZ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=U8n+D9Tsn4xUSXlG4IWpPezCwzc4aP4LffVEJnvhlzQYjSRcPRZDyqki5JEABfui1
	 qkpmmdIwhXlgQG/C8cv570Bo7a9L887TpG2ZJKR7g5UkbONx+tPCeFFd55o6uGQt/X
	 zqzjhTeitMxvE2n6djxrPpCcO6nm6+2/1U0Wc3KmLasVXfXfqYr68+JC2MFWQVGzXC
	 xu52edYN7khoCu5OhnX50Jrpe3JWtFXXuI5aQyq+TbsZpPjMnzlGeRL1K9LEGi9PaK
	 2BdmmnDXxhKIf4500pKwwK+kb09KgtIycYCl+q/1ahVBrS0hgREeVfVtS9bFZymaME
	 CIniw0h+Yhjvg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/10] clk: realtek: Add RTD1625-ISO clock controller
 driver
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260508111641.3192177-10-eleanor.lin@realtek.com>
References: <20260508111641.3192177-10-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:50:00 +0000
Message-Id: <20260508235001.3E817C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Missing MODULE_DEVICE_TABLE for the OF match table in the clock =
driver.
- [Medium] Flexible array overallocation and `__counted_by` mismatch in `hw=
s` array initialization.
- [Low] Typo in MODULE_DESCRIPTION in the reset driver.
--

commit 57dcde089e2dea62cefc3bf2d39edbfbdf75b997
Author: Cheng-Yu Lee <cylee12@realtek.com>
Subject: clk: realtek: Add RTD1625-ISO clock controller driver

Add support for the ISO (Isolation) domain clock controller on the Realtek
RTD1625 SoC. This controller manages clocks in the always-on power domain.
It also includes an auxiliary reset driver instantiated by the core clock
driver to handle the ISO domain resets.

> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/=
clk-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..58c2b147eb019
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c

[ ... ]

> +static struct clk_hw_onecell_data rtd1625_iso_clk_data =3D {
> +	.num =3D RTD1625_ISO_CLK_MAX,
> +	.hws =3D {

[ ... ]

> +		[RTD1625_ISO_CLK_EN_MISC_VFD]    =3D &__clk_regmap_gate_hw(&clk_en_mis=
c_vfd),
> +		[RTD1625_ISO_CLK_MAX] =3D NULL,

Could this cause a bounds mismatch?

By setting .num to RTD1625_ISO_CLK_MAX but initializing the array at the
MAX index, the array size is implicitly expanded to MAX + 1 elements. This
appears to violate the __counted_by(num) contract in struct
clk_hw_onecell_data.

Should this trailing NULL initialization be removed?

> +	},
> +};

[ ... ]

> +static struct clk_hw_onecell_data rtd1625_iso_s_clk_data =3D {
> +	.num =3D RTD1625_ISO_S_CLK_MAX,
> +	.hws =3D {
> +		[RTD1625_ISO_S_CLK_EN_IRDA] =3D &__clk_regmap_gate_hw(&clk_en_irda),
> +		[RTD1625_ISO_S_CLK_EN_UR10] =3D &__clk_regmap_gate_hw(&clk_en_ur10),
> +		[RTD1625_ISO_S_CLK_MAX] =3D NULL,

Is this trailing NULL initialization needed here as well? Like the above,
this makes the array size RTD1625_ISO_S_CLK_MAX + 1 elements, which
doesn't match the .num value.

> +	},
> +};

[ ... ]

> +static const struct of_device_id rtd1625_iso_match[] =3D {
> +	{.compatible =3D "realtek,rtd1625-iso-clk", .data =3D &rtd1625_iso_desc=
},
> +	{.compatible =3D "realtek,rtd1625-iso-s-clk", .data =3D &rtd1625_iso_s_=
desc},
> +	{ /* sentinel */ }
> +};
> +

Should there be a MODULE_DEVICE_TABLE(of, rtd1625_iso_match) here?

Without it, the module aliases aren't exported to modules.alias, which
might prevent udevd from automatically loading the driver at boot. This
could also cause the auxiliary reset controller to silently fail to probe.

> +static struct platform_driver rtd1625_iso_driver =3D {

[ ... ]

> diff --git a/drivers/reset/realtek/reset-rtd1625-iso.c b/drivers/reset/re=
altek/reset-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..0829a5cb0ac11
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625-iso.c

[ ... ]

> +module_auxiliary_driver(rtd1625_iso_driver);
> +
> +MODULE_DESCRIPTION("Reatek RTD1625 ISO Reset Controller Driver");

This isn't a bug, but there's a typo in the module description.
"Reatek" should probably be "Realtek".

> +MODULE_LICENSE("GPL");
> +MODULE_IMPORT_NS("REALTEK_RESET");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D9
