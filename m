Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C9485CE5
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 17:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784828456; cv=none; b=dvK0hHA7gcXIVHkrO58H0omIT0bdb21GWLYSjEQKegrkDpRb1dcWJGZishSuQd9ppeE8dPMe4XeqpmbA6wABFFBy/MJPswdsreyBkksj2fWD/Ewok6fVx9PPlvy+xfQQVkV5LmQJ23Abg3LLtRFLtdoRJ8xtGM7PV22XXd8TyvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784828456; c=relaxed/simple;
	bh=UixgtGiGVUnNyLlipfU+RXYoFChLDvPTxTim1Tpp6l8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Com2fZcJdVVSeYi0qzA9GVt0yhTSehPg7TcvAnZ911l6OeYcy6Boy+gmtdkGKoKAEBi1rC1VaTzUSnKipHrpwWl0FL1z9ww/R3YyBPvJqPFPoGXAed/CRtG4PIou4KL1FgAoNDKbDVuH2RicEOCfkOhuiQXvOvUpuJRPCZcm5Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PU4tcaSC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PU4tcaSC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5897F1F000E9;
	Thu, 23 Jul 2026 17:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784828451;
	bh=prl7z1JRYGJL56NNi51aXUspATxCEtBSu7ubwfxNh/w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PU4tcaSC5Pw1sHOZTUo8v97rUFXujRxm6i3Pa3WIm0nzvsuPkzA4+pS+y1RgSXvep
	 TlSMwgzAjqnI0D7TjMEsfVCjSzBNJ9qUyMJBlh0Y5NDRvaOFfEPpEkZINhH2AAAu1u
	 r+/fjaxw8DIekuZ2GmFuzWUYjA2UW0BSgd7UFphl8CcMDEqjYaT/Vre8GrmdMS5EKs
	 KE7d1fywMDhWBLmcRUYWtjPYzKZnZh/+eVB+hjnlCcwnAg0aFMYnQW7znRvgemn17e
	 yzTYXIwexjyd5FgwwudX0qAsq7KtPAQrI572sfwbnUfko4fYK723YLBWotEovpuBm6
	 hIzm36HewDiCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
References: <20260723-gp2ap070s-v1-0-b8ca3a4c10dd@disroot.org>
 <20260723-gp2ap070s-v1-2-b8ca3a4c10dd@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 17:40:50 +0000
Message-Id: <20260723174051.5897F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] The interrupt handler improperly uses WARN_ONCE for a standard ext=
ernally triggerable physical race condition, enabling a trivial Denial of S=
ervice (panic).
- [High] Returning IRQ_HANDLED on an I2C read failure without clearing the =
hardware interrupt causes an IRQ storm and CPU lockup.
- [Medium] Missing bounds checking for user-provided threshold values allow=
s integer truncation and negative values to bypass validation, leading to c=
orrupted hardware state.
- [Medium] Missing driver-level serialization in the threshold write sequen=
ce allows concurrent sysfs writes to bypass invariants (TOCTOU race).
- [Medium] Unbalanced lifecycle operations: the device and its interrupts a=
re enabled during probe, but never disabled on teardown, causing a resource=
 and power leak.
- [Medium] Speculative: Incorrect Hardware State Control / Power Management=
 for interrupts.
--

--- Patch [2]: [PATCH 2/3] iio: proximity: add driver for Sharp GP2AP070S p=
roximity sensor ---
commit cf1a3ba55be680215231a378699a58e4edfcc9a0
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

iio: proximity: add driver for Sharp GP2AP070S proximity sensor

This commit adds a new driver for the Sharp GP2AP070S proximity sensor.
It relies on a downstream Samsung kernel implementation as a secondary
source of documentation.

Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/bl=
ob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]

> diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp=
2ap070s.c
> new file mode 100644
> index 0000000000000..9625f53d956ec
> --- /dev/null
> +++ b/drivers/iio/proximity/gp2ap070s.c

