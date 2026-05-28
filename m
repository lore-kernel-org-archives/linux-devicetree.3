Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 569053B4E8F
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779961541; cv=none; b=dvGgJsLlbTwFNrBWk7O4TTpN1qmeC9a+AH3yB2aupAdnK9yrBQPpMdZY0WWNfkKZjNTqKuHX+ji5FHoMl6u1nqge8ojrVH032xQAKtMhjT5jPgc3dYSLEDcqGNvsaOIDbAGZrcIJiNwUF5VuPwBXJDUk246KPPdNf9nO58r+/mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779961541; c=relaxed/simple;
	bh=OCc6nTo5TgNX7Pgxi4OGR3KoG3JJHiEDnvxOzCWezdw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pXHRaUkvzWsNRhi61+JhL9NaBW2zQ4vuLflyaslyPfmNsM1BSFEWFAK/ozsDkrrv5Cjk+twZ7LUeS1tY7rxiKyjFvaZDiEnPfxeMONaA7Rsp2mgvKlr36FpGspOsLMGm8wTVjqUO1f6eWTiot5+Wbm2MAVMt/TGMwq4N3IMT38o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eXkN0k2U; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eXkN0k2U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE13D1F000E9;
	Thu, 28 May 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779961538;
	bh=rPch0l1dLxkO+0MnNdrwbxOPVkadQZrLCO57Y0wZnzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eXkN0k2UPg4qQtykPD3SxPZCFMcG9BNQ21UTkr5X+cJYU1JJky+R8Lw5segdC79kK
	 +aTAgDXiDiXRiTqwIzifUYFAhfZn78dJcjXPcE/c+G2Sj1TQksH+Jotq1M7Ztk9/If
	 kQQqWPGSeSjzDNnmKtr5FcNDs/TrLGBYheVDjNWrVNhIrVmyIFEtLTwdXv5UPGxmID
	 5t+x2rTkHCpHZpV2zxC61nptGhUAk/PwPMunhWYetHkjh423QRxBmSmAogEmdm7C6c
	 bOabthQL6i4Wmcafek4EofBndvgHoUrshdDjrmZhl2ctD9GOJ7K0bos9MmV0WUteTA
	 v2edoI+fZeZMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 2/2] leds: ltc3220: Add Support for LTC3220 18
 channel LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Edelweise Escala" <edelweise.escala@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260528-ltc3220-driver-v9-2-69450fc213cb@analog.com>
References: <20260528-ltc3220-driver-v9-2-69450fc213cb@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 09:45:37 +0000
Message-Id: <20260528094537.EE13D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 10 potential issue=
(s) to consider:
- [High] LTC3220_GRAD_BLINK_REG is incorrectly marked as a volatile registe=
r, which can break regmap_update_bits().
- [High] Hardware registers are not restored during system resume, leaving =
LEDs permanently off after suspend.
- [High] Missing delays during the hardware reset sequence can cause the re=
set to be ignored.
- [High] Early return in `ltc3220_reset` skips software initialization and =
regmap cache setup when a reset GPIO is present.
- [Medium] Hardware blink activates at 0 brightness if the LED was previous=
ly off.
- [Medium] LED sysfs interfaces are exposed to userspace before the driver =
probe is fully validated.
- [Low] Invalid use of a dynamic variable as an array index inside the `con=
tainer_of` macro causes a build failure.
- [Low] Unused macro LTC3220_GRADATION_START_VALUE.
- [Low] Missing inclusion of <linux/property.h>.
- [Low] Unused inclusion of <linux/delay.h>.
--

commit 2114fc05b329ae4441a5e44db9eed34c434f6c7b
Author: Edelweise Escala <edelweise.escala@analog.com>
Subject: leds: ltc3220: Add Support for LTC3220 18 channel LED Driver

Add driver for the LTC3220 18-channel LED driver with I2C interface,
individual brightness control, and hardware-assisted blink/gradation
features.

> diff --git a/drivers/leds/leds-ltc3220.c b/drivers/leds/leds-ltc3220.c
> new file mode 100644
> index 0000000000000..a633ac5ca6ae4
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3220.c
> @@ -0,0 +1,440 @@
[ ... ]
> +#include <linux/bitfield.h>
> +#include <linux/delay.h>

