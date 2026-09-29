Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40BB530F95A
	for <devicetree@vger.kernel.org>; Tue, 29 Sep 2026 23:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790723312; cv=none; b=lJO6/cqoP5tfMI1fYytUe/E+OryEyhNiCnv0smk0vXIbqBum6GGayJ/AJTQIVj3asBj45yOW1UdlADEnkqk1CEXv4wlLpGMu4IftSCZTggp8m9XfUY5sdLGgNpfqlmhMusap2Ut7d040uU5+ev6rOdRchqymBr0ZvKIjBLOOOks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790723312; c=relaxed/simple;
	bh=Oygqq3KqJEqfo7tX/lW0Dl0CTEF3eoWgfPjou8H5ypc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=di0ersGrXZVMPDHc0Y5mS5hA/dGWIVsKWTKUSdkNoABw71KC4xlLAJLzmxdlupRYc8z4t8TeNzQQbOcz1OGccV1iKA935ilr3l9SSq5AjGsuP9u6AyPuTnzrxoLjr579VIEmjBSDuFs9OYMqEnDsX1BMqAH9hyVxPivFSDfkaJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fGJUsznE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fGJUsznE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8F3A1F000FF;
	Tue, 29 Sep 2026 23:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790723310;
	bh=F9IKhffRO6nuSeJSqVjhONdCATa9EY/iMXy46HHqqZw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fGJUsznEqIMEE38UpJ3Wcrrxdrnv/oyou9DwszZlWes/wz4id3kFIehUfyJCS6aIR
	 VLkDehVHyTx8T4d0vZv6y65IUBhC8ev74SkveeguqggeWe7yw0QOQAazl2/23q9gWu
	 eg+T1kuOlugOATO42w5SML2r7cccd3+EqIq1SANFShgBrfPB8Q2s1xGknPBOh12ThV
	 fSaeYnEh96EgHNNbRLzVhd360bWzsrKfPn0ZlFDEEZ8AXckAm5yFZDTR3i6raCBCj8
	 jxjedHp+CgzRs3+pZmgkRT4G/MlInRktYpsbBAP+fUBeLFCRa9ggc5mOVJPYV52DBX
	 3s4orbSFdff1w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/13] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <c066072441fdba492c18c71d5332d84224379410.1790719425.git.marcelo.schmitt@analog.com>
References: <cover.1790719424.git.marcelo.schmitt@analog.com>
 <c066072441fdba492c18c71d5332d84224379410.1790719425.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 23:08:30 +0000
Message-Id: <20260929230830.A8F3A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] locking: mutex held across system calls in IIO buffer callbacks
- [High] iio: broken multi-channel readback in 4-wire fallback mode
- [High] iio: ODR GPIO uninitialized in 4-wire mode preventing software tri=
ggers
- [High] iio: data race on shared rx_buf in NO_CS mode
- [Medium] spi: local mode state desynchronized on spi_setup() failure
- [Medium] regmap: data race on global static ad4134_regmap_config
--

commit 26369b61324efb5e168b91e351dda0ac9d6716f3
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

    iio: adc: ad4134: Support SPI 4-wire mode
   =20
    AD4134 devices can be wired in a few different ways. So far, only minim=
um
    I/O mode was supported. While minimum I/O mode allows interfacing with
    AD4134 with a reduced number of wires, that wiring configuration is not
    suitable for high-throughput data acquisition.
   =20
    Extend AD4134 support to enable interfacing in SPI 4-wire configuration.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index f0196126515e6..50021001b3741 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c
