Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBDC41D621
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:03:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059423; cv=none; b=iOf4TZHeplOqt/XaVED9e+niEiXPYUcCfOk49KwdhltMUGcxWhZ0JRpmGnwt4XsuGKuQNuJc9fHU4EneRhkpc5I/lbBf8VDXI7PmNbxPU+XlC8moST8HtXGKG97ycwqUjdkp9KGknAOhqLEDNaXLbr/wMBYL6JA9tAv+pn5ienU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059423; c=relaxed/simple;
	bh=V9Einq5aWoKMB2qU2El3X6UyC3Z0CRiHQn3lhAQ3aNc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ArsibrfBGLB5df+xaS03KOJ79GsaOtcesJQ/mATaxUBngeLai2jbmNTiPdCRAfTXdfdfNPBrUqPi1VRy31O8n3dj1OYL8WWKwBhfZsX9Bd0aBo244PvI+rtwiNWqd7H3uSJ732WcBxINWf3VMHFi+K68F9lHdExteU6aIRyhiJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jm5BTqnW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jm5BTqnW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE371F000E9;
	Tue, 14 Jul 2026 20:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059414;
	bh=HKC0/td1+G+v8Tx9avf7PHSbT91ujbUYzU1owOnBL3o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jm5BTqnWEMt71V5SE+Mxx9nvRdwWAEKwV01+ykly8uwdXCJ3vCQcdCgsvR4uu8w6n
	 80id1WpWg7U+cCiUQaNeGEJzd1OWA6q5UPTFi0Q9FIApYzrDQQRTQNdxmp0LqhgYRV
	 4pJowHRidpV95mNuMJTRWDvMnNIOvWMLYFnaCy/5VoO+AQtezHgCSzrGWZIVwotNbX
	 NHFVkDFD+gRyTyq1SZtXvS31424oJfoGdBgYV2wCnO6N9xsvQjhG14XArV6nXPnWeS
	 qBbzY1j2cYLLAeNbKe2VkfafRdWdod9NGKDWvE8RWuazNAfiK3OcEXAKSDu3/sNj5z
	 nEfklwUlUnZ7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] iio: adc: ti-ads1100: Fix incorrect reading when
 datarate changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714194717.596193-2-jakubszczudlo40@gmail.com>
References: <20260714194717.596193-1-jakubszczudlo40@gmail.com>
 <20260714194717.596193-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:03:33 +0000
Message-Id: <20260714200333.EEE371F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The polling logic in `ads1100_poll_data_ready` is fundamentally br=
oken due to an inverted loop condition and impossible hardware polling stat=
e in continuous mode.

Pre-existing issues:
- [High] The driver consistently returns stale or invalid data on the first=
 read after waking up from runtime suspend because it does not wait for a n=
ew conversion to complete.
- [Medium] Missing return value check for `ads1100_set_config_bits()` in `a=
ds1100_set_scale()` suppresses I2C write errors.
--

--- Patch [1]: [PATCH v7 1/3] iio: adc: ti-ads1100: Fix incorrect reading w=
hen datarate changed in single mode ---
commit 110a1aa46c3c440dfe6b3dac8a6c6e80760ff636
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: ti-ads1100: Fix incorrect reading when datarate changed in single=
 mode

When device is suspended and it is in single mode then changing
datarate doesn't make it actually wait for a new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for new data.

Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83c..f0a30ae139afa 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -123,10 +128,50 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does ads1100_get_adc_result() return stale
or invalid data on the first read after waking up from runtime suspend?

The code executes the I2C read immediately after the runtime PM resume
returns, bypassing the necessary hardware conversion delay:

ads1100_get_adc_result()
    ret =3D pm_runtime_resume_and_get(&data->client->dev);
    if (ret < 0)
        return ret;

    ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

If the read occurs immediately before the conversion finishes (for example,
125ms delay is needed at 8 SPS), will this return the power-on reset value
of 0 or garbage data instead of a valid measurement?

> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];
> +	/* To be sure we wait 5 times more than data rate */
> +	unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data=
_rate_Hz);
> +	int data_ready;
> +	u8 buffer[3];
> +	int ret;
> +
> +	/* To be sure that polled value will have value after config change */
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
> +				 data_ready, data_ready !=3D 0,
> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

[Severity: High]
Does this readx_poll_timeout() call have an inverted loop condition for
data_ready?

Because the condition is data_ready !=3D 0, it appears the driver will break
early when the device is busy, and spin up to 7.5 seconds when the device
is actually ready.

Since this polling state might be impossible in continuous mode, could this
cause the driver to consistently hit the 7.5-second timeout, completely
breaking data rate and scale configuration when userspace writes to the
in_voltage_scale or in_voltage_sampling_frequency sysfs attributes?

[ ... ]

> @@ -149,22 +199,35 @@ static int ads1100_set_scale(struct ads1100_data *d=
ata, int val, int val2)
> =20
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
> =20

[Severity: Medium]
This is a pre-existing issue, but does ads1100_set_scale() suppress I2C wri=
te
errors by missing a return value check for ads1100_set_config_bits()?

If I2C bus errors occur during scale configuration (for example, if the bus
is unstable or the device is disconnected), the driver will continue as if
the configuration succeeded.

Could this lead to incorrect data conversion scales being reported to
userspace?

> -	return 0;
> +	return ads1100_poll_data_ready(data);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714194717.5961=
93-1-jakubszczudlo40@gmail.com?part=3D1
