Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE940332634
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784061528; cv=none; b=snMPUOcu3aF6j1Obe3xN4gh2k1C0wUFFuP5P774aKDEh730mIdF41HQlrnT6EtIGHNdgfIY+BLrCmssJppvkt6YZpBNfZDuiTzy6wYA3m35OIn5aXm6Gz3UUYV2FES03sAzaTKyo0P0bQH4j6rgl4mpMzG1GBmz35fyFmMwzeVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784061528; c=relaxed/simple;
	bh=5TozeRgQTmK02stItwLqoev7wENCMHK5LXkbQdk8p8w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a/bt+X3t5xP4EM/TAFd9DhIP6gMOndzbqH8mTfLp3tXrKTv6c7G3JErpnwteQfTT6jlJmNdSVWQno6kHvtQcDwxBdUYlT07AEXEtBI+abN0mD0iTPnmsP1aFcvM+tD0m9hK9TQfJUyCVl6+fB3oyArrNLyXrieATKml2zPrZBEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AljtVMqc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AljtVMqc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3328C1F000E9;
	Tue, 14 Jul 2026 20:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784061526;
	bh=9M/6ChiX64naJRSIbGL++HQh2QprnZKOL6IuIgsd0Co=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AljtVMqcA+W/RjX31MTLHUswLNXpXCE9gxBlvoJSE1GPdTbziMbq6Jtxv1EaE49Cf
	 7urilPmo2mFGjvev8vc1ebOo9gxAN4jIM7CI3BcAMNOSEcYO30sMVgcggVIl43Hzk4
	 kRo0vmHHCGtnWweOwBNCV4hK99g4TzA2lud9hx7oQQx42KN5FftQ+3b9Alj6Rs8XHq
	 8uoMFS8wvn2s7F6B2xg0x2MRnvZB47JKKihljgL4+0ZJeYrhgsRisqmHCbGcKKn5qO
	 vojRa/HrMuaQTLNAXlfkB3GnjrbNWKJzuY/jehmJOZANk+4M39+poOT6MoyluKKiBg
	 e9pi1jvtrQ2PA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: magnetometer: add support for QST QMC6308
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jorijn van der Graaf" <jorijnvdgraaf@catcrafts.net>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>
References: <20260714202842.340293-1-jorijnvdgraaf@catcrafts.net>
 <20260714202842.340293-3-jorijnvdgraaf@catcrafts.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:38:45 +0000
Message-Id: <20260714203846.3328C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] Mixing goto-based error handling with scope-based resource manag=
ement (scoped_guard).
- [Medium] The driver unconditionally clears the OSR2 bits during initializ=
ation, which contradicts the commit message claim.
- [Medium] PM runtime usage counter leak on probe error path if devm_pm_run=
time_enable() fails.
--

--- Patch [2]: [PATCH 2/2] iio: magnetometer: add support for QST QMC6308 -=
--
commit 853c93f15847bd14844e93c8fdb6cfc5b96c3f4e
Author: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>

iio: magnetometer: add support for QST QMC6308

Adds an I2C driver for the QST QMC6308 3-axis magnetometer. The driver
supports raw reads, multiple ranges, output data rates, filter oversampling
ratios, and runtime PM, taking measurements in normal mode paced by DRDY.

> diff --git a/drivers/iio/magnetometer/qmc6308.c b/drivers/iio/magnetomete=
r/qmc6308.c
> new file mode 100644
> index 0000000000000..ceb4b98402bb0
> --- /dev/null
> +++ b/drivers/iio/magnetometer/qmc6308.c
[ ... ]
> +static int qmc6308_take_measurement(struct iio_dev *indio_dev, int index,
> +				    int *val)
> +{
> +	struct qmc6308_data *data =3D iio_priv(indio_dev);
> +	struct regmap *map =3D data->regmap;
> +	struct device *dev =3D regmap_get_device(map);
> +	unsigned int status;
> +	__le16 buf[3];
> +	int ret;
> +
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret) {
> +		/* EACCES means a read raced runtime PM disable on suspend */
> +		if (ret !=3D -EACCES)
> +			dev_err(dev, "Failed to power on (%d)\n", ret);
> +		return ret;
> +	}
> +
> +	scoped_guard(mutex, &data->mutex) {
> +		/* 50ms headroom over the slowest ODR (10Hz) */
> +		ret =3D regmap_read_poll_timeout(map, QMC6308_REG_STATUS,
> +					       status,
> +					       (status & QMC6308_STATUS_DRDY),
> +					       2 * USEC_PER_MSEC,
> +					       150 * USEC_PER_MSEC);
> +		if (ret)
> +			goto out_rpm_put;
> +
> +		ret =3D regmap_bulk_read(map, QMC6308_REG_X_LSB, buf,
> +				       sizeof(buf));
> +		if (ret)
> +			goto out_rpm_put;

[Severity: Medium]
Is it safe to mix goto-based error handling with scoped_guard() in the same
function? The cleanup subsystem documentation indicates that functions shou=
ld
either use scope-based cleanup for all resources or convert none of them, to
avoid confusing ownership semantics.

> +
> +		if (status & QMC6308_STATUS_OVFL)
> +			ret =3D -ERANGE;
> +	}
> +
> +out_rpm_put:
> +	pm_runtime_put_autosuspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	*val =3D (s16)le16_to_cpu(buf[index]);
> +
> +	return 0;
> +}
[ ... ]
> +static int qmc6308_init(struct qmc6308_data *data)
> +{
> +	struct regmap *map =3D data->regmap;
> +	unsigned int reg;
> +	int ret;
[ ... ]
> +	data->odr =3D QMC6308_ODR_50HZ;
> +	data->osr =3D QMC6308_OSR1_8;
> +
> +	return regmap_write(map, QMC6308_REG_CTRL1,
> +			    FIELD_PREP(QMC6308_MODE_MASK,
> +				       QMC6308_MODE_NORMAL) |
> +			    FIELD_PREP(QMC6308_ODR_MASK, data->odr) |
> +			    FIELD_PREP(QMC6308_OSR1_MASK, data->osr));

[Severity: Medium]
Does this regmap_write() clear the OSR2 bits, contradicting the commit
message which states OSR2 is left at its power-on default?

Since regmap_write() overwrites the entire 8-bit register, the OSR2 field
(bits 7:6) will be implicitly zeroed here. Would using regmap_update_bits()
prevent overwriting the power-on default?

> +}
[ ... ]
> +static int qmc6308_probe(struct i2c_client *client)
> +{
> +	struct device *dev =3D &client->dev;
> +	struct qmc6308_data *data;
> +	struct iio_dev *indio_dev;
> +	struct regmap *map;
> +	int ret;
[ ... ]
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, QMC6308_AUTOSUSPEND_DELAY_MS);
> +	ret =3D devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Does returning directly here leak the PM runtime usage counter if
devm_pm_runtime_enable() fails?

Since pm_runtime_get_noresume() increments the counter just above, it appea=
rs
we might need to balance it with pm_runtime_put_noidle() on this error path
to prevent the parent or I2C device from being kept artificially active.

> +
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return devm_iio_device_register(dev, indio_dev);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714202842.3402=
93-1-jorijnvdgraaf@catcrafts.net?part=3D2
