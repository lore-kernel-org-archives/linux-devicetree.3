Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381873939D2
	for <devicetree@vger.kernel.org>; Thu, 30 Jul 2026 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440605; cv=none; b=FZWaCKiEjsDXvNatJh/Azxfmg4lpW2RjxLhm1HLWOhMAsh/OS9xOIIJJWs+ARsQpNjtsLEtqR8vvmwwpBzutLmdmTYxHr2CLcJcH1urfX5LO3s1aZ3tPnc88YteL2YTsX6tg0zVF9x0KiMkBkv+Lr/pKydjJ8tCrq3ENuZhG5TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440605; c=relaxed/simple;
	bh=k2RvY8LyLIoZYfh5Pkwju8Ii+EPpzCpmDtgF8/Lzofo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=skhJTigdxbZhVWGcTuAVzrixcT3XiHqYDF0s9I33emXC/JJQyZVhOVbjcPJgdZPvPC34wXRsgYCN4jMzX3rWp2Tb97cQ3/GCMdsUpfQ2caHmIFzwNoZLBl8g/jsM5cZhooOXvIe8SBNNc05M9S5T3TV8XtF9FLrgGmBzZRXFZ2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=emxXhCwV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="emxXhCwV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4C61F000E9;
	Thu, 30 Jul 2026 19:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785440603;
	bh=mLBDVd4j6t9uiCBSx05fPI2DLFvwaLeNJaDps5P47qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=emxXhCwVXrthqU2yoOnuwXg5SixV2FyIKy3LKr7x/2D/xZxm/Hh4IutZH5oWpgmPS
	 ShF7KYbOM3Eld3jJypL642DiqIQLuY6Na3ELO8ChWH0YGt73JmXG9CzrhuOICSacbg
	 7BKKoPr9Plw64k0UC4WotmBI5aZCHu1t73u0RuCoQPqaSC50hLAY4d108UN5R+21cU
	 U66hPZd/i5ZL60tomQK//aKC9E/PWeABdkVBLk5r+1Qd31BeaffNqwfbVpew+HravG
	 cAGQLMqK5tkIoJ95zw7/EK4/6tXPylVxV4RH6Nq1R2tYO7C2urIt59Cne8aqMqdLlV
	 RIaj4X5zMMY/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070S
 proximity sensor
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kaustabh Chakraborty" <kauschluss@disroot.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
References: <20260731-gp2ap070s-v2-0-1bdfee07d5ea@disroot.org>
 <20260731-gp2ap070s-v2-2-1bdfee07d5ea@disroot.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 19:43:22 +0000
Message-Id: <20260730194323.3B4C61F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 9 potential issue(=
s) to consider:
- [High] Potential Interrupt Storm on I2C Read Errors
- [High] Improper Use of WARN_ONCE for a Normal Physical Race Condition All=
owing Denial of Service
- [Medium] Resource Leak and Unbalanced Hardware Lifecycle
- [Medium] Hardware Threshold Interrupts are Unconditionally Enabled at Pro=
be
- [Medium] Missing Bounds Check on User-Supplied Sysfs Thresholds Enables I=
nteger Truncation and Invariant Bypass
- [Medium] Missing Driver-Level Mutex Causes TOCTOU Race in Sysfs Writes
- [Medium] Missing System Suspend/Resume Operations Prevents Deep Sleep
- [Low] Inefficient Suboptimal I2C Reads in Threaded IRQ Handler
- [Low] Use of Deprecated sprintf in sysfs Output
--

--- Patch [2]: [PATCH v2 2/3] iio: proximity: add driver for Sharp GP2AP070=
S proximity sensor ---
commit 5c657e9abcf891397094f2fe629d2a5366679466
Author: Kaustabh Chakraborty <kauschluss@disroot.org>

iio: proximity: add driver for Sharp GP2AP070S proximity sensor

The GP2AP070S is a proximity sensor designed and manufactured by Sharp
Corporation. This sensor is used in mobile devices, including, but not
limited to - the Samsung Galaxy J6.

The driver has been adopted from Samsung's downstream kernel
implementation [1]. Due to the lack of public documentation about the
schematics of this device. The downstream driver acts as the secondary
source of information. Driver clarity has also been improved with the
help of the GP2AP* drivers in iio/light.