[ ... ]
> @@ -226,6 +246,90 @@ static const struct regmap_access_table ad4134_regma=
p_wr_table =3D {
>  	.n_yes_ranges =3D ARRAY_SIZE(ad4134_regmap_wr_range),
>  };
> =20
> +/*
> + * When operating in modes other than minimum I/O mode, AD4134 register =
data on
> + * the SDO line is sampled on SCLK rising edge (SPI mode 0). In addition=
 to
> + * that, when AD4134 SDO and DOUT0 pins are multiplexed by hardware OUTS=
IDE
> + * AD4134 SILICON, the multiplexer state must be set to route SDO to the=
 SPI
> + * controller. With both SPI mode and multiplexer state properly set, re=
gister
> + * access runs as usual. Still, to prevent concurrent hardware interface
> + * configurations, callers must hold the access_lock. Finally, successfu=
l calls
> + * to this function must be balanced with calls to ad4134_release_reg_ac=
cess()
> + * so to release the mux state lock. See AD4134 IIO documentation for de=
tails.
> + */
> +static int ad4134_claim_reg_access(struct ad4134_state *st) __must_hold(=
&st->access_lock)
> +{
> +	unsigned int cur_mode =3D st->spi->mode & SPI_MODE_X_MASK;
> +	int ret;
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && cur_mode !=3D SPI_MODE_0=
) {
> +		st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +		st->spi->mode |=3D SPI_MODE_0;
> +		ret =3D spi_setup(st->spi);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If spi_setup() fails, the local spi->mode keeps the SPI_MODE_0 value but the
hardware isn't updated.  On the next call, cur_mode will match SPI_MODE_0,
skipping spi_setup().  Could this leave the device permanently desynchroniz=
ed
from the controller?

> +	}
> +
> +	if (st->mux_st[AD4134_SDO_INPUT])
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);
> +
> +	return 0;
> +}
[ ... ]
> @@ -268,7 +381,11 @@ static int ad4134_data_read(struct ad4134_state *st,=
 unsigned int reg,
>  {
>  	unsigned int i;
>  	u32 sample;
> -	int ret;
> +	int access_ret, ret;
> +
> +	ret =3D ad4134_claim_sample_access(st);
> +	if (ret)
> +		return ret;
> =20
>  	/*
>  	 * To be able to read data from all 4 channels through a single line, we
> @@ -284,7 +401,7 @@ static int ad4134_data_read(struct ad4134_state *st, =
unsigned int reg,
>  		ret =3D spi_write_then_read(st->spi, NULL, 0, st->rx_buf,
>  					  BITS_TO_BYTES(AD4134_CHAN_PRECISION_BITS));

[Severity: High]
Since ad4134_min_io_mode_setup() is not called in 4-wire mode,
AD4134_DATA_FORMAT_SINGLE_CH_MODE is never set. Doesn't this mean
ad4134_data_read() blindly assumes the data is serialized on DOUT0 when it
isn't? Could this result in reading Channel 0 data four times instead of the
other channels?

>  		if (ret)
> -			return ret;
> +			goto out_data_read_release;
[ ... ]
> @@ -381,6 +526,41 @@ static irqreturn_t ad4134_trigger_handler(int irq, v=
oid *p)
>  	return IRQ_HANDLED;
>  }
> =20
> +static int ad4134_buffer_postenable(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	mutex_lock(&st->access_lock);
> +
> +	ret =3D ad4134_claim_sample_access(st);
> +	if (ret)
> +		goto out_unlock;
> +
> +	return 0;
> +
> +out_unlock:
> +	mutex_unlock(&st->access_lock);
> +	return ret;
> +}
> +
> +static int ad4134_buffer_predisable(struct iio_dev *indio_dev)
> +{
> +	struct ad4134_state *st =3D iio_priv(indio_dev);
> +	int ret;
> +
> +	ret =3D ad4134_release_sample_access(st);
> +
> +	mutex_unlock(&st->access_lock);

[Severity: High]
Is it intentional to hold st->access_lock across system calls here? Returni=
ng
to user space with the mutex held violates lock ownership semantics and can
trigger lockdep splats. Furthermore, could this deadlock any subsequent sys=
fs
regmap accesses while the buffer is enabled?

> +
> +	return ret;
> +}
[ ... ]
> @@ -588,15 +768,69 @@ static int ad4134_probe(struct spi_device *spi)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D devm_mutex_init(dev, &st->access_lock);
> +	if (ret)
> +		return ret;
> +
> +	ad4134_regmap_config.lock_arg =3D st;
>  	st->regmap =3D devm_regmap_init(dev, NULL, st, &ad4134_regmap_config);

[Severity: Medium]
Is it safe to modify the global ad4134_regmap_config structure during probe?
If multiple devices probe concurrently, could this cause a data race where =
one
device's lock_arg overwrites another's before devm_regmap_init() copies it?

>  	if (IS_ERR(st->regmap))
>  		return dev_err_probe(dev, PTR_ERR(st->regmap),
>  				     "failed to initialize regmap");
[ ... ]
> +	if (st->spi_mode =3D=3D AD4134_SPI_MODE_NO_CS) {
> +		/*
> +		 * The support hardware for AD4134 may have a multiplexer for
> +		 * selecting between AD4134 SDO and AD4134 DOUT0. If that mux
> +		 * is set but the user still wants to run AD4134 in minimum I/O
> +		 * mode, then DOUT0 is not used and the multiplexer OUTSIDE OF
> +		 * AD4134 SILICON must be set to select AD4134 SDO. See AD4134
> +		 * IIO documentation for details.
> +		 */
> +		st->mux_st[AD4134_SDO_INPUT] =3D
> +			devm_mux_state_get_optional_selected(dev, "reg_access");
> +		if (IS_ERR(st->mux_st[AD4134_SDO_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_SDO_INPUT]),
> +					     "failed to get reg_access mux-state\n");
> +
> +		ret =3D ad4134_min_io_mode_setup(st);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "failed to setup minimum I/O mode\n");
> +	} else {

[Severity: High]
In 4-wire mode, ad4134_min_io_mode_setup() is bypassed. Since st->odr_gpio =
is
only retrieved inside ad4134_min_io_mode_setup(), won't it remain
uninitialized (NULL)? Will this cause all software triggers using
gpiod_set_value_cansleep(st->odr_gpio, ...) to silently fail in 4-wire mode?

> +		/*
> +		 * This controls a multiplexer OUTSIDE OF AD4134 SILICON.
> +		 * See AD4134 IIO documentation for details.
> +		 */
> +		st->mux_st[AD4134_SDO_INPUT] =3D devm_mux_state_get(dev, "reg_access");
> +		if (IS_ERR(st->mux_st[AD4134_SDO_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_SDO_INPUT]),
> +					     "failed to get reg_access mux-state\n");
> +
> +		st->mux_st[AD4134_DOUT0_INPUT] =3D devm_mux_state_get(dev, "data_read"=
);
> +		if (IS_ERR(st->mux_st[AD4134_DOUT0_INPUT]))
> +			return dev_err_probe(dev, PTR_ERR(st->mux_st[AD4134_DOUT0_INPUT]),
> +					     "failed to get data_read mux-state\n");
> +
> +		indio_dev->setup_ops =3D &ad4134_buffer_setup_ops;
> +	}

[Severity: High]
Since setup_ops is only assigned for 4-wire mode, won't NO_CS mode bypass
ad4134_buffer_postenable() entirely?  If so, doesn't that mean
ad4134_trigger_handler() uses st->rx_buf without holding st->access_lock,
creating a data race with concurrent sysfs regmap accesses?

> =20
>  	ret =3D devm_iio_triggered_buffer_setup(dev, indio_dev,
>  					      iio_pollfunc_store_time,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790719424.gi=
t.marcelo.schmitt@analog.com?part=3D10
