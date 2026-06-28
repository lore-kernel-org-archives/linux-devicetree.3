Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8AF3AE6FC
	for <devicetree@vger.kernel.org>; Sun, 28 Jun 2026 19:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676639; cv=none; b=hRFIIfGBbAsxFcPCjxBnQ3vlOetWQ6QdiumtwJKRuSeIda9TMRhNu65cqPk9hDI5z5QQytWo3xTHBzEzlJH/N7RGna2HizYeHL0n0OTB75HvgoekIn/gkfbMa1YTFdXeRxVZC7nF0eMPuUfH600hnR1rh5kL2rUQ0fcclMgxNf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676639; c=relaxed/simple;
	bh=F5HG0My1rdu4TJF4O/ebPwVUJ3XRsOc6zgK6lxBMrLU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YAVztQV/xhBN9drVdYWcAupoah/SjQE+wt07/Tc3M1wt+PU118yRsBSz0JHzFcI/52Zuq/sZvJtahwkoeWhA8mZ1TI4L9ODWGQh5Kx2kagr44HPMd8zeFbc5lpUbadMWB85ztl9gL6ciScGpcjUEI/4qM18+RdA5v1U7cDF8t2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U/tdOyw6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U/tdOyw6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B641F000E9;
	Sun, 28 Jun 2026 19:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782676638;
	bh=QeDRBrREy/v0cf15edqu4bcjx7RXVefFJvWbLcftm8Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U/tdOyw6gQtJuCrfO6CwumeCaSxMFo1XHatDx1vQUv4wZ57RiKWROUah5tpHzRe09
	 Q4xbPhiyzhJAmVChaKYRewrs3vfCJJ0J2Vbv5bF4PFTSmYN9M+tDsagZNFqPVEthPm
	 PSaOkEu0vXYMHdHI7MVeoVX5rt3gtuX+KzXF2lLszPE02fRauA0cehOVHXgfvJ7Abl
	 s9vfaJwWEuNMJFKsfpKrG4njxnReUTzavplaAWVq9FJflDpJIFtGmwCTyK4XJvG76Z
	 1vOYmp+zi7UgaaR7cK4XFQbc9RQMmzvPfxa4KO928AkuIvIAWCdOc4eetiXuxZR0AB
	 0WEDCM3ZtuahA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] iio: adc: Add ti-ads1110 support to ti-ads1100
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jakub Szczudlo" <jakubszczudlo40@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260628194341.66752-4-jakubszczudlo40@gmail.com>
References: <20260628194341.66752-1-jakubszczudlo40@gmail.com>
 <20260628194341.66752-4-jakubszczudlo40@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 28 Jun 2026 19:57:18 +0000
Message-Id: <20260628195718.68B641F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The IIO device name is hardcoded to 'ads1100', ignoring the dyna=
mically added configuration name.
- [Medium] The polling timeout calculation ignores the device-specific data=
 rates and always uses the ADS1100 data rates, leading to excessive sleep t=
imes for the ADS1110.

Pre-existing issues:
- [High] The `ads1100_set_data_rate()` function completely ignores the user=
-requested rate and always applies the maximum data rate.
- [High] Driver removal while the device is in runtime suspend causes I2C t=
imeouts and an unbalanced regulator disable.
--

commit 97f3fd71176aef31ec01d7462b178bf5156c7ab6
Author: Jakub Szczudlo <jakubszczudlo40@gmail.com>

iio: adc: Add ti-ads1110 support to ti-ads1100 driver

Add ADS1110 support that have faster datarate than ADS1100, it also uses
internal voltage reference of 2.048V for measurement.

> diff --git a/drivers/iio/adc/ti-ads1100.c b/drivers/iio/adc/ti-ads1100.c
> index 71b31adeba3c6..c937e00e0a407 100644
> --- a/drivers/iio/adc/ti-ads1100.c
> +++ b/drivers/iio/adc/ti-ads1100.c
[ ... ]
> @@ -41,20 +41,44 @@
>  #define	ADS1100_SINGLESHOT	ADS1100_CFG_SC
> =20
>  #define ADS1100_SLEEP_DELAY_MS	2000
> +#define ADS1110_INTERNAL_REF_mV 2048
> =20
>  static const int ads1100_data_rate[] =3D { 128, 32, 16, 8 };
> +static const int ads1110_data_rate[] =3D { 240, 60, 30, 15 };

