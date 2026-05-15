Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF4E3BF672
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 22:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778883358; cv=none; b=CV2dl7O1UKybgBuPcdQNIPbgd2mlH3FAYW9gegoN0f3FE9aDJOgPEyJObF3qp7oj8u+a0G+lt5jnsQFYG+MvcfKLicodbYaUcLZ8+IkDFE2+zDTFqdHIrsvX9u9C0OEqF0dGe9Eb4flZkO6sFtXMCcnfDgm6O35hpK0FPr46Khc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778883358; c=relaxed/simple;
	bh=ctnfzOZ3928DE/hHr3+If9qVDAiSUh9EQJLDbHR21ZA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nYL0TgvD90TBW41HO2qqiYS/g3j//zQnv99Och/YKotnsYPESyJB0Z3XrcKlZfECrhbzDWPouGIr9EwT+r6WJlwnnBJWz5MbJfENOxQZvfmn+77/ZNgV4TI6Y1oXXCc4v5mu/ZCvAyJHKgj1B/GIQJfoW2oBRfqkNYJgjkfsVaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PDUMhmFe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PDUMhmFe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11108C2BCB0;
	Fri, 15 May 2026 22:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778883358;
	bh=ctnfzOZ3928DE/hHr3+If9qVDAiSUh9EQJLDbHR21ZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PDUMhmFej+LZmhQ4lIu/+AXNdnnVMvm0DAgE145hsqnv6XfeR2f20yAwV+IIgkIEO
	 rHbJ1Q6WpUNIuz7ghpSRDoK9xJ8OAxv/KPihlK0bBBjwSn2kTxba5eI54rtKjMrGD3
	 z6Y2NO0WMYtdYoT+EhDF/Dfv1Kj+eRF9ZrVoLs1OzRNnfTePD6bSEXKfcxti0lL+8b
	 opLTme1S6jzR9MGwud7kWOXxLv4Qk+3KYLNPAHqzs4doHIQnB+305oIbdhm2sN8ozf
	 JA8B97dweo2Sl/3l38BAcQo6BVYudSIG69Qbrc7XpVd9omIjLOC7Uc+lCE8Hsy+Fyg
	 gFKEDSPA9rFyg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 06/10] leds: flash: add support for Samsung S2M
 series PMIC flash LED device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260516-s2mu005-pmic-v7-6-73f9702fb461@disroot.org>
References: <20260516-s2mu005-pmic-v7-6-73f9702fb461@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 May 2026 22:15:57 +0000
Message-Id: <20260515221558.11108C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Medium] The V4L2 external_strobe_set callback triggers a software strobe=
 instead of configuring a hardware strobe.
- [Medium] The OF match table is declared but never assigned to the platfor=
m_driver struct.
- [Medium] Inconsistent Torch maximum brightness constraints between Sysfs =
and V4L2.
- [Medium] Lack of mutual exclusion between Torch and Flash modes.
- [Medium] Hardware state leak on probe failure or module unload.
--

commit b304c8fc634e3a0a1b0e1d670a3987ad37675a8c
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

leds: flash: add support for Samsung S2M series PMIC flash LED device

This commit adds support for flash LEDs found in Samsung S2M series PMICs,
such as the S2MU005. The driver supports two independently controlled chann=
els
that can operate in both torch and flash modes.

> diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/led=
s-s2m-flash.c
> new file mode 100644
> index 0000000000000..6ee8db094611a
> --- /dev/null
> +++ b/drivers/leds/flash/leds-s2m-flash.c

[ ... ]

> +static int s2m_fled_flash_external_strobe_set(struct v4l2_flash *v4l2_fl=
ash, bool enable)
> +{
> +	struct s2m_led *led =3D to_s2m_led(v4l2_flash->fled_cdev);
> +
> +	return led->fled.ops->strobe_set(&led->fled, enable);
> +}

Does this implementation fire the flash immediately instead of configuring
it to wait for a hardware strobe signal?

