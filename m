Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A685E3D8914
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 10:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785405934; cv=none; b=pXlv5pymQ0y6sdPGXMVdV8YSFBdn1g1j9rvpXWph7YwjDVBTX0AAyZfEYjzGt5wpCHKS9L4KArM5/k//YZCvk4/H0tyIH0+NRF9RXYrOHhn17tS4AQ+DRYYrcgZhhV+GOpRLmyAiIAiFDh2tC2ZQsRyWRRfzcLA2kqADWL3xjRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785405934; c=relaxed/simple;
	bh=sk0Dg/1TpIFEMrVAkb1TmdQUb0YsFaW/zvP6u7cQp/w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=brnZj0zVMatcE1Kue6IzU3yjU0HgdZHPJ9BtHAj14uIYxvQ9eN/kdHGkuLgaTJ68WLNFYSfcF4Stlol5JIkWpmfVkB7oqHGTPZF7olE4Ed8C+B6WVfygpoWsdzBT4B2XNTY22WUJBI/0lgr0+KD+vkh/XWks4ujN4+XqMMTXqZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oND4+X7o; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oND4+X7o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4791F00A3A;
	Thu, 30 Jul 2026 10:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785405933;
	bh=Dg0pvk+4YxD20VvIGpiG8ufx2A23hJhox8oTuwlTGfg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oND4+X7o78DeZP+eukBe+YndLxu9kF23dBztyR6ICXRG/coJLFruYjNgCBQINzocZ
	 Vytj1J0T6v/YZdGGXm4TqiHOTJQz3bK/nYj4S3wiyJhQs8e96zU1VDCGvXzlyCeYpa
	 LwQ1hs9GpEC4bR89k6OaeM/9SKoI2cx9iwUh5NZovHYL6mM/aeFpROWh+FEbth5vZK
	 80CiLuzu9MS6XMIHZBXMlglambkFW57Ul7HCTTzxLik3lYGvcyFJIEB3nj71VDnPEO
	 Ka81wMJhmAnlvnBDkR2PPmaU3VWLR1ROAhpEtNlJ68256e/ViF20WgacaO90N+CLI6
	 fB4yIt+M1FV5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 15/24] clk: mediatek: Add MT8189 apmixedsys clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-15-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
 <20260729-mt8189-clocks-system-base-v4-15-e356b813a64c@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 10:05:32 +0000
Message-Id: <20260730100533.4C4791F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Reusing `mtk_pll_unprepare_common()` with a CLR register breaks PL=
L disable logic, either accidentally clearing other active PLLs or failing =
to disable the target PLL.
--

--- Patch [15]: [PATCH v4 15/24] clk: mediatek: Add MT8189 apmixedsys clock=
 support ---
commit 5a8d4164915ab1ef9117354d41ec7d48062de00e
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 apmixedsys clock support
   =20
This commit adds support for the MT8189 apmixedsys clock controller,
which provides PLLs generated from the SoC 26m.

> diff --git a/drivers/clk/mediatek/clk-mt8189-apmixedsys.c b/drivers/clk/m=
ediatek/clk-mt8189-apmixedsys.c
> new file mode 100644
> index 0000000000000..a50a8979b8495
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-apmixedsys.c
> @@ -0,0 +1,203 @@
[ ... ]
> +#define MT8189_INTEGER_BITS	8
> +
> +#define PLL_SETCLR(_id, _name, _reg, _pwr_reg, _en_setclr_bit,		\
> +			_rstb_setclr_bit, _flags, _pd_reg,	\
> +			_pd_shift, _tuner_reg, _tuner_en_reg,	\
> +			_tuner_en_bit, _pcw_reg, _pcw_shift,	\
> +			_pcwbits) {				\
> +		.id =3D _id,					\
> +		.name =3D _name,					\
[ ... ]
> +		.pcw_shift =3D _pcw_shift,			\
> +		.pcwbits =3D _pcwbits,				\
> +		.pcwibits =3D MT8189_INTEGER_BITS,		\
> +		.ops =3D &mtk_pll_setclr_ops,			\

[Severity: High]
Will using mtk_pll_setclr_ops here cause system instability when disabling
PLLs?

Looking at mtk_pll_unprepare_setclr() (which is called by these ops), it
delegates to mtk_pll_unprepare_common(pll, pll->en_clr_addr). That common
function performs a read-modify-write:

    r =3D readl(en_addr) & ~BIT(pll->data->pll_en_bit);
    writel(r, en_addr);

If reading the CLR register returns the current PLL status, 'r' will contain
1s for all other active PLLs and 0 for the target PLL. Writing this back to
the CLR register would clear all other active PLLs and leave the target PLL
enabled.

If the CLR register returns 0 (write-only), 'r' becomes 0, and writing 0
does nothing, meaning the target PLL is never disabled.

Should this use a direct write instead of a read-modify-write on a CLR
register, similar to how the reset bar CLR register is handled?

> +	}
> +
> +static const struct mtk_pll_data apmixed_plls[] =3D {
> +	PLL_SETCLR(CLK_APMIXED_ARMPLL_LL, "armpll-ll", 0x204, 0x210, 18,
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729-mt8189-clo=
cks-system-base-v4-0-e356b813a64c@collabora.com?part=3D15
