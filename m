Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E3F39B481
	for <devicetree@vger.kernel.org>; Tue,  4 Aug 2026 19:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785872689; cv=none; b=n4AXOKdFC6hMtXkwaonjqHXRXQTNlnkaSIjAat/Z3HKqZnSocaq9vYSzdnhPucTBY9TFu+TmwVP5OYXLPx/sYUE1BZXol1iam1O3uWNyWX5zUF1lUV2+ePmRzl3z0hJev9pnglvsyLpYklvjadxwA+XqwLvbN8p56RTrEfyvzaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785872689; c=relaxed/simple;
	bh=IcfNrEa3Ul2DcanQx5MgFrozwnED9J2qUHs+uCG+/9g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DQtUzosMd1Kk6baywP6xfwuuxel2lxUjKmZ8JAKmcPOwvl3mj2PIp3ugAVM2PU/s+EXSNmgTaH6rjJL8M3VPuX7+r+FKJcIiv7aUZWd846soGQmwoZHs7/2sSuHMsLafH85PBQVTAyp+oS2Aa8w2RjzClmM8YeMQrdanLbtP0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WbuQzr7Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WbuQzr7Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A29A41F00A3D;
	Tue,  4 Aug 2026 19:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785872687;
	bh=G4u56PlJ5n2EFIwXy7J0rCrjMrv8EnFUQ5IpGvKXbcE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=WbuQzr7Q3knfZ2M63wWVRqdaopfJvrNc7rdiJTUQQ4qh5fXgUzzsbfTEYNlVOoWzL
	 fBNeIkZqlHJf1fVS8dXlGtZk/TwAn1nSZWSIGmc9d6PN9tFGeqVqudZVIE01hndv4r
	 4sP8BnrXQqF/XQ27EuEvVHJRlU6FZrEl72if+I3taXmktGjpDyA3whtGuv+1IoZtXQ
	 jn0xkylfBsC4ZoDax/EjdVNhFojfBBSMGcCOjM4sasfXHtovNVol0If8YFmfWY/DfC
	 buwpgArDCrXf1tmVjTlMvYRxP1VqC/I0BWbvW80dXNQ3u9OAkEvQfG/84i43fO8CwI
	 3BHlsITC0yTsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 1/3] iio: adc: ti-ads1100: Fix incorrect reading when
 datarate changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260804192840.29121-2-jakubszczudlo40@gmail.com>
References: <20260804192840.29121-1-jakubszczudlo40@gmail.com>
 <20260804192840.29121-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 04 Aug 2026 19:44:47 +0000
Message-Id: <20260804194447.A29A41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Error paths in `ads1100_start_single_conversion()` leave the devic=
e and driver in a permanently desynchronized state on timeout or I2C failur=
e.
- [High] I2C buffers allocated on the stack are passed to DMA-capable I2C A=
PIs.

Pre-existing issues:
- [High] ADC read after runtime resume returns garbage or power-on reset va=
lues without waiting for the first conversion to complete.
--

--- Patch [1]: [PATCH v9 1/3] iio: adc: ti-ads1100: Fix incorrect reading w=
hen datarate changed in single mode ---
commit e93e149965f30840eff030d72d0901bf664fc6dd
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single=
 mode

When device is suspended and it is in single mode then changing
datarate doesn't make it actually wait for new measurement, so to
be sure that read after change is correct, functions that changes
datarate and gain will wait for a new data.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83c..288d209ecf92d 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -123,10 +128,87 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)

[Severity: High]
This isn't a bug introduced by this patch, but does ads1100_get_adc_result()
read garbage or power-on reset values if executed immediately after waking =
up?

In ads1100_get_adc_result():

	ret =3D pm_runtime_resume_and_get(&data->client->dev);
	if (ret < 0)
		return ret;

	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

Since a single conversion takes up to 125ms (at 8 SPS), calling
i2c_master_recv() immediately after runtime resume reads the ADC before it
completes its initial measurement.

>  	return 0;
>  }
> =20
> +static int ads1100_conversion_busy(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: High]
Can this cause memory corruption?  Passing the stack-allocated buffer to
i2c_master_recv() is unsafe if the underlying I2C host controller uses DMA,
as it can corrupt adjacent stack variables due to cache line invalidation.

> +	if (ret < 0) {
[ ... ]
> +static int ads1100_start_single_conversion(struct ads1100_data *data)
> +{
> +	u8 config =3D data->config | ADS1100_CFG_SC;
> +	int ret;
> +
> +	ret =3D i2c_master_send(data->client, &config, sizeof(config));

[Severity: High]
Could passing this stack-allocated config variable to i2c_master_send() also
cause memory corruption if the host controller uses DMA?

> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C write fail: %d\n", ret);
> +		return ret;
> +	}
> +   /* Need to wait because of change from continuous to single mode */
> +	ret =3D ads1100_wait_single_conversion(data);
> +	if (ret)
> +		return ret;
> +
> +	config |=3D ADS1100_CFG_ST_BSY;
> +
> +	ret =3D i2c_master_send(data->client, &config, sizeof(config));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C write fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* No need to cache it, it's status bit */
> +	data->config =3D config & ~ADS1100_CFG_ST_BSY;

[Severity: High]
Are we leaving the driver and hardware permanently out of sync on error her=
e?

If ads1100_wait_single_conversion() or the second i2c_master_send() fails,
we return early. However, the physical hardware was transitioned to
single-shot mode while the software cache data->config was not updated to
include ADS1100_CFG_SC.

If userspace later tries to restore continuous mode, won't it silently skip
the I2C write because data->config appears unchanged, leaving the device
stuck in single-shot mode indefinitely?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260804192840.2912=
1-1-jakubszczudlo40@gmail.com?part=3D1