[Severity: Low]
Is this include needed?

It doesn't appear that any delay functions like msleep() or usleep_range()
are used in the driver implementation.

> +#include <linux/device.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/i2c.h>
> +#include <linux/leds.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/types.h>

[Severity: Low]
Should this file include <linux/property.h>?

The driver uses fwnode property APIs such as device_for_each_child_node_sco=
ped(),
fwnode_property_read_u32(), and fwnode_property_present(), which are defined
in <linux/property.h>.

> +/* LTC3220 Registers */
> +#define LTC3220_COMMAND_REG				0x00
[ ... ]
> +#define LTC3220_NUM_LEDS				18
> +
> +#define LTC3220_GRADATION_START_VALUE			128

[Severity: Low]
Is this macro used anywhere in the driver?

It appears to be dead code as it is never referenced.

> +#define LTC3220_GRADATION_RAMP_TIME_240MS		240
[ ... ]
> +static bool ltc3220_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +	return reg =3D=3D LTC3220_GRAD_BLINK_REG;
> +}

[Severity: High]
Does this register need to be marked volatile?

Marking a register as volatile tells regmap to bypass the cache and read fr=
om
the physical hardware. If the LTC3220 is a write-only I2C device, the physi=
cal
read will fail, causing regmap_update_bits() to fail entirely in
ltc3220_pattern_set() and ltc3220_blink_set().

Even if the device supports reads, this register is exclusively controlled =
by
software and does not change autonomously, so could it be cached normally to
avoid unnecessary I2C reads?

> +static const struct regmap_config ltc3220_regmap_config =3D {
[ ... ]
> +static int ltc3220_set_led_data(struct led_classdev *led_cdev,
> +				enum led_brightness brightness)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);
> +	struct ltc3220 *ltc3220 =3D container_of(uled_cfg, struct ltc3220,
> +					       uled_cfg[uled_cfg->led_index]);

[Severity: Low]
Will this dynamic variable index inside container_of() cause a build failur=
e?

The driver attempts to retrieve the parent structure using
uled_cfg[uled_cfg->led_index]. The container_of macro relies on offsetof(),
which strictly requires the member argument to be a constant expression.

Since uled_cfg->led_index is a runtime variable, this violates the C standa=
rd
and can abort compilation on compilers like Clang with an error about a
non-constant integer expression.

> +	int ret;
[ ... ]
> +static int ltc3220_blink_set(struct led_classdev *led_cdev,
> +			     unsigned long *delay_on,
> +			     unsigned long *delay_off)
> +{
> +	struct ltc3220_uled_cfg *uled_cfg =3D container_of(led_cdev, struct ltc=
3220_uled_cfg,
> +							 led_cdev);
[ ... ]
> +	ret =3D regmap_update_bits(ltc3220->regmap, LTC3220_GRAD_BLINK_REG,
> +				 LTC3220_BLINK_MASK, FIELD_PREP(LTC3220_BLINK_MASK, blink_mode));
> +	if (ret)
> +		return ret;
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_ULED_REG(uled_cfg->l=
ed_index),
> +				  LTC3220_LED_MODE_MASK,
> +				  FIELD_PREP(LTC3220_LED_MODE_MASK, LTC3220_BLINK_MODE));
> +}

[Severity: Medium]
Will the hardware blink activate at 0 brightness if the LED was previously =
off?

When the LED is off, its current bits in LTC3220_ULED_REG are 0. The driver
updates the mode bits to LTC3220_BLINK_MODE using regmap_update_bits() but
does not update the brightness bits.

Because the core expects the driver to handle brightness configuration for
hardware blinking, could this hardware blink execute at 0 brightness, leavi=
ng
the LED unlit?

