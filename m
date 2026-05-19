Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630643939B6
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 09:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779181717; cv=none; b=OFSnQ1HNVEVW2+LvCn4bXthwDX0+9By9hZm5+o0y85+mKWeOO2lv+5JwvIcNLU1XrL5TyunCwNuRfLTdIg+DND63Rm+5w3CbZWS4CQgiNBmpooVulPfW49qPXwjwpc3a2W95XUb1/7R+NESU3h4UGDP23cfvP9DBbnG87LUZNPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779181717; c=relaxed/simple;
	bh=04kn6h0Ii7cn04gbOfe7s20JSSAMSaKY3u80COPNv/o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZybMO2BFEUuV1mY8v2hI4es1I6DFqJp+uMXiyvUmSUkApuCneooDop3u7gKWgbVaefh7OenuykTnObqQnk4zmjfKT24tH6lTDXbLu0KwGdZO2pehKP8cf5JfVHgPdke0V+JBVcDg5fyArDW+jHZCJp/gK98elcqPmTyr9zaCHc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K83kR4Wh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K83kR4Wh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44E0CC2BCC9;
	Tue, 19 May 2026 09:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779181717;
	bh=04kn6h0Ii7cn04gbOfe7s20JSSAMSaKY3u80COPNv/o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=K83kR4WhagTiv9/Bg6X7YcS1W2dtxi6Rpt14BOQ18x4ofEE2IkzE1wJVXNHehk84/
	 DBz/zX5EGTUpYWV6UYNY38pbmvguLWv01dSHnPhGoIF+q5gGUnabQ59aiO2oRX3T+o
	 d38LZR+xc3Jp2WWY6LfZ/IjEg/KueD88Pt3vGlwFAyiunV0FcfWN+V4NrzlVUE06am
	 u5ywjnOxs/7p4r0OMQdT47bIcHMfZLSnfnF0m2WRVVY3M/BJl+LmmxevSBWmKYmfw3
	 Gp9Nl0HHxN1R3s2iJ4bcHCz3VK3qNUQwNAPEEtcDnLU/QsjtmCz8aJ24am9qwDnM1A
	 bfR6Py/ZqmYVw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-2-ec8194bbc885@linaro.org>
References: <20260519-topic-sm8650-ayaneo-pocket-s2-sy7758-v3-2-ec8194bbc885@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 09:08:35 +0000
Message-Id: <20260519090836.44E0CC2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] The 'enable' GPIO is not properly deasserted before the 'vddio' re=
gulator is disabled, causing potential hardware backpowering.
- [High] Loss of critical register configuration on system resume if power =
is lost.
- [Medium] The generic driver hardcodes board-specific electrical parameter=
s instead of parsing them from the Device Tree.
- [Medium] The driver treats the 'enable' GPIO as strictly mandatory, preve=
nting it from probing on boards where the pin is hardwired.
- [Medium] Missing `<linux/delay.h>` header inclusion for `fsleep()`.
- [Low] Typo in Kconfig help text ('Socket' instead of 'Pocket').
- [Low] The `MSK_LED_ENABLE` macro is defined but never used.
--

commit ad75708c40d354dbaee72f90622daea36e29195d
Author: KancyJoe <kancy2333@outlook.com>

backlight: Add SY7758 6-channel High Efficiency LED Driver support

Implement support for the Silergy SY7758 6-channel High Efficiency LED
Driver used for backlight brightness control in the Ayaneo Pocket S2
dual-DSI panel.

> diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kc=
onfig
> index a7a3fbaf7c29e..052ac80c82137 100644
> --- a/drivers/video/backlight/Kconfig
> +++ b/drivers/video/backlight/Kconfig
[ ... ]
> +config BACKLIGHT_SY7758
> +	tristate "Backlight Driver for Silergy SY7758"
> +	depends on I2C
> +	select REGMAP_I2C
> +	help
> +	  Say Y to enable the backlight driver for the Silergy SY7758
> +	  backlight controller found in Ayaneo Socket S2.

