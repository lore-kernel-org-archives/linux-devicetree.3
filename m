Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C762749E6
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780328277; cv=none; b=HWmAuTIl5uSWCQZjxrklyotMdJuaA2pq84vV0FjPJkhxmp7sipdIOFrSftQuok0eBdrrrgD7U9QRIGOgeEbGbmZgR57GtYjPpVf4k9i9hnUKohnGO9bD+/fZ4T8//+NvzF4YmLVzo4AWCC6Jeyaq7J0iDVqAzZAgs54KFUjHf54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780328277; c=relaxed/simple;
	bh=7McSbv1i7t6KzfpN5ly5bnnQGtb9KDUSCcLaaFPodKU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bPDLvsDfkSLx3Hj0cx4dOdLQ6ubfiyJCaWMoNX+cBjOVMgt98EPuxvQ5Tli9c9bJgjhG51zvEa0UK+b9F7aULckZZxFR8SNPHMDWwJ/Zr6DIN/Ibw52Xc47Eb2MIyWBATrcMKVCy0VXyK8W2EuUsZKcyj5LIwmJBDFlKyUHBG7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fJY1M5lX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fJY1M5lX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF841F0089A;
	Mon,  1 Jun 2026 15:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780328275;
	bh=mZjXFU1pGYVA8sFTSyTDcWBvjlPUmzUA48ZZRAke8hs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fJY1M5lX7UWR4NHWXPwas/VJF1FROz8wsqGhjrchyfyMw8DbjM0Pr/c+LpiLWaB20
	 a9UQVpbw4IJxnJhasbVHRcQkNsSbZWPEX08s5TMmZOHPpBl1qRufXV6GNDrTDrVmJj
	 rhT85PE8g1NLTxNl7wg4O1gJQ8NASogUx6V1hxAASuV38a4lpLKzukDA2rrMs/T8cN
	 5PU+0nA/QtJz7xhytGPQ27t6Szi2RZcErnBmAB2REd0GoA++4yvFNGttvTGpKpyqqh
	 hQP0FTL4WR2PqhOF5HRmUX9adWYZHXDxg1YpxaCIwuSkLAeFJgE+RDnUqc68uEyB4g
	 mzwf62gwaxa0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/11] video: leds: backlight: lm3533: Support
 getting LED sources from DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Svyatoslav Ryhel" <clamor95@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601151831.76350-12-clamor95@gmail.com>
References: <20260601151831.76350-12-clamor95@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:37:55 +0000
Message-Id: <20260601153755.8DF841F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Register Overwrite Logic Error in LED and Backlight Setup
- [Medium] Silent failure when `led-sources` exceeds maximum supported items
--

commit d198a595bf518d4b23e00515d642947b56c4b197
Author: Svyatoslav Ryhel <clamor95@gmail.com>

video: leds: backlight: lm3533: Support getting LED sources from DT

Add Control Bank to HVLED/LVLED muxing support based on the led-sources
defined in the device tree.

> diff --git a/drivers/leds/leds-lm3533.c b/drivers/leds/leds-lm3533.c
> index f2502daf450d8..6db1c1fd2e20d 100644
> --- a/drivers/leds/leds-lm3533.c
> +++ b/drivers/leds/leds-lm3533.c

[ ... ]

> @@ -641,7 +651,33 @@ static const struct attribute_group *lm3533_led_attr=
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
> +			if (led->leds[i] >=3D LM3533_LVCTRLBANK_MAX)
> +				continue;
> +
> +			output_cfg_shift =3D led->leds[i] * 2;
> +			output_cfg_val |=3D led->id << output_cfg_shift;
> +		}
> +
> +		/* LVLED1, LVLED2 and LVLED3 */
> +		ret =3D regmap_update_bits(led->lm3533->regmap, LM3533_REG_OUTPUT_CONF=
1,
> +					 OUTPUT_CONF1_MASK,
> +					 output_cfg_val << OUTPUT_CONF1_SHIFT);

[Severity: High]
Does this code inadvertently clear configurations for other LED strings?

Because OUTPUT_CONF1_MASK is a static broad mask (GENMASK(7, 2)), the call =
to
regmap_update_bits() clears all LVLED1-3 fields that are not part of the
current output_cfg_val.

If multiple control banks are probed sequentially, it seems the later probe
will overwrite and break the hardware routing of previously configured bank=
s.
Should the mask be dynamically generated based on the specific strings being
configured in led-sources instead of updating all bits?

> +		if (ret)
> +			return ret;
> +
> +		/* LVLED4 and LVLED5 */
> +		ret =3D regmap_update_bits(led->lm3533->regmap, LM3533_REG_OUTPUT_CONF=
2,
> +					 OUTPUT_CONF2_MASK,
> +					 output_cfg_val >> OUTPUT_CONF2_SHIFT);
> +		if (ret)
> +			return ret;
> +	}
> =20
>  	ret =3D lm3533_ctrlbank_set_max_current(&led->cb, led->max_current);