Link: https://github.com/Exynos7870/android_kernel_samsung_universal7870/bl=
ob/lineage-16.0/drivers/sensors/gp2ap070s.c [1]

> diff --git a/drivers/iio/proximity/gp2ap070s.c b/drivers/iio/proximity/gp=
2ap070s.c
> new file mode 100644
> index 0000000000000..9625f53d956ec
> --- /dev/null
> +++ b/drivers/iio/proximity/gp2ap070s.c
[ ... ]
> +static ssize_t gp2ap070s_iio_read_near_level(struct iio_dev *indio_dev,
> +					     uintptr_t priv,
> +					     const struct iio_chan_spec *chan,
> +					     char *buf)
> +{
> +	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> +
> +	return sprintf(buf, "%u\n", drvdata->near_level);

[Severity: Low]
Could this use sysfs_emit() instead of sprintf()? The kernel standard is to
use sysfs_emit() for sysfs show callbacks to ensure safety and consistent
formatting.

> +}
[ ... ]
> +static int gp2ap070s_iio_write_event_value(struct iio_dev *indio_dev,
> +					   const struct iio_chan_spec *chan,
> +					   enum iio_event_type type,
> +					   enum iio_event_direction dir,
> +					   enum iio_event_info info, int val,
> +					   int val2)
> +{
> +	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> +	__le16 value;
> +	u16 threshold_other;
> +	int ret;

[Severity: Medium]
Is a driver-level lock needed here to serialize sysfs writes?

Since this function performs a read-modify-write sequence across multiple
independent registers to enforce the lo < hi threshold rule, could concurre=
nt
sysfs writes race, read stale values, and write an invalid configuration?

> +
> +	if (type !=3D IIO_EV_TYPE_THRESH || info !=3D IIO_EV_INFO_VALUE)
> +		return -EINVAL;
> +
> +	switch (dir) {
> +	case IIO_EV_DIR_RISING:
> +		ret =3D regmap_raw_read(drvdata->regmap,
> +				      GP2AP070S_REG_PS_THD_LO_LE16, &value,
> +				      sizeof(value));
> +		if (ret)
> +			return ret;
> +
> +		/* Ensure lo_threshold < hi_threshold */
> +		threshold_other =3D le16_to_cpu(value);
> +		if (threshold_other >=3D val)
> +			return -EINVAL;

[Severity: Medium]
Could a negative val bypass this check?

Since val is a signed int and threshold_other is an unsigned u16, C integer
promotion rules will promote the u16 to a signed int for the comparison.

If a user writes -1, wouldn't 100 <=3D -1 evaluate to false, bypassing the
validation? The negative value would then wrap around when cast to u16
below, writing a potentially huge value to the hardware register. Should val
be bounds-checked (e.g., between 0 and U16_MAX)?

> +
> +		value =3D cpu_to_le16((u16)val);
> +		ret =3D regmap_raw_write(drvdata->regmap,
> +				       GP2AP070S_REG_PS_THD_HI_LE16, &value,
> +				       sizeof(value));
[ ... ]
> +static irqreturn_t gp2ap070s_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct gp2ap070s_drvdata *drvdata =3D iio_priv(indio_dev);
> +	struct device *dev =3D drvdata->dev;
> +	u16 threshold_lo, threshold_hi, distance;
> +	__le16 value;
> +	int ret;
> +
> +	ret =3D regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_LO_LE16,
> +			      &value, sizeof(value));

[Severity: Low]
Is it necessary to read the static low and high thresholds from the hardware
on every interrupt? Since these are configuration variables only modified by
the driver itself, could they be cached in struct gp2ap070s_drvdata to
prevent slow synchronous I2C bus traffic during the threaded IRQ handler?

> +	if (ret) {
> +		dev_err(dev, "Failed to read low threshold value (%d)\n", ret);
> +		return IRQ_HANDLED;
> +	}

[Severity: High]
Can returning IRQ_HANDLED here cause an interrupt storm? If the I2C read
fails, the handler exits without clearing the device's interrupt condition.

If the system's interrupt line is level-triggered, returning IRQ_HANDLED
instructs the IRQ core to unmask the line. The hardware will then immediate=
ly
re-assert the interrupt, leading to an infinite loop and CPU lockup. Should
this return IRQ_NONE or clear the interrupt state before returning?

> +
> +	threshold_lo =3D __le16_to_cpu(value);
> +
> +	ret =3D regmap_raw_read(drvdata->regmap, GP2AP070S_REG_PS_THD_HI_LE16,
> +			      &value, sizeof(value));
[ ... ]
> +	if (distance >=3D threshold_hi) {
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_RISING),
> +			       iio_get_time_ns(indio_dev));
> +	} else if (distance <=3D threshold_lo) {
> +		iio_push_event(indio_dev,
> +			       IIO_UNMOD_EVENT_CODE(IIO_PROXIMITY, 0,
> +						    IIO_EV_TYPE_THRESH,
> +						    IIO_EV_DIR_FALLING),
> +			       iio_get_time_ns(indio_dev));
> +	} else {
> +		/*
> +		 * If none match, then it's stuck in the threshold band gap.
> +		 * The hardware generally does not issue interrupts here.
> +		 */
> +		WARN_ONCE(true, "spurious interrupt issued in proximity threshold gap\=
n");

[Severity: High]
Is it safe to use WARN_ONCE() for a condition triggered by external physical
events? If a physical object triggers the proximity interrupt but moves out
of the threshold bounds before the I2C read completes, it will fall into
this gap.

Using WARN_ONCE() here allows unprivileged actors to trigger a kernel panic
on systems configured with panic_on_warn. Could this be changed to
dev_dbg() or dev_warn()?

> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int gp2ap070s_probe_hw_register(struct gp2ap070s_drvdata *drvdata)
> +{
> +	struct device *dev =3D drvdata->dev;
> +	int ret;
> +
> +	ret =3D regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM1, ~0);
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to reset sensor\n");
> +
> +	ret =3D regmap_clear_bits(drvdata->regmap, GP2AP070S_REG_COM2, ~0);
> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to unmask interrupts\n=
");
> +
> +	ret =3D regmap_set_bits(drvdata->regmap, GP2AP070S_REG_COM3,
> +			      GP2AP070S_VAL_COM3_INT_PULSE);

[Severity: Medium]
Does this enable hardware threshold interrupts unconditionally during probe?
Typically, IIO devices should start with interrupts disabled and only enable
them when explicitly requested by userspace via write_event_config, to avoid
wasting CPU cycles on spurious interrupts before a consumer is ready.

> +	if (ret)
> +		return dev_err_probe(drvdata->dev, ret, "Failed to enable interrupt\n"=
);
[ ... ]
> +static int gp2ap070s_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct iio_dev *indio_dev;
> +	struct gp2ap070s_drvdata *drvdata;
> +	int ret;
[ ... ]
> +	ret =3D gp2ap070s_probe_hw_register(drvdata);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If gp2ap070s_probe_hw_register() succeeds but a subsequent probe step fails,
or if the module is later removed, will the hardware remain powered on and
active? Should there be a devm_add_action_or_reset() or a .remove callback
to properly power down the sensor and disable interrupts?

> +
> +	ret =3D devm_request_threaded_irq(dev, client->irq, NULL,
> +					gp2ap070s_irq_handler, IRQF_ONESHOT,
> +					"gp2ap070s-irq", indio_dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to request IRQ");
> +
> +	return devm_iio_device_register(&client->dev, indio_dev);
> +}
[ ... ]
> +static struct i2c_driver gp2ap070s_i2c_driver =3D {
> +	.driver =3D {
> +		.name =3D "gp2ap070s",
> +		.of_match_table =3D gp2ap070s_of_device_id,
> +	},
> +	.probe =3D gp2ap070s_probe,
> +	.id_table =3D gp2ap070s_i2c_device_id,
> +};
> +module_i2c_driver(gp2ap070s_i2c_driver);

[Severity: Medium]
Are power management operations missing for this device? Without a .pm
callback providing system suspend/resume handling, the active sensor may
continue pulsing its LED and interrupt the host, draining battery and
blocking deep sleep states when the system suspends.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-gp2ap070s-=
v2-0-1bdfee07d5ea@disroot.org?part=3D2
