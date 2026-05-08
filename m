Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F65E364043
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 23:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778282252; cv=none; b=A1qTKD3xO/7KvEkBiOBBcSJ4Y/wiJD9HcOeO5TomrwODtZYpPeNiosp89nswcD/uqRmmEf1a1lY22Qsy0DBAJznD9G6gYaybzdvodSTYYQOOXTXETfcVPXcmGrrHNYSdSaqpUnTc7oc3ztlJjlUlDOMCSSXU96mvYmmhM3bj8BI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778282252; c=relaxed/simple;
	bh=1ud4bRUpySSF2XwtRFUNENt33KL9ZIMPNHUYeitUfC4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YcyWPBRfFFSD8Qn7853jIX/PiKrrtV5mzqmnrdDt4tB/q5AiuPaSKfiAjAbF4q/5k8lvn/AaDn8Yo+eEKFDEJconiPx7/cgnkeEuWcA2iVM3NUmt80raLLoDFehB8DeJ2SKmz/rDqhMySQDqDbmfKhocjeFNb0xl+KYEhzFRe0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oYfW+7XK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oYfW+7XK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4692BC2BCB0;
	Fri,  8 May 2026 23:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778282251;
	bh=1ud4bRUpySSF2XwtRFUNENt33KL9ZIMPNHUYeitUfC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=oYfW+7XKH2eufr3wwWW7S74KBwYxwQwzm12feByGYAN1mu8tfCf4zibH/a7S5f52W
	 h8bX+d0uQKcd66qMCGHz+lmA5xJifRvKdIs2pzYinh3bp84+AprhL+94VEsQHSkPmJ
	 t57NqXJZDjx0p/WDYFeWZTCJ4mkYJdv4i8ckNaxXTWgOCxjcDsDCUKnfHydeuR48RD
	 foKGANbNTzcUXbi+h9L22aYegVzR35YqOr+Grm8Tib4QVQ2mpJc2Gyrsup6wr5Y1nH
	 /uXRzixxaL/TnRPUzlDkXfb5fnDp4C6T0zwLeBbM9ce9aAAMk4OtTymoeVAe10Hucl
	 9DJTkm5qnQfgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 08/10] clk: realtek: Add RTD1625-CRT clock controller
 driver
Reply-To: sashiko@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260508111641.3192177-9-eleanor.lin@realtek.com>
References: <20260508111641.3192177-9-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 08 May 2026 23:17:30 +0000
Message-Id: <20260508231731.4692BC2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware race condition due to missing freq_ready_valid initializa=
tion in PLL structures.
- [Medium] Missing MODULE_DEVICE_TABLE for the clock controller driver.
- [Medium] rtk_clk_probe writes per-device regmap state into globally share=
d static clock structures.
- [Low] Kconfig dependency propagation violation for CLK_RTD1625.
- [Low] Typo in MODULE_DESCRIPTION of the reset driver.
--

commit 84d35dbda57cf6e9762915011a556ab1a6e99c67
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-CRT clock controller driver

Add support for the CRT (Clock, Reset, and Test) domain clock controller
on the Realtek RTD1625 SoC. This driver provides essential clock sources
(including PLLs), gating, and multiplexing functionalities for the
platform's peripherals.

> diff --git a/drivers/clk/realtek/Kconfig b/drivers/clk/realtek/Kconfig
> index 9efd70094bd27..2eaaa827ae3ac 100644
> --- a/drivers/clk/realtek/Kconfig
> +++ b/drivers/clk/realtek/Kconfig
> @@ -28,4 +28,19 @@ config RTK_CLK_COMMON
>  config RTK_CLK_PLL_MMC
>  	tristate
> =20
> +config CLK_RTD1625
> +	tristate "RTD1625 Clock Controller"
> +	depends on RESET_CONTROLLER
> +	select RESET_RTD1625

Should this config also depend on ARCH_REALTEK || COMPILE_TEST?

RESET_RTD1625 has this dependency, and selecting it without inheriting
the dependencies can cause unmet direct dependency warnings or build
failures on unsupported architectures.

