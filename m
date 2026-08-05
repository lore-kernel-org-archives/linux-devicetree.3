Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6D416876
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 09:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785923771; cv=none; b=QqVvFtMfxnjnheKZHnauqCxxACMFfi6bfdUui5urdioDY1PpUAkR/r5Da5GKNNMaD0cD5P8e9BZ0wpuI/gmojXeK4IvZDaf1xyIlteaNfI5UjJOK2r/om/wySAx8p3d7LJZyNBzNH66crhdUJxx/aRlCK/iqNwMgSQcmlaUISz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785923771; c=relaxed/simple;
	bh=yjyi64P2Kubr/2QKlw4YLAetoG035zBaol3Wc4OgrNs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=K1433GI0cwvwYZ+rbIlOCC+qjUVz28FqLFVCJP50qvrI6zGbukqEtESYCHhsapGPIIWqYoXcUTfxe09tTOROwi1RCJKODIhYke9ZJ6WSjZjaL8F9xMizO0UMIwlh0Gd7GAFElJxzMkxUdCx7LniNUV/6gA3Z1hNFVl+fawHsCR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qto0UvEK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qto0UvEK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA2E1F00A3E;
	Wed,  5 Aug 2026 09:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785923769;
	bh=88PL9IPQn8HI6XunkvsmFTr/x0w9/0BJEtQF+1TZyFA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Qto0UvEK+0pFtGwpJ9UmAR5aWXJPH8VkTMycjwugMm9HcBbAJAmlO7TS68FSsJ9BS
	 k/hQVUmS2iofc16snEyicfilLYXwpNdlZR1JYBuTRWT2og710i7YLq8M7YwKV/vmtR
	 S5v/NFq1CAE1l7vaep13QOuauU9Fb4A9+nmD2dvtyDvnUI1iVOXh9d5AH0efY+6k2h
	 HG5rvsdD7/lARuqXGm1Xsqg9CJPgmvOi/RkGIZCq2d02X6Rw5bCkDYqt/3x6XkQfgf
	 x7ryxG7gdQjz74H74atLhZoFW19a6SzFPtLpyNEARwBMXNuxQY20h91tZq4omL90Xy
	 tiwuc9seyW67w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] iio: adc: ltc2497: add 2x conversion speed mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andrei Stancovici" <andrei.stancovici@analog.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805094135.11762-4-andrei.stancovici@analog.com>
References: <20260805094135.11762-1-andrei.stancovici@analog.com>
 <20260805094135.11762-4-andrei.stancovici@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 09:56:08 +0000
Message-Id: <20260805095609.1EA2E1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] I2C transfer buffer `cmd` is allocated on the stack, which strictl=
y violates DMA mapping rules. If the underlying I2C host controller relies =
on DMA and attempts to map the transfer buffer, calling `dma_map_single()` =
on a stack address will fail or cause a kernel panic on architectures with =
`CONFIG_VMAP_STACK` enabled (as the stack may not be physically contiguous)=
. The driver author correctly used an `__aligned(IIO_DMA_MINALIGN)` heap bu=
ffer for `st->data.d8` / `st->data.d32` to safely handle DMA, making this s=
tack allocation an oversight.
- [Medium] Missing update of `time_prev` before returning `-ERESTARTSYS` on=
 an interrupted wait leads to state corruption and spurious I2C NACKs (`-EI=
O`). When switching modes or channels, the driver issues a dummy write to s=
tart a new conversion and then calls `msleep_interruptible()`. If this slee=
p is interrupted by a signal, the driver returns early without updating `dd=
ata->time_prev` to reflect the newly started conversion. On the next read r=
etry, `ltc2497core_wait_conv()` calculates the elapsed time against this st=
ale `time_prev`. If switching from a faster mode (e.g., 76ms) to a slower m=
ode (150ms), the wait logic may falsely conclude the 150ms delay is satisfi=
ed because the time elapsed since the *old* `time_prev` exceeds the remaini=
ng wait time. It then directly executes a premature I2C read before the ADC=
 has finished converting, resulting in a hardware NACK.
--

--- Patch [3]: [PATCH 3/3] iio: adc: ltc2497: add 2x conversion speed mode =
---
commit 3de76fde39bdb91c8ae6ce607b01c574bc7d76f1
Author: Andrei Stancovici <andrei.stancovici@analog.com>

iio: adc: ltc2497: add 2x conversion speed mode

This commit introduces a 2x output rate mode for the LTC2499 ADC by exposing
a new sampling_frequency attribute on voltage channels. It updates the
conversion wait times and the two-byte command path to accommodate the speed
mode configuration.

> diff --git a/drivers/iio/adc/ltc2497-core.c b/drivers/iio/adc/ltc2497-cor=
e.c
> index 4ca7271ca0071..68b53a983e053 100644
> --- a/drivers/iio/adc/ltc2497-core.c
> +++ b/drivers/iio/adc/ltc2497-core.c
[ ... ]
> @@ -61,7 +105,9 @@ static int ltc2497core_read(struct ltc2497core_driverd=
ata *ddata, u8 address, in
>  			return ret;
>  		ddata->addr_prev =3D address;
> =20
> -		if (msleep_interruptible(LTC2497_CONVERSION_TIME_MS))
> +		/* The reprogram above starts a conversion in the new mode. */
> +		ddata->conv_time_prev =3D conv_time_ms;
> +		if (msleep_interruptible(conv_time_ms))
>  			return -ERESTARTSYS;

[Severity: Medium]
Will this lead to state corruption and spurious I2C NACKs if the sleep is
interrupted?

When switching modes or channels in ltc2497core_read(), a dummy write starts
a new conversion and then calls msleep_interruptible(). If this sleep is
interrupted by a signal, the driver returns early without updating
ddata->time_prev to reflect the newly started conversion.

On the next read retry, ltc2497core_wait_conv() calculates the elapsed time
against the stale time_prev. If switching from a faster mode (e.g., 76ms) to
a slower mode (150ms), the wait logic may falsely conclude the 150ms delay =
is
satisfied because the time elapsed since the old time_prev exceeds the
remaining wait time. It then directly executes a premature I2C read before
the ADC has finished converting, resulting in a hardware NACK (-EIO).

>  	}
[ ... ]
> diff --git a/drivers/iio/adc/ltc2497.c b/drivers/iio/adc/ltc2497.c
> index 4e0f5c7671f41..6bb016f495e6e 100644
> --- a/drivers/iio/adc/ltc2497.c
> +++ b/drivers/iio/adc/ltc2497.c
[ ... ]
> @@ -104,6 +107,8 @@ static int ltc2497_result_and_measure(struct ltc2497c=
ore_driverdata *ddata,
>  		} else {
>  			cmd[0] =3D LTC2497_ENABLE | address;
>  			cmd[1] =3D LTC2499_EN2;
> +			if (ddata->sped_2x)
> +				cmd[1] |=3D LTC2499_SPD;
>  		}
> =20
>  		ret =3D i2c_master_send(st->client, cmd, sizeof(cmd));

[Severity: High]
Is it safe to pass a stack-allocated buffer to i2c_master_send()?

If the underlying I2C host controller relies on DMA and attempts to map the
transfer buffer, calling dma_map_single() on a stack address will fail or
cause a kernel panic on architectures with CONFIG_VMAP_STACK enabled.

Should we use an __aligned(IIO_DMA_MINALIGN) heap buffer for this transfer
instead, similar to how st->data is handled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805094135.1176=
2-1-andrei.stancovici@analog.com?part=3D3
