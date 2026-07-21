Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4BA44E03B
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 10:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628333; cv=none; b=jGz2V0gS3mRK2HZB1pZ6gUzjnffDtIN2p8zkmZpFTGLID+slLpCEI9sk3thwyCFSzxB55QMCgXWHckHyhT+Z3q7w40JLwoyPKgKyVqAv/wtkbskkv+kYyWESCY5upVZ+Rp4NLQzRFL81GURWfA9esPBqy4nZ0+xu/+6HHNCPMjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628333; c=relaxed/simple;
	bh=5KkikZv6sc8hxabCG2BMbSVoCluVg54SUAYlKFtBgAY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YmYGYn8PqflygVvSZ/2GrQSQf/je7GFNUSyhnW0hdVL0UYkO6/kM35tBsvVXWALuUodAu5ANAW+g4S+gS5bTO+V0CDCzxTQjBWchGKDWgj+IO1kJTKJ4TqqIapdWdpA7UHiVkm0OpMGiSqVJyAWL6EZ78YnlV3we3OnWlq9efTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dAOW1Esx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dAOW1Esx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F98A1F000E9;
	Tue, 21 Jul 2026 10:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628331;
	bh=s4Gd2z+YgpktkaQcSBRkLIbqAyMwmpw9KOpFs6mq4zI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dAOW1Esx7/GhqjZrtNnBtxkCaXicTswznBMopKJXNdyrUy7F13UnFEMKGWdqzMnJS
	 XWhXSE21ODLxW4K7NS2xFsCwwWRripT2zn09ebIVY23j9MLLo0nutdfdhnuvnsrQTM
	 5jfLits9X1PHLxXOZS0VDGSrQPTj8SRGjDw/cqlg2+bGr3dVq+5ewO+EEbkboJEUOX
	 kLzs6a4p4eq7fdCTFsAeMBqpdt4TLbmjvhjBUo/5j6ep0GyV3YnqtaiWcjw6uBkJIg
	 JDWlYStG2npjwofCJ48OLsOZWXCF4HXcmmdlMQgbVcrM63FDpjG/GWbca/oFfMuOJ3
	 72KpBEa/Mn6Og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/18] clk: mediatek: Add MT8189 apmixedsys clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
References: <20260720-mt8189-clocks-system-base-v3-0-8e6d99ab3ad2@collabora.com>
 <20260720-mt8189-clocks-system-base-v3-9-8e6d99ab3ad2@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:05:31 +0000
Message-Id: <20260721100531.5F98A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] The `PLL_SETCLR` macro omits `.ops` and `.pwr_reg`, causing `mtk_p=
ll_prepare()` to corrupt offset 0 of the APMIXEDSYS controller.

Pre-existing issues:
- [High] Stale state in the static `pllfhs` array persists after unbind, ca=
using unmapped memory access (Use-After-Free) if the driver is rebound and =
`fhctl_parse_dt()` fails.
--

--- Patch [9]: [PATCH v3 09/18] clk: mediatek: Add MT8189 apmixedsys clock =
support ---
commit 025aa9a1940ce762ce47408b18d63d2592369750
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 apmixedsys clock support

Add support for the MT8189 apmixedsys clock controller, which provides
PLLs generated from SoC 26m.

> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c

[ ... ]

> +#define PLL_SETCLR(_id, _name, _reg, _en_setclr_bit,		\
> +			_rstb_setclr_bit, _flags, _pd_reg,	\
> +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> +			_pcwbits) {				\
> +		.id =3D _id,					\
> +		.name =3D _name,					\
> +		.en_reg =3D MT8189_PLLEN_OFS,			\
> +		.reg =3D _reg,					\
> +		.pll_en_bit =3D _en_setclr_bit,			\
> +		.rst_bar_mask =3D BIT(_rstb_setclr_bit),		\
> +		.flags =3D _flags,				\
> +		.fmax =3D MT8189_PLL_FMAX,			\
> +		.fmin =3D MT8189_PLL_FMIN,			\
> +		.pd_reg =3D _pd_reg,				\
> +		.pd_shift =3D _pd_shift,				\
> +		.tuner_reg =3D _tuner_reg,			\
> +		.tuner_en_reg =3D _tuner_en_reg,			\
> +		.tuner_en_bit =3D _tuner_en_bit,			\
> +		.pcw_reg =3D _pcw_reg,				\
> +		.pcw_shift =3D _pcw_shift,			\
> +		.pcwbits =3D _pcwbits,				\
> +		.pcwibits =3D MT8189_INTEGER_BITS,		\
> +	}

[Severity: High]
Does this macro need to initialize .ops and .pwr_reg?

Because .pwr_reg defaults to 0 and .ops is missing, the clock core will fall
back to the default mtk_pll_ops. When mtk_pll_prepare() is called, it seems
it will unconditionally read and write to base + 0 (since pwr_reg is 0).

Will this inadvertently toggle bits 0 and 1 of the register at offset 0
every time a PLL is prepared or unprepared?

Additionally, falling back to the default ops causes the driver to perform
non-atomic read-modify-write operations on the enable register instead of
using the intended SET/CLR operations.

[ ... ]

> +static struct mtk_pllfh_data pllfhs[] =3D {
> +	FH(CLK_APMIXED_ARMPLL_LL, 0, 0x003C),
> +	FH(CLK_APMIXED_ARMPLL_BL, 1, 0x0050),
> +	FH(CLK_APMIXED_CCIPLL, 2, 0x0064),
> +	FH(CLK_APMIXED_MAINPLL, 3, 0x0078),
> +	FH(CLK_APMIXED_MMPLL, 4, 0x008C),
> +	FH(CLK_APMIXED_MFGPLL, 5, 0x00A0),
> +	FH(CLK_APMIXED_EMIPLL, 6, 0x00B4),
> +	FH(CLK_APMIXED_TVDPLL1, 7, 0x00C8),
> +	FH(CLK_APMIXED_TVDPLL2, 8, 0x00DC),
> +	FH(CLK_APMIXED_MSDCPLL, 9, 0x00F0),
> +	FH(CLK_APMIXED_UFSPLL, 10, 0x0104),
> +	FH(CLK_APMIXED_APUPLL, 11, 0x0118),
> +	FH(CLK_APMIXED_APUPLL2, 12, 0x012c),
> +};

[Severity: High]
This is a pre-existing issue, but does this static array retain stale state
across driver unbind and rebind cycles?

During a successful probe, fhctl_parse_dt() sets pllfh->state.fh_enable =3D=
 1
and stores the mapped I/O pointer in pllfh->state.base. When the driver is
unbound, mtk_clk_unregister_pllfhs() unmaps this memory but doesn't appear
to clear the state in the static array.

If the driver is later rebound and fhctl_parse_dt() fails (for example, due
to an of_iomap failure), it returns without updating the array. Will
mtk_clk_register_pllfhs() then read the stale fh_enable =3D=3D 1 and pass t=
he
unmapped state.base pointer to the clock framework, leading to unmapped mem=
ory
accesses on subsequent clock operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-mt8189-clo=
cks-system-base-v3-0-8e6d99ab3ad2@collabora.com?part=3D9
