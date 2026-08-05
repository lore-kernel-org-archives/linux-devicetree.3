Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE7423EAB3
	for <devicetree@vger.kernel.org>; Wed,  5 Aug 2026 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785908957; cv=none; b=G1IccaclsqmpzCb2JYxrXz9sR+dF/UU0dcgSfpndeGv12Na83aUrYGA6Q2wgd4Sb6l6v8Uc+mm0j9ES3E/SRLhsPHL2/haHmhDWZ+WmZR5U6gZ7MZmazNKEgLdzk5+Vmb95r0XLSHsXBb8Sg/++EgqeUkwbYpGw2C2Q2PeMZPv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785908957; c=relaxed/simple;
	bh=CrUFtZ8kJr/LuVu1kLuUfUSprkyXaOM0Z/Vrj8nVFp4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IihY08voWEwBCRdzI7vqZq+9i9F+8XhQrm4fRTnX6euAIDo60QX0lXOadQ0G2AR6SaYHlW2ktZ48rpJiZETCmzf049KN19Z+KURhy5rQ5qgFDDjRXFkhZ6Enf2ADgq9JLRaC+WAEIpaDtnB7qn/NvzBGuTIfwGs1p8dwS7S5fcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iU7LYjpX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iU7LYjpX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FE91F000E9;
	Wed,  5 Aug 2026 05:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785908956;
	bh=gTDA7YIeXdYiCJxfGW9MWFdLQ8ACbBjHd0eOVMa+ny8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iU7LYjpXPhQptPXjjkgpnnGOjKAJ6nD5kh2OOvdy0H/RwV0INdP6hg2Lzmacam3gt
	 icXxL1+VEJ8wHzwHMIrGuDVz2vYah62ckmCAe0fJ7zMzLWlriGGXGW8pJtBPsRqOO4
	 W7ZaIoYjVZxApWcFesmuA/zmTyuI79S6EYftgn0TZKM1vokXLjcvYDOF5wdTuSVvLR
	 1p47ktHouCcDlz7sbt1HsNRCyHjAG9i1NW6zwE0MblVx5leBEXBlvBRfKxbCaxhumM
	 PPDmMREtQsCt5IXBnhg8YQWjrG+C29Dr1Zh5ulncpabxS/lSkZESGGBP5lXQRIwU8Z
	 6oyYAFvaRRukQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] iio: adc: ti-ads112c04: Add support for TI
 ADS112C04
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hsieh" <kylehsieh1995@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260805-ti-ads112c04-driver-v3-2-49f436829e01@gmail.com>
References: <20260805-ti-ads112c04-driver-v3-0-49f436829e01@gmail.com>
 <20260805-ti-ads112c04-driver-v3-2-49f436829e01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 05 Aug 2026 05:49:14 +0000
Message-Id: <20260805054915.D3FE91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Incorrect byte swapping for 16-bit I2C word read causes data corru=
ption on Big-Endian architectures.
- [High] The hardirq handler does not mask the interrupt or clear the hardw=
are interrupt source, leading to an infinite interrupt storm if a level-tri=
ggered IRQ is used.
- [Medium] The commit message falsely claims support for dynamic reference =
voltage scaling via `refn-supply`.
- [Medium] A delayed hardware interrupt from a previously timed-out convers=
ion can prematurely complete the wait for a new conversion, causing a read =
of stale data.
--

--- Patch [2]: [PATCH v3 2/2] iio: adc: ti-ads112c04: Add support for TI AD=
S112C04 ---
commit bffeb9c9d9c618f12635f25aeb7cd1053228824c
Author: Kyle Hsieh <kylehsieh1995@gmail.com>

iio: adc: ti-ads112c04: Add support for TI ADS112C04

Add IIO driver support for the Texas Instruments ADS112C04 (16-bit)
delta-sigma ADCs.

