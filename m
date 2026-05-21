Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9200407CD3
	for <devicetree@vger.kernel.org>; Thu, 21 May 2026 19:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779391114; cv=none; b=tN295Nwfgk96ByG41VBeD9aWdH5JXXcudrYDtpXRCMz1Y4S6tXdtIIdslh6HW2Pdni3kE3EOutZ7A9Aoe41XjpbgVAKHb7CvZSWdSmYRe8r4DBO6KZ5B5sGtNvmpcMcmLkAnnoNtU3BJFj7oFHLjgsl4BLDTZzGVLj48QIr+MgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779391114; c=relaxed/simple;
	bh=Z3bJoCVAzhQoo7hSDZx4dfJME4ajQXJvDKpuOJqxWuM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TxdC+o+vpJGZC+VbX2hgoAteoECcFWUEGg9oXNGxhF0HpAOf9kdkwTQIz6OT0pGOlf5ur1IvY62tO9hQ3a5er0sfpck9/+HibB/uS0i2gfAuRhV8HKQ49ARqZtgFPEFIEVyLcVaYwifoz+Tugyc4MoiQqEngl2bozT7uEaTAEM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zw2+ZtyN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zw2+ZtyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F20931F000E9;
	Thu, 21 May 2026 19:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779391109;
	bh=pjXQgs0/pAF1LbOr0gcY/0a5WZnZsJ3SzRW3cJYC6n0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zw2+ZtyNDcDYMsXEU9KRV/SPNZbwDRCkkucRtNOvk34l0Kw569KPLt2N2mH6pOQf7
	 VFHlGynmqRMI0IEdS++r/1JRg1QbTHWz29xKM6MzHLVZ+8KiobMK9r/4M5eTvM1+Sn
	 qPeU6bL79XUGeZznHQXxvpWiDfjZUnN6o2badhuf+0D8iix0m1UMGGg+pljy4d2bFz
	 2KLuGMGhLYgT2B3PXwvA64TbCCRi21VN8vnhfvv4D6PWgcHXP9CL5S6NdLR3a4mHTQ
	 H5HspS0a/c72XC6/RH/MrJIycYYp/ow6Gzrv1dhQx+IgNDu5U/PE+qceCN6YHRuR9r
	 M5ytkzTHIAeQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 8/8] iio: temperature: ltc2983: Add support for
 ADT7604
Reply-To: sashiko-reviews@lists.linux.dev
To: "Liviu Stan" <liviu.stan@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260521164323.770626-9-liviu.stan@analog.com>
References: <20260521164323.770626-9-liviu.stan@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 19:18:28 +0000
Message-Id: <20260521191828.F20931F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Reading the IIO_RESISTANCE channel bypasses hardware fault detecti=
on, causing hardware errors (like broken sensor traces) to be silently repo=
rted as valid data.

Pre-existing issues:
- [High] reinit_completion() is called after initiating the hardware conver=
sion, creating a race condition that can cause spurious read timeouts.
--

commit d382a4cbefd41723ab5ddd91fd399d716c8faaec
Author: Liviu Stan <liviu.stan@analog.com>
Subject: iio: temperature: ltc2983: Add support for ADT7604

This commit adds support for the ADT7604 temperature sensor by repurposing
custom RTD and thermistor types as copper trace resistance and leak detector
sensors. It introduces two new software sensor types and exposes a new
IIO_RESISTANCE channel reading from a separate result register bank. The
ltc2983_chip_info struct is also extended to use a 64-bit supported_sensors
bitmask for the new types.

> diff --git a/drivers/iio/temperature/ltc2983.c b/drivers/iio/temperature/=
ltc2983.c
> index 326f843f42713..e2ffeee026eef 100644
> --- a/drivers/iio/temperature/ltc2983.c
> +++ b/drivers/iio/temperature/ltc2983.c

[ ... ]

> @@ -1205,7 +1502,8 @@ static struct ltc2983_sensor *ltc2983_temp_new(stru=
ct fwnode_handle *child,
>  }
> =20
>  static int ltc2983_chan_read(struct ltc2983_data *st,
> -			const struct ltc2983_sensor *sensor, int *val)
> +			const struct ltc2983_sensor *sensor,
> +			u32 base_reg, int *val)
>  {
>  	struct device *dev =3D &st->spi->dev;
>  	u32 start_conversion =3D 0;

[Severity: High]
This is a pre-existing issue, but can this function experience spurious
read timeouts due to a race condition with the completion?

Looking at the rest of this function:

    ret =3D regmap_write(st->regmap, LTC2983_STATUS_REG, start_conversion);
    if (ret)
        return ret;

    reinit_completion(&st->completion);

If the hardware conversion finishes very quickly after regmap_write(),
could the interrupt fire and call complete() before the CPU executes
reinit_completion()? This would overwrite the completion event, causing the
subsequent wait_for_completion_timeout() to spuriously time out.

Would it be safer to call reinit_completion() before initiating the hardware
action?

[ ... ]

> @@ -1236,13 +1534,23 @@ static int ltc2983_chan_read(struct ltc2983_data =
*st,
>  	}
> =20
>  	/* read the converted data */
> -	ret =3D regmap_bulk_read(st->regmap, LTC2983_RESULT_ADDR(sensor->chan),
> +	ret =3D regmap_bulk_read(st->regmap, LTC2983_RESULT_ADDR(sensor->chan, =
base_reg),
>  			       &st->temp, sizeof(st->temp));
>  	if (ret)
>  		return ret;
> =20
>  	*val =3D __be32_to_cpu(st->temp);
> =20
> +	if (base_reg =3D=3D ADT7604_RES_RES_START_REG) {
> +		/*
> +		 * Resistance result register gives a plain unsigned value,
> +		 * D31 is always 0, no valid bit, no fault bits. Read bits[30:0]
> +		 * directly =E2=80=94 the temperature result format does not apply her=
e.
> +		 */
> +		*val &=3D GENMASK(30, 0);
> +		return 0;

[Severity: High]
Will returning early here bypass hardware fault detection for resistance
channels?

As the comment notes, the resistance result register does not contain fault
bits. However, hardware fault indicators (like Hard Fault, Soft Fault, or
Over Range) are stored in the primary Temperature Result register.

By returning before reading the Temperature Result register and calling
sensor->fault_handler(), does this code silently ignore sensor faults? This
might be problematic for sub-ohm copper traces, which only expose the
IIO_RESISTANCE channel, leaving users with no mechanism to detect a broken
trace.

> +	}
> +
>  	if (!(LTC2983_RES_VALID_MASK & *val)) {
>  		dev_err(dev, "Invalid conversion detected\n");
>  		return -EIO;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521164323.7706=
26-1-liviu.stan@analog.com?part=3D8
