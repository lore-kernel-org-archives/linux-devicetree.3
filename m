Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F60C431E4C
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 15:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783698039; cv=none; b=SKqLwBb03ujMJ1dbd5JBKBuYckCUVvqmS1junjgZGveVc0/3JJIIWgNhVDYS6vBbmoTR9QnnGWxFtU009Eqq+i9QbYhJqYB2QhbGN2ceTYy1HLFXrNznQlfQkoUnjAkFb8DizQetk2XOYmtRhdA5TZ7Al5O1bv7JYxIHNBuJDgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783698039; c=relaxed/simple;
	bh=vB2iDXTHLRTQQjrM0yIyqakwoUK7g+E8ErrKilgFK30=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iY43w8ZiGZiGvVv/6TRtnmqBNo52KZGEAZlcKsLf48GEm1VOZ4G1vHyZO3RLNdNeumUhMyolUhILLiSJwJqyFcnMAluae6M3tNrrqXVRgAF9/dKoD1RL7GdLQ7SS8pj+R6EW7806ypLqVVjD4Ems/g2N/dE71f/3Ur3+fqaj2W4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4aJp7nx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4aJp7nx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5D1F1F000E9;
	Fri, 10 Jul 2026 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783698027;
	bh=H0ThWu3rbqf+rDlnQotuOGyGdak2qC/yuOTOTlrzXtk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U4aJp7nxB+IyAtfua08EoMDC/4HcDBNzADe80EQXAtIMTx1phNEUf+5i2UnzhKYFt
	 xUdCeSSoO0us43cHCNw9RGDG1Cf/BEynFspL+GxAgfNxUCmKRkg1RaaNQrl9x3x7S7
	 CX9PjI1xfTKQK+7BCRYdlxyG+5Vy9moJd4xmJ+44pj0DxepeKiftevhnbl+t0WPe4e
	 zPZGqtbEeLMPwuAjGNbQFtk7D229XhpnbW5R1l4dIOP4JenQMpFp9nMbsSWk8iYaGK
	 FxOUTDkDCT07gdz+lI+PeyM4Lx4e0q3KMH0UVp8dd563Hutua4EFmn0ttq28vklHaP
	 bXTEmpzipvlRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikolai Burov" <nikolai.burov@jolla.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 15:40:26 +0000
Message-Id: <20260710154026.B5D1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The slew rate (`PINCTRL_PIN_REG_SR`) register range incorrectly al=
iases the direction (`PINCTRL_PIN_REG_DIR`) register range, corrupting pin =
input/output state.
- [Low] Directly referencing `mtk_paris_pinctrl_pm_ops` without `pm_sleep_p=
tr()` causes a build failure when `CONFIG_PM_SLEEP` is disabled.

Pre-existing issues:
- [Critical] The `eint_pins_mt6858` array lacks designated initializers and=
 padding, leading to an out-of-bounds read and deterministic heap corruptio=
n during EINT initialization.
- [High] Missing `.remove` callback and `.suppress_bind_attrs =3D true` cau=
ses a Use-After-Free and memory leak on driver unbind.
--

--- Patch [2]: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858 ---
commit def1c2e865d76b34f711dc474e7d38bf58749658
Author: Nikolai Burov <nikolai.burov@jolla.com>

pinctrl: mediatek: Add driver for MT6858

This commit adds a pinctrl driver for the MT6858 (MediaTek Dimensity 7100)
SoC. It configures pin modes, directions, input/output states, and EINT
hardware mappings.

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6858.c b/drivers/pinctrl/=
mediatek/pinctrl-mt6858.c
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6858.c

[ ... ]

