Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0608369208
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 21:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788815427; cv=none; b=rJ/URkQg8GvDQepUMNiGs9puwUbT8lLAhUB/bEyNhnQmThHc6sJGITlimzdtMQbbl6VdXSu4AjyXh5UFtPRtRvQyMSIHfyYk8+8viWJ06CIP6EeRojjzTjXI504Ua5kbZfuufYc9mKfK6Wvh3frkch8lF2DmAWnKvGuKa2yBFJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788815427; c=relaxed/simple;
	bh=LZyenbhrmmPMthVCjd8eVc2jp1jNYS20v/2KdyFDf6g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H3KDctWKViJ+VmneRcRUBkSRLUTQfUshq+mYPRfZNrSM47JPghSPnZd4Ap+rcBqLhWMyDxiWs8h4kL8cRW8z2R9Dy0VQJuJvtL+mcIwm3p827x/VsW1F8Udh6vAFGxpNpaoXQTaepSkWAjaHRJ3QpPwdS7BoD5jWXnR3BQAbMKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W4Cf1fBc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W4Cf1fBc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD9591F00A3A;
	Mon,  7 Sep 2026 21:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788815425;
	bh=PunW8fp/Or0IDUjTt3iQfeSyVypVVdTbEUfAIdMKo20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W4Cf1fBcFJ1vTv+GaqCxzHS9Kjd97oOb4AhvkQj8BKcauKOTkUeY/mo/Hnfcu7v1s
	 /eBKMmfIDIPQJeDW/fifbg5MBlMZa0iwe2tKMJfolBmC3lLCg1mW9dICPBgchS+IOd
	 BTcxX5p65dlOPcCbLa4K4csrUGas8Koj3grYG3SrvT24tillEzh1gKLcBYGkg/mQgc
	 MKYEuVnri3yzLJwYc/4sPzMTu6P9V+btOgGTEewuZKPcxhE1Q8HwHjwheylY3bts2b
	 i/yKARvXxLKAAFHKzwGks27WLZhtmqw2vYKv4yC4wyf1n8gfqmrL3Ta0lLWpcGeBXy
	 uM8YLxHb98zCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: light: add AS7343 multi-spectral sensor
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chang Yu" <marcus.yu.56@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907210042.32552-3-marcus.yu.56@gmail.com>
References: <20260907210042.32552-1-marcus.yu.56@gmail.com>
 <20260907210042.32552-3-marcus.yu.56@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 21:10:25 +0000
Message-Id: <20260907211025.AD9591F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Device configuration is not restored on system resume, breaking th=
e sensor if power is lost.
- [Medium] The PM operations structure pointer is incorrectly wrapped with =
pm_sleep_ptr() instead of pm_ptr().
- [Medium] Missing PM runtime get/put in as7343_read_raw() allows reads whi=
le the device is runtime-suspended.
- [Medium] The variable 'val' is evaluated uninitialized when regmap_read()=
 fails.
- [Medium] The device is left powered on during driver unbind and error pat=
hs.
- [Low] Incorrect base types used for endianness conversions cause Sparse w=
arnings.
- [Low] Concurrent sysfs reads cause a race condition in as7343_read_raw() =
when latching and reading sensor data.
--

commit b11536303f5757f091de7d446bfca2f105210812
Author: Chang Yu <marcus.yu.56@gmail.com>

iio: light: add AS7343 multi-spectral sensor driver

This patch adds a driver for the AMS AS7343 14-channel multi-spectral
sensor with I2C interface. It exposes 12 spectral channels via IIO sysfs
and adds basic power management support.