> - Single-shot conversions using the IIO raw read interface.
> - Dynamic parsing of single-ended and differential channels from
>   device tree child nodes.
> - Hardware interrupt support via the DRDY pin, falling back to
>   software polling if no IRQ is provided.
> - Scale calculation based on the internal 2.048V reference.
> - Dynamic reference voltage scaling via the regulator subsystem
>   (refp-supply/refn-supply), falling back to the internal 2.048V

[Severity: Medium]
The commit message mentions support for refn-supply, but does the code
actually support it?

Looking at ads112c04_probe(), it seems to explicitly reject refn-supply:

	if (device_property_present(dev, "refn-supply") ||
	    device_property_present(dev, "ti,refp-refn-resistor-ohms"))
		return dev_err_probe(dev, -EOPNOTSUPP,
				     "refn-supply and external resistors are not supported yet\n");

Could the commit message be updated to align with the implementation?

>   reference if not specified.
> - Hardware reset fallback using GPIO.
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>

[ ... ]

> diff --git a/drivers/iio/adc/ti-ads112c04.c b/drivers/iio/adc/ti-ads112c0=
4.c
> new file mode 100644
> index 0000000000000..64af866f615de
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads112c04.c

[ ... ]

> +static int ads112c04_read_data(struct ads112c04_state *st, int *val)
> +{
> +	int ret;
> +
> +	ret =3D i2c_smbus_read_word_data(st->client, ADS112C04_CMD_RDATA);
> +	if (ret < 0)
> +		return ret;
> +
> +	*val =3D sign_extend32(be16_to_cpu(ret), 15);

[Severity: High]
Does this byte swapping work correctly on big-endian architectures?

i2c_smbus_read_word_data() returns the word already converted to host
endianness based on SMBus little-endian rules. If the device sends
big-endian data, using be16_to_cpu() on the result of
i2c_smbus_read_word_data() can cause data corruption on big-endian systems.

> +
> +	return 0;
> +}
> +
> +static int ads112c04_get_adc_result(struct ads112c04_state *st,
> +				    struct iio_chan_spec const *chan,
> +				    int *val)
> +{
> +	u8 new_config0;
> +	int ret;
> +
> +	new_config0 =3D st->config0 & ~ADS112C04_CONFIG0_MUX;
> +	new_config0 |=3D FIELD_PREP(ADS112C04_CONFIG0_MUX, chan->address);
> +
> +	if (st->config0 !=3D new_config0) {
> +		ret =3D ads112c04_write_reg(st->client, ADS112C04_REG_CONFIG0, new_con=
fig0);
> +		if (ret < 0)
> +			return ret;
> +		st->config0 =3D new_config0;
> +	}
> +
> +	reinit_completion(&st->completion);
> +
> +	ret =3D ads112c04_write_cmd(st->client, ADS112C04_CMD_START_SYNC);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret =3D ads112c04_wait_for_data(st);

[Severity: Medium]
Is there a race condition here if a previous conversion timed out?

If a previous read timed out but the hardware conversion was still running,
a delayed interrupt from that previous conversion could fire immediately af=
ter
reinit_completion() is called.=20

Would this cause ads112c04_wait_for_data() to return prematurely and read
stale data?

> +	if (ret < 0)
> +		return ret;
> +
> +	return ads112c04_read_data(st, val);
> +}

[ ... ]

> +static irqreturn_t ads112c04_irq_handler(int irq, void *private)
> +{
> +	struct iio_dev *indio_dev =3D private;
> +	struct ads112c04_state *st =3D iio_priv(indio_dev);
> +
> +	complete(&st->completion);
> +
> +	return IRQ_HANDLED;
> +}

[Severity: High]
If the device tree configures this interrupt as level-triggered, could this
handler cause an interrupt storm?

The hardirq handler completes the wait but returns IRQ_HANDLED without
masking the interrupt line or clearing the hardware interrupt source.
Since devm_request_irq() is called in ads112c04_probe() with irqflags=3D0,
it allows level-triggered configurations from the device tree which would
continually fire until the data is read.

Should this use a threaded interrupt, or mask the IRQ until the data is rea=
d?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805-ti-ads112c=
04-driver-v3-0-49f436829e01@gmail.com?part=3D2
