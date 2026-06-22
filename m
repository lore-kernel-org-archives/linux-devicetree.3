Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A169927B32C
	for <devicetree@vger.kernel.org>; Mon, 22 Jun 2026 22:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782167591; cv=none; b=KxayHBGGSf0uGlK+o8wXM9JhSRKhpso5D3A5SIF4hv9io8nWvU9WM9sIGnE9MCb7/4FnetfLE5q/KiuddPKdwga0tOHvsbDlvtAuXxy0Dpp7DQ6lAvSJm6PA2j2+YzIpgf2rPmYqjtzumNm8GPcjdMcaMW5PlP71Y7ORu88mH48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782167591; c=relaxed/simple;
	bh=CmKtrhCXxkUiPDAmyyDEhlMkJHsX+Mc9L6MwqNgcmIc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bY4spT3V9hq2bzU3joMKHf5nypB7iY2D99KctXYZsnAEtProA+lo32tb6LMmnmKnuYveDcfRbzi2H4RtioEzeS5dniLe/mBANPftyTnc3XGFMpV3vVaKVAZSDrGDBrU8dsDrLflnb+BCus4A2ci6fK8M1xpOlvY1ingjOb3MebM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja1sSoDM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja1sSoDM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C83D1F01564;
	Mon, 22 Jun 2026 22:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782167590;
	bh=0Q11RlCwxbac/Gd9JBd9iJy8XlrY0GiFJ3Yebo9v6SY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ja1sSoDMfJWOU8sLPzYuZywnIetO8MZH0DaMmsQpNToL57Y4EFsU1zpD2pxTH2O7y
	 rK6Kvh6AHPZbCgvoDJK8SgfSFrFSONq4ip9Gzr+j5fvsf+4IDriVpugYDzSoFHkRar
	 UnKRDb7up6yyGH/KLl7H7manyd7OTwesTnVRqvWJ/w+9XGMvWPsaucwSg0CkrrUu8X
	 kJRtOFfp1mSTCqQnWgF/S9ClTBJ+6Za6Lv2oV7Y1UtGkHrKeerSRA/mzJMvynFlhxQ
	 oq8mCuDxaXmQhluuRmnH/nWHn1zU128snrWeS/GhIt2Zfi+i+DQB590uRLgqW3nRpH
	 P/d63IogzGjWg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] iio: adc: Fix incorrect reading when datarate
 changed in single mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260622221550.374235-2-jakubszczudlo40@gmail.com>
References: <20260622221550.374235-1-jakubszczudlo40@gmail.com>
 <20260622221550.374235-2-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Jun 2026 22:33:09 +0000
Message-Id: <20260622223310.0C83D1F01564@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] I2C read failures inside the polling loop are improperly mapped to=
 'device busy', causing a 7.5-second hang and massive dmesg log flooding.
- [High] The data ready polling logic fails to synchronize because the ST/B=
SY bit is likely static in continuous conversion mode.
- [Medium] The `ads1100_poll_data_ready` function performs a completely red=
undant I2C read that wastes bus bandwidth.

Pre-existing issues:
- [High] The return value of `ads1100_set_config_bits` is ignored in `ads11=
00_set_scale`, leading to silent configuration failures.
- [High] Reading the ADC result immediately after runtime resume returns an=
 invalid or stale conversion.
- [High] I2C read functions allocate transfer buffers on the stack, which i=
s unsafe for DMA operations.
--

commit 06506d1fcb678ffc0137dbc1df3913f95ce47327
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>
Subject: iio: adc: Fix incorrect reading when datarate changed in single mo=
de

This commit attempts to fix incorrect ADC readings after changing
datarate or gain while suspended in single mode. It introduces a
polling loop to wait for new data before returning from the configuration
functions.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 9fe8d54cce83c..e3c801381434d 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -123,10 +127,49 @@ static int ads1100_get_adc_result(struct ads1100_da=
ta *data, int chan, int *val)
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but doesn't reading the ADC result immediately
after runtime resume return an invalid or stale conversion?

