Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7138A40F8D6
	for <devicetree@vger.kernel.org>; Fri, 10 Jul 2026 11:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783683118; cv=none; b=c/C0u/LPJUEvfSIGmznmk2ODhGBumYHs95Oscy3fX7Nw9fhR3y760u2oMobYikFkmopzRlK9oLP7ZaHh0iJsam58Ui4P2uG65FvtvCdPXkUBV7mxyjwPCzE2XjDHESskD/qtwJQN0QRPWrFub1mz+/peoNtGGJZCB5yJ8KoKvXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783683118; c=relaxed/simple;
	bh=TlueALM1QniMcpcWV1t8La7BW85wcp5nJk1dBIJ0p2k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GSokW0U0+dRFyvX9AMjpZTp1uMNE5GTx7HvgVuT2ukTSuhPEMTYt0xiBfpKV+NpzQ1MDhjYt8vAGJCOEfuNUXQ2WmKUBo8yY60SMyl53R1/ZXIH0tqlfWi7QG77mlKSiO/7iAQo0O9hM003NgIzaYxELjrZyCGHrlZ9qdXAp0b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JS8ya6Mm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JS8ya6Mm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53EC51F000E9;
	Fri, 10 Jul 2026 11:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783683109;
	bh=iIimHaYhyTG+YVu/mMDt3SkSOFmqp1BwxLP9K7WRQd0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JS8ya6Mmea0wMLj2ZiZNB9K6TmKH5jEpSxGF6DKBAT8F+XeWOnbtbbMbo1i0e22rN
	 FlxRlbJah2nsFsy+tmojckGlFdDf8Wj2gtKT32rH9+P3fb9BWZ09KDc/2WvbFyHr88
	 arBzljVaB5dAWo7c4U/BwXAbH+sxprGD+ceG+daMmGlndNtRoUBQGKkQqgJJDtqWqX
	 Q/9cANWBB7DJTljPw/Hytyklcyjsq3cuQPFh8b5UqiCqZfghAPEFUdx/o/x7+eGPd3
	 sktBA0Tjs5f8QuQL6kGskRsfmdESbxGM1aChxJnUGLkTj6W/+CAbHPF14Au58Bbugv
	 M49h9qeSmlBrw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 1/7] iio: dac: ad5696: properly check i2c_transfer()
 return value
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar" <rodrigo.alencar@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260710-ad5686-new-features-v7-1-1bcc8c280e4d@analog.com>
References: <20260710-ad5686-new-features-v7-0-1bcc8c280e4d@analog.com>
 <20260710-ad5686-new-features-v7-1-1bcc8c280e4d@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:31:48 +0000
Message-Id: <20260710113149.53EC51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The I2C read transaction uses overlapping transmit and receive buf=
fers, causing a DMA mapping violation and potential cacheline corruption.
- [High] Missing NULL check for `chip_info` during driver probe when bound =
via sysfs.
--

--- Patch [1]: [PATCH v7 1/7] iio: dac: ad5696: properly check i2c_transfer=
() return value ---
commit 7918e0fc4a2bf3dec679b7e0bd608081aff01ef3
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>

iio: dac: ad5696: properly check i2c_transfer() return value

Verify that the expected number of i2c messages were transferred when
ad5686_i2c_read() is called.

Closes: https://lore.kernel.org/all/20260705114746.1485F1F000E9@smtp.kernel=
.org/

> diff --git a/drivers/iio/dac/ad5696-i2c.c b/drivers/iio/dac/ad5696-i2c.c
> index 279309329b64b..6f726e6301a6e 100644
> --- a/drivers/iio/dac/ad5696-i2c.c
> +++ b/drivers/iio/dac/ad5696-i2c.c
> @@ -40,8 +40,8 @@ static int ad5686_i2c_read(struct ad5686_state *st, u8 =
addr)
>  				      0x00);
> =20
>  	ret =3D i2c_transfer(i2c->adapter, msg, 2);
> -	if (ret < 0)
> -		return ret;
> +	if (ret !=3D 2)
> +		return ret < 0 ? ret : -EIO;

[Severity: High]
This is a pre-existing issue, but does this I2C read transaction use
overlapping transmit and receive buffers?

Looking at the msg array initialization earlier in ad5686_i2c_read():

    struct i2c_msg msg[2] =3D {
        {
            ...
            .buf =3D &st->data[0].d8[1],
        },
        {
            ...
            .buf =3D (char *)&st->data[0].d16,
        },
    };

The transmit buffer and the receive buffer are mapped to the same
st->data[0] union, meaning they overlap and share the same cacheline.

When the I2C controller uses non-cache-coherent DMA, mapping overlapping
buffers for both DMA_TO_DEVICE and DMA_FROM_DEVICE within the same
cacheline violates the DMA API.

Could the cache invalidation for the receive buffer clobber the dirty
cacheline containing the transmit buffer's data, leading to corrupted data
being sent to the DAC or corrupted readback?

>  	return be16_to_cpu(st->data[0].d16);
>  }

[Severity: High]
This isn't a bug introduced by this patch, but is there a missing NULL
check for chip_info during driver probe when bound via sysfs?

In drivers/iio/dac/ad5696-i2c.c:ad5686_i2c_probe():

    return ad5686_probe(&i2c->dev, i2c_get_match_data(i2c), ...);

If a user binds the driver using driver_override via sysfs with a device
name not present in the driver's id_table or of_match_table,
i2c_get_match_data() will return NULL.

This NULL pointer is then passed to ad5686_probe() in
drivers/iio/dac/ad5686.c:

    st->vref_mv =3D st->use_internal_vref ? st->chip_info->int_vref_mv : re=
t / 1000;

Will this unconditionally dereference chip_info and cause a kernel panic
during device probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-ad5686-new=
-features-v7-0-1bcc8c280e4d@analog.com?part=3D1
