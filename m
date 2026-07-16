Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55EF93C09E2
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784241764; cv=none; b=un+frBH2o35tDr1wX6F3AwDaT+rm6f0y+rvvmY43oXw9XrhMLVEYlE9gJ5noYVKKwqQL/Q6BMCAU/hrRuNRiYny4FUB+lsHkva62FGdBLyYd2whQtPRa0dywQy/G5Py1mXqsYb/kSUrW65PoMMosjLTct9TgqVeLWcd7atBv/NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784241764; c=relaxed/simple;
	bh=wAN8v6YTXFeI8SCNgrhnCo0doYsqWSmhkzt90MQ88d0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kqsp9f5pBDnpenOnnRoWsVfVVS6HwfwblGZXS6Bva4AXyPYaza60WKOXCcmHH3jsP9b/qtNEgcVnTLUZpcIP7Q5shsyet744JY4E32mekoOIwgJcSUQ3VlGRq7S+eBc4aWztceTbuaYpC5Jhv/XuEwqeWdjfAzAQgZ+KTKHy6z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixulkd/s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixulkd/s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAFFF1F000E9;
	Thu, 16 Jul 2026 22:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784241762;
	bh=219E/M8ThrQ4GKvUqub4sdBil8Tcs5WqQb+YTtFsf8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ixulkd/sRaDahiWMSguxN4t9cyDDxpTGLAOyQUYXlE/6kQr1tges3BpOP0XAPim/u
	 hsauTRrdSYAbFBcxmF0qhdaqLuCJJ/b3q9fjTjQqBK4ms1XbbnxARE2i2uSf1CuP2H
	 JxsDLcGHI7a99+FMjVdxLfhtMdw+cEDpwSdXe5VTwIPghSH0WQWJpF91AWhzMbYLhZ
	 SUMdAUve/13GlqMFi95hKrn0vVW9Qf47j87w5OS+Hopdoc18G79IlVpx1cJOJBt+nu
	 +MeKJmJ9D1EQoeSWUt06asGMuKoYjvVp47KU1QLe2nmGuA57SGzYaRepZ6gjuNpVCU
	 xfL7iNY51lJBw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 09/13] clk: zte: Introduce a driver for zx297520v3
 top clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: devicetree@vger.kernel.org, olteanv@gmail.com, robh@kernel.org, vkoul@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, conor+dt@kernel.org
In-Reply-To: <20260717-zx29clk-v7-9-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-9-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:42:41 +0000
Message-Id: <20260716224241.BAFFF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Using `clk_main[0]` to initialize the `.parent` field in the `zx297=
520v3_top_gates` static array is a violation of ISO C rules for constant ex=
pressions, resulting in a hard compile error.
--

--- Patch [9]: [PATCH v7 09/13] clk: zte: Introduce a driver for zx297520v3=
 top clocks ---
commit 8a7fee3879cf08b60157cde425eed4bbaa05fcb1
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

clk: zte: Introduce a driver for zx297520v3 top clocks

This commit introduces a clock driver for the ZTE zx297520v3 SoC top clocks.
It supports core devices such as PLLs, the AHB bus, timers, the USB
controller, and the Cortex M0 processor.

> diff --git a/drivers/clk/zte/clk-zx297520v3.c b/drivers/clk/zte/clk-zx297=
520v3.c
> new file mode 100644
> index 0000000000000..20ff00ba5f670
> --- /dev/null
> +++ b/drivers/clk/zte/clk-zx297520v3.c

[ ... ]

> +static const struct zx_gate_desc zx297520v3_top_gates[] =3D {

[ ... ]

> +	/* AHB clock gates: Disabling these cuts off the A53 from register acce=
ss into 0x130000/
> +	 * 0x140000, including the topcrm region, so it can't be re-enabled. Ma=
rk them critical for
> +	 * that reason.
> +	 *
> +	 * Gating this off does not stop the M0 rproc, nor does it stop M0 from=
 accessing topcrm. It
> +	 * does however gate off M0 from the AXI interconnect, so it can't read=
 RAM, Matrix, etc. So
> +	 * these bits here merely gate the bus, not the actual devices.
> +	 */
> +	GATE(ZX297520V3_AHB_PCLK,          "ahb-pclk",       "ahb-mux",        =
0x54, 12,
> +		CLK_IS_CRITICAL),
> +	GATE(ZX297520V3_AHB_WCLK,          "ahb-wclk",       "m0-mux",         =
0x54, 13,
> +		CLK_IS_CRITICAL),
> +
> +	/* SRAM1 and 2 clocks. Leave them on for now, as turning them off carel=
essly hangs the M0 */
> +	GATE(ZX297520V3_SRAM1_PCLK,        "sram1-pclk",     clk_main[0],      =
0x54, 18,
> +		CLK_IS_CRITICAL),

[Severity: Low]
Does using clk_main[0] to initialize elements of a static array cause a bui=
ld
failure?

In C, array accesses are not treated as constant expressions. Initializing =
the
zx297520v3_top_gates static array with clk_main[0] will cause the compiler
to fail with an "initializer element is not constant" error.

Could a string literal like "clock-26m" be used directly instead?

> +	GATE(ZX297520V3_SRAM2_PCLK,        "sram2-pclk",     clk_main[0],      =
0x54, 16,
> +		CLK_IS_CRITICAL),
> +
> +	/* Pinmux (AON, TOP, IOCFG but not PDCFG). Critical as well until we ha=
ve a driver that
> +	 * consumes it. I don't think we'll realistically shut this off ever.
> +	 *
> +	 * Setting either bit 0 or 1 in register 0x58 makes the device work.
> +	 */
> +	GATE(ZX297520V3_PMM_WCLK,          "pmm-wclk",       clk_main[0],      =
0x58,  0,
> +		CLK_IS_CRITICAL),
> +	GATE(ZX297520V3_PMM_PCLK,          "pmm-pclk",       clk_main[0],      =
0x58,  1,
> +		CLK_IS_CRITICAL),

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D9
