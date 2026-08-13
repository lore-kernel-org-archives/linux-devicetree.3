Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFA2439015
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 16:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637564; cv=none; b=GcnoBkZZCxYcsxPohJT4OFd04BGcqKaIY0LfxzUWwTjicMPVEzwhDIAABgLNcuH/dUYXw6j5AlGSaFHvfdxE44gCn2w45tL3bGHRPVx6k6Om5gCyvVv/9wLZ9r22wF62rdw5VeAcv1mu4Exi/7+pUYHB3NCFe/PGLSMJnd3PGZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637564; c=relaxed/simple;
	bh=GhXXuloMzuN5fZjH3PlyD1cvxv3AupENvjiUFiHw6FE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=meCe/zwUIRDbrqwlurgQw/q2nYdDGVf3DRfZVkzREsSXMiq3o5kghr6AMsgg2gENo0Yv/VhHdp6pAIWyYA/ky/TNdzfqEXHuo6Fx4sxyUHon0C9c/EBnn+C9/DiVfUOIyVrfAG0vO6Jm1MPs/27aJoG9NonIh2zhnv4NpGzOHDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i99aN3W5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i99aN3W5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0211F000E9;
	Thu, 13 Aug 2026 16:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786637557;
	bh=0kUJledlZMoZ7YyYMQownsVd2CAvrjXXoMaFWNYr09Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i99aN3W5mYA65Fj8OCTaSngb1BtRuc6Gqg4fSBu2b4nEAjaD/yTsZKhNUrHQi7jD/
	 OJmSWmDkiWEskuDNQN12Ioa1EMIXZACPcog7bGocMuHzHBTEiXSKGQDum2QVNthzY4
	 xE4fsMq7whbC3EvKQ8TWTePgREYDRtWx7Ub3gFVzmFWaZOt7/JqO6RXW1B5Qzmlmo7
	 9eJCa+kQy/6/2CES4buDGBfaPmJp2tuJngqwTEGGIu5kiTkLhDaZ+rlbG9853Rt2B4
	 4TL2woTFV5VJkbMSGRTQuWs2jzZ4/+uZXZWZNsm0IcvPsS23coVE4kQ+6TUhVPMAxw
	 ZU0cIsqfUF/cQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] iio: adc: ltc2497: add LTC2499 internal
 temperature channel
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260813160139.70000-3-andrei.stancovici@analog.com>
References: <20260813160139.70000-1-andrei.stancovici@analog.com>
 <20260813160139.70000-3-andrei.stancovici@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 16:12:36 +0000
Message-Id: <20260813161236.ED0211F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The driver attempts to use a DMA-safe buffer to bypass I2C bounc=
e buffering, but calls the ordinary `i2c_master_send()` API instead of `i2c=
_master_send_dmasafe()`.
--

--- Patch [2]: [PATCH v2 2/3] iio: adc: ltc2497: add LTC2499 internal tempe=
rature channel ---
commit cea285d89524ad50d9ef052e9f3bd1971904c7b9
Author: Andrei Stancovici <andrei.stancovici@analog.com>

iio: adc: ltc2497: add LTC2499 internal temperature channel

This commit adds support for the LTC2499 internal temperature channel by
providing raw, scale, and offset values. It implements two-byte I2C commands
using a DMA-safe buffer to switch between the internal PTAT sensor and exte=
rnal
voltage inputs.

> diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
> --- a/drivers/iio/adc/ltc2497.c
> +++ b/drivers/iio/adc/ltc2497.c

[ ... ]

> @@ -85,6 +85,40 @@ static int ltc2497_result_and_measure(struct ltc2497co=
re_driverdata *ddata,
>  			return 0;
>  	}
> =20
> +	/*
> +	 * Parts with the internal PTAT sensor (LTC2499) latch their converter
> +	 * configuration via a second command byte and only re-evaluate it when
> +	 * that byte has EN2 set; a single byte, or a second byte with EN2 =3D =
0,
> +	 * means "keep previous". A one-byte channel select therefore cannot pu=
ll
> +	 * the device back out of temperature mode, so a voltage read after a
> +	 * temperature read would keep returning the PTAT result. Always drive =
the
> +	 * second byte with EN2 set on these parts: IM =3D 1 for a temperature =
read,
> +	 * EN2 alone (IM =3D 0) to (re)select an external input. FA =3D FB =3D =
0 keeps
> +	 * the power-on simultaneous 50/60Hz rejection, whose worst-case
> +	 * conversion time the driver's wait already covers.
> +	 *
> +	 * The two bytes are assembled in the DMA-safe st->data buffer rather t=
han
> +	 * on the stack, so the pointer handed to i2c_master_send() stays valid=
 on
> +	 * adapters that DMA the transfer (e.g. with CONFIG_VMAP_STACK).
> +	 */
> +	if (ddata->chip_info->has_temp) {
> +		if (address =3D=3D LTC2497_TEMP_ADDR) {
> +			st->data.d8[0] =3D LTC2497_ENABLE | LTC2497_CONFIG_DEFAULT;
> +			st->data.d8[1] =3D LTC2499_EN2 | LTC2499_IM;
> +		} else {
> +			st->data.d8[0] =3D LTC2497_ENABLE | address;
> +			st->data.d8[1] =3D LTC2499_EN2;
> +		}
> +
> +		ret =3D i2c_master_send(st->client, (char *)st->data.d8, 2);

[Severity: Medium]
The comment above states the two bytes are assembled in a DMA-safe buffer to
ensure the pointer stays valid on adapters that DMA the transfer. Since
ordinary i2c_master_send() does not set the I2C_M_DMA_SAFE flag, won't the
I2C core automatically allocate a temporary bounce buffer and copy the data
anyway?

Would it be better to use i2c_master_send_dmasafe() here so the I2C core kn=
ows
it can safely use this buffer directly without bouncing?

> +		if (ret < 0) {
> +			dev_err(&st->client->dev, "i2c transfer failed: %pe\n",
> +				ERR_PTR(ret));
> +			return ret;
> +		}
> +		return 0;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813160139.7000=
0-1-andrei.stancovici@analog.com?part=3D2
