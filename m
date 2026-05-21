Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394F82F362B
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353139; cv=none; b=KETTZUmb7als+yZBkn1oqSCo0YBtxL22oKw9OmFSnvN0STZx+RO0Gwv/WIt9rGMg2T+6ncvJ1Uy0l98NK6i0UZ2G2TUPU3BItYt4qqKU7mXAgmjkKNX0+BTTVq6TEowNy5lzOCZ3TEJ4PqKwDT+feFPgRDRsvZLQa5cHUOENzOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353139; c=relaxed/simple;
	bh=5jcrO5tOvosfJDVSl5LeQpG72CAK2ujBuU1VzW4l294=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BTLiyYG8CN5qUYe3ku81i38XfW/dqOL3fx1Q5/pg8nA12Uo0F7N2Bid3wWJnuhRP5czDNl/1mMNW8IF/WdvuVnwU6tn8b3uPx4vdJY4MkWxK9G4G05lxkkIoGrRcPs4fpIOnQ3LI3xaFsHEUciOKsvK3TyhCPdXIyv8InuxAPuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6NK2Tyo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6NK2Tyo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E14B71F000E9;
	Thu, 21 May 2026 08:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779353138;
	bh=eZ2hLaDgzHxqWfW7V6FIeKRfeVb4EFIGgA1gxsKZD3s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g6NK2Tyo35KsE/PnnCAa5fjMbJ9nLV5SLoXUDo+ZFgwXzbPlBzBRQJIwsHbgWEHLr
	 QtPHZ8cn5pfITWvZwPlIQ1DSP2GM4pOU4tOdIVnhbVWTyVv3MtQzm5uQEw8X5/NAkP
	 7s3EdTiyDbODndxxOBPXjwgKvcaiUZQ/JehmkPYviK03uL54C/Nn/Ajums7a5FVY1n
	 KDthPsoyQXIDV4s1unyyk7ZHMIyMv7/1vT0z4craJTO56mC5osKi0YTB4LzUB0ZUBk
	 vVCBGVaarGXkJUIT5K50yMj0BFpFuodRVy2v9tQgJG0dGJ4+sG4w3YpU5LDPKY/AMd
	 GRX1hxuHlWLHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] backlight: Add SY7758 6-channel High Efficiency
 LED Driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-2-73c732615e4a@linaro.org>
References: <20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-2-73c732615e4a@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 08:45:37 +0000
Message-Id: <20260521084537.E14B71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver incorrectly uses regmap_write() to update specific fiel=
ds in configuration registers, wiping out unreferenced bitfields.
- [High] The 'enable' GPIO is driven HIGH during probe but never explicitly=
 set LOW during removal or on probe failure, causing hardware resource leak=
s and potential electrical back-powering.
- [Medium] Critical hardware configuration is lost across system suspend/re=
sume cycles.
- [Medium] Non-atomic updates to the 12-bit brightness registers may cause =
visible backlight flicker.
--

commit 98100c9f3380a75d76d0213c9564c18833a54b8e
Author: KancyJoe <kancy2333@outlook.com>

backlight: Add SY7758 6-channel High Efficiency LED Driver support
   =20
This commit implements support for the Silergy SY7758 6-channel High
Efficiency LED Driver used for backlight brightness control in the Ayaneo
Pocket S2 dual-DSI panel.

> diff --git a/drivers/video/backlight/sy7758.c b/drivers/video/backlight/s=
y7758.c
> new file mode 100644
> index 0000000000000..198d559394389
> --- /dev/null
> +++ b/drivers/video/backlight/sy7758.c

[ ... ]

> +static int sy7758_backlight_update_status(struct backlight_device *backl=
ight_dev)
> +{
> +	struct sy7758 *sydev =3D bl_get_data(backlight_dev);
> +	unsigned int brightness =3D backlight_get_brightness(backlight_dev);
> +	int ret;
> +
> +	ret =3D regmap_write(sydev->regmap, REG_BRT_12BIT_L,
> +			   FIELD_PREP(MSK_BRT_12BIT_L,
> +				      brightness & 0xff));
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_write(sydev->regmap, REG_BRT_12BIT_H,
> +			   FIELD_PREP(MSK_BRT_12BIT_H,
> +				      (brightness >> 8) & 0xf));

[Severity: Medium]
Will writing the LSB and MSB in separate I2C transactions cause visible
flicker during smooth dimming?

If the brightness transitions across a byte boundary (e.g., from 0x0FF to
0x100), writing the LSB first will momentarily set the hardware to 0x000
before the MSB write corrects it to 0x100.

Unless the hardware specifically latches the value only when the MSB is
written, could this use regmap_bulk_write() to update both contiguous
registers atomically?

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct backlight_ops sy7758_backlight_ops =3D {
> +	.options =3D BL_CORE_SUSPENDRESUME,

[Severity: Medium]
Since BL_CORE_SUSPENDRESUME is set, does the driver also need PM suspend/re=
sume
callbacks to restore the configuration registers?

If the system cuts power to the controller during suspend, the initializati=
on
performed in sy7758_init() might be permanently lost upon resume, causing t=
he
device to operate with uninitialized or default settings.

Could a regmap cache with regcache_sync() in a resume handler be used, or
perhaps re-invoking sy7758_init() on resume?

> +	.update_status =3D sy7758_backlight_update_status,
> +};
> +
> +static int sy7758_init(struct sy7758 *sydev)
> +{
> +	int ret =3D 0;
> +
> +	ret =3D regmap_write(sydev->regmap, REG_DEV_CTL,
> +			   BIT_DEV_CTL_FAST | BIT_DEV_CTL_BL_CTLB |
> +			   FIELD_PREP(MSK_DEV_CTL_BRT_MODE, 2));

[Severity: High]
Does using regmap_write() here wipe out unreferenced bitfields in these
configuration registers?

Because regmap_write() replaces the entire register contents, it implicitly
clears all unreferenced bitfields to 0. For example, in REG_OTP_CFG9 below,
writing FIELD_PREP(MSK_CFG9_VBST_MAX, 4) forces JUMP_EN, JUMP_TH, and
JUMP_VOLTAGE to 0, which might destroy their default or OTP-loaded values.

Could this use regmap_update_bits() when modifying specific fields to prese=
rve
the state of other bits?

> +	if (ret)
> +		return ret;

[ ... ]

> +static int sy7758_probe(struct i2c_client *client)
> +{
> +	struct backlight_properties props =3D { };
> +	struct device *dev =3D &client->dev;
> +	struct sy7758 *sydev;
> +	unsigned int dev_id;
> +	int ret;

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

[Severity: High]
Is the enable GPIO ever explicitly driven LOW during removal or on probe
failure?

During driver removal or probe failure, devres automatically calls
gpiod_put(), which simply releases the software descriptor without actively
driving the pin LOW. Immediately afterward, devres disables the vddio regul=
ator.

This sequence leaves the host driving a logic HIGH into the enable pin of an
unpowered SY7758 controller, which violates electrical sequencing and might
cause back-powering or hardware damage.

Could the driver register a custom devm action (e.g., using
devm_add_action_or_reset()) to explicitly set the GPIO to 0 before the
regulator is disabled?

> +	if (IS_ERR(sydev->gpio))
> +		return dev_err_probe(dev, PTR_ERR(sydev->gpio),
> +				     "failed to get enable GPIO\n");

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-topic-sm86=
50-ayaneo-pocket-s2-sy7758-v4-0-73c732615e4a@linaro.org?part=3D2
