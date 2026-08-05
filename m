Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762B9414DCB
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923844; cv=none; b=Ci6sWNly6AY6+M4eeuuvUnrYbAPEfWVAqRCEALnjDEv6V8bZoBT+pGC2E3Sfws+Co49BtDnI7Ogz6WTYdjQZpR9paIcEu2n4i5hg0R3p235oMqwHV8g8vin78WmLlC9F6im/ab73+MzRJFsVePvWz7sRwD/JUbe1Feyzs2tSL/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923844; c=relaxed/simple;
	bh=RRoFeEW5xygHmCYwKpmBoc57z9Ya+5rX6F/t8rWRRdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=SwRxfDMtOZ7iVgk/dGB4aGwUT+0TXBbwj14EAJcQJJqqbn8xm6OyBwq3QI4u8aT5lsYhIovEkMTfEvgpBsgRbgvCblHGifjlooaHS6arC6jOPyI3otDRAH7W0hfAvrM+zhbpG/QoIWMgh7zhB5uMh7DU5UCuLaY05hE3njxe0Ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzGGP4Xa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzGGP4Xa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACCD1F00A3A;
	Wed,  5 Aug 2026 09:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785923843;
	bh=csZmCLxFMt9SDo+LKVNiTxCTQluh8qI5rrndvh5WLOA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IzGGP4XawoWl1KkxlFQLeNbBcI2AVF86M5K1pyif7OiRd+Fdlr/Hlf7tcCoy6ewB4
	 laYWbnRMrGaPIOUFrxY6ICd3wlLATxx4ju2m4ZtXkUTeDmlCcz0XGMVSsJgkTQf+Ce
	 M0M164AFSItZSL+XQa9UL/F62wiH/DSTybOwxEY5FvjP3iG/hY0vPkoBwem4pYW6zY
	 GFK9iPPKPKu2ZanzDO9vVKapzQ/G0E2HpHO2v6eHQ25kzTww90t8ijHVX+WK4MU8Q2
	 WwU+NM2azvsieSvy1YmGWXSZSGcpBMA93Dni8JfqvnyqthvR1vzXd/3MXfkxR5Ew0H
	 iYLJ1FhH56+Ug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] iio: adc: ltc2497: add LTC2499 internal temperature
 channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805094135.11762-3-andrei.stancovici@analog.com>
References: <20260805094135.11762-1-andrei.stancovici@analog.com>
 <20260805094135.11762-3-andrei.stancovici@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:57:22 +0000
Message-Id: <20260805095723.0ACCD1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Potential division by zero kernel panic if regulator_get_voltage()=
 returns 0 when reading the temperature offset.
- [High] Stack-allocated buffer passed to i2c_master_send() is not DMA-safe.
- [High] The 2-byte command inadvertently configures 50Hz-only rejection, b=
reaking 60Hz rejection and causing a hardcoded 150ms conversion delay to ti=
me out.
--

--- Patch [2]: [PATCH 2/3] iio: adc: ltc2497: add LTC2499 internal temperat=
ure channel ---
commit 20bcf3fffe757278d79cfcae060ca4eaa317443e
Author: Andrei Stancovici <andrei.stancovici@analog.com>

iio: adc: ltc2497: add LTC2499 internal temperature channel

This commit adds support for the LTC2499's internal PTAT temperature sensor.
It exposes the sensor as an IIO_TEMP channel, utilizing a second I2C
configuration byte to enable temperature conversions and calculate the exact
temperature using the reference voltage.

> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-cor=
e.c
> index 2dc5c70442694..4ca7271ca0071 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
[ ... ]
> @@ -95,10 +96,43 @@ static int ltc2497core_read_raw(struct iio_dev *indio=
_dev,
[ ... ]
> +	case IIO_CHAN_INFO_OFFSET:
> +		switch (chan->type) {
> +		case IIO_TEMP:
> +			ret =3D regulator_get_voltage(ddata->ref);
> +			if (ret < 0)
> +				return ret;
> +			/*
> +			 * 0 =C2=B0C =3D=3D 273.15 K must map to raw + offset such that
> +			 * (raw + offset) * scale =3D=3D 0 m=C2=B0C, i.e.
> +			 *   offset =3D -273150 / scale
> +			 *          =3D -273150 * 3140000 / Vref_uV
> +			 * Computed in 64-bit to avoid overflow.
> +			 */
> +			*val =3D div_s64(-273150LL * 3140000, ret);

[Severity: High]
If regulator_get_voltage() returns exactly 0 (for instance, via a dummy
regulator or misconfigured devicetree), will this trigger a divide-by-zero
panic?=20

The check above handles negative error codes but appears to miss a
check for zero before the division.

> +			return IIO_VAL_INT;
> +		default:
> +			return -EINVAL;
> +		}
> =20
>  	default:
>  		return -EINVAL;
[ ... ]
> diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
> index eb9d521e86e54..4e0f5c7671f41 100644
> --- a/drivers/iio/adc/ltc2497.c
> +++ b/drivers/iio/adc/ltc2497.c
[ ... ]
> @@ -85,6 +85,36 @@ static int ltc2497_result_and_measure(struct ltc2497co=
re_driverdata *ddata,
[ ... ]
> +	if (ddata->chip_info->has_temp) {
> +		u8 cmd[2];

[Severity: High]
Is this stack-allocated buffer safe to use with i2c_master_send()?=20

If the underlying I2C adapter driver uses DMA for transfers, it might attem=
pt
to map this stack memory. With CONFIG_VMAP_STACK enabled, stack memory is
allocated in vmalloc space and is not DMA-capable, which could lead to
memory corruption or mapping errors.=20

Should this use a DMA-safe buffer instead?

> +
> +		if (address =3D=3D LTC2497_TEMP_ADDR) {
> +			cmd[0] =3D LTC2497_ENABLE | LTC2497_CONFIG_DEFAULT;
> +			cmd[1] =3D LTC2499_EN2 | LTC2499_IM;
> +		} else {
> +			cmd[0] =3D LTC2497_ENABLE | address;
> +			cmd[1] =3D LTC2499_EN2;
> +		}

[Severity: High]
By omitting bits 5 (FA) and 4 (FB) in the second command byte, these
bits default to 0. According to the LTC2499 datasheet, does this inadverten=
tly
configure the part for 50Hz-only noise rejection?

If so, 50Hz-only mode increases the maximum conversion time to 160.3ms.
Since the driver hardcodes the wait time to 150ms via
LTC2497_CONVERSION_TIME_MS, could this result in the I2C read transaction
being NACKed by the busy ADC, causing persistent read failures?=20

Would explicitly setting the FA bit to maintain the 149.9ms simultaneous
50/60Hz rejection mode prevent this timeout?

> +
> +		ret =3D i2c_master_send(st->client, cmd, sizeof(cmd));
> +		if (ret < 0) {
> +			dev_err(&st->client->dev, "i2c transfer failed: %pe\n",
> +				ERR_PTR(ret));
> +			return ret;
> +		}
> +		return 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805094135.1176=
2-1-andrei.stancovici@analog.com?part=3D2
