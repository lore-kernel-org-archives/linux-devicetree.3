Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB593A4F2F
	for <devicetree@vger.kernel.org>; Tue, 23 Jun 2026 06:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782196983; cv=none; b=ng/y4C+DMD4fsgjSfdFnrfAfa18vW5cgB4y1m8v2Ca3puNlkCP+rA3pV1EJUbY15DZ0aIljfTdbjGlTgn6vxvW8bRUZ1jD3ldcKSBjfUQVKFM2MmIVpKOTwGanfcGvipDHO4YPiYDLGM1ND+XfLBC3mkcSPm3oQePgzd5x6ALQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782196983; c=relaxed/simple;
	bh=e6m+6/dBkT+ECkLy9W2lGAKdVGQjpBPi6UYEQLQk7OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T7Sop4RvRXGeexOcm1z5W3g/C1bFdQ5ncIusyV/yliaYbHbgEggzjSYiyK2qq0VJ695TCi5WBuIWo9IUO1wlKo9UF04M+HfEWSm862khQY6xWo08zDrPmBKSHel5ZawpDbKhzh8E/fKta3ws5JS0x/v/0K3xF6ZH4vYiwTuY+QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrMhc74C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrMhc74C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDED81F000E9;
	Tue, 23 Jun 2026 06:43:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782196982;
	bh=jO/sx0x5wTo47Iqj/6+sDSu/fDK4qzPC5/R1ridwm2A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrMhc74CqGQrdCNdDUsncUdMfG8S70k97d4pYJaaS0fLX1mUu+EOUgozSxfPEA4C0
	 9oLEikSomknf82VzNJMJuTGgw2ddlwZv7YFsQ6fFstW6PcXVnbr39njHWgULG8yLT/
	 fGLKtFYYulEGUY/TaUDxrD4JGUj6sXsscmRI5rECtJahbVWPJeLRWfr22tBQ9wLVNb
	 N3BOpWqKOABAiiaKOrLxbs7LFOXS0NFbR5+ZpitL1BBsYNjvAzIRUNRyPCVNnBxAEZ
	 Wd+FKbuAXIOwdIA4K7MuDobCMUmD3OvZEdDngF2QzjqpngWG7ZznitXhHzyfPaG17i
	 SWV1q/nHuWmGw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
References: <20260623-upstream-ltc3208-v6-0-fc6bd9749166@analog.com>
 <20260623-upstream-ltc3208-v6-2-fc6bd9749166@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jun 2026 06:43:00 +0000
Message-Id: <20260623064301.BDED81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The regmap configuration lacks `.reg_defaults`, which will cause `=
regmap_field_write()` to attempt a hardware read for shared registers. This=
 can fail entirely on write-only I2C devices.
- [Medium] The driver unconditionally overwrites the CPO (Charge Pump Oscil=
lator) mode bits in the options register, destroying bootloader state.
- [Low] Minor code quality defects: format string mismatches, dead code, an=
d typos.
--

commit 347e80a37d34f3436d81f8c496280febd37eb8a5
Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>

leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

Kernel driver implementation for the LTC3208 Multidisplay LED Driver.
The LTC3208 controls up to 7 distinct LED channels and is configured via I2=
C.

>     The CAM LED channel is configured as 2 separate CAMHI and CAMLO regis=
ter
>     sub-channels, which currnet is selected via the CAMHL pin, or set to
>     CAMHI register only via setting the S_CAMHILO bit high in register G =
(0x7).

[Severity: Low]
This isn't a bug, but there's a typo in the commit message: 'currnet' inste=
ad
of 'current'.

> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> index 0000000000000..3d6bec99e9ea9
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c
> @@ -0,0 +1,244 @@
[ ... ]
> +#define LTC3208_REG_F_CAM 0x6 /* CAM (High and Low) current DAC*/
> +#define LTC3208_REG_G_OPT 0x7 /* Device Options */
> +#define  LTC3208_OPT_CPO_MASK GENMASK(7, 6)

[Severity: Low]
Is this macro needed? It appears to be defined but never used in the driver.
The same applies to LTC3208_MAX_CPO_OPT defined later.

[ ... ]
> +struct ltc3208_led {
> +	struct led_classdev cdev;
> +	struct i2c_client *client;
> +	struct regmap_field *rfield;
> +	enum ltc3208_channel channel;
> +};
> +
> +struct ltc3208 {
> +	struct ltc3208_led leds[LTC3208_NUM_LED_GRPS];
> +	struct regmap *regmap;
> +};

[Severity: Low]
Is the channel member in struct ltc3208_led used anywhere? It gets assigned
during probe but doesn't seem to be read later.

Similarly, the regmap pointer in struct ltc3208 appears to only be used
locally in ltc3208_probe() and isn't needed in the struct.

[ ... ]
> +static const struct regmap_config ltc3208_regmap_cfg =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.max_register =3D LTC3208_REG_G_OPT,
> +	.cache_type =3D REGCACHE_FLAT_S,
> +};

[Severity: High]
Does this regmap configuration need a .reg_defaults array to seed the cache?

Since .reg_defaults is missing, the cache won't be seeded. Later, when
ltc3208_led_set_brightness() calls regmap_field_write() for shared registers
(like LTC3208_REG_A_GRNRED), it will trigger a read-modify-write operation
that issues an I2C read.

If the hardware is write-only, the read will fail and break LED functionali=
ty.
If it supports reads, this still introduces unnecessary I2C read latency on=
 a
fast path.

[ ... ]
> +static int ltc3208_probe(struct i2c_client *client)
> +{
[ ... ]
> +	reg_val =3D FIELD_PREP(LTC3208_OPT_EN_RGBS, set_sub_control_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_CAMHILO, disable_camhl_pin) |
> +		  FIELD_PREP(LTC3208_OPT_DIS_RGBDROP,
> +			     disable_rgb_aux4_dropout_signal);
> +
> +	ret =3D regmap_write(regmap, LTC3208_REG_G_OPT, reg_val);

[Severity: Medium]
Does this unconditional write wipe out the existing CPO bits (bits 7:6)?

By using regmap_write() here, any initial hardware configuration done by
the bootloader or hardware defaults (like Charge Pump mode) might be perman=
ently
erased. Would regmap_update_bits() be safer here to apply only the
explicitly configured fields?

[ ... ]
> +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					    "Failed to get reg value of LED\n");
> +		else if (chan >=3D LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					     "%d is an invalid LED ID\n", chan);

[Severity: Low]
Could this dev_err_probe() use %u instead of %d?

The chan variable is an unsigned u32, so %d produces a format string mismat=
ch.

> +		else if (ddata->leds[chan].client)
> +			return dev_err_probe(&client->dev, -EINVAL,
> +					"%d is already registered\n", chan);
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260623-upstream-l=
tc3208-v6-0-fc6bd9749166@analog.com?part=3D2
