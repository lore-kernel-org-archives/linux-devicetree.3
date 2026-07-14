Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB443DDDDB
	for <devicetree@vger.kernel.org>; Tue, 14 Jul 2026 20:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059850; cv=none; b=pZdqlq+5rU0QTBsVd1NDzEe+5LFr1Dz7/7sXm/mSh09+s5Rvek+GNAEgBz3WcFCWMONiOoUlPNoG5W2T5+VmeGXC8ebXcHkjxatdZlNj/qpu7HWezFAgpuIcNW3szMvS66K8cNTRVzJD0UAplJ+enCFe1Cjo8tYpphb0WU/XhJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059850; c=relaxed/simple;
	bh=QAwi4wzqjXOkGfBTfK4dHQs6ht5U4zTkdm4/UqCmjWw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FUn2fcXrSV+u1Nb9VFSyw4EPikmmvaLJnYvV+xwne5fZ4k98wkSW/SZ0JtFYkKDM8njCO2BbHkTp8eFJndKbAdNCY5MFM/8EI9FcGu2kw9iJk/sg27+cLYgwq6bBzSCSVm6hfBDpYhg9h4nrAvaQ1kE7vkD6H7UzmZjw8BpfrRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gjAy7H6d; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gjAy7H6d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E9A1F000E9;
	Tue, 14 Jul 2026 20:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784059849;
	bh=K9jyld6P4RBq/DXnRcT4R20igSHF3pG3dQDeDcLF7OI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gjAy7H6dv42k6CA4sUfRmYlRyLFj9m/Jar2P4yKFktuh6zndeTLkUlQh6Bf7ZZLMT
	 7iI9o2n7ILWK2wSA+6WYWGW7pLQiCBB6QP/WN0npHRvvhNnIfCilnHhPo7e3i4AEli
	 onffeHW7N2j/sbwD/PwomZhvaB4wYnjTSJjBVnDXDCnoqjH3UPIG8ovSZv9C0JTYUP
	 +bKPT5wZ2MrHwYFZQuFqns+6f/Af2aUE+Xd3PGDz+ogVhBjy+EqJpraeWew2gfqSCL
	 cl00BKb5EVHJrqXlXbnR5e6my3wjIh4vyhv/1W6b1PBhnf5QyHRvN8kPWpCpKgQyyR
	 cFvvYiHXUQ9dQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/3] iio: adc: ti-ads1100: Fix incorrect reading when
 datarate changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260714195528.597753-2-jakubszczudlo40@gmail.com>
References: <20260714195528.597753-1-jakubszczudlo40@gmail.com>
 <20260714195528.597753-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 20:10:48 +0000
Message-Id: <20260714201049.01E9A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Polling logic is broken due to an inverted termination condition, =
leading to immediate exits when the device is busy.

Pre-existing issues:
- [High] The device driver reads stale or default power-on data immediately=
 after runtime PM resumes it.
--

--- Patch [1]: [PATCH v7 1/3] iio: adc: ti-ads1100: Fix incorrect reading w=
hen datarate changed in single mode ---
commit 64de239449801ff35a0ccf32ce8fdee336eb3033
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: iio: adc: ti-ads1100: Fix incorrect reading when datarate changed =
in single mode

This commit introduces a polling loop to wait for new data to be ready
when the datarate or gain is changed while the device is in single mode.
It adds ads1100_poll_data_ready() and calls it after configuration changes.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -123,10 +128,50 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)
[ ... ]
>  	ret =3D pm_runtime_resume_and_get(&data->client->dev);
>  	if (ret < 0)
>  		return ret;
> =20
>  	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: High]
This is a pre-existing issue, but does this immediately read a stale or
power-on value (0) instead of a valid measurement after autosuspend?

When pm_runtime_resume_and_get() wakes the device, the ADC is powered on
and placed in continuous mode. However, we immediately execute an I2C
read without waiting for the ADC's first conversion to complete (which can
take up to 125ms at 8 SPS).

> =20
>  	pm_runtime_put_autosuspend(&data->client->dev);
> =20
>  	if (ret < 0) {
[ ... ]
> +static int ads1100_new_data_is_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
[ ... ]
> +	ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
> +				 data_ready, data_ready !=3D 0,
> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

[Severity: High]
Is the termination condition for the polling loop inverted?

ads1100_new_data_is_ready() returns the ST/BSY bit, which is 1 when the ADC
is busy and 0 when it is ready.

Since readx_poll_timeout() exits when the condition evaluates to true,
data_ready !=3D 0 will cause the loop to exit immediately while the device =
is
still busy, bypassing the wait entirely.

> +	if (ret)
> +		return ret;
> +
> +	return data_ready < 0 ? data_ready : 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714195528.5977=
53-1-jakubszczudlo40@gmail.com?part=3D1