[ ... ]

> @@ -716,6 +752,23 @@ static int lm3533_led_probe(struct platform_device *=
pdev)
>  	led->pwm =3D 0;
>  	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &led->pwm);
> =20
> +	led->num_leds =3D device_property_count_u32(&pdev->dev, "led-sources");
> +
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default LVLED or is not linked to any LVLED at all.
> +	 */
> +	if (led->num_leds > 0 && led->num_leds <=3D LM3533_LVCTRLBANK_MAX) {
> +		ret =3D device_property_read_u32_array(&pdev->dev, "led-sources",
> +						     led->leds, led->num_leds);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to get led-sources\n");
> +			goto err_deregister;
> +		}
> +	} else {
> +		led->num_leds =3D 0;
> +	}

[Severity: Medium]
Will this silently ignore out-of-bounds configurations?

If the user provides a device tree with more items than the hardware suppor=
ts
(e.g., led->num_leds > LM3533_LVCTRLBANK_MAX), the check fails and the code
falls through to the else block.

Setting led->num_leds =3D 0 treats the oversized array as if the property w=
as
entirely omitted, masking the error. Would it be better to explicitly return
an error like -EINVAL to alert the user of an invalid configuration?

> +
>  	ret =3D lm3533_led_setup(led);
>  	if (ret)
>  		goto err_deregister;

[ ... ]

> diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backligh=
t/lm3533_bl.c
> index 945625c54fc43..2119433bae456 100644
> --- a/drivers/video/backlight/lm3533_bl.c
> +++ b/drivers/video/backlight/lm3533_bl.c

[ ... ]

> @@ -253,7 +259,8 @@ static struct attribute_group lm3533_bl_attribute_gro=
up =3D {
>  static int lm3533_bl_setup(struct lm3533_bl *bl)
>  {
>  	int id =3D lm3533_bl_get_ctrlbank_id(bl);
> -	int ret;
> +	u32 output_cfg_val =3D 0;
> +	int ret, i;
> =20
>  	ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_B=
CONF,
>  				 CTRLBANK_AB_BCONF_MODE(id),
> @@ -261,6 +268,20 @@ static int lm3533_bl_setup(struct lm3533_bl *bl)
>  	if (ret)
>  		return ret;
> =20
> +	if (bl->num_leds) {
> +		for (i =3D 0; i < bl->num_leds; i++) {
> +			if (bl->led_strings[i] >=3D LM3533_HVCTRLBANK_COUNT)
> +				continue;
> +
> +			output_cfg_val |=3D id << bl->led_strings[i];
> +		}
> +
> +		ret =3D regmap_update_bits(bl->lm3533->regmap, LM3533_REG_OUTPUT_CONF1,
> +					 OUTPUT_CONF1_MASK, output_cfg_val);

[Severity: High]
Can this similarly clobber the other backlight control bank?

Since OUTPUT_CONF1_MASK is GENMASK(1, 0), it unconditionally updates all HV=
LED
routing fields at once. Configuring one backlight bank will overwrite the
configuration of the other bank.

Could the mask be limited only to the bits modified by the current bank?

> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D lm3533_ctrlbank_set_max_current(&bl->cb, bl->max_current);

[ ... ]

> @@ -336,6 +357,23 @@ static int lm3533_bl_probe(struct platform_device *p=
dev)
>  	bl->pwm =3D 0;
>  	device_property_read_u32(&pdev->dev, "ti,pwm-config-mask", &bl->pwm);
> =20
> +	bl->num_leds =3D device_property_count_u32(&pdev->dev, "led-sources");
> +
> +	/*
> +	 * If led-sources property is not set then either this Control Bank uses
> +	 * its default HVLED or is not linked to any HVLED at all.
> +	 */
> +	if (bl->num_leds > 0 && bl->num_leds <=3D LM3533_HVCTRLBANK_COUNT) {
> +		ret =3D device_property_read_u32_array(&pdev->dev, "led-sources",
> +						     bl->led_strings,
> +						     bl->num_leds);
> +		if (ret)
> +			return dev_err_probe(&pdev->dev, ret,
> +					     "failed to get led-sources\n");
> +	} else {
> +		bl->num_leds =3D 0;
> +	}

[Severity: Medium]
Does this have the same silent failure behavior as the LED probe?

If bl->num_leds > LM3533_HVCTRLBANK_COUNT, it falls back to the else block
setting bl->num_leds =3D 0 without producing an error, ignoring the invalid
device tree array.

> +
>  	ret =3D lm3533_bl_setup(bl);
>  	if (ret)
>  		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601151831.7635=
0-1-clamor95@gmail.com?part=3D11
