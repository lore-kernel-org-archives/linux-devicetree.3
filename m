Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E04D3F65E8
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181235; cv=none; b=Lf+iQinxbaNcLVt/Tqk+UNDTB/dWtAjLJTSqZ2zDarAPz6cPOC6oCnQWCNt92TDSBeksTi6OPIRTiU6kIJ7lLPOuOyC1xa/UKyAl52Dr5dGab9a4XEiwMFZHbTp1p/Yn103psP6frILuoQxnBezbIJt0ga3MK5MmqblnywN4mOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181235; c=relaxed/simple;
	bh=efdJhcdNTNClGIRIiCwauBeBM5Wu2us5hH1ciqzfgiE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TpsVSH0R0gMFn+cRRREokVD7NutcRfbNNmdSNrFXWATa1OMlmaO/w8BU8cRKXIYz/S7odDaJE0WhNH21C7PtVtRtIlXLZTapjj6dWS2GjOUy7Z0T0sNV4Xc8fUwx4ntrtcoI/Jq9MWaIFOJ83DAOk7RO/XBGswSCZw2jPr5WTvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTWrpCr+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTWrpCr+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCED6C2BCB3;
	Tue, 19 May 2026 09:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181235;
	bh=efdJhcdNTNClGIRIiCwauBeBM5Wu2us5hH1ciqzfgiE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=FTWrpCr+2RT3wVElosrnKKQFqbi1B0V3YsAZByQC9DkdjgZwOjyTRrxlKrP8b3vcB
	 5HO8NB23yuJKmQpK8CidI+SVj7x32yO/zRBp+pnp/ZknIW+kvfXw/PMcp2r2h+D/e2
	 Kg/daYZ+gXDyPves3QbHe+nGMCAbomBwOlw9Gey8YmqAOE11IGIyxJWN6HAe8INlb6
	 yIGapPGwnfOxXNaFMyrQLFDYetdj+xqJMox1NWoZf+dDiPIfaYVQ1JS93reOeSc/HD
	 OlV0AHDyUNf1/dDrTUEXggO9wbvTcjlDliWz5qSOre/6+zCBfUio2RKNpEO627nMdH
	 B+ukkfpSmnINQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/3] clk: eswin: Add eic7700 HSP clock driver
Reply-To: sashiko-reviews@lists.linux.dev
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519081627.1591-1-dongxuyang@eswincomputing.com>
References: <20260519081627.1591-1-dongxuyang@eswincomputing.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:00:34 +0000
Message-Id: <20260519090034.CCED6C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Global static clock arrays are modified during probe without lockin=
g, breaking support for multiple instances.
- [Low] The Kconfig symbol `COMMON_CLK_EIC7700_HSP` lacks the `default ARCH=
_ESWIN` property, which is inconsistent with the base clock driver.
--

commit 5c87f865ca8ae746d80ff71fdbbce73f7be502ec
Author: Xuyang Dong <dongxuyang@eswincomputing.com>

clk: eswin: Add eic7700 HSP clock driver

Add driver for the ESWIN EIC7700 high-speed peripherals system clock
controller and register an auxiliary device for system reset controller
which is named as "hsp-reset".

> diff --git a/drivers/clk/eswin/Kconfig b/drivers/clk/eswin/Kconfig
> index 0406ec499ec9c..37857bd773356 100644
> --- a/drivers/clk/eswin/Kconfig
> +++ b/drivers/clk/eswin/Kconfig
[ ... ]
> @@ -13,3 +13,16 @@ config COMMON_CLK_EIC7700
>  	  SoC. The clock controller generates and supplies clocks to various
>  	  peripherals within the SoC.
>  	  Say yes here to support the clock controller on the EIC7700 SoC.
> +
> +config COMMON_CLK_EIC7700_HSP
> +	tristate "EIC7700 HSP Clock Driver"
> +	depends on ARCH_ESWIN || COMPILE_TEST

This isn't a bug, but should this config have default ARCH_ESWIN to match
the base clock driver? Without it, the high-speed peripheral clocks might
be unexpectedly disabled by default on ESWIN platforms.

> +	select AUXILIARY_BUS
> +	select COMMON_CLK_EIC7700
> +	select RESET_EIC7700_HSP if RESET_CONTROLLER
> +	select REGMAP_MMIO

[ ... ]
> diff --git a/drivers/clk/eswin/clk-eic7700-hsp.c b/drivers/clk/eswin/clk-=
eic7700-hsp.c
> new file mode 100644
> index 0000000000000..3383aa64948a6
> --- /dev/null
> +++ b/drivers/clk/eswin/clk-eic7700-hsp.c
[ ... ]
> +static struct eswin_fixed_factor_clock eic7700_hsp_factor_clks[] =3D {
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV2, "factor_hsp_cfg_div2",
> +		     hsp_cfg, 1, 2, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_CFG_DIV4, "factor_hsp_cfg_div4",
> +		     hsp_cfg, 1, 4, 0),
> +	ESWIN_FACTOR(EIC7700_HSP_CLK_FAC_MMC_DIV10, "factor_hsp_mmc_div10",
> +		     hsp_mmc, 1, 10, 0),
> +};
[ ... ]
> +static int eic7700_hsp_clk_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct auxiliary_device *adev;
> +	struct eswin_clock_data *data;
> +	struct regmap *regmap;
> +	struct clk_hw *hw;
> +	int i, ret;
> +
> +	data =3D eswin_clk_init(pdev, EIC7700_HSP_NR_CLKS);
> +	if (IS_ERR(data))
> +		return dev_err_probe(dev, PTR_ERR(data),
> +				     "failed to get clk data!\n");
> +
> +	regmap =3D devm_regmap_init_mmio(dev, data->base,
> +				       &eic7700_hsp_regmap_config);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap),
> +				     "failed to get regmap!\n");
> +
> +	ret =3D eswin_clk_register_fixed_factor(dev, eic7700_hsp_factor_clks,
> +					      ARRAY_SIZE(eic7700_hsp_factor_clks),
> +					      data);

Is it safe to pass the global static array eic7700_hsp_factor_clks to this
function?

Looking at eswin_clk_register_fixed_factor() in drivers/clk/eswin/clk.c, it
modifies the array during probe:

int eswin_clk_register_fixed_factor(...)
{
    ...
        clks[i].hw =3D *clk_hw;
        data->clk_data.hws[clks[i].id] =3D clk_hw;
    ...
}

If multiple instances of this driver probe concurrently or defer, could this
data race corrupt the CCF parent-child linkages? The same pattern appears
to affect eic7700_hsp_gate_clks and eic7700_hsp_mux_clks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519081431.1424=
-1-dongxuyang@eswincomputing.com?part=3D2
