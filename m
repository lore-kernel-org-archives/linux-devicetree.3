Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49DB41A268
	for <devicetree@vger.kernel.org>; Sat, 11 Jul 2026 18:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783796069; cv=none; b=fSKDzn23u+KcxGZLBAqH9pMMs17DRMFmwM8HGDnsyjzqlrZt3u5lGay1gqfTw4TCucvQzLR29k5E7Er2/JwZf6czICyVeDBsoxqJ/4aR9rJ7Zd/pLtDvSsFajs9tQUN/ilBUmW94hJidHvndtnfvGaryGksBKRYh7xFbHM2Oe2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783796069; c=relaxed/simple;
	bh=GvJNY/n5cgBsECNxrK4fV06AxgY/2EQ0DiPjG/ioH/8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FkJZouhRpRyj4dQ9sBDtpFRGUGQrm2JOwbqa4v8sx1CwxTszcukdcF5v/ZAAD3ydZ1/CKCGdr+LgMxGD927G4naREzPWsF03j7K7tknnzHhLH+tXLGFp4HPPXWOGXYm/DufAqLGBRhNHLc/69coJp5nt3IvsQsOMvoCPOk3j/eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TjdZ0o1O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TjdZ0o1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2AF51F000E9;
	Sat, 11 Jul 2026 18:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783796067;
	bh=VdJ8yWJU+95BSxXNoTJG2qiw+AzXOTcF2Ko+a3gaWBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TjdZ0o1ONNZJ3b1si12xPfI+Byu0C8ejqHj5ranwaRoct2x9t/FTwCzIspdQv2MfU
	 eZVhg6SGWPMzUOM800P3YxaY/eJVwmw1ZSNqwDQa0i+zUq0hYWpZmFaonJ++hv4B0P
	 3FzfeLJjgnITKmtUHL/nLtnUaTSuqnfcDYF2aAiWBJ0RKYDMHPLXzetKPe9t0Kw1Te
	 Mg17U75+JO9zCDtQxjtc+vQNAf8eKmaLaiYTU12NI420cQOVXoe1uxxCGlYVH7rnaY
	 mdhc0RaWRf3eukdcMsxnaQcNr5tBPlt7KKHXZRZ8LTSiPm9d47gcAZMQ7FeI+Pki/p
	 13sL8YC6s/zgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260711184414.1013686-2-jakubszczudlo40@gmail.com>
References: <20260711184414.1013686-1-jakubszczudlo40@gmail.com>
 <20260711184414.1013686-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 11 Jul 2026 18:54:27 +0000
Message-Id: <20260711185427.A2AF51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The newly introduced polling mechanism in `ads1100_poll_data_ready=
` uses an inverted wait condition that guarantees failure, silently swallow=
s I2C errors, and incorrectly relies on a status bit that is always zero in=
 continuous mode.
--

--- Patch [1]: [PATCH v6 1/3] iio: adc: Fix incorrect reading when datarate=
 changed in single mode ---
commit 9efe89d3c5acb6ee87bd34da568f0f0c50cd6e20
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: Fix incorrect reading when datarate changed in single mode

When device is suspended and it is in single mode then changing
datarate doesn't make it actual wait for new measurement, so to
be sure that read after change is correct functions that changes
datarate and gain will wait for new data.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c

[ ... ]

> +static bool ads1100_new_data_not_ready(struct ads1100_data *data)
> +{
> +	u8 buffer[3];
> +	int ret;
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));
> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return true;

[Severity: High]
If an I2C read error occurs, this returns true. Since the polling condition
below checks for non-zero, won't this cause the poll to exit immediately and
silently treat the hardware failure as a successful wait?

> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);
> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int data_rate_Hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];
> +	/* To be sure we wait 5 times more than data rate */
> +	unsigned long wait_time_us =3D DIV_ROUND_CLOSEST(USEC_PER_SEC, 5 * data=
_rate_Hz);
> +	bool data_ready;
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
> +	return readx_poll_timeout(ads1100_new_data_not_ready, data,
> +				 data_ready, data_ready !=3D 0,
> +				 wait_time_us, ADS1100_MAX_DRDY_TIMEOUT_US);

[Severity: High]
Is this condition inverted? The readx_poll_timeout macro stops polling when
the condition evaluates to true. With data_ready !=3D 0, it stops immediate=
ly
if the device is busy, and spins until timeout if the device is ready.

Additionally, because acquiring PM runtime resumes the device into continuo=
us
mode, the ST/BSY bit is always 0. Does this mean every write to the scale or
data rate attributes will hang for 7.5 seconds and return -ETIMEDOUT?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260711184414.1013=
686-1-jakubszczudlo40@gmail.com?part=3D1