> @@ -1339,6 +1339,21 @@
>  static const struct mtk_pin_reg_calc mt6858_reg_cals[PINCTRL_PIN_REG_MAX=
] =3D {
>  	[PINCTRL_PIN_REG_MODE] =3D MTK_RANGE(mt6858_pin_mode_range),
>  	[PINCTRL_PIN_REG_DIR] =3D MTK_RANGE(mt6858_pin_dir_range),
>  	[PINCTRL_PIN_REG_DI] =3D MTK_RANGE(mt6858_pin_di_range),
>  	[PINCTRL_PIN_REG_DO] =3D MTK_RANGE(mt6858_pin_do_range),
>  	[PINCTRL_PIN_REG_SR] =3D MTK_RANGE(mt6858_pin_dir_range),

[Severity: High]
Does this code incorrectly alias the slew rate configuration to the directi=
on
register?=20

Setting the PINCTRL_PIN_REG_SR index to MTK_RANGE(mt6858_pin_dir_range)
means that when the device tree specifies PIN_CONFIG_SLEW_RATE, the core
will write to the direction register space. This could inadvertently alter=
=20
the pin's input/output direction instead of the slew rate.

>  	[PINCTRL_PIN_REG_SMT] =3D MTK_RANGE(mt6858_pin_smt_range),
>  	[PINCTRL_PIN_REG_IES] =3D MTK_RANGE(mt6858_pin_ies_range),

[ ... ]

> @@ -1360,6 +1375,12 @@
>  static const struct mtk_eint_hw mt6858_eint_hw =3D {
>  	.port_mask =3D 0xf,
>  	.ports     =3D 3,
>  	.ap_num    =3D 217,

[Severity: Critical]
This is a pre-existing issue, but can this lead to an out-of-bounds read
during initialization?=20

In mtk_eint_do_init(), the core loops up to ap_num - 1. Because the=20
eint_pins_mt6858 array skips unsupported pins and lacks designated=20
initializers, the compiler packs it into exactly 142 elements. Iterating=20
up to 216 will read past the array bounds and could corrupt the heap when=20
indexing the dynamically allocated pin_list.

>  	.db_cnt    =3D 36,
>  	.db_time   =3D debounce_time_mt6878,
>  };

[ ... ]

> @@ -1390,6 +1411,10 @@
>  static struct platform_driver mt6858_pinctrl_driver =3D {

[Severity: High]
This is a pre-existing issue, but can this cause a use-after-free if the=20
driver is unbound via sysfs?=20

Since the platform driver lacks a .remove callback and does not set=20
.suppress_bind_attrs =3D true, a privileged user can unbind it. Devres will=
=20
free the hw and eint structures, but the manually created IRQ domain and=20
chained handler remain registered. Subsequent hardware interrupts might=20
execute the handler and dereference the freed eint pointer.

>  	.driver =3D {
>  		.name =3D "mt6858-pinctrl",
>  		.of_match_table =3D mt6858_pinctrl_of_match,
>  		.pm =3D &mtk_paris_pinctrl_pm_ops,

[Severity: Low]
Can this cause a link-time build failure?=20

The mtk_paris_pinctrl_pm_ops struct is exported using the=20
EXPORT_GPL_DEV_SLEEP_PM_OPS() macro, which discards the symbol when=20
CONFIG_PM_SLEEP is disabled. Should this reference be wrapped in=20
pm_sleep_ptr() to avoid an undefined reference error?

>  	},
>  	.probe =3D mtk_paris_pinctrl_probe,
>  };

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h b/drivers/pinc=
trl/mediatek/pinctrl-mtk-mt6858.h
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h

[ ... ]

> @@ -2154,6 +2154,10 @@
>  static struct mtk_eint_pin eint_pins_mt6858[] =3D {
>  	MTK_EINT_PIN(0, 2, 0, 1),
>  	MTK_EINT_PIN(1, 2, 1, 1),

[ ... ]

>  	MTK_EINT_PIN(120, 0, 73, 0),
>  	MTK_EINT_PIN(121, 0, 74, 0),
>  	MTK_EINT_PIN(197, 3, 0, 0),

[Severity: Critical]
This is a pre-existing issue, but can this sequence cause an out-of-bounds
memory access?

The array jumps directly from pin 121 to 197. Without using designated=20
initializers, the compiler simply packs the elements sequentially, making=20
the array much smaller than the expected ap_num of 217.

>  	MTK_EINT_PIN(198, 3, 1, 0),
>  	MTK_EINT_PIN(199, 3, 2, 0),

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-mt6858-pin=
ctrl-v1-0-f75ab558f0df@jolla.com?part=3D2