[Severity: Medium]
Does this new data rate array also need to be used in
ads1100_poll_data_ready()?

Looking at that function, it still calculates the wait time using the origi=
nal
ads1100_data_rate array:

    int data_rate_hz =3D ads1100_data_rate[FIELD_GET(ADS1100_DR_MASK, data-=
>config)];

If an ADS1110 is used, won't this result in calculating the timeout based on
the slower ADS1100 sample rates instead of the device's actual rate?

>  static const int ads1100_data_rate_bits[] =3D { 12, 14, 15, 16 };
> =20
>  /* Timeout based on the minimum sample rate of 8 SPS (7500ms) */
>  #define ADS1100_MAX_DRDY_TIMEOUT_US	(7500 * USEC_PER_MSEC)
> =20
> +struct ads1100_config {
> +	const char *name;
> +	const int *available_data_rate_hz;
> +	const int data_rate_count;
> +	bool has_internal_vref_only;
> +};

[Severity: Medium]
Is the name field in this struct intended to be used for the IIO device nam=
e?

Looking at ads1100_probe(), it appears the device name remains hardcoded:

    indio_dev->name =3D "ads1100";

Will the ADS1110 device be incorrectly exposed as "ads1100" in sysfs because
it ignores this new configuration name?

[ ... ]
> @@ -204,7 +242,7 @@ static int ads1100_set_data_rate(struct ads1100_data =
*data, int chan, int rate)
>  	unsigned int size;
>  	int ret;
> =20
> -	size =3D data->supports_data_rate ? ARRAY_SIZE(ads1100_data_rate) : 1;
> +	size =3D data->supports_data_rate ? data->ads_config->data_rate_count :=
 1;
>  	for (i =3D 0; i < size; i++) {
>  		if (i =3D=3D size)
>  			return -EINVAL;
> @@ -225,14 +263,9 @@ static int ads1100_set_data_rate(struct ads1100_data=
 *data, int chan, int rate)
>  		PM_RUNTIME_ACQUIRE_IF_ENABLED_AUTOSUSPEND(&data->client->dev, pm);
>  		ret =3D PM_RUNTIME_ACQUIRE_ERR(&pm);
>  		if (ret)
>  			return ret;
> =20
>  		ret =3D ads1100_set_config_bits(data, ADS1100_DR_MASK,
>  					      FIELD_PREP(ADS1100_DR_MASK, i));
>  		if (ret)
>  			return ret;
> =20
>  		return ads1100_poll_data_ready(data);
>  	}

[Severity: High]
This is a pre-existing issue, but the loop in ads1100_set_data_rate() lacks
any condition to check if the requested rate matches the available rates.

It seems the loop will always apply i =3D 0 on the first iteration and retu=
rn.
Does this silently force the hardware to its maximum rate regardless of user
input?

[ ... ]
> @@ -458,16 +497,18 @@ static DEFINE_RUNTIME_DEV_PM_OPS(ads1100_pm_ops,
>  				 ads1100_runtime_suspend,
>  				 ads1100_runtime_resume,
>  				 NULL);

[Severity: High]
This is a pre-existing issue, but does driver removal while the device is in
runtime suspend cause teardown issues?

During driver unbind, the I2C core executes removal without automatically
resuming the device. Because there is no .remove callback to call
pm_runtime_get_sync() before teardown, devres will execute
ads1100_disable_continuous() followed by ads1100_reg_disable().

Since ads1100_runtime_suspend() already disabled the regulator, won't this
lead to an I2C timeout when trying to write to the unpowered device, follow=
ed
by an unbalanced regulator disable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260628194341.6675=
2-1-jakubszczudlo40@gmail.com?part=3D3