> +	select RTK_CLK_COMMON

[ ... ]

> diff --git a/drivers/clk/realtek/clk-rtd1625-crt.c b/drivers/clk/realtek/=
clk-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..ec9d8f936199c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-crt.c

[ ... ]

> +static struct clk_pll pll_acpu =3D {
> +	.clkr.hw.init =3D CLK_HW_INIT("pll_acpu", "osc27m", &rtk_clk_pll_ops, C=
LK_GET_RATE_NOCACHE),
> +	.seq_power_on          =3D pll_acpu_seq_power_on,
> +	.num_seq_power_on      =3D ARRAY_SIZE(pll_acpu_seq_power_on),
> +	.seq_power_off         =3D pll_acpu_seq_power_off,
> +	.num_seq_power_off     =3D ARRAY_SIZE(pll_acpu_seq_power_off),
> +	.seq_pre_set_freq      =3D pll_acpu_seq_pre_set_freq,
> +	.num_seq_pre_set_freq  =3D ARRAY_SIZE(pll_acpu_seq_pre_set_freq),
> +	.seq_post_set_freq     =3D pll_acpu_seq_post_set_freq,
> +	.num_seq_post_set_freq =3D ARRAY_SIZE(pll_acpu_seq_post_set_freq),
> +	.freq_reg              =3D RTD1625_REG_PLL_SSC_DIG_ACPU1,
> +	.freq_tbl              =3D acpu_tbl,
> +	.freq_mask             =3D FREQ_NF_MASK,
> +	.freq_ready_reg        =3D RTD1625_REG_PLL_SSC_DIG_ACPU_DBG2,
> +	.freq_ready_mask       =3D BIT(20),
> +	.freq_ready_val        =3D BIT(20),
> +	.power_reg             =3D RTD1625_REG_PLL_ACPU2,
> +	.power_mask            =3D 0x7,
> +	.power_val_on          =3D 0x3,
> +	.lock                  =3D __SPIN_LOCK_UNLOCKED(pll_acpu.lock),
> +};

Will the clock framework assume this PLL is stable prematurely?

Because this structure is zero-initialized and .freq_ready_valid is not set
to 1, wait_freq_ready() may return 0 immediately without polling the
hardware PLL lock status. This could potentially lead to hardware lockups
or data corruption.

[ ... ]

> +static struct clk_regmap * const rtd1625_crt_regmap_clks[] =3D {
> +	&clk_en_misc.clkr,
> +	&clk_en_pcie0.clkr,
> +	&clk_en_gspi.clkr,

[ ... ]

> +	&clk_gpu.clkr,

Does this array pass statically allocated global clock objects to
rtk_clk_probe()?

Looking at rtk_clk_probe(), it iterates over desc->clks and writes the
per-device regmap state:

    for (i =3D 0; i < desc->num_clks; i++)
        desc->clks[i]->regmap =3D regmap;

If the device is unbound, could this leave a dangling pointer in the global
clock structures?

[ ... ]

> +static const struct of_device_id rtd1625_crt_match[] =3D {
> +	{.compatible =3D "realtek,rtd1625-crt-clk", .data =3D &rtd1625_crt_desc=
,},
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver rtd1625_crt_driver =3D {

Could this driver use a MODULE_DEVICE_TABLE() for rtd1625_crt_match?

Because CLK_RTD1625 is a tristate config, this can be built as a loadable
module. Without the macro, module auto-loading may fail when the device
tree node is encountered.

[ ... ]

> diff --git a/drivers/reset/realtek/reset-rtd1625-crt.c b/drivers/reset/re=
altek/reset-rtd1625-crt.c
> new file mode 100644
> index 0000000000000..13553e3224cd3
> --- /dev/null
> +++ b/drivers/reset/realtek/reset-rtd1625-crt.c

[ ... ]

> +MODULE_DESCRIPTION("Reatek RTD1625 CRT Reset Controller Driver");

This isn't a bug, but there's a typo in "Reatek" which should be "Realtek".

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260508111641.3192=
177-1-eleanor.lin@realtek.com?part=3D8
