Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C915D29AAFD
	for <devicetree@vger.kernel.org>; Fri, 29 May 2026 19:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780084565; cv=none; b=VuMlejzGc1EPu2jBX8ujUGf1P3zPmqgnjfavhy6IJuNiQwB5F8a4s3Mcvf4E6cxrK1mVzSmsImNyoLjwCRS7SNKltoqD6gUEqJkoySqQv1ETl4vD+6aMsvp9sOnDyK0IA6KfpQTA1nhzrFbHnL4RRm1Jzc8jfLOzjBy3GEIxd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780084565; c=relaxed/simple;
	bh=zo/59g/UcnkhlQDpErztGXF+XjBoNhnAYVs/lvufTGQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=six4VQuMvwdXMUI2gMhSuQVPSENp+rDx1vWFy+GxewbaDf/zXcEJ2nJO44Kka8XFMJAHNNKBlbk8GG2RhQCCs9nXOYoIOl+zlrW6LlZZhKUboZNCnr77La/sLYLmt2ocNaJSSXcBihLcFAGT1wyX58h/l7HsUIJaP1jqysXhEJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onYGpwfC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onYGpwfC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBCF1F00893;
	Fri, 29 May 2026 19:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780084564;
	bh=OF9tnpbpYqXFLWcCaUMeNtU/TVp49Z1GXjxmNEnJFzs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=onYGpwfCxF45BH+XbmSoxGk8vVjeYouJ/XixIgIw9ucmNTa5EZN6/GMdKCugVp/mo
	 dygiQ5fXdUVQEW/edirg+vuQKXokqCVl170vOjKh+aA6gco/cgWqT6bTkuPsNu4lPa
	 KH5TkEW/oq//Sy25LsyZLGTksJiTzP58RjsbrDRI+FhXGHnbG1iHKK8JMGx8SwZg6a
	 ANf3ycBCWBI5c49VyKUm8lAsvHsak6ApP5wt9ZzeTxqyDpoHhsJtUMtk/4G1FfPhMs
	 9q3ACtWGS2WOMPvWOInLbdHBveGeMS8+QHMA1rlJrxNv0LEHc51GjcTCk4Cbfs2AC6
	 JT+yYIcWeY1oQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
References: <20260529-topic-sm8650-ayaneo-pocket-s2-sy7758-v5-2-03aacd49747c@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 19:56:03 +0000
Message-Id: <20260529195604.3EBCF1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The enable GPIO is asserted high during probe but never explicitly=
 driven low during driver removal or probe failure, risking back-powering a=
nd hardware damage.
- [High] The driver relies on `BL_CORE_SUSPENDRESUME` but fails to restore =
volatile hardware initialization state upon resume.
- [Medium] The enable GPIO is requested as strictly mandatory, breaking sup=
port for hardware designs where the pin is hardwired.
- [Medium] The backlight sysfs interface remains active after `backlight_di=
sable()` is called in `remove()`, creating a race condition where userspace=
 can re-enable the hardware during teardown.
--

commit 55527bb448bde80cb22811193477de9c8839514e
Author: KancyJoe <kancy2333@outlook.com>

backlight: Add SY7758 6-channel High Efficiency LED Driver support

Implement support for the Silergy SY7758 6-channel High Efficiency LED
Driver used for backlight brightness control in the Ayaneo Pocket S2
dual-DSI panel.

> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/s=
y7758.c
> new file mode 100644
> index 0000000000000..786589cb8df91
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c

[ ... ]

> +static int sy7758_backlight_update_status(struct backlight_device *backl=
ight_dev)
> +{

[ ... ]

> +}
> +
> +static const struct backlight_ops sy7758_backlight_ops =3D {
> +	.options =3D BL_CORE_SUSPENDRESUME,
> +	.update_status =3D sy7758_backlight_update_status,
> +};

[Severity: High]
This driver sets the BL_CORE_SUSPENDRESUME option, which relies on the
backlight core to blank and unblank the brightness on suspend and resume.
However, if the system's power management cuts power to the vdd regulator
during suspend, won't the device lose all the configuration state establish=
ed
in sy7758_init()?

Because there are no standard pm_ops to re-apply this initialization sequen=
ce
upon resume, it seems the backlight might operate with incorrect parameters=
 or
fail to turn on. Should this driver implement a resume callback to restore =
the
volatile hardware configuration?

[ ... ]

> +static int sy7758_probe(struct i2c_client *client)
> +{
> +	struct backlight_properties props =3D { };
> +	struct device *dev =3D &client->dev;
> +	struct sy7758 *sydev;

[ ... ]

> +	/* Get and enable regulator */
> +	ret =3D devm_regulator_get_enable(dev, "vdd");
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to get regulator\n");
> +
> +	fsleep(100);
> +
> +	/* Get enable GPIO and set to high */
> +	sydev->gpio =3D devm_gpiod_get(dev, "enable", GPIOD_OUT_HIGH);
> +	if (IS_ERR(sydev->gpio))
> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
> +				     "failed to get enable GPIO\n");

[Severity: Medium]
Is it possible for the enable pin to be hardwired to a power rail on some
hardware designs? Using devm_gpiod_get() makes this GPIO strictly mandatory
and fails the probe if the enable-gpios property is absent in the Device Tr=
ee.
Would devm_gpiod_get_optional() be more appropriate here?

[Severity: High]
The enable GPIO is asserted high here, but is there a mechanism to ensure it
is explicitly driven low during driver removal or if the probe fails later?

If devres automatically disables the vdd regulator while the host is still
driving the GPIO high, couldn't this back-power the chip through its intern=
al
ESD protection diodes and cause hardware damage? Using
devm_add_action_or_reset() to drive the GPIO low before the regulator is
disabled might prevent this.

[ ... ]

> +static void sy7758_remove(struct i2c_client *client)
> +{
> +	struct sy7758 *sydev =3D i2c_get_clientdata(client);
> +
> +	backlight_disable(sydev->bl);
> +}

[Severity: Medium]
Since the backlight was registered using devm_backlight_device_register(),
devres will unregister the sysfs interface after sy7758_remove() returns.

Does this leave a race window where userspace could concurrently write to t=
he
sysfs brightness file and re-enable the hardware right after
backlight_disable() turns it off?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529-topic-sm86=
50-ayaneo-pocket-s2-sy7758-v5-0-03aacd49747c@linaro.org?part=3D2
