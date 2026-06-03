Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCF4395AD3
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780489293; cv=none; b=Fmf267+9AkGHotU2p5yQRjDF0Lf2vsQ4ts0W2ocOSfjc36SQQeDMx4diaYWLkmdBiMbwaCevjjgTEMtNlYl6X18ceNa0n1JjRgRXsz8Q3iotqB5pTULF//L0uM7ky5WhW72yoGt+uYyZURAMKpxGLuKtaZ3C0SzjMGhzeKxa+xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780489293; c=relaxed/simple;
	bh=Ij6ebVvCkmso5cH2H4ztjK1lDCD4XYNO58CyQr2gOXQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=awXlYWbGijJn5MEG6F7vjJUPfBC6+G7ln7i78shBVVSDjh/XQf+9cMfWkZCjdnX8QDCryvVowjTUW/MDvKuN2O4bdH81FIiViggvXME4s2IWkvJnH82jh00127iNZqcksVfKdy/c3/usxfEf8GcT9h/zVOMA9FvaDPPVau2Fvss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJJbVF0J; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJJbVF0J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99DE01F00893;
	Wed,  3 Jun 2026 12:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780489292;
	bh=JTYtIX+uJFZgrZO0fgEM4Cl9qSRm+lSN+DO/pDz7VTo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AJJbVF0JVPfDLfbySEDUV72XsZbtR2/wL1i6EJnNhDHhGah/dK+IB/oebpXiVWPbw
	 MjDvbrhQCXjk4oCo4mUFeMGo5bOEhqOPpFm3GFR7yvbqX9IJlkcIuKIetglbfcqPJD
	 4JV2KzdYcE/U57hGdgiyBUV7zEQajd8xDArAqCWjgEhOJJ5UADfWBXnJ/8qwNH3kLm
	 drWBYHAklv+nB70gVXnU2e8iXfiiQP8g6nn+cnwThbyronq/gDJoPzBh4d0qcIesx5
	 3v0m/YxRfH6x9+FfPkYY6g6M+OHSU/XaCYM8EzbkpL2rDbVoO5RFW0zi+N4NYoOWtg
	 QXVRHAc9qb4zQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 peripherals clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260603-a9_peripherals-v2-2-ee1b8c0a1e6c@amlogic.com>
References: <20260603-a9_peripherals-v2-2-ee1b8c0a1e6c@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 12:21:31 +0000
Message-Id: <20260603122131.99DE01F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] The divider and gate definitions for the `gen` clock overlap on bi=
t 11 in the `GEN_CLK_CTRL` register.
- [High] The `a9_hdmitx1_pixel` clock incorrectly references `a9_hdmitx_pix=
el_sel.hw` as its parent instead of its own multiplexer `a9_hdmitx1_pixel_s=
el.hw`.
- [High] The `usb_48m_pre` multiplexer is missing a value translation table=
, mapping the 6th parent to an unconnected hardware channel.
- [Low] The Kconfig symbol `COMMON_CLK_A9_PERIPHERALS` implies a non-existe=
nt symbol `COMMON_CLK_A9_PLL`.
- [Low] The `COMPILE_TEST` option is used incorrectly in the Kconfig `defau=
lt` statement and is missing from `depends on`.
--

commit bae2f7359df3d153442d5e8943999c98d3682a16
Author: Jian Hu <jian.hu@amlogic.com>
Subject: clk: amlogic: Add A9 peripherals clock controller driver

Add the peripherals clock controller driver for the Amlogic A9 SoC family.

> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,21 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
> =20
> +config COMMON_CLK_A9_PERIPHERALS
> +	tristate "Amlogic A9 SoC peripherals clock controller support"
> +	depends on ARM64
> +	default ARCH_MESON || COMPILE_TEST

[Severity: Low]
Is the COMPILE_TEST directive intended to be here? Placing COMPILE_TEST in =
the
default expression enables this driver by default on all ARM64 architectures
when compile testing is active. Should it instead use
"depends on ARM64 || COMPILE_TEST" and "default ARCH_MESON"?

> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS
> +	select COMMON_CLK_MESON_DUALDIV
> +	select COMMON_CLK_MESON_VID_PLL_DIV
> +	imply COMMON_CLK_SCMI
> +	imply COMMON_CLK_A9_PLL

[Severity: Low]
Does COMMON_CLK_A9_PLL exist in the tree? Kconfig will silently ignore
non-existent implied symbols, which might mean a missing patch or typo.

