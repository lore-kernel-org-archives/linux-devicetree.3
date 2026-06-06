Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB10B21CA13
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 05:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780722900; cv=none; b=tw8fDbUUS7cL/qJDZVpSvU/rud7a/z1lF5AJlUl6za0T74jgiPNkKDyEi1ipXY3nOF3ZUYfbj5R0kNZ0cCFfT66ojknhIvPxEcREzwmOqmM2eaZtsyUBeMQ0qzr9j703zr8MjBKQv1NK1klyZZdVhfI1aeZdRk1XPQOjJxsHPyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780722900; c=relaxed/simple;
	bh=TFvvTJuM7SsLq8TSuP2gHPRg6UFvh/MC7VEH8gFp9ig=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e/vjz3clY0cN76Gtw5aNtUK4oC6QM+sYxN5wVtAhj9dmBBZBsyOyzQzThDJYyIdchmCQA6veK2GVNcI40gZ0ifvlo+o0PIIQe8fKS7VGjz0q2Kfp49pA8ZIFP+3MKRhK+c/kS14jP3hwuVbp+9cR5EgdR/N0ygWWH//oxNST2ew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA0U9o05; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA0U9o05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E4661F00893;
	Sat,  6 Jun 2026 05:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780722898;
	bh=oGgaSMGixmd2NwyKPqfKj/BZoJp9l/Ii+ZQ2FjrCguo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dA0U9o05njTtvnGe24NCFwwkdRZE3WnunMP5zKhHvoSTv6Ld8EBeusv/nAVeWjtB3
	 S+zSmFSPGCN+/8Pv+aLS2a/TZ8nCemujA4yMFH2IMQXCMZL2Pya+Uffk/a+KO9I43D
	 spQ66MnbdaGGvfSJJO2FVAD57AIrhVSkBcfiS+kJ3p04byjl4LEYL1ePDknQmNSuzR
	 nRMWF9JadqhqHvDO2d+FzpiNuAGsEG7YrP7Yhs5WzbzFcySHiD14btR9qaVq6RYUO0
	 J6MVrNyVY0rg1rfQKo+fEu19K9VaSNJQd8DVgB0cMp2ior29Fva60Ze3NtWxuodvxl
	 IKX9aCoNlzzAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 08/14] mfd: lm3533: Convert to use OF bindings
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260606045738.21050-9-clamor95@gmail.com>
References: <20260606045738.21050-9-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 05:14:57 +0000
Message-Id: <20260606051458.3E4661F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] A crafted device tree with a single child node containing multiple=
 matching compatible strings causes a heap buffer overflow in `lm3533_devic=
es`.
- [High] `lm3533_led_probe` mistakenly returns 0 (success) on an error path=
, causing the device to remain bound and leading to a double-free on remova=
l.
- [Medium] `lm3533_bl_probe` returns a positive integer on an error path, v=
iolating the probe function API and triggering a kernel warning.
- [Low] Missing 'led-sources' property causes unintended I2C transactions d=
ue to improper checking of negative error codes.
- [Low] The `ti,pwm-config-mask` property is implicitly truncated from 32 b=
its to 8 bits before validation, allowing invalid values to bypass the boun=
ds check.
--

commit 064deeedced51b760172cc0805ab8c80bd2dafdf
Author: Svyatoslav Ryhel <clamor95@gmail.com>
Date:   Sat Jun 6 04:57:32 2026 +0000

    mfd: lm3533: Convert to use OF bindings
   =20
    Since there are no users of this driver via platform data, remove the
    platform data support and switch to using Device Tree bindings.

