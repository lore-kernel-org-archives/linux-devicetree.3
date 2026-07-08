Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A103C389DE8
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783505064; cv=none; b=Wt4YJCuazluCYi2XLi6j8KR19vXyet45N7pnFfmQZnHdZi2YKrA8aLcz26t0er9/IS8Dx7Jf9GUo8CzGify+N/fFR0OrYKRXFrZm/pKqaFdYwnMN9K/1F9duJhpbSw0wu3JDVdPeMC1IdfbkyLv3ekDG0Cia8N7BJqA9FZves04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783505064; c=relaxed/simple;
	bh=gLRkGkNaqH75vttzQhC7fF/y0qsFvkQYD3LE7OkFdUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0M2MJgE7zpLPnX6R8qqXvAUxt+oSwLzSe1QO21BQ/hwU2jP6lt7AllIAVIG0s5ASz65VziW7qKHnrlKdcoQAjH47pYeeqfJLTSgEADeBDMm6MMUkNybFZekiWG+R9e8OcxSPLfq6Tmm9Pq0/jAceU++2D5Y9V6tIYlnrm5lMEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFk87coB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFk87coB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 032031F00A3E;
	Wed,  8 Jul 2026 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783505063;
	bh=0gLzWz79TlT9WcHkMMdr0Ymbse2VBlgxV9AaZlOF06k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFk87coBNZTLDm1x64gXyrOtd7wWwDVF2F5kZOdV6daZ/jSk6g7eWMu9/XhM6kH8n
	 ZZflSWMUEkaIIQ1AYuPuVuVJkKJ92J3QcYzD0wkwds5GLZqA9Fl7rjcb+lfpPLgaP2
	 EvFhljo2vPANLHQSAxxQ6MwrhHdgGkuMa3J7xBH09fCxWdyLyBbyWOdlj+/z598J7b
	 51FGAG0uGgTwaqkYy3XTgK0j7IlRgb0oskxZrqrPzNh/EcA7tLi9RWAdChDAu6nH3h
	 Cj1AjfhM3XlEO7hxvNYKIoLTrqxO63YbP7xRatt48ysoaN2h0mv3vl6bRaWUE8fuVm
	 zdSJK9L8kSILw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] iio: dac: dac8163: Add driver for DAC8163
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lukas Metz" <lukas.metz@gmx.net>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-dac8163-work-v2-2-3acd1bf20182@gmx.net>
References: <20260708-dac8163-work-v2-0-3acd1bf20182@gmx.net>
 <20260708-dac8163-work-v2-2-3acd1bf20182@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 10:04:22 +0000
Message-Id: <20260708100423.032031F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Hardware sequencing risk: external reference voltage is enabled be=
fore the analog power supply.
- [Low] Incompatible pointer type passed to `regmap_read()` causing a build=
 failure.
- [Low] Missing `select REGMAP_SPI` in Kconfig leads to build or probe fail=
ures.
--

--- Patch [2]: [PATCH v2 2/2] iio: dac: dac8163: Add driver for DAC8163 ---
commit e7b20377f202f6c225fbb971eaeb3c40d160ef56
Author: Lukas Metz <lukas.metz@gmx.net>

iio: dac: dac8163: Add driver for DAC8163

The DAC756x, DAC816x, and DAC856x devices are low-power, voltage-output,
dual-channel, 12-, 14-, and 16-bit digital-to-analog converters (DACs),
respectively. These devices include a 2.5-V, 4-ppm/=C2=B0C internal
reference, giving a full-scale output voltage range of 2.5 V or 5 V.

> diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
> index 657c68e75542e..257cb92f43fde 100644
> --- a/drivers/iio/dac/Kconfig
> +++ b/drivers/iio/dac/Kconfig
> @@ -644,6 +644,21 @@ config TI_DAC7612
> =20
>  	  If compiled as a module, it will be called ti-dac7612.
> =20
> +config TI_DAC8163
> +	tristate "Texas Instruments 12/14/16-bit 2-channel DAC driver"
> +	depends on SPI_MASTER

[Severity: Low]
Should this Kconfig select REGMAP_SPI?  If CONFIG_TI_DAC8163=3Dy is selected
without any other kernel configuration enabling REGMAP_SPI, the kernel build
might fail with a linker error for __devm_regmap_init_spi, or the driver mi=
ght
fail to probe.

> +	help
> +	  Driver for the Texas Instruments digital-to-analog converter
> +	  family dacxx6x compatible with the following variants

[ ... ]

> diff --git a/drivers/iio/dac/ti-dac8163.c b/drivers/iio/dac/ti-dac8163.c
> new file mode 100644
> index 0000000000000..6be0aac2e8753
> --- /dev/null
> +++ b/drivers/iio/dac/ti-dac8163.c
> @@ -0,0 +1,373 @@

[ ... ]

> +static int dac8163_read_raw(struct iio_dev *indio_dev,
> +			    struct iio_chan_spec const *chan, int *val,
> +			    int *val2, long mask)
> +{
> +	struct dac8163_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_RAW:
> +		ret =3D regmap_read(st->regmap,
> +				  CMD_SET(CMD_WRITE_UPDATE, chan->channel),
> +				  val);

[Severity: Low]
Can this cause a build failure on compilers that treat incompatible pointer
types as errors?  The dac8163_read_raw() function passes val (which is of
type int *) directly to regmap_read(), but regmap_read() strictly expects an
unsigned int *.

> +		if (ret)
> +			return ret;
> +		*val >>=3D chan->scan_type.shift;
> +		return IIO_VAL_INT;

[ ... ]

> +static int dac8163_probe(struct spi_device *spi)
> +{

[ ... ]

> +	if (device_property_present(&spi->dev, "vrefin-supply")) {
> +		ret =3D devm_regulator_get_enable_read_voltage(&spi->dev,
> +							     "vrefin");
> +		if (ret < 0)
> +			return ret;
> +
> +		st->vref_mV =3D ret / (MICRO / MILLI);
> +		internal_reference =3D false;
> +		st->gain =3D 1;
> +	} else {
> +		st->vref_mV =3D DAC8163_INTERNAL_REF_mV;
> +		internal_reference =3D true;
> +		st->gain =3D 2;
> +	}
> +
> +	ret =3D devm_regulator_get_enable(&spi->dev, "avdd");

[Severity: High]
Could this power sequencing damage the hardware?  During dac8163_probe(),
the external reference voltage (vrefin) is enabled before the primary analog
power supply (avdd).

Applying an external reference voltage before the analog supply is active m=
ight
forward-bias internal ESD protection diodes, which could lead to excessive
current draw or latch-up.

> +	if (ret < 0)
> +		return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dac8163-wo=
rk-v2-0-3acd1bf20182@gmx.net?part=3D2
