Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4139B3A1E8C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777021; cv=none; b=f3KiAwByndIvqUanJvxGj9PIBTxgSt70OuT7aiAHUEdlPNewJuQ4KL6eF830hQquBkHKJsc1ZKfNVTaJvPleMvdCQeHL27KxXD+Ce0Oafv6KjkGCM7OaMMTyvYanAqGkJnqMKGaIWh0sGoIkmKMvvrLjTykiCO4tSgAuRWTW7zU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777021; c=relaxed/simple;
	bh=NuAjYVGkHfB2MdurFeILUuGfKpFzeV93O76NvC23z7Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=paBQ1lyNFnOsrlySzjZMG7YHKHKnMQ7QnneI/Jedc4xw6rq5qzswEXOhRgI2cMbvwPAHt6LZlJ2UYv/v/eJRsRNYZ9UpeAKjhW6bRjXKsNbJgNTxdjoZFnYGcGZU34qofNgTUkvchdQQXtQiZId03HFzmjXRZJvR0OBnu+qQUmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQLGFaK3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQLGFaK3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84DAF1F000E9;
	Thu, 18 Jun 2026 10:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781777019;
	bh=jJT2qzmGuolZTrVpAaRD9lBg4iP0nNq7iIFvEKa2JTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SQLGFaK3TlatN+inrja2w/vgK9ZFUi6VM0E57U7uj/cNjUNkmGUuGjxRN4+8/2yDK
	 OiMI+rkS/G0cQyPJ3/OCvYZOktuvdC2zNbADWp18IQ2Oj85SwmkUfmZRIrDdiiWXI5
	 jH7DszsWzQFRv3l/ieFunsFLJiZVyeJ/lh25HjcHTVjj3eMXvBnQ3DsagMXk/cA2UV
	 QEOlbF5HAyKBnS35X+nfQ4Mkp9nOu4S81E8lfiuTyJ4z8Qm+pvO3Ya2bGpuPZmQaA+
	 0OkSqdQVk0i+EoZvQuKXKCeyV8+TNb/zCwi1awrn/5ATKgHwCes6sWQpPhFOxcjEb4
	 T5tyzMY5fdCAg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260618-a9_peripherals-v4-2-fe120de44e77@amlogic.com>
References: <20260618-a9_peripherals-v4-0-fe120de44e77@amlogic.com>
 <20260618-a9_peripherals-v4-2-fe120de44e77@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 10:03:38 +0000
Message-Id: <20260618100339.84DAF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The `hdmitx1_pixel` clock uses the wrong parent selector.
- [Low] The Kconfig symbol `COMMON_CLK_A9_PLL` is implied by `COMMON_CLK_A9=
_PERIPHERALS` but is never defined anywhere in the kernel tree.
- [Low] Typographical error in clock name: `a9_encoder1` is named "encorder=
1".
--

commit da44ee1b1d311bf8f1d5f4603d86f2fb2a587588
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 peripherals clock controller driver
   =20
Add the peripherals clock controller driver for the Amlogic A9 SoC family.

> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index cf8cf3f9e4ee8..86d2e270e1b82 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,21 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
> =20
> +config COMMON_CLK_A9_PERIPHERALS
> +	tristate "Amlogic A9 SoC peripherals clock controller support"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARCH_MESON
> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
> +	imply COMMON_CLK_SCMI
> +	imply COMMON_CLK_A9_PLL

[Severity: Low]
Does the symbol COMMON_CLK_A9_PLL exist in the kernel tree? It appears to be
undefined, which means implying it has no effect. Could this be a typo or
perhaps a missing patch dependency?

[ ... ]
> diff --git a/drivers/clk/meson/a9-peripherals.c b/drivers/clk/meson/a9-pe=
ripherals.c
> new file mode 100644
> index 0000000000000..8e0ae3205d772
> --- /dev/null
> +++ b/drivers/clk/meson/a9-peripherals.c
[ ... ]
> +static struct clk_regmap a9_encoder1_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D VIID_CLK_DIV,
> +		.mask =3D 0xf,
> +		.shift =3D 8,
> +		.table =3D a9_vid_parents_val_table,
> +	},
> +	.hw.init =3D &(struct clk_init_data){
> +		.name =3D "encoder1_sel",
> +		.ops =3D &clk_regmap_mux_ops,
> +		.parent_hws =3D a9_vid_parents,
> +		.num_parents =3D ARRAY_SIZE(a9_vid_parents),
> +	},
> +};
> +
> +static struct clk_regmap a9_encoder1 =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D VID_CLK_CTRL2,
> +		.bit_idx =3D 11,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "encorder1",

[Severity: Low]
This isn't a bug, but there's a typo in the clock name (encorder1 instead of
encoder1).

> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&a9_encoder1_sel.hw
> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +	},
> +};
[ ... ]
> +static struct clk_regmap a9_hdmitx1_pixel =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D VID_CLK_CTRL2,
> +		.bit_idx =3D 12,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "hdmitx1_pixel",
> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&a9_hdmitx_pixel_sel.hw

[Severity: Medium]
Should this parent be &a9_hdmitx1_pixel_sel.hw instead of
&a9_hdmitx_pixel_sel.hw? Using a9_hdmitx_pixel_sel looks like a copy-paste =
error
that might route the clock incorrectly for the secondary HDMI transmitter.

> +		},
> +		.num_parents =3D 1,
> +		.flags =3D CLK_SET_RATE_PARENT,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-a9_periphe=
rals-v4-0-fe120de44e77@amlogic.com?part=3D2