[ ... ]

> @@ -176,140 +176,140 @@ static int gp2ap070s_iio_write_event_value(struct=
 iio_dev *indio_dev,
> 					   const struct iio_chan_spec *chan,
> 					   enum iio_event_type type,
> 					   enum iio_event_direction dir,
> 					   enum iio_event_info info, int val,
> 					   int val2)
> {
> 	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> 	__le16 value;
> 	u16 threshold_other;
> 	int ret;
>=20
> 	if (type !=3D IIO_EV_TYPE_THRESH || info !=3D IIO_EV_INFO_VALUE)
> 		return -EINVAL;
>=20
> 	switch (dir) {
> 	case IIO_EV_DIR_RISING:
> 		ret =3D regmap_raw_read(drvdata->regmap,
> 				      GP2AP070S_REG_PS_THD_LO_LE16, &value,
> 				      sizeof(value));

[Severity: Medium]
Could concurrent sysfs writes to the rising and falling thresholds interlea=
ve
here in gp2ap070s_iio_write_event_value()?

Since the IIO core does not serialize write_event_value() calls, two
threads might read the old thresholds at the same time. Both could validate
their new values against the stale state and write them, resulting in the
hardware being programmed with the falling threshold higher than the rising
threshold.

Is a driver-level mutex needed for this read-modify-write sequence?

> 		if (ret)
> 			return ret;
>=20
> 		/* Ensure lo_threshold < hi_threshold */
> 		threshold_other =3D le16_to_cpu(value);
> 		if (threshold_other >=3D val)
> 			return -EINVAL;
>=20
> 		value =3D cpu_to_le16((u16)val);

[Severity: Medium]
What happens if a negative value or a value larger than U16_MAX is passed?

A value like 100000 would bypass the threshold_other >=3D val check, but th=
en
be truncated to a smaller value during the (u16) cast.

Could this break the lo_threshold < hi_threshold invariant and put the hard=
ware
in an invalid state?

> 		ret =3D regmap_raw_write(drvdata->regmap,
> 				       GP2AP070S_REG_PS_THD_HI_LE16, &value,
> 				       sizeof(value));
> 		if (ret)
> 			return ret;
>=20
> 		return IIO_VAL_INT;
> 	case IIO_EV_DIR_FALLING:
> 		ret =3D regmap_raw_read(drvdata->regmap,
> 				      GP2AP070S_REG_PS_THD_HI_LE16, &value,
> 				      sizeof(value));
> 		if (ret)
> 			return ret;
>=20
> 		/* Ensure hi_threshold > lo_threshold */
> 		threshold_other =3D le16_to_cpu(value);
> 		if (threshold_other <=3D val)
> 			return -EINVAL;
>=20
> 		value =3D cpu_to_le16((u16)val);

[Severity: Medium]
Similarly, if a negative value like -1 is written to the falling threshold,
would it pass the threshold_other <=3D val check (e.g., 100 <=3D -1 evaluat=
es
to false) and then truncate to 65535, bypassing validation?

> 		ret =3D regmap_raw_write(drvdata->regmap,
> 				       GP2AP070S_REG_PS_THD_LO_LE16, &value,
> 				       sizeof(value));

[ ... ]

> @@ -275,34 +275,34 @@ static int gp2ap070s_write_event_config(struct iio_=
dev *indio_dev,
> 					const struct iio_chan_spec *chan,
> 					enum iio_event_type type,
> 					enum iio_event_direction dir,
> 					bool state)
> {
> 	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> 	int ret;
>=20
> 	if (type !=3D IIO_EV_TYPE_THRESH)
> 		return -EINVAL;
>=20
> 	switch (dir) {
> 	case IIO_EV_DIR_EITHER:
> 		if (state)
> 			ret =3D regmap_set_bits(drvdata->regmap,
> 					      GP2AP070S_REG_COM3,
> 					      GP2AP070S_VAL_COM3_INT_PULSE);
> 		else
> 			ret =3D regmap_clear_bits(drvdata->regmap,
> 						GP2AP070S_REG_COM3,
> 						GP2AP070S_VAL_COM3_INT_PULSE);

[Severity: Medium]
Does clearing GP2AP070S_VAL_COM3_INT_PULSE in gp2ap070s_write_event_config()
actually disable the hardware interrupt?

If this bit only controls the pulse behavior and the actual interrupt mask =
is
in COM2 (which is unconditionally cleared during probe), could the device
continue to trigger IRQs even when disabled from userspace?

> 		if (ret)
> 			return ret;

[ ... ]

> @@ -325,52 +325,52 @@ static irqreturn_t gp2ap070s_irq_handler(int irq, v=
oid *private)
> 	struct iio_dev *indio_dev =3D private;
> 	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> 	struct device *dev =3D drvdata->dev;
> 	u16 threshold_lo, threshold_hi, distance;
> 	__le16 value;
> 	int ret;
>=20
> 	ret =3D regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_LO_LE16,
> 			      &value, sizeof(value));
> 	if (ret) {
> 		dev_err(dev, "Failed to read low threshold value (%d)\n", ret);
> 		return IRQ_HANDLED;
> 	}

[Severity: High]
If this I2C read fails and IRQ_HANDLED is returned without clearing the
hardware interrupt, could this result in an interrupt storm?

If the interrupt line is level-triggered and remains asserted, would the OS
continually re-enter the IRQ handler and potentially lock up the CPU core?

[ ... ]

> 	if (distance >=3D threshold_hi) {
> 		iio_push_event(indio_dev,
> 			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> 						    IIO_EV_TYPE_THRESH,
> 						    IIO_EV_DIR_RISING),
> 			       iio_get_time_ns(indio_dev));
> 	} else if (distance <=3D threshold_lo) {
> 		iio_push_event(indio_dev,
> 			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> 						    IIO_EV_TYPE_THRESH,
> 						    IIO_EV_DIR_FALLING),
> 			       iio_get_time_ns(indio_dev));
> 	} else {
> 		/*
> 		 * If none match, then it's stuck in the threshold band gap.
> 		 * The hardware generally does not issue interrupts here.
> 		 */
> 		WARN_ONCE(true, "spurious interrupt issued in proximity threshold gap\n=
");
> 	}

[Severity: High]
Is it possible for a fast-moving physical object to cross the threshold,
trigger the interrupt, and then move back into the band gap before the
threaded handler finishes reading the distance via I2C?

If so, could this expected physical race condition trigger a kernel panic on
systems configured with panic_on_warn in gp2ap070s_irq_handler()?

[ ... ]

> @@ -378,39 +378,39 @@ static int gp2ap070s_probe_hw_register(struct gp2ap=
070s_drvdata *drvdata)
> 	struct device *dev =3D drvdata->dev;
> 	int ret;

[ ... ]

> 	ret =3D regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM1,
> 			      GP2AP070S_VAL_COM1_WKUP | GP2AP070S_VAL_COM1_EN);
> 	if (ret)
> 		return dev_err_probe(dev, ret, "Failed to enable sensor\n");
>=20
> 	return 0;
> }
>=20
> static int gp2ap070s_probe(struct i2c_client *client)
> {

[ ... ]

> 	ret =3D gp2ap070s_probe_hw_register(drvdata);
> 	if (ret)
> 		return ret;

[Severity: Medium]
Does the driver need a devm_add_action_or_reset() hook to cleanly power down
the sensor on removal?

Without clearing the WKUP and EN bits on teardown, might the device be left
actively running and consuming power indefinitely after the driver is unbou=
nd?

>=20
> 	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> 					gp2ap070s_irq_handler, IRQF_ONESHOT,
> 					"gp2ap070s-irq", indio_dev);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-gp2ap070s-=
v1-0-b8ca3a4c10dd@disroot.org?part=3D2
