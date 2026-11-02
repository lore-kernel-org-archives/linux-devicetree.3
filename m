Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793612560;
	b=bkbjt2PQZK2B9eWf84E8LNoo1COOcalY3yC9RdcYSXwzP8NJCz/KzQrcTguFknlFx36Y
	 DWN0DFtApsZCv6vVSZeFpnancgdDO1UDub9c6Yj2Xg1p6GL5M7EabLwunOnVaot42WbB3
	 J7++HFlNeuRnbGVDSmdpXG3WiaVUWcnDgP39BGM3TocJO7elXwOgT4GadFYc0z9iAGDAT
	 cTrpEtNzSnIEw9Oka4qARuChXyHhigStWvQeBfy8kwtHbdnbLfI4E1npiqKR+2+zuH5PI
	 4KbQWeeSbXeJBGoyYRDeko8dIdgg0edwYfuiX5gx2Mpq6hL/c7cBlzzVZMV1lifDdQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793612560;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BRUOQTe+QnwiUrIIVIue9vTRJuEIPU1UuI/MbJv4DUU=;
	b=ke+c6EICHevON9qo8tUsQG4v7qEydJN2MsHkBVUBBlFkV8MLjYbG4T3JruAJZBDNXvue
	 QbjdtTStE9cesKGvUmQj7U+aXTSabLwbK9WtnRBBL//bAEqA4HVk5pRCbQcchMtk5QkIt
	 HiMlOQeyMkFxvj8JUxRSX+xKEqPZkklkC49QwLG73xICC74DYgT3Oyjb2Qa1F/Qwen7nN
	 74IlpaO96WRTI/lSfXGbWh9HI6RJmw5cMqFgma97+YDhhnwDBAV3TNHgUkiGQZr4xzbX5
	 A/ByqGkjhMkD8C7FF5+/kaFl5rH9LHtXRJFfWQ79wM7Ftn3j+d+tGy4zwo3GL02TDEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AimGFvtO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3A6606A324
	for <devicetree@vger.kernel.org>; Mon,  2 Nov 2026 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AimGFvtO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5809A1F000C1;
	Mon,  2 Nov 2026 09:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793612559;
	bh=BRUOQTe+QnwiUrIIVIue9vTRJuEIPU1UuI/MbJv4DUU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AimGFvtOFp4avmEP6Im1b1JHNx7WigATJifniCJTXuHzGSls8YNUpjKyaS+U+4P9m
	 jhux9qsKKHlk/lkfLmO9JMnQ90sDJu0czn7KrHugT+8NBIwFj500msrSE9TpS+uAxM
	 R1+IYqmwORWnxzw7zSBfzbw76MK74mKD4CxHW/GEuCvuxKo10bPhTDQtYHn5P/pF4C
	 1E1yqWW6oveTklVvNIZVTnVQnSWlsJe1k/aCpplmYh1DZbkqVp/g9rM7UdItS/oW0d
	 rVEyBr1dN7m9q8p0Y54MQlET+Wzsv6oUnE38AGzfDoJH0ejjTr3UmZA0pQ8S8bWsMB
	 69oebNQKyyrUQ==
Message-ID: <sashiko-outbox-193198@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/8] iio: imu: adis16607: Add external clock sync
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Radu Sabau" <radu.sabau@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261102-adis16607-v5-7-4f98b0d271ac@analog.com>
References: <20261102-adis16607-v5-0-4f98b0d271ac@analog.com>
 <20261102-adis16607-v5-7-4f98b0d271ac@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 09:42:38 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] iio: imu: adis16607: unlocked clk_freq_mHz read in adis16607_get=
_freq()
- [Medium] iio: imu: adis16607: stale sample_period_ns on error in adis1660=
7_set_freq()
--

commit d3f4ee30496626b77ece21c139b6d2175717f5c5
Author: Radu Sabau <radu.sabau@analog.com>

iio: imu: adis16607: Add external clock sync support

This commit adds support for an optional external sync clock on the
adis16607 IMU, selecting between direct sync mode (1 kHz to 8 kHz) and
scaled sync mode (1 Hz to 400 Hz) based on the supplied clock frequency.
In scaled mode, it dynamically selects the sync scale and decimation rate
when setting the sampling frequency, and reports sync or PLL lock loss from
the FIFO drain handler.

