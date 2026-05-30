Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E34B2F8E85
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 15:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780156505; cv=none; b=C2gfimIcwu29PLhFEIKOmqUPBZejK2zTqdq/Cg3HmfdTmullSisrrpDW3bqx/nZTKI8skyAiKmZMZ0IeQR4ySyFCtJfxO80bHIT2z1x1nzdZqlAPVQmwyJje+reIuc3sBfmohZSDXGUf5RyYHc0ZDt6/ecyBavDaNigPhdfzSGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780156505; c=relaxed/simple;
	bh=p32N1A6MJAF5/f0ZIeYLKY4uNSBpo3cKwSrGUIAAsPo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P1KTCzIYGbSMANLxClLtpAGAeifn08ffXVx8vyxBDzn2dvsstHf0d+UHZYCyb/WbbZW+kXmRWebrj+wkTdYl0mY1mqUHTSPBCdyyp6ddgGeKNSjTYWgsOgbvC5dHg37aqXtHFOt+jozZfql+rAWBt2zWIADkVuasekXl5d+ZUjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LljiCEbA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LljiCEbA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A6C41F00893;
	Sat, 30 May 2026 15:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780156503;
	bh=0E4kamNgnpuM46YLzW6rA55y+k9dBBU1WRBMujmdKgk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LljiCEbAorBQ7XbHBjmGslJTsAmw3I7qgfwc/nDYOKwDagddXruEOPk4EzaB/3R5W
	 YmMOrqALzCeJX1SHpPa/d3mICfKRvUdC5oUNZWe+43cIZ3KKC7qnVsSqeD+58sf07X
	 5YZJutjA5EkkHtqrvqcf09M3E4vieYKoqIcmc9oqED4U4QJRhyOudLupMwPu4y5SvN
	 w8bpiLSBtNOCC4JD00gMxDjumTqkpY7iSfv5tmGWTWSipsTzB70UGjIfALiJxyvhXt
	 hjrMTh4YHQukhpTbe6ykYSKac/ZY5iiBShON3VJQVMrTjHGTQgZgSv+92ysmL4M9CT
	 FLjfOQCiXXZsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 6/6] pinctrl: mediatek: Add MT6735 pinctrl driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yassine Oudjana" <yassine.oudjana@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260530145800.1029920-7-y.oudjana@protonmail.com>
References: <20260530145800.1029920-7-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 15:55:03 +0000
Message-Id: <20260530155503.9A6C41F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] Missing `.pull_type` field initialization in `mt6735m_data` causes=
 an out-of-bounds array read during pin configuration.
- [High] The `mt6735_pull_type` array is smaller than the total number of r=
egistered pins, causing an out-of-bounds read when virtual EINT GPIOs are a=
ccessed.
- [High] The `WB SPI` pins incorrectly share RDSEL register bits with `MSDC=
0_CMD` due to a missing cross-address stride, overwriting its configuration.
- [Medium] The `mt6735_eint_hw` struct specifies `.db_cnt =3D 16` but compl=
etely omits the `.db_time` array initialization, breaking external interrup=
t debounce.
- [Low] The `PINCTRL_MT6735` configuration symbol lacks architecture-specif=
ic dependencies, violating cross-config consistency rules.
- [Low] The MAINTAINERS file assigns the device tree binding file for the u=
nrelated MT6779 platform to the MT6735 maintainer section.
--

commit 6bc2f83078b0f10dd52d6f0637645ffc40df6f25
Author: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: pinctrl: mediatek: Add MT6735 pinctrl driver

This commit introduces a new pin controller driver for the MediaTek MT6735
and MT6735M SoCs. It includes register mappings, pin definitions, and device
tree matching data.

> diff --git a/MAINTAINERS b/MAINTAINERS
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21087,6 +21087,9 @@ PIN CONTROLLER - MEDIATEK MT6735
>  M:	Yassine Oudjana <y.oudjana@protonmail.com>
>  L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained

[Severity: Low]
Is this the correct binding file for the MT6735 section? The path targets
mediatek,mt6779-pinctrl.yaml instead of the MT6735 binding, which might
misdirect get_maintainer.pl routing.

> +F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +F:	drivers/pinctrl/mediatek/pinctrl-mt6735.c

[ ... ]

> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/=
Kconfig
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -148,6 +148,12 @@ config PINCTRL_MT2712
>  	default ARM64 && ARCH_MEDIATEK
>  	select PINCTRL_MTK
> =20

[Severity: Low]
Does this symbol need an architecture dependency? Other similar MediaTek
drivers use depends on ARM64 || COMPILE_TEST. Without it, this option
might clutter menuconfig on unrelated architectures that support OF.

