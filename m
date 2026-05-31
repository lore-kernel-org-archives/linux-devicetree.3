Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE312C11CF
	for <devicetree@vger.kernel.org>; Sun, 31 May 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780258601; cv=none; b=G6oAF+W8v9sh3zY/LU4tlPGMa9HE9ZU7tYkqhAvbbyS3ABwu5hqFEerMdm6HxNma17AYrsB8gIOGh0/y6/kxcPOYZXjs6mQaot/y8XnfVYGPphbbxDejgozHTcI1UU/r3FQcIM1W55s7B4+gAwb26cCpsDtWy4DRbT+wDQ4fduA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780258601; c=relaxed/simple;
	bh=3Nkuc8LafLMz8Ptu19Wpf+BhJy+7hTiOPQMoccvr22Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=quK7aVE2UC0BQD02DtQiavQ9KyxDfVRba7PTys4lE9owfLS7Z2CIq1yFafJfz/Ej7G5n4fudVS9hHKmIdNTZNOhKORMHnslOGDR5bIqB69BUbIfz1w6a23oz/SZJNjTD6YA3/vHEQtMsfdOjklhyPL/Ivfvt/nSRIL5HbX05meQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrrDQckb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrrDQckb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09ED11F00893;
	Sun, 31 May 2026 20:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780258600;
	bh=jgZSq/HS1sYeE5LM4ZWJA7EZDkOJ9T+mz7jRDkB37gY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PrrDQckbYG7AFhBDwROMuMo8WkA2L3X1totGHIyx/rDQNukOwyZdejXcve6VoKqL3
	 IXvXPAoeO+ebyRnoClKGvxxSFFS9LrBzZGqqNYL1XegIxkJeWcylgo9VhhA65J584G
	 GCNYfTFRumMZgVW8KCXdXVHhTw/xL8laRQpMlY907LK429iTMmVIvvnILz841edzxz
	 CxIaqfxEWIoVf2mJSB68C5JNMyvoOH4onU4xq/9o03NonUNvqJz96oO+0KGD2EejRc
	 WANApyklNvB8JtzD7vcM4oNlW1cY2lXHnsn0Vj4wuF5HkCzmymL6cln+Vyh7rkkNIf
	 V3+weWcv3KxnQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/4] iio: light: add support for veml6031x00 ALS
 series
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
References: <20260531-veml6031x00-v4-2-e64f7fdce38d@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 31 May 2026 20:16:39 +0000
Message-Id: <20260531201640.09ED11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Runtime PM usage counter underflow due to unbalanced puts.
- [Medium] The IR intensity channel does not expose its available scales to=
 userspace.
- [Medium] Missing lock in raw read path allows concurrent configuration ch=
anges to corrupt sensor readings.
--

commit 5e5c3dc820c07a34f2519b89a89cabf3c88212a1
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: add support for veml6031x00 ALS series

These sensors provide two light channels (ALS and IR), I2C communication
and a multiplexed interrupt line to signal data ready and configurable
threshold alarms.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> new file mode 100644
> index 0000000000000..6f9a7bad44d44
> --- /dev/null
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> +static const struct iio_chan_spec veml6031x00_channels[] =3D {
> +	{
> +		.type =3D IIO_LIGHT,
> +		.address =3D VEML6031X00_REG_ALS_L,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_separate_available =3D BIT(IIO_CHAN_INFO_SCALE),
> +	},
> +	{
> +		.type =3D IIO_INTENSITY,
> +		.address =3D VEML6031X00_REG_IR_L,
> +		.modified =3D 1,
> +		.channel2 =3D IIO_MOD_LIGHT_IR,
> +		.info_mask_separate =3D BIT(IIO_CHAN_INFO_RAW) |
> +				      BIT(IIO_CHAN_INFO_SCALE),
> +		.info_mask_shared_by_all =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +		.info_mask_shared_by_all_available =3D BIT(IIO_CHAN_INFO_INT_TIME),
> +	},

[Severity: Medium]
Will userspace be able to discover the valid scale multipliers for the IR
channel?

The ALS channel includes BIT(IIO_CHAN_INFO_SCALE) in its
info_mask_separate_available bitmask, but it appears to be omitted here
for the IR channel.

Because of this omission, the IIO core won't create the
in_intensity_ir_scale_available sysfs attribute.

[ ... ]

> +static int veml6031x00_single_read(struct iio_dev *iio, enum iio_chan_ty=
pe type,
> +				   int *val)
> +{
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	int addr, it_usec, ret;
> +	__le16 reg;

[ ... ]

> +	ret =3D veml6031x00_get_it(data, &it_usec);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* integration time + 10 % to ensure completion */
> +	fsleep(it_usec + (it_usec / 10));

[Severity: Medium]
Can a concurrent sysfs write corrupt this sensor reading?

This read sequence sleeps here using fsleep() without holding a lock to
serialize the read against concurrent sysfs writes.

If a user thread concurrently modifies the integration time or scale via
veml6031x00_write_raw(), the hardware's measurement cycle might be reset
mid-measurement. When single_read() wakes up, it could read the data regist=
er
before the new measurement has finished, returning stale or corrupted data.

> +
> +	ret =3D regmap_bulk_read(data->regmap, addr, &reg, sizeof(reg));
> +	if (ret)
> +		return ret;

[ ... ]

> +static int veml6031x00_probe(struct i2c_client *i2c)
> +{

[ ... ]

> +	ret =3D devm_pm_runtime_set_active_enabled(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to enable runtime PM\n");
> +
> +	ret =3D devm_pm_runtime_get_noresume(dev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get runtime PM\n");
> +
> +	ret =3D veml6031x00_validate_part_id(data);
> +	if (ret)
> +		return ret;

[ ... ]

> +	ret =3D veml6031x00_hw_init(iio);
> +	if (ret)
> +		return ret;
> +
> +	pm_runtime_put_autosuspend(dev);

[Severity: High]
Could this lead to a Runtime PM usage count underflow on driver unbind?

Earlier in veml6031x00_probe(), the driver acquires a PM runtime reference
using the devres helper:

ret =3D devm_pm_runtime_get_noresume(dev);

This automatically registers a cleanup action to decrement the usage count =
upon
driver removal or probe failure.=20

However, manually dropping the reference here with pm_runtime_put_autosuspe=
nd()
allows the device to autosuspend, but leaves the devres cleanup action queu=
ed.
When the driver is unbound (or if devm_iio_device_register() fails below),
the devres cleanup action will execute and decrement the usage counter agai=
n.

> +
> +	ret =3D devm_iio_device_register(dev, iio);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register iio device\n");
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260531-veml6031x0=
0-v4-0-e64f7fdce38d@gmail.com?part=3D2