> diff --git a/drivers/iio/light/as7343.c b/drivers/iio/light/as7343.c
> new file mode 100644
> index 0000000000000..f8ee0f2e7392d
> --- /dev/null
> +++ b/drivers/iio/light/as7343.c
[ ... ]
> +static int as7343_read_raw(struct iio_dev *indio_dev,
> +			   struct iio_chan_spec const *chan, int *val,
> +			   int *val2, long mask)
> +{
> +	struct as7343_data *data =3D iio_priv(indio_dev);
> +	int ret;
> +	unsigned int unused;
> +	u16 result;

[Severity: Low]
Do these assignments cause static analysis warnings with Sparse? 'result'
is declared as u16 but assigned a __le16 value via regmap_bulk_read() and
passed to le16_to_cpu() below.

> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		/*
> +		 * Reading ASTATUS latches all data registers to this read.
> +		 * We don't care about the returned saturation/gain status for
> +		 * now.
> +		 */
> +		ret =3D regmap_read(data->regmap, AS7343_ASTATUS, &unused);

[Severity: Medium]
Can this execute I2C reads against a suspended sensor?

The driver enables runtime PM which allows the device to be suspended
(clearing the measurement enable bit). Reading raw data without waking the
device using pm_runtime_resume_and_get() first could return stale or zero
data.

[Severity: Low]
Can concurrent sysfs reads from different channels cause a race condition
here?

The ASTATUS read latches all channels before the channel data is read.
Without a lock, could interleaved reads result in one thread receiving data
latched by another thread's ASTATUS read?

> +		if (ret)
> +			return ret;
> +
> +		ret =3D regmap_bulk_read(data->regmap, chan->address, &result, 2);
> +		if (ret)
> +			return ret;
> +
> +		*val =3D le16_to_cpu(result);
> +		return IIO_VAL_INT;
> +	}
[ ... ]
> +static int as7343_setup_device(struct device *dev, struct as7343_data *d=
ata)
> +{
> +	unsigned int val;
> +	u16 step;

[Severity: Low]
Does this cause a strict typing warning with Sparse? 'step' is declared as
u16 but receives a __le16 value via cpu_to_le16() below.

> +	int ret;
> +
> +	/* Power on */
> +	ret =3D regmap_set_bits(data->regmap, AS7343_ENABLE, AS7343_ENABLE_PON);
> +	if (ret)
> +		return ret;
> +
> +	/* Need to set REG_BANK to 1 before we can access ID */
> +	ret =3D regmap_set_bits(data->regmap, AS7343_CFG0, AS7343_CFG0_REG_BANK=
);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_read(data->regmap, AS7343_ID, &val);
> +	if (val !=3D 0x81)
> +		dev_info(dev, "Unknown device ID: %x\n", val);

[Severity: Medium]
If regmap_read() fails, it returns an error code and leaves the stack
variable 'val' uninitialized. Could we be evaluating and printing
uninitialized memory here since the error is ignored?

> +
> +	ret =3D regmap_clear_bits(data->regmap, AS7343_CFG0,
> +				AS7343_CFG0_REG_BANK);
[ ... ]
> +static int as7343_suspend(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct as7343_data *data =3D iio_priv(indio_dev);
> +
> +	return regmap_clear_bits(data->regmap, AS7343_ENABLE,
> +				 AS7343_ENABLE_SP_EN);

[Severity: Medium]
Does this leave the device powered on indefinitely?

as7343_setup_device() sets the PON bit during probe, but this suspend
action only clears SP_EN, meaning PON remains set when the device is
unbound or suspended.

> +}
> +
> +static int as7343_resume(struct device *dev)
> +{
> +	struct iio_dev *indio_dev =3D dev_get_drvdata(dev);
> +	struct as7343_data *data =3D iio_priv(indio_dev);
> +
> +	return regmap_set_bits(data->regmap, AS7343_ENABLE,
> +			       AS7343_ENABLE_SP_EN);

[Severity: High]
Does this leave the sensor in a broken state after resuming from S3 sleep?

The driver uses REGCACHE_NONE, so all volatile configurations (gain,
integration time, multiplexer) are lost when power to the sensor is lost.
This resume function only sets the SP_EN bit without reinitializing the
sensor's configuration.

> +}
[ ... ]
> +static int as7343_probe(struct i2c_client *client)
> +{
[ ... ]
> +	ret =3D as7343_setup_device(dev, data);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D devm_add_action_or_reset(dev, as7343_suspend_action, dev);

[Severity: Medium]
Does this leave the device powered on during error paths?

as7343_setup_device() powers on the device, but if a subsequent I2C
operation in that function fails, this cleanup action is never registered,
leaving the hardware powered on.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "Failed to add suspend action\n");
[ ... ]
> +static struct i2c_driver as7343_driver =3D {
> +	.driver =3D {
> +		.name           =3D "as7343",
> +		.of_match_table =3D as7343_of_match,
> +		.pm             =3D pm_sleep_ptr(&as7343_pm_ops),

[Severity: Medium]
Does this inadvertently drop runtime PM support when CONFIG_PM_SLEEP is
disabled?

The dev_pm_ops structure defines runtime PM callbacks, but using
pm_sleep_ptr() evaluates to NULL when CONFIG_PM_SLEEP=3Dn, even if
CONFIG_PM=3Dy is set. Should this be wrapped with pm_ptr() instead?

> +	},
> +	.probe      =3D as7343_probe,
> +	.id_table   =3D as7343_id,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907210042.3255=
2-1-marcus.yu.56@gmail.com?part=3D2