> +static void ltc3220_reset_gpio_action(void *data)
[ ... ]
> +static int ltc3220_reset(struct ltc3220 *ltc3220, struct i2c_client *cli=
ent)
> +{
> +	struct gpio_desc *reset_gpio;
> +	int ret;
> +
> +	reset_gpio =3D devm_gpiod_get_optional(&client->dev, "reset", GPIOD_OUT=
_HIGH);
> +	if (IS_ERR(reset_gpio))
> +		return dev_err_probe(&client->dev, PTR_ERR(reset_gpio), "Failed on res=
et GPIO\n");
> +
> +	if (reset_gpio) {
> +		gpiod_set_value_cansleep(reset_gpio, 0);

[Severity: High]
Does this sequence lack the necessary delays to ensure a successful reset?

The driver asserts the reset GPIO by requesting it with GPIOD_OUT_HIGH and
immediately de-asserts it with gpiod_set_value_cansleep(reset_gpio, 0). The=
re
is no delay between these calls, creating a near-zero width pulse that may =
fail
to meet the IC's minimum reset pulse width requirement.

It also lacks a wakeup delay before subsequent I2C commands might be sent.

> +
> +		return devm_add_action_or_reset(&client->dev, ltc3220_reset_gpio_actio=
n,
> +						reset_gpio);

[Severity: High]
Does returning early here skip software initialization and regmap cache set=
up?

If the reset_gpio is successfully acquired, this function immediately retur=
ns
0, entirely skipping the subsequent regmap_write() calls intended to initia=
lize
the hardware registers.

Because the driver does not define a .reg_defaults table, skipping these wr=
ites
leaves the regmap cache uninitialized, which can break subsequent
read-modify-write logic via regmap_update_bits().

> +	}
> +
> +	ret =3D regmap_write(ltc3220->regmap, LTC3220_COMMAND_REG, 0);
[ ... ]
> +static int ltc3220_suspend(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, LTC3220_SHUTDOWN_MASK);
> +}
> +
> +static int ltc3220_resume(struct device *dev)
> +{
> +	struct ltc3220 *ltc3220 =3D i2c_get_clientdata(to_i2c_client(dev));
> +
> +	return regmap_update_bits(ltc3220->regmap, LTC3220_COMMAND_REG,
> +				  LTC3220_SHUTDOWN_MASK, 0);
> +}

[Severity: High]
Are the hardware registers left permanently off after resume?

In ltc3220_suspend(), the driver sets the LTC3220_SHUTDOWN_MASK bit. On many
such chips, asserting the shutdown bit resets internal registers. Additiona=
lly,
power to the IC may be lost during system suspend.

In ltc3220_resume(), the driver clears the shutdown bit but does not call
regcache_mark_dirty() and regcache_sync(). Could this leave the physical LED
outputs permanently off, while the kernel's regmap cache and LED classdev s=
tate
incorrectly reflect that the LEDs are still configured and illuminated?

> +static DEFINE_SIMPLE_DEV_PM_OPS(ltc3220_pm_ops, ltc3220_suspend, ltc3220=
_resume);
> +
> +static int ltc3220_probe(struct i2c_client *client)
> +{
> +	struct ltc3220 *ltc3220;
[ ... ]
> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->led_cdev, &=
init_data);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret, "Failed to register LED class=
\n");
> +	}
> +
> +	/*
> +	 * Aggregated LED mode uses hardware quick-write to control all 18 LEDs
> +	 * simultaneously. This is mutually exclusive with individual LED contr=
ol.
> +	 * See Documentation/devicetree/bindings/leds/adi,ltc3220.yaml for deta=
ils
> +	 * on how to configure aggregated LED mode.
> +	 */
> +	if (aggregated_led_found && num_leds > 1)
> +		return dev_err_probe(&client->dev, -EINVAL,
> +				     "Aggregated LED must be the only LED node\n");

[Severity: Medium]
Are the LED sysfs interfaces exposed to userspace before the driver probe is
fully validated?

Inside the loop above, devm_led_classdev_register_ext() is called, which
immediately exposes sysfs interfaces. If the validation check here fails and
returns an error, userspace could have already discovered and interacted wi=
th
the LED devices before they are unexpectedly torn down by devres.

Could these validation checks be completed before registering the interface=
s?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528-ltc3220-dr=
iver-v9-0-69450fc213cb@analog.com?part=3D2