> diff --git a/drivers/iio/imu/adis16607.c b/drivers/iio/imu/adis16607.c
> index bd7752f7a1ec8..58504d351de16 100644
> --- a/drivers/iio/imu/adis16607.c
> +++ b/drivers/iio/imu/adis16607.c

[ ... ]

> @@ -873,6 +947,21 @@ static int adis16607_set_freq(struct adis16607 *st, =
u32 freq)
>  		if (ret)
>  			return ret;
> =20
> +		/*
> +		 * Writing USER_SYNC restarts the PLL lock, so only do it when
> +		 * the scale actually changes.
> +		 */
> +		if (scale !=3D st->sync_scale) {
> +			ret =3D __adis_write_reg_16(&st->adis,
> +						  ADIS16607_REG_USER_SYNC,
> +						  ADIS16607_SYNC_MODE_MASK | scale);
> +			if (ret)
> +				return ret;
> +
> +			st->sync_scale =3D scale;
> +			st->clk_freq_mHz =3D clk_freq_mHz;
> +		}

[Severity: Medium]
Now that st->clk_freq_mHz is updated at runtime under st->adis.state_lock in
adis16607_set_freq() when operating in ADIS16607_SYNC_SCALED mode, can a
concurrent sysfs read of sampling_frequency race with this update?

In adis16607_read_raw() -> adis16607_get_freq():

	ret =3D adis_read_reg_16(&st->adis, ADIS16607_REG_DEC_RATE, &dec);
	if (ret)
		return ret;

	*freq =3D DIV_ROUND_CLOSEST(st->clk_freq_mHz, dec + 1);

adis_read_reg_16() releases st->adis.state_lock before st->clk_freq_mHz is
read, and adis16607_read_raw() does not claim IIO direct mode for
IIO_CHAN_INFO_SAMP_FREQ.

Could adis16607_get_freq() hold st->adis.state_lock across both
__adis_read_reg_16() and the division using st->clk_freq_mHz so it cannot
pair a stale or intermediate zero ADIS16607_REG_DEC_RATE value with the new
st->clk_freq_mHz (or vice versa)?

> +
>  		if (dec) {
>  			ret =3D __adis_write_reg_16(&st->adis,
>  						  ADIS16607_REG_DEC_RATE, dec);

[Severity: Medium]
In adis16607_set_freq(), __adis_write_reg_16(&st->adis,
ADIS16607_REG_DEC_RATE, 0) clears the hardware decimation rate to 0 at the
start of the critical section, and if scale !=3D st->sync_scale,
ADIS16607_REG_USER_SYNC and st->clk_freq_mHz are also updated before the new
decimation rate is written:

	adis_dev_auto_scoped_lock(&st->adis) {
		/* Reset the decimation accumulator before the new value */
		ret =3D __adis_write_reg_16(&st->adis, ADIS16607_REG_DEC_RATE, 0);
		if (ret)
			return ret;

		if (scale !=3D st->sync_scale) {
			ret =3D __adis_write_reg_16(&st->adis,
						  ADIS16607_REG_USER_SYNC,
						  ADIS16607_SYNC_MODE_MASK | scale);
			if (ret)
				return ret;

			st->sync_scale =3D scale;
			st->clk_freq_mHz =3D clk_freq_mHz;
		}

		if (dec) {
			ret =3D __adis_write_reg_16(&st->adis,
						  ADIS16607_REG_DEC_RATE, dec);
			if (ret)
				return ret;
		}

		st->sample_period_ns =3D period_ns;
	}

If the write to ADIS16607_REG_USER_SYNC or the final write to
ADIS16607_REG_DEC_RATE fails, the hardware is left running with DEC_RATE =
=3D 0
(and possibly the new sync scale and st->clk_freq_mHz), while
st->sample_period_ns retains its old value from before the call.

Would this cause adis16607_fifo_drain() to compute skewed sample timestamps
on subsequent buffered reads?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261102-adis16607-=
v5-0-4f98b0d271ac@analog.com?part=3D7
