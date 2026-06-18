Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAF573A1E8C
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 10:03:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781777022; cv=none; b=dI+YLjJFSUcSXlIOD8xOZoBn108jIJbKCCx6DeKROOJfeC5cD5RDXIq/lwuQoN7BJAdQHt6+NCXucpRQiItKBnV9IgEIJgDxO/Bzztd21MgZFq4+xaDkanZOy9sXKpjn2vxc7OsU4u13KqqIF6vqocmPD85o/epHmd5nQZbXCb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781777022; c=relaxed/simple;
	bh=GGqUTge0Na5GExg4J1gsQz32vmYLoZqKw40fY/cRIwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Tm8jOG29yVaycQDauh3qLIkKW9O7ZfFGJKaiIQFRv9hiwnML4DvKJjTjZOJIQgwfbmgkx63eNDLOqgO4k8YTU1KA/G2Jj2ae5KuAFDPIvA2sRaviVL8CLNKExGVajA89aykfk83V2PiMXUr0amN/QUmqNPNMRDVXXz2TWRRHfCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ci//CeAW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ci//CeAW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A42F1F00A3A;
	Thu, 18 Jun 2026 10:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781777021;
	bh=MNSKkFiiQ1fxo80SVhqE0FtboJXN22LiRMtR4XFzVsY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ci//CeAWMz9DYxYCbdDDHbPoRFxR9E8gYywjFIHWNHfnJyL8byGFVHOQRX45djJEY
	 45+2ASmeBXkeeGEG4gTLGzO0p5XYpeo8zm+wVTWCH413exLUpF4NPPNEJepdt2hi2V
	 Kw9U71QmumJ4QM8WICdng67rf2go4d6+sYxgkav5261pvpwYYHhbh7NyjPYdLLcPAO
	 rCjZH138XkDKBuaB0dAsnhtO1LShivK1ZfNaLwqanBgCqQ014VwIfW/D5h+trHz1rC
	 WFcV11qdLAUfX0OHs0KxFNf6bvr8Cvu0dDM0rPHd36wUfAr6TkHaRM6VVfUUAx+kMT
	 369xtllArR74w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] clk: amlogic: Add A9 AO clock controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jian Hu via B4 Relay" <devnull+jian.hu.amlogic.com@kernel.org>
Cc: linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
References: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
 <20260618-a9_aoclk-v4-2-569d0425e50c@amlogic.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 10:03:40 +0000
Message-Id: <20260618100341.0A42F1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The AO PWM clocks are registered without an `ao_` or `a9_ao_` pr=
efix, which will cause global namespace collisions with the main clock cont=
roller.
- [Low] Typographical error in the clock name string literal for the RTC du=
aldiv input gate: `ao_rtc_duandiv_in` instead of `ao_rtc_dualdiv_in`.
- [Low] Missing `#include <linux/module.h>` for `MODULE_*` macros.
--

commit ef5998ff087b6faed09d9eed4f59078d2b2f0a60
Author: Jian Hu <jian.hu@amlogic.com>

clk: amlogic: Add A9 AO clock controller driver
   =20
Add the Always-on clock controller driver for the Amlogic A9 SoC family.

> diff --git a/drivers/clk/meson/a9-aoclk.c b/drivers/clk/meson/a9-aoclk.c
> new file mode 100644
> index 0000000000000..88aa8cf3f5d00
> --- /dev/null
> +++ b/drivers/clk/meson/a9-aoclk.c
> @@ -0,0 +1,488 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2026 Amlogic, Inc. All rights reserved
> + */
> +
> +#include <dt-bindings/clock/amlogic,a9-aoclkc.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>

[Severity: Low]
Should this file explicitly include <linux/module.h>?

The file relies on several module macros at the end (such as MODULE_DESCRIP=
TION,
MODULE_AUTHOR, and MODULE_LICENSE). Although it currently compiles successf=
ully
due to transitive includes from <linux/platform_device.h>, standard kernel
practice is to include the header explicitly.

[ ... ]

> +static const struct clk_parent_data a9_ao_pwm_parents[] =3D {
> +	{ .hw =3D &a9_ao_xtal.hw },
> +	{ .fw_name =3D "fdiv5", },
> +	{ .fw_name =3D "fdiv4", },
> +	{ .fw_name =3D "fdiv3", }
> +};
> +
> +static A9_COMP_SEL(pwm_a, AO_PWM_CLK_A_CTRL, 9, 0x7, a9_ao_pwm_parents);

[Severity: Medium]
Will this cause a clock name collision with the main clock controller?

Because the A9_COMP_SEL macro uses the #_name stringification operator insi=
de
MESON_COMP_SEL, this will generate the clock name as exactly "pwm_a_sel"
(and similarly "pwm_a_div" and "pwm_a" for the others), without any "ao_" or
"a9_ao_" prefix.

If the main clock controller conventionally registers a "pwm_a" clock, fail=
ing
to prefix the Always-On clocks will lead to global namespace collisions in =
the
Common Clock Framework and debugfs.

> +static A9_COMP_DIV(pwm_a, AO_PWM_CLK_A_CTRL, 0, 8);
> +static A9_COMP_GATE(pwm_a, AO_PWM_CLK_A_CTRL, 8);
> +
> +static A9_COMP_SEL(pwm_b, AO_PWM_CLK_B_CTRL, 9, 0x7, a9_ao_pwm_parents);

[ ... ]

> +static struct clk_regmap a9_ao_rtc_dualdiv_in =3D {
> +	.data =3D &(struct clk_regmap_gate_data){
> +		.offset =3D AO_RTC_BY_OSCIN_CTRL0,
> +		.bit_idx =3D 31,
> +	},
> +	.hw.init =3D &(struct clk_init_data) {
> +		.name =3D "ao_rtc_duandiv_in",

[Severity: Low]
This isn't a bug, but there's a typo in the clock name literal. Should
"ao_rtc_duandiv_in" be "ao_rtc_dualdiv_in"?

> +		.ops =3D &clk_regmap_gate_ops,
> +		.parent_hws =3D (const struct clk_hw *[]) {
> +			&a9_ao_xtal.hw
> +		},

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-a9_aoclk-v=
4-0-569d0425e50c@amlogic.com?part=3D2