The V4L2 API contract expects external_strobe_set to merely arm the device
for an external hardware pin assertion. If the PMIC lacks true
hardware-based external strobe support, should has_external_strobe be
omitted instead?

[ ... ]

> +static int s2mu005_fled_torch_brightness_set(struct led_classdev *cdev, =
enum led_brightness value)
> +{
[ ... ]
> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_TORC=
H_EN(led->channel));
> +	if (ret) {
> +		dev_err(cdev->dev, "failed to enable torch LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +
> +	return ret;
> +}
> +
> +static int s2mu005_fled_flash_strobe_set(struct led_classdev_flash *fled=
, bool state)
> +{
[ ... ]
> +	ret =3D regmap_set_bits(led->regmap, led->reg_enable, S2MU005_FLED_FLAS=
H_EN(led->channel));
> +	if (ret) {
> +		dev_err(fled->led_cdev.dev, "failed to enable flash LED\n");
> +		goto unlock;
> +	}
> +
> +unlock:
> +	mutex_unlock(&led->lock);
> +
> +	return ret;
> +}

Since the LED subsystem allows Sysfs to enable Torch and Flash
independently, is there a risk that both modes could be active
simultaneously in the PMIC registers?

Neither s2mu005_fled_torch_brightness_set() nor
s2mu005_fled_flash_strobe_set() appears to clear the enable bit for the
opposite mode.

[ ... ]

> +static int s2mu005_fled_init(struct s2m_led *led, struct device *dev, st=
ruct regmap *regmap,
> +			     unsigned int nr_channels)
> +{
[ ... ]
> +	/* Enable the LED channels. */
> +	ret =3D regmap_set_bits(regmap, S2MU005_REG_FLED_CTRL1, S2MU005_FLED_CH=
_EN);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to enable LED channels\n");
> +
> +	return 0;
> +}

If the probe fails during child node iteration, or if the module is
unloaded, does this leave the PMIC LED block permanently powered on?=20

It looks like S2MU005_FLED_CH_EN is set globally here but never cleared on
failure or removal, which could cause a resource and power leak.

[ ... ]

> +static int s2mu005_fled_init_channel(struct s2m_led *led, struct device =
*dev,
> +				     struct fwnode_handle *fwnp)
> +{
[ ... ]
> +	cdev->max_brightness =3D 16;
> +	cdev->brightness_set_blocking =3D s2mu005_fled_torch_brightness_set;
> +	cdev->flags |=3D LED_DEV_CAP_FLASH;
[ ... ]
> +	v4l2_cfg.intensity.min =3D led->fled.brightness.min;
> +	v4l2_cfg.intensity.step =3D led->fled.brightness.step;
> +	v4l2_cfg.intensity.max =3D led->fled.brightness.max;
> +	v4l2_cfg.intensity.val =3D led->fled.brightness.val;

Does this create an inconsistency between the Sysfs and V4L2 Torch maximum
brightness constraints?

The code sets cdev->max_brightness to 16, but v4l2_cfg.intensity is
initialized using the Flash constraints. Since led->fled.brightness limits
the brightness to 375,000 uA (effectively level 15), V4L2 users might be
artificially restricted to level 15 while Sysfs users can reach 16.

[ ... ]

> +static const struct of_device_id s2m_fled_of_match_table[] =3D {
> +	{ .compatible =3D "samsung,s2mu005-flash", .data =3D (void *)S2MU005 },
> +	{ /* sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
> +
> +static struct platform_driver s2m_fled_driver =3D {
> +	.driver =3D {
> +		.name =3D "s2m-flash",
> +	},
> +	.probe =3D s2m_fled_probe,
> +	.id_table =3D s2m_fled_id_table,
> +};
> +module_platform_driver(s2m_fled_driver);

Should s2m_fled_of_match_table be assigned to the .of_match_table field
within the driver structure here?

It appears to be declared and exported above, but never assigned to the
driver. This might prevent Device Tree compatible string matching.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-s2mu005-pm=
ic-v7-0-73f9702fb461@disroot.org?part=3D6