> diff --git a/drivers/mfd/lm3533-core.c b/drivers/mfd/lm3533-core.c
[ ... ]
> @@ -296,129 +266,99 @@ static struct attribute_group lm3533_attribute_gro=
up =3D {
[ ... ]
> +static int lm3533_device_init(struct lm3533 *lm3533)
>  {
[ ... ]
> +	device_for_each_child_node_scoped(dev, child) {
> +		if (count >=3D nchilds)
> +			break;
> =20
[ ... ]
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-als")) {
> +			lm3533_devices[count].name =3D "lm3533-als";
> +			lm3533_devices[count].of_compatible =3D "ti,lm3533-als";
> +			lm3533_devices[count].id =3D PLATFORM_DEVID_NONE;
> =20
> +			lm3533->have_als =3D true;
> +			count++;
> +		}
> =20
> +		if (fwnode_device_is_compatible(child, "ti,lm3533-backlight")) {
> +			ret =3D fwnode_property_read_u32(child, "reg", &reg);

[Severity: High]
Can this loop overflow the lm3533_devices array?

Since the bounds check if (count >=3D nchilds) break; only happens at the t=
op
of the loop, if a single child node specifies multiple compatible strings (=
e.g.,
compatible =3D "ti,lm3533-als", "ti,lm3533-backlight"), multiple if branches
will execute during the same iteration.=20

This would increment the count multiple times per node, bypassing the bounds
check and writing past the end of the allocated lm3533_devices buffer.

Should these be else if conditions to ensure only one match per child node?

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
[ ... ]
> @@ -680,15 +684,23 @@ static int lm3533_led_probe(struct platform_device =
*pdev)
[ ... ]
>  	led->cb.dev =3D led->cdev.dev;
> =20
> -	ret =3D lm3533_led_setup(led, pdata);
> +	device_property_read_u32(&pdev->dev, "led-max-microamp",
> +				 &led->max_current);
> +	led->max_current =3D clamp(led->max_current, LM3533_MAX_CURRENT_MIN,
> +				 LM3533_MAX_CURRENT_MAX);
> +
> +	led->pwm =3D 0;
> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
> +

[Severity: Low]
Could this allow invalid values to bypass validation?

The property ti,pwm-config-mask is read into the u32 variable led->pwm,
but it is later passed to lm3533_ctrlbank_set_pwm() which accepts a u8
argument. This implicitly truncates the 32-bit integer to 8 bits.

If a device tree mistakenly specifies a value exceeding 255 (like <0x13f>),
it will be truncated to 0x3f before validation. Inside
lm3533_ctrlbank_set_pwm(), the truncated value will easily pass the
val > LM3533_PWM_MAX (0x3f) bounds check, resulting in a silent
misconfiguration.

> +	ret =3D lm3533_led_setup(led);
>  	if (ret)
>  		goto err_deregister;

[Severity: Low]
Does this code correctly handle negative error codes when led-sources is
missing?

In lm3533_led_probe(), led->num_leds is assigned the result of
device_property_count_u32(..., "led-sources"). If this property is absent,
it returns -EINVAL.

Later in lm3533_led_setup(), the condition if (led->num_leds) will
evaluate to true for negative values. While the inner loop is skipped,
regmap_update_bits() executes with a mask of 0, causing unnecessary hardware
I2C reads.=20

Should the condition be > 0 to properly skip the hardware update
when the property is absent? (Note: This same behavior exists in
lm3533_bl_setup() for bl->num_leds).

[Severity: High]
Does the error path for led-sources leak a successful return code?

In lm3533_led_probe(), if the count of led-sources exceeds
LM3533_LVCTRLBANK_MAX, the code logs an error and jumps to err_deregister.
However, the ret variable at this point is 0 from the earlier successful
led_classdev_register() call.

Returning 0 falsely informs the driver core that probe succeeded. When the
module is removed, lm3533_led_remove() will invoke led_classdev_unregister()
on the already-unregistered LED class device, resulting in a use-after-free=
 or
double-free.=20

Should ret be set to a negative error code (e.g., -EINVAL) before jumping
to the error label?

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
[ ... ]
> @@ -304,6 +311,17 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
[ ... ]
> +	device_property_read_u32(&pdev->dev, "led-max-microamp",
> +				 &bl->max_current);
> +	bl->max_current =3D clamp(bl->max_current, LM3533_MAX_CURRENT_MIN,
> +				LM3533_MAX_CURRENT_MAX);
> +
> +	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
> +
> +	ret =3D lm3533_bl_setup(bl);
> +	if (ret)
> +		return ret;
> +

[Severity: Medium]
Does the error handling for led-sources violate the probe function API?

In lm3533_bl_probe(), if the count of led-sources exceeds
LM3533_HVCTRLBANK_COUNT, the code executes:

return dev_err_probe(&pdev->dev, bl->num_leds,
                     "num of LED sources exceeds max %d\n",
                     LM3533_HVCTRLBANK_COUNT);
                   =20
dev_err_probe() returns its second argument as the error code. Because
bl->num_leds is a positive value, the probe function returns a positive int=
eger
instead of a negative error code.=20

This violates the API and causes the driver core's really_probe() to emit a
warning before overriding the return code to -ENXIO.=20

Should this return a negative error code like -EINVAL instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260606045738.2105=
0-1-clamor95@gmail.com?part=3D8
