Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE03039A7E1
	for <devicetree@vger.kernel.org>; Wed, 10 Jun 2026 08:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079548; cv=none; b=aKDiouPRcAuXzU2get5az+gnZpxbec+87+nLblE6174cLu9Wz9mSNiOj+LTeGg+cDf4vxQYYqATj81IRKwJHpfn/4CBFGn+osaiFWAmGENRv37I+sflBzKmcRvKdGSkAyf9MIYrl46KxmkCYH02ZbO+ncz93jBqgvTklJfXBTqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079548; c=relaxed/simple;
	bh=gJZWhgZjxBzbsRZwXx2iWIN0oKASoml3ECd+SWPyPGk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=g719hdYABeRaAUiHeoqZq4pk2gsgwhoDMp5vcxK/5oD+DR9JPy4gPbi9AIONnHgnmNlaRCK4ocHC1Bko6x9WblUhFNuy3X86sDPHL32h8URiddGB4MvSYnXWx0sASa24m9R38ZopRZDV2O8K2tK/jjcxLCFXM5VLtzNl/2/h6ok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIo+HP6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIo+HP6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC081F00893;
	Wed, 10 Jun 2026 08:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781079546;
	bh=pkXpRIgRgBmnciFEpa3cgwlc4pEEyCuvae9F5zPOFfM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oIo+HP6jVm4N57MVlmljZJSnZmQrIaGoiafi1S5+YNJhg/0fYv2Ls7XAaCiGGqbIj
	 kOMSo9LZAiKC35dqka/7/vq0MUWYZVVly8Z+IvUhilGIxxtIR79H8xpkBChv4NioZy
	 eCFRe4npBrTDH5WN6WkqCtEg6L1ciwWXjEeKv6Zx7qD6giZTv7XHSVISOxrzT4Z3ou
	 n8MFgJpPNM3qXnfNWL+r1/FyLhOBkp789T/GI+AHEr8AbwUg2Hd7EqMU+8EOjfut9Z
	 vm8QXK7QR0FKDE39sFTh1oe3/C2MzqHHLw3UAFxpa+Vn/rF22ZGeSyWawB6nCyib1Z
	 ZXlSqueJ8PxRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 07/10] clk: realtek: Add support for MMC-tuned PLL
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260610080824.255063-8-eleanor.lin@realtek.com>
References: <20260610080824.255063-8-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 08:19:06 +0000
Message-Id: <20260610081906.9FC081F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] `clk_pll_mmc_set_rate` entirely ignores dynamic rate parameters an=
d hardcodes the PLL frequency.
- [Medium] `clk_pll_mmc_determine_rate` lacks bounds clamping and allows ou=
t-of-bounds rates that map to unsupported hardware configurations.
- [Low] The tristate `RTK_CLK_PLL_MMC` config causes `clk-pll-mmc.o` to be =
silently dropped from the build when `CONFIG_RTK_CLK_COMMON=3Dy` and `CONFI=
G_RTK_CLK_PLL_MMC=3Dm`.
--

commit 021382a87679f7b201df250be3c9547b24d2131a
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add support for MMC-tuned PLL clocks

This commit adds clk_pll_mmc_ops for enable/disable, prepare, rate control,
and status operations on MMC PLL clocks. It also adds clk_pll_mmc_phase_ops
to support phase get/set operations.

> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
[ ... ]
> @@ -27,4 +27,7 @@ config RTK_CLK_COMMON
>  	  multiple Realtek clock implementations, and include integration
>  	  with reset controllers where required.
> =20
> +config RTK_CLK_PLL_MMC
> +	tristate
> +
>  endif

[ ... ]

> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
[ ... ]
> @@ -7,3 +7,5 @@ clk-rtk-y +=3D clk-pll.o
>  clk-rtk-y +=3D clk-regmap-gate.o
>  clk-rtk-y +=3D clk-regmap-mux.o
>  clk-rtk-y +=3D freq_table.o
> +
> +clk-rtk-$(CONFIG_RTK_CLK_PLL_MMC) +=3D clk-pll-mmc.o

[Severity: Low]
When CONFIG_RTK_CLK_COMMON is set to 'y' and CONFIG_RTK_CLK_PLL_MMC is set =
to
'm', does Kbuild drop clk-pll-mmc.o from the build entirely?

Since clk-rtk is a built-in object (obj-y) when CONFIG_RTK_CLK_COMMON=3Dy,
conditionally appending to it via clk-rtk-m +=3D clk-pll-mmc.o will cause
Kbuild to ignore the module object. This can lead to undefined reference
build errors when attempting to link against rtk_clk_pll_mmc_ops.

[ ... ]

> diff --git a/drivers/clk/realtek/clk-pll-mmc.c b/drivers/clk/realtek/clk-=
pll-mmc.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll-mmc.c
[ ... ]
> +static int clk_pll_mmc_determine_rate(struct clk_hw *hw, struct clk_rate=
_request *req)
> +{
> +	u32 val;
> +
> +	if (!req->best_parent_rate)
> +		return -EINVAL;
> +
> +	val =3D DIV_ROUND_CLOSEST(req->rate * 4, req->best_parent_rate);
> +	req->rate =3D req->best_parent_rate * val / 4;
> +
> +	return 0;
> +}

[Severity: Medium]
Is there a risk of integer overflow here on 32-bit platforms if req->rate
exceeds ~1.07 GHz? The calculation req->rate * 4 operates on an unsigned lo=
ng.

Also, does val need to be bounds-checked against the hardware's supported
tuning limits? If an extreme rate is requested, the framework might approve=
 it
but it could map to unsupported hardware configurations later on, since val
is never clamped here.

[ ... ]

> +static int clk_pll_mmc_set_rate(struct clk_hw *hw, unsigned long rate, u=
nsigned long parent_rate)
> +{
> +	struct clk_pll_mmc *clkm =3D to_clk_pll_mmc(hw);
> +	u32 val =3D PLL_MMC_SSC_DIV_N_VAL;
> +	int ret;

[Severity: High]
Does this function intentionally ignore the rate and parent_rate parameters?

Because val is initialized to a hardcoded constant (PLL_MMC_SSC_DIV_N_VAL,
which is 27), the hardware is strictly locked to a single static configurat=
ion
and the dynamic rate arguments are bypassed.

Additionally, this hardcoded value causes the subsequent switch statement
to unconditionally take the `case 20 ... 30:` branch, making the rest of
the frequency ranges dead code.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610080824.2550=
63-1-eleanor.lin@realtek.com?part=3D7
