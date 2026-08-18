Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B346C84D
	for <devicetree@vger.kernel.org>; Tue, 18 Aug 2026 11:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787053899; cv=none; b=SJho2rYRV8PX6PyDpimUh0QQwUbR/Hz4xdJh/2+qbUh1MRLYAr/HhsJzgZdL0Ro720ceJHAQlhWSdqXJQYptQe5CNxNQiQ5S/RjCPwmLvHh5wRbrlRoASExrHnto8WB3UGruDqqMZH/xvMtF8Ii7KZanm295hw6+zomQuDzhjGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787053899; c=relaxed/simple;
	bh=Uy5M2/ynfqpeDKqLyMWSxR6jQ6JUKwLBLaE+k19ZRsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mpYdyM08UAuov2dX3kgCiMZfHNU8oi6+J7vkE5JY/CPtoJPWfyFv24SzHyc3p/3dI5xmlaFW+fjjsMeGgDwK02k/f2u20f+zCHkSqlLRbAj75bjGiZ3+Y3V2fWtY7EvQtW/tjLfTNzroJ+odokN6vwcXtgE6PfTp6/t694+d1WI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6KDTLfT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6KDTLfT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D83171F000E9;
	Tue, 18 Aug 2026 11:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787053898;
	bh=9dAIkcodDu5+Zm0Mrz1yKhxcQ7nWgxFVBqB3Nd2nF0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j6KDTLfT19Vxet1+vYA4GxGuLiWpmeGF6Yw05MRAateV+W+aKb+mafeyCdBhcbHNm
	 z7dTcAcAEFN53L1F2iOT923c3fAFueuIYFRemiRc4RYid+Pzpep6d3QurdPw3vMrLv
	 HGhTw5wZfV3GHadKhw3ct4A9K8PPKttGO7c/26xl6zhNnIfUsBKsR2eMbpAbupHBoG
	 ddd6PBkEiWkr2e8faze04sr7AhMWnT4NLJKQQZLAf4x77fdOFCRkAo9Bk3qUqrC5RF
	 SWmxUkCN0kUr/O2IgBcWpzNUD3er8JyJ9I0pJSV8UAe9cYcDrHteLFjhdKEEmBWlub
	 8xNpfQVTkSIQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/4] iio: light: veml6031x00: add support for events
 and trigger
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-veml6031x00-v7-4-2b0de0f20edf@gmail.com>
References: <20260818-veml6031x00-v7-0-2b0de0f20edf@gmail.com>
 <20260818-veml6031x00-v7-4-2b0de0f20edf@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 11:51:37 +0000
Message-Id: <20260818115137.D83171F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The trigger handler iterates over all active channels, including=
 the soft timestamp channel, causing an unintended read of the configuratio=
n register (0x00) on every trigger.
--

--- Patch [4]: [PATCH v7 4/4] iio: light: veml6031x00: add support for even=
ts and trigger ---
commit edb90c2eedbeff107834cc27e54709e4496c1560
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

iio: light: veml6031x00: add support for events and trigger

This commit adds support for configurations with and without an interrupt=20
line to the VEML6031X00 driver. It enables events and trigger functionality=
=20
when a shared interrupt line is available.

> diff --git a/drivers/iio/light/veml6031x00.c b/drivers/iio/light/veml6031=
x00.c
> index e6ca98414a01c..068fa7b3ecc98 100644
> --- a/drivers/iio/light/veml6031x00.c
> +++ b/drivers/iio/light/veml6031x00.c

[ ... ]

> @@ -549,11 +968,83 @@ static int veml6031x00_buffer_postdisable(struct ii=
o_dev *iio)

[ ... ]

> +static irqreturn_t veml6031x00_trig_handler(int irq, void *p)
> +{
> +	struct iio_poll_func *pf =3D p;
> +	struct iio_dev *iio =3D pf->indio_dev;
> +	struct veml6031x00_data *data =3D iio_priv(iio);
> +	struct regmap *map =3D data->regmap;
> +	IIO_DECLARE_BUFFER_WITH_TS(__le16, scan, 2) =3D { };
> +	unsigned int i =3D 0;
> +	int ch, ret;
> +
> +	if (test_bit(VEML6031X00_SCAN_ALS, iio->active_scan_mask) &&
> +	    test_bit(VEML6031X00_SCAN_IR, iio->active_scan_mask)) {
> +		ret =3D regmap_bulk_read(map, VEML6031X00_REG_ALS_L,
> +				       scan, 2 * sizeof(*scan));
> +		if (ret)
> +			goto done;
> +	} else {
> +		iio_for_each_active_channel(iio, ch) {
> +			ret =3D regmap_bulk_read(map, iio->channels[ch].address,
> +					       &scan[i++], sizeof(*scan));
> +			if (ret)
> +				goto done;
> +		}
                 ^^^^

[Severity: Medium]
Will this loop also iterate over the soft timestamp channel if it is enabled
in the active scan mask?

Since IIO_CHAN_SOFT_TIMESTAMP leaves the .address uninitialized (0), this
could inadvertently issue an I2C read from the configuration register (0x00)
on every trigger event when falling back to this else branch. Should this
loop skip the timestamp channel, for example by checking if the channel
address is valid or if the type is IIO_TIMESTAMP?

> +	}
> +
> +	iio_push_to_buffers_with_ts(iio, scan, sizeof(scan), pf->timestamp);
> +
> +done:
> +	iio_trigger_notify_done(iio->trig);
> +
> +	return IRQ_HANDLED;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-veml6031x0=
0-v7-0-2b0de0f20edf@gmail.com?part=3D4
