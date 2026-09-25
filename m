Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10C8C4DD3C4
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352593; cv=none; b=NMbz6I7yLoHT/7jMNMboTe9NUPwrKJq6oOeIpQWSzj6PrNkmjj9qXrGA0MHciQITgkhmxKdf+1OiAz5+llEXoIfb+yem3K4ycu5v53KOXlq/YBu5uE+gawFQARKRy/zx9Zkt7IgC0fAKDtlxELvadynrgP41GK8BpxeJU1jJpQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352593; c=relaxed/simple;
	bh=kyetx4MPAXUMQlZYSJyh2crAVzr8w+goFHHH58P4saM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aOJtD4GsasFjXXNaJbmICCuZXuxy7lwus60ymBw+TIDtzwv/itTKF0eXWZEMRXfY81iyv/1Evu5MdHkAsK/hGiElI+pXseL30LrYwEjNOuJgzmyKWMbgvDQ/NJcHAE+5ZlGu7zY7iHG9tSmTJKyZ8GPFrWuRopeMQ+H2klgvh/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JBHWb5ne; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JBHWb5ne"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 936C01F000FF;
	Fri, 25 Sep 2026 16:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790352585;
	bh=zKimJ05z6g5bR01B7KLQttRU7WOXXwUdDrB0JTa9RcM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JBHWb5ne+fHMdTDWQ2XEb1gTI2+BdnJjJ7K4UVQ0IyvEZcRAGBiB01i9SxR4ROmzk
	 e2sPZs1xEnAv9YfxNF1cJYtKDPBWheYzVGycVgdQvVzUVX2e6c99NFUy1Wf9/tN45/
	 0EAGfBBrd4ERUW23bcpBFG3qwm8jcxfYruxd5sC4jvtk45UIy+a8LU66MKXnUm4x5E
	 Su2eezgrPFAM+QD9Edx9GsdxfMl8MnVOpiDJFe3tH52P23YgZ2CKmS7FfmmZ9W62OE
	 oxizLKSGHKOz209J6i7OmhEehR/ASCwIdL5OLuMbQCxYi2y6mxjF0UdyBz248eXBzA
	 UDTzgsuTvc/Kg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <y.oudjana@protonmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260925-mt6735-pinctrl-v9-v9-6-bfb19d8bb87c@protonmail.com>
References: <20260925-mt6735-pinctrl-v9-v9-0-bfb19d8bb87c@protonmail.com>
 <20260925-mt6735-pinctrl-v9-v9-6-bfb19d8bb87c@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 16:09:45 +0000
Message-Id: <20260925160945.936C01F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] pinctrl: mediatek: mt6735: missing pull_type element causes off-by=
-one and OOB read
- [High] pinctrl: mediatek: mt6735: missing PINCTRL_PIN_REG_MAX bounds crea=
tes OOB read vulnerability
- [Low] pinctrl: mediatek: mt6735: inconsistent pin function names using sq=
uare brackets
--

commit 13f59080a920a07d8352caa06c8ae89603f98199
Author: Yassine Oudjana <y.oudjana@protonmail.com>

pinctrl: mediatek: Add MT6735 pinctrl driver

Add a driver for the MediaTek MT6735 SoC pin controller. This driver
also supports the pin controller on MT6735M, which lacks 6 physical
pins (198-203) used for MSDC2 on MT6735.

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/me=
diatek/pinctrl-mt6735.c
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
[ ... ]
> static const struct mtk_pin_reg_calc mt6735_reg_cals[] =3D {
> 	[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6735_pin_dir_range),
> 	[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6735_pin_di_range),

[Severity: High]
Does this array need to be explicitly sized with PINCTRL_PIN_REG_MAX?

The core validation in mtk_hw_pin_field_get() verifies
field < PINCTRL_PIN_REG_MAX and accesses hw->soc->reg_cal[field].range.
Because this array stops implicitly at the highest initialized enum, reading
an uninitialized or out-of-bounds field can read past the array and cause
an out-of-bounds read vulnerability.

[ ... ]
> static const struct mtk_pin_reg_calc mt6735m_reg_cals[] =3D {
> 	[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6735m_pin_dir_range),
> 	[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6735m_pin_di_range),

[Severity: High]
Does this array also need explicit sizing with PINCTRL_PIN_REG_MAX to avoid
the same out-of-bounds read vulnerability as mt6735_reg_cals?

[ ... ]
> 	MTK_PULL_PULLSEL_TYPE,		/*  57 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  58 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  60 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  61 */

[Severity: High]
Is index 59 intentionally skipped here?

The mt6735_pull_type array skips index 59, but the corresponding pin
declaration array mtk_pins_mt6735 contains GPIO59. This shift by one causes
the framework to apply the wrong pull configuration rules to all pins from =
60
upwards. Also, because the array is undersized by 1, reading the pull type
for the final pin will result in an out-of-bounds read.

[ ... ]
> 	MTK_PULL_PULLSEL_TYPE,		/*  57 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  58 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  60 */
> 	MTK_PULL_PULLSEL_TYPE,		/*  61 */

[Severity: High]
Does the MT6735M pull type array also skip index 59?

This will cause the same off-by-one mapping shift and out-of-bounds read
as seen in the MT6735 array.

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h b/drivers/pinctr=
l/mediatek/pinctrl-mtk-mt6735.h
--- /dev/null
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
[ ... ]
> 	MTK_PIN(
> 		4, "GPIO4",
> 		MTK_EINT_FUNCTION(0, 4),
> 		DRV_GRP2,
> 		MTK_FUNCTION(0, "GPIO4"),
> 		MTK_FUNCTION(1, "CLKM2"),
> 		MTK_FUNCTION(2, "DPI_D8"),
> 		MTK_FUNCTION(3, "SPI_MOB"),
> 		MTK_FUNCTION(4, "TDD_TCK"),
> 		MTK_FUNCTION(5, "CONN_MCU_TCK[0]"),
> 		MTK_FUNCTION(6, "CONN_MCU_AICE_TCKC"),
> 		MTK_FUNCTION(7, "C2K_DM_EINT0")
> 	),
[ ... ]
> 	MTK_PIN(
> 		71, "GPIO71",
> 		MTK_EINT_FUNCTION(0, 71),
> 		DRV_GRP0,
> 		MTK_FUNCTION(0, "GPIO71"),
> 		MTK_FUNCTION(1, "JTCK"),
> 		MTK_FUNCTION(2, "CONN_MCU_TCK[1]"),
> 		MTK_FUNCTION(3, "LTE_MD32_JTAG_TCK"),

[Severity: Low]
Are these square brackets intended in the pin function name?

Square brackets can break identifier parsing conventions in scripts or tools
parsing sysfs/debugfs. Also, the MT6735M variant uses an underscore for
this pin instead:

> 	MTK_PIN(
> 		4, "GPIO4",
> 		MTK_EINT_FUNCTION(0, 4),
> 		DRV_GRP2,
> 		MTK_FUNCTION(0, "GPIO4"),
> 		MTK_FUNCTION(1, "CLKM2"),
> 		MTK_FUNCTION(2, "DPI_D8"),
> 		MTK_FUNCTION(3, "SPI_MOB"),
> 		MTK_FUNCTION(4, "TDD_TCK"),
> 		MTK_FUNCTION(5, "CONN_MCU_TCK_0"),

Can we use standard underscore notation consistently across both variants?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925-mt6735-pin=
ctrl-v9-v9-0-bfb19d8bb87c@protonmail.com?part=3D6