Looking at ads1100_get_adc_result():

	ret =3D pm_runtime_resume_and_get(&data->client->dev);
	if (ret < 0)
		return ret;

	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

When the device auto-suspends, a subsequent sysfs read of in_voltage0_raw
calls pm_runtime_resume_and_get(), which transitions the ADC to continuous
mode and starts a new conversion. However, ads1100_get_adc_result()
immediately reads the I2C output register without waiting for the conversion
to complete, which can take up to 125ms at 8 SPS.

> +static bool ads1100_new_data_not_ready(struct ads1100_data *data)
> +{
> +	int ret;
> +	u8 buffer[3];
> +
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: High]
This isn't a bug introduced by this patch, but is it safe to use
stack-allocated buffers for I2C transfers?

Using stack-allocated buffers for I2C transfers violates subsystem rules and
can lead to memory corruption or kernel panics on architectures where
CONFIG_VMAP_STACK is enabled and the underlying I2C controller utilizes DMA.

> +	if (ret < 0) {
> +		dev_err(&data->client->dev, "I2C read fail: %d\n", ret);
> +		return true;

[Severity: High]
Does returning true on hard I2C errors trap the driver in an infinite polli=
ng
loop?

Returning true signals to the read_poll_timeout() macro that the device is
merely not ready, causing it to endlessly retry for up to 7.5 seconds inste=
ad
of aborting. This masks the actual I2C error code with -ETIMEDOUT and
generates massive dmesg log flooding.

> +	} else if (ret < 3) {
> +		dev_err(&data->client->dev, "Short I2C read\n");
> +		return true;
> +	}
> +
> +	return FIELD_GET(ADS1100_CFG_ST_BSY, buffer[2]);

[Severity: High]
Will this polling logic synchronize properly in continuous conversion mode?

When changing scale or datarate, PM_RUNTIME_ACQUIRE_AUTOSUSPEND() is called,
transitioning the ADC to continuous conversion mode. In continuous conversi=
on
mode on these TI ADCs, the ST_BSY bit does not pulse to indicate new data;
it is typically static.

If ST_BSY reads as 0, ads1100_new_data_not_ready() returns false, breaking =
the
loop instantly. If it reads as 1, the driver would hang for 7.5 seconds.

> +}
> +
> +static int ads1100_poll_data_ready(struct ads1100_data *data)
> +{
> +	int ret;
> +	u8 buffer[3];
> +	bool data_ready;
> +	int datarate =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data->con=
fig)];
> +	/* To be sure we wait 5 times more than datarate */
> +	unsigned long wait_time =3D DIV_ROUND_CLOSEST(MICRO, 5 * datarate);
> +
> +	/* To be sure that polled value will have value after config change */
> +	ret =3D i2c_master_recv(data->client, (char *)&buffer, sizeof(buffer));

[Severity: Medium]
Is this initial I2C read redundant?

Executing ads1100_poll_data_ready() triggers this initial i2c_master_recv(),
discards the populated local buffer, and immediately enters
read_poll_timeout() with sleep_before_read =3D false. This instantly perfor=
ms
another identical i2c_master_recv() inside ads1100_new_data_not_ready(),
needlessly occupying the I2C bus.

[ ... ]
> @@ -149,19 +198,36 @@ static int ads1100_set_scale(struct ads1100_data *d=
ata, int val, int val2)
> =20
>  	ads1100_set_config_bits(data, ADS1100_PGA_MASK, ffs(gain) - 1);
> =20
> -	return 0;
> +	ret =3D ads1100_poll_data_ready(data);
> +
> +	return ret;
>  }

[Severity: High]
This is a pre-existing issue, but does ads1100_set_scale() ignore the return
value of ads1100_set_config_bits()?

If the I2C write to update the hardware PGA scale fails, the error is
discarded. The function proceeds to poll for new data and may eventually
return success to userspace.

This leads to silently corrupted or miscalculated voltage measurements beca=
use
the sysfs attribute appears to have updated while the ADC is physically
operating with the old scale.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260622221550.3742=
35-1-jakubszczudlo40@gmail.com?part=3D1
