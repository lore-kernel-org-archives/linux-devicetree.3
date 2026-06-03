Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22542F0C45
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490085; cv=none; b=o4l69TqcTEL8dvMKsVJjgdQwuYmWKwxNbOGA13abaibiqE+/W54YNKG0Xj3oFBo6SorCvHR+B8FhmAGiuVbMJag8ZFRuDF3BWGTvnHFIJT0qhQ1a92LhwuyyBKwF+RTbYV9SFZ5O4q6Eo4JW/95NQOIArm9KT6fBo0wvBPYA7XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490085; c=relaxed/simple;
	bh=LCKGgRSClRIv6NDOE1rMBSRLVIiqybhKrLobAmPDBRc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aUE5Y5ytaz4d77i7g41jOc1G0w6I/Z1dhmzcpFOniqhUGtzOwSd7yvgTuB28q2jQxmEnEFmfc3L/ziqtHR+5aD1wokpno8hljXN8hj7Pv/Sb4U5qLvCJirBoV/gA8WsRiLAi/n6VR8jgQZEwTNo+Flo++PpwP3E76qVj/ho8z3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpA5m2t4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpA5m2t4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 132711F00893;
	Wed,  3 Jun 2026 12:34:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780490084;
	bh=8UD23uJw27FwM4BNCBjpLFtRuqU8u+Zb6KTd0T9i1BY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpA5m2t4PWDXQVUY72LtYjclXjJHlexb/tXB+HMO9qdcf5Hu3DzOF7O6klyq6t/37
	 eMsr2KP9sdnsl6wZDXcKzfykCp14dAQgFiX7Q4cl4WfH0KMpjpnWu0n1BAHpkQwfW+
	 goV2571fu4cKhxdXQvE/2s8rUSlWalDW1y93JkgD+6OQsF95WBnLfcCx4PA4ivhWoI
	 abUrfogx18aEPncrjtAfiLLfNCprJ7P2LFric1ALHrRwxcW2rIS396lSZfaw/VYO6E
	 jtA4pRCEwmhDhkwbnNUHbiCIW5mNKDGY3485WeUOn2PmZhH3lnRJYNFE2qb/E8kBfN
	 uihJtkNNsrXig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] clk: amlogic: Add A9 AO clock controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
References: <20260603-a9_aoclk-v2-2-f47ea616ee78@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 12:34:43 +0000
Message-Id: <20260603123444.132711F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] The Kconfig symbol `COMMON_CLK_A9_AO` inappropriately uses `default=
 ARCH_MESON || COMPILE_TEST`. This forces the driver to be enabled by defau=
lt on all compile-test builds, polluting the default configuration and brea=
king cross-config consistency.
- [Low] The clock controller driver defines an internal clock as `i2c3` but=
 maps it to `CLKID_AO_SYS_I3C`, indicating a typo where 'i3c' was mistakenl=
y written as 'i2c3'.
--

commit a36917077cf54c71ca4b917e7b2122bd84e2b956
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 AO clock controller driver

This commit adds the Always-on clock controller driver for the Amlogic A9
SoC family.

> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index cf8cf3f9e4ee8..625e6788b9406 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -132,6 +132,19 @@ config COMMON_CLK_A1_PERIPHERALS
>  	  device, A1 SoC Family. Say Y if you want A1 Peripherals clock
>  	  controller to work.
> =20
> +config COMMON_CLK_A9_AO
> +	tristate "Amlogic A9 SoC AO clock controller support"
> +	depends on ARM64
> +	default ARCH_MESON || COMPILE_TEST

[Severity: Low]
Should COMPILE_TEST be used in a default directive here?=20

By including it in the default expression, the driver will automatically be
enabled on all compile-test builds, polluting the default configuration.=20
Usually, COMPILE_TEST is placed in the 'depends on' clause instead to=20
allow build coverage without forcing it on by default.

> +	select COMMON_CLK_MESON_REGMAP
> +	select COMMON_CLK_MESON_CLKC_UTILS

[ ... ]

> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 0000000000000..b7b3ca231a42b
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c

[ ... ]

> +/*
> + * A9 integrates a low-power microprocessor (Always-on CPU: AOCPU). Some=
 AO sys
> + * clocks control the AOCPU modules. Mark the AOCPU-related clocks with
> + * CLK_IS_CRITICAL to avoid them being disabled and impacting AOCPU func=
tionality.
> + * AOCPU-related clocks list:
> + * - clktree
> + * - rst_ctrl
> + * - pad
> + * - irq
> + * - pwrctrl
> + * - aocpu
> + * - sram
> + */
> +static A9_AO_PCLK(i2c3,		0,	0);

[Severity: Low]
Is this intended to be an I3C clock rather than I2C?=20

Since the driver defines the other I2C controllers alphabetically (i2c_a,=20
i2c_b, etc.), and this gets mapped to CLKID_AO_SYS_I3C below, it looks like=
=20
'i2c3' might be a typo for 'i3c'.=20

Because of the macro stringification, this typo will cause the Common Clock=
=20
Framework to register the clock with the wrong name.

> +static A9_AO_PCLK(rtc_reg,	1,	0);
> +static A9_AO_PCLK(clktree,	2,	CLK_IS_CRITICAL);

[ ... ]

> +static struct clk_hw *a9_ao_hw_clks[] =3D {
> +	[CLKID_AO_XTAL_IN]		=3D &a9_ao_xtal_in.hw,
> +	[CLKID_AO_XTAL]			=3D &a9_ao_xtal.hw,
> +	[CLKID_AO_SYS]			=3D &a9_ao_sys.hw,
> +	[CLKID_AO_SYS_I3C]		=3D &a9_ao_sys_i2c3.hw,

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-a9_aoclk-v=
2-0-f47ea616ee78@amlogic.com?part=3D2