This isn't a bug, but there is a typo (Socket instead of Pocket) in the help
text.

> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/s=
y7758.c
> new file mode 100644
> index 0000000000000..a6087e687b640
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c
> @@ -0,0 +1,259 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Silergy SY7758 6-channel High Efficiency LED Driver
> + *
> + * Copyright (C) 2025 Kancy Joe <kancy2333@outlook.com>
> + * Copyright (C) 2026 Linaro Limited
> + * Author: Neil Armstrong <neil.armstrong@linaro.org>
> + */
> +#include <linux/backlight.h>
> +#include <linux/module.h>
> +#include <linux/i2c.h>
> +#include <linux/of.h>
> +#include <linux/err.h>
> +#include <linux/bits.h>
> +#include <linux/regmap.h>
> +#include <linux/bitfield.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/regulator/consumer.h>

Should <linux/delay.h> be included here? The driver explicitly calls fsleep=
()
in sy7758_probe(), but relies on implicit header inclusion.

[ ... ]
> +#define MSK_BRT_12BIT_H		GENMASK(3, 0)
> +#define MSK_LED_ENABLE		GENMASK(5, 0)

Is MSK_LED_ENABLE intended to be used? It appears to be defined here but is
never used anywhere in the driver code.

[ ... ]
> +static const struct backlight_ops sy7758_backlight_ops =3D {
> +	.options =3D BL_CORE_SUSPENDRESUME,
> +	.update_status =3D sy7758_backlight_update_status,
> +};

Since BL_CORE_SUSPENDRESUME is set, the backlight core will call
update_status() on resume. If the system turns off the vddio regulator or I=
2C
power domain during suspend, won't the configuration registers programmed in
sy7758_init() (such as REG_DEV_CTL and the OTP configurations) be lost?

Does this driver need explicit suspend and resume callbacks to reapply the
hardware initialization sequence?

> +static int sy7758_init(struct sy7758 *sydev)
> +{
[ ... ]
> +	ret =3D regmap_write(sydev->regmap, REG_OTP_CFG0,
> +			   FIELD_PREP(MSK_CFG0_CURRENT_LOW, 85));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(sydev->regmap, REG_OTP_CFG1,
> +			   BIT_CFG1_PDET_STDBY |
> +			   FIELD_PREP(MSK_CFG1_CURRENT_MAX, 1) |
> +			   FIELD_PREP(MSK_CFG1_CURRENT_HIGH, 10));

These values (85, 1, 10) appear to be board-specific electrical limits for =
the
Ayaneo panel. Could hardcoding them cause issues if this generic driver is
reused for other boards?

Should these parameters be parsed from Device Tree properties instead?

[ ... ]
> +static int sy7758_probe(struct i2c_client *client)
> +{
[ ... ]
> +	/* Get and enable regulators */
> +	ret =3D devm_regulator_get_enable(dev, "vddio");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
> +
> +	fsleep(100);
> +
> +	/* Get enable GPIO and set to high */
> +	sydev->gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);

On driver unbind or probe failure, devres will release resources in LIFO
order. This means the GPIO descriptor is freed via gpiod_put() before the
vddio regulator is disabled.

Because gpiod_put() does not change the physical pin state, won't the enable
pin remain driven high while the main chip power is turned off? Could this
cause hardware backpowering through the chip's protection diodes?

Does the driver need a custom devm_add_action_or_reset() callback to
explicitly drive the GPIO low before the regulator is disabled?

Additionally, if a board implements the SY7758 with the enable pin permanen=
tly
pulled high in hardware, this devm_gpiod_get() call will return -ENOENT and
unconditionally fail probe.

Could this use devm_gpiod_get_optional() to allow the driver to probe
successfully on such boards?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-topic-sm86=
50-ayaneo-pocket-s2-sy7758-v3-0-ec8194bbc885@linaro.org?part=3D2
