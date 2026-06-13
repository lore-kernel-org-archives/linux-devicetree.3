Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04B938D415
	for <devicetree@vger.kernel.org>; Sat, 13 Jun 2026 19:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781378525; cv=none; b=BGzqxey0nFWDw6R7N/6QU6IdDeSUMOMxM3+u5nSCIZ6l2mrk7I1yPSee6RBTo3eGZIc6PCmIMMzdkkOWuWa3XqroLzUJ03SmIUds4aa0J9cefUrdqurFF+/ZQIMkT+EGGh9KzmUNplTciuPwCcOD49Ia+QQOtsOTW5hadjRyWHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781378525; c=relaxed/simple;
	bh=1AJzMEe8YzhobW2KJ1hAWpe+9vO7uljek17Ny6MP3EY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ez7RlrQsDfhX4HXPjE3pElTtphihjbbwucvyP0tjjr2GIaRs7hscgkJUiolVZcvJGlDwO9keXaOQbETVD4XhfOwfDOVq6RLZ/THl4HOzNgqy4eQj+Xem0BCgzW8LGoJDwdxfeQlPerY7hPvHFTLcnlDKlIMnDi1XlVzQ4uTEIiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EW+Gv6PS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EW+Gv6PS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D43531F000E9;
	Sat, 13 Jun 2026 19:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781378522;
	bh=AomepSk2v18tebTgq3o53YRWIJwH9repuBiHt07vM0I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EW+Gv6PSKgVG6I+L8pCSn0u+yOQ/SijE5pLXxhVnOD8MVFOZa4qUZuyom3PO9oTPh
	 UmDpwWGURLzJrvkYVHvf/vYfHED9fvc6TIjAbxhJwFXWroUPC4gb8NY2oKbrzm7UwL
	 32yo3YbB+IFswVYA/1ZG/LJxurlyNuZrRHsTbkchMKYgB5cYPRQdMkdTQMwMVGTu2K
	 OBe+7H+EB0krkbrfsnoGM2swS5I8m1zupTG4Gw16hl2JAXgdmjDG38WeLJOIW80VuZ
	 WGhkMeohzhXPVyWJcRwvGs2cFj4sibRWbvp7Mn6vi9RyObBKXhIwM1t8nZ/lJTI9vG
	 iFZkFUsqqcGMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260613190957.654798-4-jakubszczudlo40@gmail.com>
References: <20260613190957.654798-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 13 Jun 2026 19:22:01 +0000
Message-Id: <20260613192201.D43531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Incorrect boolean cast of I2C read errors causes infinite polling =
loop and log spam.
- [High] The return value of `ads1100_set_config_bits()` is ignored, maskin=
g I2C write failures.
- [High] Polling the ST/BSY bit will always time out because the device is =
placed in continuous conversion mode.
- [Medium] The initial dummy `i2c_master_recv()` ignores its return value.

Pre-existing issues:
- [High] The read path returns stale data after waking from autosuspend.
--

commit 4b2f1aca65a15af2d7f4a7cbbd2f3fc74aa691ce
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: Fix incorrect reading when datarate changed in single mode

When device is suspended and it is in single mode then changing
datarate doesn't make it actual wait for new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for new data.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 76de2466dc53b..2ec5c104afcf9 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -123,6 +123,36 @@ static int ads1100_get_voltage_microvolts(struct ads=
1100_data *data)
>  	return ads1100_get_voltage_milivolts(data) * MICRO / MILLI;
>  }
> =20
> +static bool ads1100_new_data_ready(struct ads1100_data *data)
> +{
> +	int ret;
> +	u8 buffer[3];
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 3) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;

[Severity: High]
Since this function returns a bool, doesn't returning a negative error
code implicitly cast it to true? If i2c_master_recv() fails, this will
cause the caller to interpret the error as data being ready.

> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	bool data_ready;
> +	int datarate =3D data->ads_config->data_rate[FIELD_GET(ADS1100_DR_MASK,=
 data->config)];
> +   // To be sure we wait 5 times more than datarate
> +	unsigned long wait_time =3D DIV_ROUND_CLOSEST(MICRO, 5 * datarate);
> +
> +	/* To be sure that polled value will have value after config change */
> +	i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: Medium]
Is it safe to ignore the return value of this initial dummy read?

If the bus is inaccessible or the device is disconnected, the error is
silently masked before entering the polling loop.

> +
> +	return read_poll_timeout(ads1100_new_data_ready, data_ready,
> +				 !data_ready, wait_time,
> +				 ADS1100_MAX_DRDY_TIMEOUT, false, data);

[Severity: High]
If ads1100_new_data_ready() returns true due to the implicit error casting
mentioned above, !data_ready evaluates to false. Won't this cause the
read_poll_timeout() loop to never break, resulting in a full 7.5-second
timeout while flooding the kernel log with dev_err messages?

Also, the ST/BSY bit seems to permanently read as 1 (busy) when the device
is in continuous mode. Since pm_runtime_resume_and_get() places the device
in continuous mode via ads1100_runtime_resume(), won't this polling loop
always hit the timeout anyway?

> +}
> +
[ ... ]
> @@ -185,21 +216,40 @@ static int ads1100_set_scale(struct ads1100_data *d=
ata, int val, int val2)
>  	if (gain < BIT(0) || gain > BIT(3))
>  		return -EINVAL;
> =20
> +	ret =3D pm_runtime_resume_and_get(&data->client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);

[Severity: High]
Should we check the return value of ads1100_set_config_bits() here?

If the I2C configuration write fails, the hardware configuration and the
internal state remain unmodified, but the code will still proceed to poll
for data using the old configuration. We should probably propagate the
error and ensure pm_runtime_put_autosuspend() is still called on the error
path.

> =20
> -	return 0;
> +	ret =3D ads1100_poll_data_ready(data);
> +
> +	pm_runtime_put_autosuspend(&data->client->dev);
> +
> +	return ret;
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
> -		if (data->ads_config->data_rate[i] =3D=3D rate)
> -			return ads1100_set_config_bits(data, ADS1100_DR_MASK,
> +		if (data->ads_config->data_rate[i] !=3D rate)
> +			continue;
> +
> +		ret =3D pm_runtime_resume_and_get(&data->client->dev);
> +		if (ret < 0)
> +			return ret;
> +
> +		ads1100_set_config_bits(data, ADS1100_DR_MASK,
>  					FIELD_PREP(ADS1100_DR_MASK, i));

[Severity: High]
Similar to ads1100_set_scale(), does ignoring the return value of
ads1100_set_config_bits() mask I2C write failures here?

> +		ret =3D ads1100_poll_data_ready(data);
> +
> +		pm_runtime_put_autosuspend(&data->client->dev);
> +		return ret;
>  	}
> =20
>  	return -EINVAL;

[Severity: High]
This isn't a bug introduced by this patch, but there appears to be a
pre-existing issue in ads1100_get_adc_result().

When ads1100_get_adc_result() is called, it wakes the device with
pm_runtime_resume_and_get(), which places the device into continuous
conversion mode. However, the driver immediately issues an I2C read
without waiting for the first continuous conversion to complete:

ads1100_get_adc_result() {
    ret =3D pm_runtime_resume_and_get(&data->client->dev);
    if (ret < 0)
        return ret;

    ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
    ...
}

Doesn't this cause the read path to return stale data from the previous
active session when waking from autosuspend?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260613190957.6547=
98-1-jakubszczudlo40@gmail.com?part=3D3
