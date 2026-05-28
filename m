Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F292F7F19
	for <devicetree@vger.kernel.org>; Thu, 28 May 2026 16:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779986012; cv=none; b=VpcErSnaRaxS36IjDbvrLNtZf2Ebx7HBfB6ISNdNjdSvswpQqVs7WiCW7J3iclUgZ/mZGUUI39AxdQqHrGghJ+Yc+JEKsU880na2wbD+OL2N7oppM2/GgmhRUxYHNfagPjKxWVLIbDwiiMG5ZPEZLg3ZOoUwrzcWN/L6paKuDPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779986012; c=relaxed/simple;
	bh=wSSujGhIPjybcjubjrC+YM5m904UyRH9L/C9VD/dxpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NPlG2MrhpCfo7ARkBJUywq2Y4ygI0dwCdVYocaBMqnTLRYAA4zSeviiwFd/9YdN59yQxo8XfUHq90k/dRsNC4PpJV2v6Qe1pAMmY8SntmX4EweGNJaK8rK7dQkm4cPjHJiSQuExVy3s5VYbyD0tp+pAhTVemn99gGtmLmEG0vaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YgEeDUkp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YgEeDUkp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D391F000E9;
	Thu, 28 May 2026 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779986011;
	bh=SY4K8ZrjIUn2GHRodTI8nDLfOxTNQTauppzYlXw/A+M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YgEeDUkpEOV7wq1cQowXOF58RBKSs3wc5D7T/JdW+h6XUZd5blpNNeq4HuR3Gdtvi
	 kglg1eS8sizJYKAeswFEbnnj5gfYg9FJBhJEXh/unqUGyWX8Z5XzH+HjggKDGfvk05
	 CsMrky26t3YDw5dbUIF2kn8RgXPgeNJ5gGJCZOEAOUjGdV1QtKcLJ7rkvUQBtXBalP
	 k+U21p41rYVv2TIxcFDfamqHK3yx/3OS5WeDiptAAtMi599IWbdXIfi0se6KWR8ey4
	 0LCXIM/6uy2P5qwgXmiaanioYB4GFhEUJZDQFN0rhg6zlKWghM8/P00nHP1i51KHjm
	 CRzbYJVxeQRFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/6] video: leds: backlight: lm3533: Support getting
 LED sources from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260528135123.103745-7-clamor95@gmail.com>
References: <20260528135123.103745-7-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 May 2026 16:33:30 +0000
Message-Id: <20260528163330.F2D391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardcoded register masks clobber sibling device configurations.
- [Medium] Missing bounds validation on device tree shift values causes und=
efined behavior.
- [Medium] Premature sysfs group removal in error path triggers kernel warn=
ings.
- [Low] Incorrect boundary check allows an out-of-bounds LVLED index.
- [Low] Improper handling of negative error codes from device property coun=
t via unsigned wrapping.
--