> +	help

[ ... ]

> diff --git a/drivers/clk/meson/a9-peripherals.c b/drivers/clk/meson/a9-pe=
ripherals.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/clk/meson/a9-peripherals.c
> @@ -0,0 +1,1927 @@

[ ... ]

> +/* Channel 5 and 6 are unconnected. */
> +static u32 a9_usb_250m_parents_val_table[] =3D { 0, 1, 2, 3, 4, 7 };
> +static const struct clk_parent_data a9_usb_250m_parents[] =3D {
> +	{ .fw_name =3D "fdiv4", },
> +	{ .fw_name =3D "fdiv3", },
> +	{ .fw_name =3D "fdiv5", },
> +	{ .fw_name =3D "fdiv2", },
> +	{ .fw_name =3D "fdiv7", },
> +	{ .fw_name =3D "fdiv2p5", }
> +};
> +
> +static A9_COMP_SEL(usb_250m, USB_CLK_CTRL, 9, 0x7, a9_usb_250m_parents,
> +		   a9_usb_250m_parents_val_table);
> +static A9_COMP_DIV(usb_250m, USB_CLK_CTRL, 0, 7);
> +static A9_COMP_GATE(usb_250m, USB_CLK_CTRL, 8, 0);
> +
> +static const struct clk_parent_data a9_usb_48m_pre_parents[] =3D {
> +	{ .fw_name =3D "fdiv4", },
> +	{ .fw_name =3D "fdiv3", },
> +	{ .fw_name =3D "fdiv5", },
> +	{ .fw_name =3D "fdiv2", },
> +	{ .fw_name =3D "fdiv7", },
> +	{ .fw_name =3D "fdiv2p5", }
> +};
> +
> +static A9_COMP_SEL(usb_48m_pre, USB_CLK_CTRL, 25, 0x7, a9_usb_48m_pre_pa=
rents,
> +		   NULL);

[Severity: High]
Does usb_48m_pre need a value translation table as well? It shares the same
parent list as usb_250m, where the 6th parent (fdiv2p5) maps to hardware va=
lue
7 because channels 5 and 6 are unconnected. By passing NULL here, selecting
fdiv2p5 writes value 5 to the register, connecting it to a dead channel.

> +static A9_COMP_DIV(usb_48m_pre, USB_CLK_CTRL, 16, 7);
> +static A9_COMP_GATE(usb_48m_pre, USB_CLK_CTRL, 24, 0);

[ ... ]

> +static A9_COMP_SEL(gen, GEN_CLK_CTRL, 12, 0x1f, a9_gen_parents,
> +		   a9_gen_parents_val_table);
> +static A9_COMP_DIV(gen, GEN_CLK_CTRL, 0, 12);
> +static A9_COMP_GATE(gen, GEN_CLK_CTRL, 11, 0);

[Severity: High]
Can these definitions cause conflicts? The divider for the gen clock has a
width of 12 (bits 0-11), while the gate is defined at bit 11 of the same
register.

If the divider is updated, it might unintentionally toggle the gate, and
toggling the gate might corrupt the most significant bit of the divider.

[ ... ]

> +static struct clk_regmap a9_hdmitx1_pixel_sel =3D {
> +	.data =3D &(struct clk_regmap_mux_data){
> +		.offset =3D HDMI_CLK_CTRL,
> +		.mask =3D 0xf,
> +		.shift =3D 24,
> +		.table =3D a9_vid_parents_val_table,
> +	},
> +	.hw.init =3D CLK_HW_INIT_PARENTS_HW("hdmitx1_pixel_sel", a9_vid_parents
> +			, &clk_regmap_mux_ops, 0),
> +};
> +
> +static struct clk_regmap a9_hdmitx1_pixel =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D VID_CLK_CTRL2,
> +		.bit_idx =3D 12,
> +	},
> +	.hw.init =3D CLK_HW_INIT_HW("hdmitx1_pixel", &a9_hdmitx_pixel_sel.hw,

[Severity: High]
Should this reference a9_hdmitx1_pixel_sel.hw instead? It appears to be bou=
nd
to the primary HDMI TX selector (a9_hdmitx_pixel_sel.hw). This would tie the
secondary HDMI output to the primary multiplexer.

> +				  &clk_regmap_gate_ops, CLK_SET_RATE_PARENT),
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-a9_periphe=
rals-v2-0-ee1b8c0a1e6c@amlogic.com?part=3D2
