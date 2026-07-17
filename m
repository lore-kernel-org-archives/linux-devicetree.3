Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1857379C23
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 19:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784315206; cv=none; b=gLG+fCx8pouIfIGGEtrImsdrvr9tfA8qOMAtBonOw/JgbttDHqv6nzRh7rhfZP0Hk9UIuRD2vG8eaWOpPt5SnHg5Qp/iOlUxKndXW1vWaPeySeQA/rw+dLlRBCN1doj6OM7kA/RoGtjXBJRphjYkTsk4uijL/djX99YHM2wggIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784315206; c=relaxed/simple;
	bh=h22iYDeG6lGYWxtFx20B5EheGSuS5X4zpoMSZZYLCpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S9ONfnaoCwOLWsus04wW4oY5z7m54nIWwuDnYfOKWbwf1fqZJv6+y5t8ekvuYrjEMx77l88aS3CaloxYskTefLNglF+eJwbnrkCbjI0IkGzanNhQSEkqMT9gZItPrglgxcBcP/YdI5qBU4yw/IeKOQrlr9myIuX7e+5++BAfgK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai+8kCQw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai+8kCQw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AD81F000E9;
	Fri, 17 Jul 2026 19:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784315204;
	bh=yy0/4RcmtD3gMGFRcoUozvJCf6WDmI4nG7Q3M2MNQz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ai+8kCQwH+JQYFXZnLlnWlgqO89n21dQHJ8YRviZyWuwPKbcNm6QIH0XnzPe1e9dy
	 Ffp5T14iAGYLCrtpndVB2L8dh5+8VKr1+f5T4xrn46zKIQGElgV18qD1KeQE7JXJct
	 6rZz15EA/XqNhtRRw31DHU8t8CJauGE6wVR7HVq0OjSq6hoa6lstBd6gyESmmTGbNr
	 aH2CoWKA9NdvYwAjIAmusCjBHd2oSBHRqYKuQOmFRwlklUqq8T3iLcq2BUa8MbAei4
	 tdi7XmvzoC7ZlGF8urZpkTyxWaK6KY8AQtHZKy9FOuKvQv8bmyEoNyMuu9Hbfs9FfZ
	 9u04KUnXTuZgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 1/3] iio: adc: ti-ads1100: Fix incorrect reading when
 datarate changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260717185033.246580-2-jakubszczudlo40@gmail.com>
References: <20260717185033.246580-1-jakubszczudlo40@gmail.com>
 <20260717185033.246580-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 19:06:43 +0000
Message-Id: <20260717190644.26AD81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] The polling loop intended to wait for a new conversion to finish e=
xits immediately without waiting because the ST/BSY bit is always 0 when th=
e device is in continuous conversion mode.
- [Medium] The `-ETIMEDOUT` error code returned by `readx_poll_timeout()` i=
s ignored in `ads1100_poll_data_ready()`, causing timeouts to be treated as=
 successful executions.

Pre-existing issues:
- [High] Reading the ADC immediately after runtime resume yields stale or i=
nvalid data because it does not wait for the first continuous conversion to=
 finish.
- [High] Stack-allocated arrays are used for I2C data transfers, violating =
DMA safety rules.
- [Medium] The return value of `ads1100_set_config_bits()` is completely ig=
nored inside `ads1100_set_scale()`, masking potential I2C communication fai=
lures.
--

--- Patch [1]: [PATCH v8 1/3] iio: adc: ti-ads1100: Fix incorrect reading w=
hen datarate changed in single mode ---
commit d5f0f22a48498eb2a1b3f20f5e781562bc3b089e
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: iio: adc: ti-ads1100: Fix incorrect reading when datarate changed =
in single mode

When device is suspended and it is in single mode then changing
datarate doesn't make it actually wait for new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for a new data.

Fixes: 541880542f2b ("iio: adc: Add TI ADS1100 and ADS1000")

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83c..363f790ca5d5e 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
> @@ -123,10 +128,50 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but does reading the ADC immediately after
runtime resume in ads1100_get_adc_result() yield stale or invalid data?

The resume callback re-enables the VDD regulator and switches the ADC to
continuous conversion mode. Since a conversion takes time, the driver reads
the result register via i2c_master_recv() without any delay to wait for the
first continuous conversion to finish.

Can this return whatever stale data was left in the register from before it
was suspended, or invalid power-on default data?

> +static int ads1100_new_data_is_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: High]
This isn't a bug introduced by this patch, but do the new functions added
here pass a stack-allocated buffer to the I2C core?

If the underlying I2C host controller driver uses DMA, mapping a stack
address can lead to memory corruption or kernel panics when VMAP_STACK and
CONFIG_DMA_API_DEBUG are enabled.

Should these buffers be dynamically allocated or embedded in a
heap-allocated device structure with proper cacheline alignment instead?

> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]) ? 0 : 1;

[Severity: High]
Does polling the ST/BSY bit work correctly in this context?

According to the ADS1100 datasheet, the ST/BSY bit always reads as 0 in
continuous conversion mode. Because ads1100_runtime_resume() sets the ADC
to continuous conversion mode (ADS1100_CONTINUOUS), won't this check
immediately evaluate as true on its very first invocation?

This would cause the polling loop to exit instantly without actually
waiting for the conversion to complete, bypassing the intended wait period
added by this patch.

> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{

[ ... ]

> +	ret =3D readx_poll_timeout(ads1100_new_data_is_ready, data,
> +				 data_ready, data_ready !=3D 0,
> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);
> +	if (data_ready < 0)
> +		return data_ready;
> +
> +	return 0;

[Severity: Medium]
Is it intentional that the error code returned from readx_poll_timeout() is
ignored here?

If the ADC fails to signal readiness within the timeout duration,
readx_poll_timeout() sets ret to -ETIMEDOUT and breaks the loop. Since the
timeout condition implies data_ready =3D=3D 0, the subsequent check evaluat=
ing
data_ready < 0 will be false.

Does this cause the function to return 0 instead of propagating the timeout
error from ret, successfully masking the failure from the caller?

> +}
> +
>  static int ads1100_set_scale(struct ads1100_data *data, int val, int val=
2)
>  {
>  	int microvolts;
>  	int gain;
> +	int ret;

[ ... ]

>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
> =20
> -	return 0;
> +	return ads1100_poll_data_ready(data);
>  }

[Severity: Medium]
This is a pre-existing issue, but is it safe to ignore the return value
from ads1100_set_config_bits() here?

If the underlying i2c_master_send() fails and returns a negative error code,
this function does not capture or propagate the result. It then proceeds to
poll the ADC and return the poll's result, which could lead to silent
configuration failures.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717185033.2465=
80-1-jakubszczudlo40@gmail.com?part=3D1