commit e5414513aab84157f65b5403f08affee4717c3cb
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: leds: backlight: lm3533: Support getting LED sources from DT
   =20
Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index d707d43d55260..07390bba9a48c 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c
[ ... ]
> @@ -639,7 +649,33 @@ static const struct attribute_group *lm3533_led_attr=
ibute_groups[] =3D {
> =20
>  static int lm3533_led_setup(struct lm3533_led *led)
>  {
> -	int ret;
> +	u32 output_cfg_shift =3D 0;
> +	u32 output_cfg_val =3D 0;
> +	int ret, i;
> +
> +	if (led->num_leds) {
> +		for (i =3D 0; i < led->num_leds; i++) {
> +			if (led->leds[i] > LM3533_LVCTRLBANK_MAX)

[Severity: Low]
Is this boundary check correct? LM3533_LVCTRLBANK_MAX appears to be 5, so
using greater-than allows an index of 5 to pass.

Since there are only 5 LV LEDs mapped to indices 0 through 4, would an index
of 5 result in calculating a bit shift for a non-existent LVLED6?

> +				continue;
> +
> +			output_cfg_shift =3D led->leds[i] * 2;
> +			output_cfg_val |=3D led->id << output_cfg_shift;
> +		}
> +
> +		/* LVLED1, LVLED2 and LVLED3 */
> +		ret =3D lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF1,
> +				    output_cfg_val << OUTPUT_CONF1_SHIFT,
> +				    OUTPUT_CONF1_MASK);

[Severity: High]
If a mask like OUTPUT_CONF1_MASK is used for lm3533_update() and it covers =
all
LEDs, will it unconditionally clear the configuration bits for any LEDs not
assigned to the current bank?

For example, if Bank 0 configures one LED and then Bank 1 configures anothe=
r,
does the second update overwrite and clear the first one's configuration si=
nce
the mask is static? Should the register mask be dynamically generated based=
 on
the LEDs actually being configured?

> +		if (ret)
> +			return ret;
> +
> +		/* LVLED4 and LVLED5 */
> +		ret =3D lm3533_update(led->lm3533, LM3533_REG_OUTPUT_CONF2,
> +				    output_cfg_val >> OUTPUT_CONF2_SHIFT,
> +				    OUTPUT_CONF2_MASK);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index c03d0d1667e42..82b46a531dd27 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c
[ ... ]
> @@ -248,7 +254,8 @@ static struct attribute_group lm3533_bl_attribute_gro=
up =3D {
>  static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
>  	int id =3D lm3533_bl_get_ctrlbank_id(bl);
> -	int ret;
> +	u32 output_cfg_val =3D 0;
> +	int ret, i;
> =20
>  	ret =3D lm3533_update(bl->lm3533, LM3533_REG_CTRLBANK_AB_BCONF,
>  			    bl->linear ? CTRLBANK_AB_BCONF_MODE(id) : 0,
> @@ -256,6 +263,16 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
>  	if (ret)
>  		return ret;
> =20
> +	if (bl->num_leds) {
> +		for (i =3D 0; i < bl->num_leds; i++)
> +			output_cfg_val |=3D id << bl->led_strings[i];

[Severity: Medium]
Since the values from bl->led_strings arrays are read directly from the dev=
ice
tree property without bounds checking, could a malformed device tree provid=
e a
value of 32 or greater and cause an out-of-bounds bitwise shift here?

> +
> +		ret =3D lm3533_update(bl->lm3533, LM3533_REG_OUTPUT_CONF1,
> +				    output_cfg_val, OUTPUT_CONF1_MASK);
> +		if (ret)
> +			return ret;
> +	}
[ ... ]
> @@ -329,6 +346,24 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
>  	bl->linear =3D device_property_read_bool(&pdev->dev,
>  					       "ti,linear-mapping-mode");
> =20
> +	bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sources");

[Severity: Low]
Looking at the struct definition, bl->num_leds is declared as a u32.

If device_property_count_u32() returns a negative error code like -EINVAL,
does that get implicitly cast to a very large positive unsigned integer?

The subsequent bounds check would safely fail, but could this be avoided by
using an int for the count, similar to what is done in lm3533_led_probe()?

> +
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default HVLED or is not linked to any HVLED at all.
> +	 */
> +	if (bl->num_leds > 0 && bl->num_leds <=3D LM3533_HVCTRLBANK_COUNT) {
> +		ret =3D device_property_read_u32_array(&pdev->dev, "led-sources",
> +						     bl->led_strings,
> +						     bl->num_leds);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get led-sources\n");
> +			goto err_sysfs_remove;

[Severity: Medium]
If device_property_read_u32_array() fails, this jumps to err_sysfs_remove.

Looking at lm3533_bl_probe(), sysfs_create_group() is called later in the
probe sequence.

Does calling sysfs_remove_group() on an uncreated sysfs group here trigger a
kernel warning? Should the error path at this stage simply return the error
code instead?

> +		}
> +	} else {
> +		bl->num_leds =3D 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260528135123.1037=
45-1-clamor95@gmail.com?part=3D6
