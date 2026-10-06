Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E904385D86
	for <devicetree@vger.kernel.org>; Tue,  6 Oct 2026 18:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791311553; cv=none; b=TrNywq9jOyxBeUch6FGPgM8H8EywjLRXG38c2QyKTtqX3Dj7/5b8sWhiUM3V2Y1NGUzUKx0Ms2JTJ11CjPsUfO1XjKF/Bp1erlw6fTuI6bDkAoos4B1j+oN6zW0LT37dDAkBhGoPuPMPjI/2qBnxtzzSwKZn0bP3tUWavzQIY/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791311553; c=relaxed/simple;
	bh=P4uUOoW4YbDTOll7w9u0yHBE+OUrLkKqvvw7aJ4PgZI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=dXjuK1E4Sj4WTQNTOKcFD6XzwvVuip9BJYMd9zf0bcL7bDlepJfu/Ljz+pn59J3xrkuScKPMzBsWXjk5EoqmBuD7IfLpC/zGOXLQqbFwMPWo7P0fk1SZN0CkFrbJqlQKoeDvtf4i3L7YqiaXaXaBkMWU1uMCungadz5XwFSWGBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f/PlVgab; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f/PlVgab"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A86341F0089B;
	Tue,  6 Oct 2026 18:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791311551;
	bh=SJUodfQc+vkB7i/I+pkS+4ejxf8hg2PK22zyNqnnEKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f/PlVgabVBGMtk/Kv7ucXedQBBt3v9fbB9gKSAkHgYKASi5HH8bytR8X68C/D7JOf
	 2l2qRVbb1+HyOJNuS4Qazmppc2iJTC+B9q8PE41Qs7JLAVvL+KOCNV9hNunxihXNb1
	 cpJk3UunIiTGp/hr1o4gd8ymBnLiW6IW0dCvfskugW0q6CcmgZG4fwnEK49P5RR2FH
	 ikPCC123uXTfJr9ciwo3tm3XLbTeqkW22vfEaWYjJltbS8RlVuImnkT2h6IwSfLlY0
	 PHcffVchvqVKNyYcPrDV114+vyeKtY4JLfpiaXwRtpcyUwbZQNNCADrWnxRXanqAGf
	 nysNXHW2VZFYQ==
Message-ID: <sashiko-outbox-162348@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/13] iio: adc: ad4134: Run shorter transfers when
 CRC is disabled
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e46fd2f9b11ff2b690483bc2ea6489b6d145c773.1791309733.git.marcelo.schmitt@analog.com>
References: <cover.1791309733.git.marcelo.schmitt@analog.com>
 <e46fd2f9b11ff2b690483bc2ea6489b6d145c773.1791309733.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 18:32:31 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: adc: ad4134: broken SPI read CRC calculation and ignored fa=
ilures
- [Medium] iio: adc: missing delay after reset deassertion in probe
--

commit 5284b96efc125640c497213951d3fabe580894ec
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Run shorter transfers when CRC is disabled

This commit conditionally reduces the SPI transfer length when the AD4134
CRC feature is disabled. It introduces a crc_en flag in the driver state
to skip the CRC validation check and send fewer bytes when CRC is inactive.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index a0113fff4b715..85fa16321d744 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -232,7 +233,7 @@ static int ad4134_register_read(struct ad4134_state *=
st, unsigned int reg,
>  	*val =3D st->rx_buf[1];
> =20
>  	/* Check CRC */
> -	if (st->rx_buf[2] !=3D st->tx_buf[2])
> +	if (st->crc_en && st->rx_buf[2] !=3D st->tx_buf[2])
>  		dev_dbg(&st->spi->dev, "reg read CRC check failed\n");
> =20
>  	return 0;

[Severity: Medium]
Does this CRC validation logic reliably verify the read data?

In ad4134_register_read(), the master's CRC (st->tx_buf[2]) is computed usi=
ng
the command byte and a dummy payload (0x00). However, the slave returns its=
 CRC
(st->rx_buf[2]) computed over the command byte and the actual register value
being read (st->rx_buf[1]). Comparing st->rx_buf[2] !=3D st->tx_buf[2] will
spuriously fail for any read where the register value is non-zero.

Additionally, both the read and write paths merely log a dev_dbg() message =
on
CRC mismatch and return success (0) instead of returning an error code (such
as -EIO). Can this allow corrupted data to be used by the caller, rendering
the CRC feature ineffective for data integrity?

[ ... ]
> @@ -313,6 +314,7 @@ static int ad4134_min_io_mode_setup(struct ad4134_sta=
te *st)
>  	struct device *dev =3D &st->spi->dev;
>  	int ret;
> =20
> +	st->crc_en =3D true; /* In minimum I/O mode CRC cannot be disabled */
>  	st->odr_gpio =3D devm_gpiod_get(dev, "odr", GPIOD_OUT_LOW);

[Severity: Medium]
Does the AD4134 device require a stabilization delay before interacting wit=
h it
over SPI?

In ad4134_probe(), devm_reset_control_get_optional_exclusive_deasserted() is
called to deassert the reset line. Execution then proceeds directly to regm=
ap
initialization and SPI transfers without any hardware stabilization delay:

	rst =3D devm_reset_control_get_optional_exclusive_deasserted(dev, NULL);
	if (IS_ERR(rst))
		return dev_err_probe(dev, PTR_ERR(rst),
				     "failed to get and deassert reset\n");

	crc8_populate_msb(ad4134_spi_crc_table, AD4134_SPI_CRC_POLYNOM);

	ret =3D devm_mutex_init(dev, &st->sync_lock);
	if (ret)
		return ret;

	st->regmap =3D devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);

Without a delay, could the first SPI transactions during probe drop or retu=
rn
invalid data, causing initialization to fail?

The driver defines AD4134_RESET_TIME_US as 10 seconds (10 * USEC_PER_SEC) b=
ut
never uses it to invoke any sleep function.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1791309733.gi=
t.marcelo.schmitt@analog.com?part=3D5
