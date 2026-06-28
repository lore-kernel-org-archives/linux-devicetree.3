Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102522417DE
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676477; cv=none; b=mwaxVfP19+lecNrsAnSU0j/efC2qr7fuH1iGQDaiPMWcj82AkDMI5NTY3lFm9h3ETUhzLoqIZh6mx+DYQu/pFjWP9a5niMwdK3kI9d7Y23xfcynKFu5tL+dXAYiAVE2VBcUFIu/X+RfASUWXElR/DVor+ZbMoCd6NyI3yfIsIms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676477; c=relaxed/simple;
	bh=jurd/OIIBEo/9PXOzpGwicrBnrWkgLwauhn7nVynX4g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U3ANvON/HB/vw+XPJTaK6O9mnMpzL4OTy8/r4NVkIVhFHp+hRcwSABJFFXij+JH8xKu8fMx8OYEGx8sSOcarEkOiRvnAhzlKDUXHXAbFIqws8CnKIYccqb26E97liaZLT/dlxmthwfVer6V/Z1ujfb1QEveML99UYEbcInB3puU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WBDUVaGx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WBDUVaGx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7480D1F000E9;
	Sun, 28 Jun 2026 19:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782676475;
	bh=hhfXkX8oRuqEo4fxFcF5++hlEPGgfDa/UOXwZO7wbaU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WBDUVaGxfr60ZrD220RQ8uGbLKfngn88Yxblxk1/TNcBbWv+IobI+eGJidDWAYfIy
	 O1sVPqRje3ZYtioRYqksnTRvUZDylsu+iTj0EA0rtFtZfR0KAPe49xG/B/qb0jrxoD
	 ip+4dUbNZBjhlQeGifnKnrpY59KU2cN0h+36/54wilMPM4gN6x+ByNVd2MQHQR81Ni
	 qvKUC8juPJVVu96xNqsh6SY2lnRcu+lLaxHXoY32v0uRLffTuQYEjvJ6+fEzqidbyh
	 /SazaUismP/eLnr5U1z8b/NR3yimTRcXaiTp0WXWMkvkFiLu5qIfL/MhNcinedBLRz
	 CClGAOrNm5QFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/3] dt-bindings: iio: adc: ti,ads1100: add support
 for ADS1110
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260628194341.66752-3-jakubszczudlo40@gmail.com>
References: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
 <20260628194341.66752-3-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 19:54:34 +0000
Message-Id: <20260628195435.7480D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `ads1100_set_data_rate` function ignores the requested data ra=
te and unconditionally applies the first entry.
- [High] `ads1100_poll_data_ready` uses an inverted break condition for pol=
ling, causing it to exit immediately when the device is busy.
--

commit 94cd92aafbd37136e109b12cbe69b760dcdb10a5
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: Fix incorrect reading when datarate changed in single mode

This commit addresses an issue where changing the datarate in single mode
while the device is suspended does not wait for a new measurement. Functions
modifying datarate and gain are updated to wait for new data.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83c..71b31adeba3c6 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c

[ ... ]

> @@ -123,10 +128,46 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)
>  	return 0;
>  }
> =20
> +static bool ads1100_new_data_not_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret =3D i2c_master_recv(data->client, buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return true;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int data_rate_hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];
> +	/* To be sure we wait 5 times more than data rate */
> +	unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data=
_rate_hz);
> +	bool data_ready;
> +	u8 buffer[3];
> +	int ret;
> +
> +	/* To be sure that polled value will have value after config change */
> +	ret =3D i2c_master_recv(data->client, buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return readx_poll_timeout(ads1100_new_data_not_ready, data,
> +				 data_ready, data_ready !=3D 0, wait_time_us,
> +				 ADS1100_MAX_DRDY_TIMEOUT_US);

[Severity: High]
Does this use an inverted break condition for polling?

When ads1100_new_data_not_ready() is called, it returns 1 if the device
is busy. The readx_poll_timeout() macro assigns this to data_ready and
evaluates data_ready !=3D 0 to determine if it should break out of the loop.

Since the condition is data_ready !=3D 0, the loop will exit immediately wh=
en
the device is busy, rather than waiting for the device to become ready.

> +}

[ ... ]

> @@ -149,19 +195,31 @@ static int ads1100_set_scale(struct ads1100_data *d=
ata, int val, int val2)
> =20
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
> =20
> -	return 0;
> +	return ads1100_poll_data_ready(data);
>  }
> =20
>  static int ads1100_set_data_rate(struct ads1100_data *data, int chan, in=
t rate)
>  {
>  	unsigned int i;
>  	unsigned int size;
> +	int ret;
> =20
>  	size =3D data->supports_data_rate ? ARRAY_SIZE(ads1100_data_rate) : 1;
>  	for (i =3D 0; i < size; i++) {
> -		if (ads1100_data_rate[i] =3D=3D rate)
> -			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
> -						       FIELD_PREP(ADS1100_DR_MASK, i));
> +		if (i =3D=3D size)
> +			return -EINVAL;
> +
> +		PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&data->client->dev, pm);
> +		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
> +		if (ret)
> +			return ret;
> +
> +		ret =3D ads1100_set_config_bits(data, ADS1100_DR_MASK,
> +					      FIELD_PREP(ADS1100_DR_MASK, i));

[Severity: High]
Will this ignore the requested data rate and unconditionally apply the first
entry?

The previous check against the user's requested rate:
    if (ads1100_data_rate[i] =3D=3D rate)

was removed.

As a result, on the very first iteration (i =3D 0), this configures the dev=
ice
to the first available data rate and immediately returns, ignoring the value
the user actually requested.

> +		if (ret)
> +			return ret;
> +
> +		return ads1100_poll_data_ready(data);
>  	}
> =20
>  	return -EINVAL;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628194341.6675=
2-1-jakubszczudlo40@gmail.com?part=3D2
