Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCD823BD06
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425232; cv=none; b=KHbQIHLnMyUuvhj3CgGzqcjLqK7zuLRMZMe6dnTKgrS7nUdIOzmttoOEQ0TL50d+BWfA8VPk8ZGUsO55DYB/nIz3+R/YlNlL1fkGhAYkuwV9wJW+1cKLdErjmdn7WRxlHfXAFB8JZJUVim61aYokd1JVbBb+l9MEKn/MIFfpffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425232; c=relaxed/simple;
	bh=FKI7Yf+AgJlux4LlX2rKW39GG8Thdkwe1Omvj3O0LMI=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hbhGXUlLOZtYVBpkTqpIC7yz+DJYWt8uxOJxjVTw8gO3UaOMoYiGt7FTu2gHUvtL+XOe0ZFHL6kTqUzlGLXnhPnwutGRNSPKFWDzPEyaaUn5W8W3G+06r+47OdaE9/EzJnHWT2BgB7y+SGUJSmFA4FMzvJ5Gxnr9nn04EH5EB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U9UPFGgT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U9UPFGgT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B8F21F000E9;
	Thu, 25 Jun 2026 22:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782425231;
	bh=1Snr7yK0brIfd7zl+YJYRxYiTErQW1B8TyJS3mVu3FE=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=U9UPFGgTKJnU+Kn/4FZHKH3XypnXqJlyTRtsJHkmd0WLZd6Zy4uaV6PNlU4s1xtEg
	 ChVphbhzTIpINx/KzKQMVa87u6kQJ62Oq5HBWx+cyOqSo4k9KwSqmbSNA62KsPxxpV
	 JAgqVtps5sxDgnwZ5gIjZKs/yf7vV1/muREdyrTBsxs+gfHqMuKdWf1kzJKIFkSqkX
	 HviouZ9btIBB9KRwuj2LIiUYEgvPTzhDYQ/iRl8hWEKBoYWf86nWRCVE2iKRrWNs27
	 zyxJvpV/vXIgX678Bluv4q3tbUevDccR9mk26zDVU1KXaD+y6eeMATBMTrrLZp5fn8
	 mG6p1REflqkyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/8] iio: adc: add ti-ads112c14 driver
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-6-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-6-ceb9b0b561cb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 22:07:10 +0000
Message-Id: <20260625220711.1B8F21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Short I2C reads lead to the use of uninitialized stack memory for =
ADC readings.
- [High] The driver inadvertently sets the device into Continuous Conversio=
n mode instead of the intended Single-Shot mode.
--

commit 610f816911f47ce29d3c83f300222d6ab72f8820
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: add ti-ads112c14 driver

Add a new driver for the TI ADS112C14/ADS122C14 ADC chips.

This first step is adding a very basic driver that only supports power
on/reset and reading the system monitor channels.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> new file mode 100644
> index 0000000000000..c61d472447325
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c14.c

[ ... ]

> +static int ads112c14_single_conversion(struct ads112c14_data *data,
> +				       const struct iio_chan_spec *chan,
> +				       u8 *buf)
> +{

[ ... ]

> +	return i2c_smbus_read_i2c_block_data(client, ADS112C14_CMD_RDATA,
> +					     BITS_TO_BYTES(data->chip_info->resolution_bits),
> +					     buf);
> +}
> +
> +static int ads112c14_read_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan, int *val,
> +			      int *val2, long mask)
> +{

[ ... ]

> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW: {
> +		u8 buf[3];
> +		int ret;
> +
> +		if (!iio_device_claim_direct(indio_dev))
> +			return -EBUSY;
> +
> +		ret =3D ads112c14_single_conversion(data, chan, buf);
> +		iio_device_release_direct(indio_dev);
> +		if (ret < 0)
> +			return ret;

[Severity: High]
Does this code handle short I2C reads correctly?

i2c_smbus_read_i2c_block_data() returns the positive byte count on success.
If the device returns fewer bytes than requested, ret will be positive but
less than BITS_TO_BYTES(data->chip_info->resolution_bits).

Since ads112c14_read_raw() only checks if (ret < 0), won't a short read
bypass error handling and cause it to process uninitialized stack memory fr=
om
buf, leading to an information leak and corrupted ADC readings?

> +
> +		switch (data->chip_info->resolution_bits) {
> +		case 16:
> +			*val =3D get_unaligned_be16(buf);

[ ... ]

> +static int ads112c14_probe(struct i2c_client *client)
> +{

[ ... ]

> +	/* Place in single-shot conversion mode to make ready for raw read. */
> +	ret =3D regmap_set_bits(data->regmap, ADS112C14_REG_DEVICE_CFG,
> +			      ADS112C14_DEVICE_CFG_CONV_MODE);

[Severity: High]
Does setting ADS112C14_DEVICE_CFG_CONV_MODE actually put the device into
continuous conversion mode instead of the intended single-shot mode?

According to the comment, the intention is to use single-shot mode (which is
typically the default value of 0). Setting the bit to 1 appears to enable
continuous conversion mode, which could cause hardware race conditions and
corrupted data when multiplexer settings are changed for new sysfs readings.

> +	if (ret)
> +		return ret;
> +
> +	indio_dev->name =3D info->name;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-iio-adc-ti=
-ads122c14-v2-0-ceb9b0b561cb@baylibre.com?part=3D6
