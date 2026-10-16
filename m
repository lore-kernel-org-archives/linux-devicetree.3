Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31890348C6D
	for <devicetree@vger.kernel.org>; Fri, 16 Oct 2026 08:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792139160; cv=none; b=Nv4D4GfGB/xnQ1JP+zrB7GBkV0/funkNEBiSBel3IdVOxkUTWwsfs97fJWGnUSBt337KDmBDuVwPMpqbGsmYWztZRGSjLmNZsmQo+HltJzOaas+aqoQHS72wF1QLWzLMS+EthCZoHKqV+nlHhI2K4gSM95xa+/3HR4cDfo128wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792139160; c=relaxed/simple;
	bh=np6xZxnXUvqmANajyc2CxQrN6IPYPJ3FlT3+aCmV4NA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=sYbXmpp52Uf95jPIKwsN6g1S36uEPpLVWmGSme7kORM6ombZo8XcBELav9hb8MBvE7gH8YM6QdI3g/sSilij/MsqPHpYvlqfES1Bml8DbmdB2wIfPbfODxYgJAreXDGTXQ+RcFRIqT09WcAhgNVaYaUYCsGlInOBTLEw+rFC65o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CY1QNYJA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CY1QNYJA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91481F000C4;
	Fri, 16 Oct 2026 08:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792139158;
	bh=Yw5juo+uq7OhWj6tYblZ+B8xRRORU8fifjfG7SB6Hcw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CY1QNYJA6MaP/tBEbnIQlpSR8jzLn7g1r8atxJvZ28xdyn0+46+v8MmtqewneSX+5
	 N9Kl5gjpj0Y7Yp70pYUQCb0o6k3e97Mxb6uNB5NPHFdIc71YO2FYrLMH15V2eS26w4
	 PaoKL7InfPBrvjVAgiIpSCw1P1EVGUDp3wGUdbxTirkv0bMtqYhBW58LYjzaZAfRL+
	 NkQkP9t6mGJbcI8erdlR0yc+fWG0DXxB+xph13jSGUPxGgSIpnzjl9eZkmCrcKMYX8
	 YBuepoda4rLzm1hJumpaKUMMKu2OH/E04xubNLPQUZmQ6Boyqk8IifbE9ehHivxIvd
	 tDj/NqPyf7p/g==
Message-ID: <sashiko-outbox-174017@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] iio: light: tcs3472: Add TCS3400 support
Reply-To: sashiko-reviews@lists.linux.dev
To: HuskerMinion <mocker-mug-unwoven@duck.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261016-tcs3400-v1-2-3d79d2a7f449@duck.com>
References: <20261016-tcs3400-v1-0-3d79d2a7f449@duck.com>
 <20261016-tcs3400-v1-2-3d79d2a7f449@duck.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 08:25:58 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: light: tcs3472: data race when setting CALIBSCALE
- [Medium] iio: missing iio_device_claim_direct in write_raw
--

commit 71b07faf78f3ba40068aeff966e06035eb4c1e4f
Author: HuskerMinion <mocker-mug-unwoven@duck.com>
iio: light: tcs3472: Add TCS3400 support

This patch adds support for the AMS TCS3400 ambient light sensor to the
existing TCS3472 driver. It introduces a chip_info structure to handle
device-specific differences such as register auto-increment behavior,
gain steps, and interrupt clearing.

> diff --git a/drivers/iio/light/tcs3472.c b/drivers/iio/light/tcs3472.c
> index b392943e51c8b..fbd9a1b34ea17 100644
> --- a/drivers/iio/light/tcs3472.c
> +++ b/drivers/iio/light/tcs3472.c
[ ... ]
> @@ -396,8 +447,8 @@ static int tcs3472_write_raw(struct iio_dev *indio_de=
v,
>  	case IIO_CHAN_INFO_CALIBSCALE:
>  		if (val2 !=3D 0)
>  			return -EINVAL;
> -		for (i =3D 0; i < ARRAY_SIZE(tcs3472_agains); i++) {
> -			if (val =3D=3D tcs3472_agains[i]) {
> +		for (i =3D 0; i < ARRAY_SIZE(data->chip->agains); i++) {
> +			if (val =3D=3D data->chip->agains[i]) {
>  				data->control &=3D ~TCS3472_CONTROL_AGAIN_MASK;
>  				data->control |=3D i;

[Severity: Medium]
Does this code introduce a data race when setting CALIBSCALE?

The shared data->control state is modified and written to the I2C device
locklessly here in tcs3472_write_raw(). If there are concurrent sysfs writes
to in_illuminance_calibscale, could they cause a read-modify-write data race
that corrupts the state and inadvertently applies an incorrect gain setting
(e.g., combining bits to apply a 64x gain) to the hardware?

[Severity: Medium]
Should tcs3472_write_raw() be calling iio_device_claim_direct() to serialize
sysfs writes against active buffered captures?

If userspace modifies device configuration parameters, such as CALIBSCALE or
SAMP_FREQ, while a triggered buffer capture is active, could it silently
alter the scale or timing of the captured samples, resulting in corrupted or
desynchronized data for the userspace consumer?

>  				return i2c_smbus_write_byte_data(
>  					data->client, TCS3472_CONTROL,
>  					data->control);
>  			}
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-tcs3400-v1=
-0-3d79d2a7f449@duck.com?part=3D2