> +config PINCTRL_MT6735
> +	bool "MediaTek MT6735(M) pin control"
> +	depends on OF
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS

[ ... ]

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/=
mediatek/pinctrl-mt6735.c
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c

[ ... ]

> +static const struct mtk_pin_field_calc mt6735_pin_rdsel_range[] =3D {
> +	PINS_FIELD_BASE(0, 4, 2, GPIO_RDSEL, 32, 0x04, 24, 2),		/* EINT0~4 */

[ ... ]

> +	PINS_FIELD_BASE(183, 183, 6, GPIO_RDSEL, 32, 0, 24, 6),		/* MSDC0_RSTB =
*/
> +	PINS_FIELD_BASE(184, 185, 6, GPIO_RDSEL, 32, 0, 30, 2),		/* FM */

[Severity: High]
Could the missing cross-address stride here cause configuration overwrites?
In mt6735_pin_rdsel_range, the WB SPI pins specify an s_bit of 32 but
leave _x_addrs as 0. Because of the wrap-around in the offset calculation,
writing RDSEL for WB SPI appears to target bits 0-1 of GPIO_RDSEL, which
would clobber the configuration for MSDC0_CMD.

> +	PINS_FIELD_BASE(186, 189, 6, GPIO_RDSEL, 32, 0, 32, 2),		/* WB SPI */
> +	PINS_FIELD_BASE(198, 198, 1, GPIO_RDSEL, 32, 0, 4, 6),		/* MSDC2_CMD */

[ ... ]

[Severity: High]
Is it possible for this array to cause an out-of-bounds read?
The driver registers 213 total pins in mtk_pins_mt6735, but this
mt6735_pull_type array only explicitly defines up to index 203.
If the pinctrl framework queries the bias configuration for any virtual
EINT GPIO (indexes 204 and above), it looks like it will read past the end
of the array.

> +static const unsigned int mt6735_pull_type[] =3D {
> +	MTK_PULL_PULLSEL_TYPE,		/*   0 */
> +	MTK_PULL_PULLSEL_TYPE,		/*   1 */

[ ... ]

> +static const char * const mt6735_pinctrl_register_base_names[] =3D {
> +	"gpio", "iocfg0", "iocfg1", "iocfg2", "iocfg3", "iocfg4", "iocfg5"
> +};
> +
> +static const struct mtk_eint_hw mt6735_eint_hw =3D {
> +	.port_mask =3D 7,
> +	.ports     =3D 6,
> +	.ap_num    =3D 224,

[Severity: Medium]
Will external interrupt debounce work without the .db_time array defined?
The mtk-eint driver seems to explicitly check if eint->hw->db_time is
present, returning -EOPNOTSUPP if it is omitted. This might leave the
hardware debounce feature non-functional.

> +	.db_cnt    =3D 16,
> +};
> +
> +static const struct mtk_pin_soc mt6735_data =3D {

[ ... ]

> +static const struct mtk_pin_soc mt6735m_data =3D {
> +	.reg_cal =3D mt6735m_reg_cals,
> +	.pins =3D mtk_pins_mt6735m,
> +	.npins =3D ARRAY_SIZE(mtk_pins_mt6735m),
> +	.ngrps =3D ARRAY_SIZE(mtk_pins_mt6735m),
> +	.eint_hw =3D &mt6735_eint_hw,
> +	.gpio_m =3D 0,
> +	.ies_present =3D true,
> +	.base_names =3D mt6735_pinctrl_register_base_names,
> +	.nbase_names =3D ARRAY_SIZE(mt6735_pinctrl_register_base_names),

[Severity: High]
Does the absence of the .pull_type field here create a memory safety issue?
Without the pull_type pointer in mt6735m_data, Paris pinctrl framework
functions like mtk_pinconf_bias_get_combo will fall back to
MTK_PULL_TYPE_MASK and read the PINCTRL_PIN_REG_RSEL (index 23) register
configuration. Since mt6735m_reg_cals stops at PINCTRL_PIN_REG_PULLSEL
(index 18), this fallback path will read out of bounds.

> +	.bias_set_combo =3D mtk_pinconf_bias_set_combo,
> +	.bias_get_combo =3D mtk_pinconf_bias_get_combo,
> +	.drive_set =3D mtk_pinconf_drive_set_rev1,
> +	.drive_get =3D mtk_pinconf_drive_get_rev1,
> +	.adv_pull_get =3D mtk_pinconf_adv_pull_get,
> +	.adv_pull_set =3D mtk_pinconf_adv_pull_set,
> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530145800.1029=
920-1-y.oudjana@protonmail.com?part=3D6
