Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792796113;
	b=DLkpAynIMya0v6I/XxuG+b80x8VYitLTVwDufP3RQOangrrZ7HUNzj67u/9jA1Fy/JBL
	 Xf73Fu2OX5r/hKRcjTFFkqduwFGFERsqtNifW0K9tF0gVEd25YC4pVqJ8brFBgyefgm4X
	 5iIr/7hcNIpJ9+36KlKe/Xsq7/DGScLWbBUbiLz1nj+SE3bp+g2JLy7U8dIPcqVzCD7Fn
	 MuNQLaQHKGfTsvVWbpf3c8tr3edr299bnyVWQJD653DuS+tlwNDjbBpsIyAjiMV1Q80FK
	 X9Q6PaIQ1wW7+/2p2szWeTGMgAPK7B1/R6FZvfEiT1jKVWqilpC6RNpEBxjH3ZKT1TA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792796113;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=MmwIB47NU7LpmpHmjbdAghXH/+H5H3D3MvJIH4OVVGE=;
	b=ehBinSUvwX7qpHl8LePUp1Iz+pn1zPTwJJVGEo8w1XGgaid3NbnLCkb0GmqlzEQBCwm9
	 eJ/8j8o/NycKeqMsRLcebeQAkdXwIvhZ94TSlyq4/r8aKQuKDW/JEgQRUY1XYCwdhwQPf
	 vb+9KVB3gmAlggD20o6CCdHYyx2VGcPz0gQSjYoM2CqJ1vUVipli4Q07mRflTAbYr1v8m
	 QjiTiBwFGZpB5i4gSn/wBVNLf0qF9ml4q/xUmRjGsEvdaHi8hBRFMZA5xpf3Dba1EUm7q
	 PW3cjQ/ZpN+U15JDekMCbrOJuMbGtVCEc+DrYzQBulrgfn8KbxkmqRvlnqG0KLFncZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="SUX7/QQU";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834A3606A31A
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 22:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SUX7/QQU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308C21F01825;
	Fri, 23 Oct 2026 22:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792796113;
	bh=MmwIB47NU7LpmpHmjbdAghXH/+H5H3D3MvJIH4OVVGE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SUX7/QQUK27FRq1xitRQt9BSpIpTOxU8wUq3SoY1fgIuS4YMZy7YRPx1Var1brcTh
	 ZmuFic0LczvV14gGF+tW283XAnenfFJyxZ/A1a4QDWSSOP3weXJkDx1iWIykHmseBg
	 wD/w9zkl8AvZp4bv2a5f8DquKyizx4oDMvFpiqkSIqVV9lHlOXEfLheRnyoz2Ew+Pu
	 N5uIKOD/1U7rrPpGY8/7bteeDcAnPkWlYPze2S3ozIakhcBJQF2mx7gATeVCUiJesY
	 qVYhtZSrn4GGJJP52ThwczVK+FUHOUUk44U/yJ2Z7cNfIYXE6hYt7kiQUccnMvX37n
	 nVDouR8CgWrTg==
Message-ID: <sashiko-outbox-183334@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/16] iio: adc: ad4134: Support SPI 4-wire mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <d7e9cffc6a8c90295631b2b6119743d37b8ccce5.1792792325.git.marcelo.schmitt@analog.com>
References: <cover.1792792325.git.marcelo.schmitt@analog.com>
 <d7e9cffc6a8c90295631b2b6119743d37b8ccce5.1792792325.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 22:55:12 +0000
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
- [High] iio: adc: ad4134: broken ACQUIRE() and DEFINE_GUARD_COND() for acc=
ess claims
- [Medium] iio: adc: ad4134: duplicate devm_mux_state_get() call in ad4134_=
probe()
--

commit 2e7d5e9974efe0835378f504b67e632ce2d53ac2
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: ad4134: Support SPI 4-wire mode

This commit adds support for interfacing with the AD4134 ADC in SPI 4-wire
mode using an external multiplexer to switch between register access on SDO
and ADC sample data reads on DOUT0.

> diff --git a/drivers/iio/adc/ad4134.c b/drivers/iio/adc/ad4134.c
> index 4252244a23bc9..4efb63c45aa29 100644
> --- a/drivers/iio/adc/ad4134.c
> +++ b/drivers/iio/adc/ad4134.c

[ ... ]

> @@ -221,6 +239,99 @@ static const struct regmap_access_table ad4134_regma=
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
> + * access runs as usual. Successful calls to this function must be balan=
ced with
> + * calls to ad4134_release_reg_access() so to release the mux state lock=
. See
> + * AD4134 IIO documentation for details.
> + */
> +static int ad4134_claim_reg_access(struct ad4134_state *st)
> +{
> +	unsigned int spi_mode =3D st->spi->mode & SPI_MODE_X_MASK;
> +	int ret;
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && spi_mode !=3D SPI_MODE_0=
) {
> +		st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +		st->spi->mode |=3D SPI_MODE_0;
> +		ret =3D spi_setup(st->spi);
> +		if (ret) {
> +			st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +			st->spi->mode |=3D spi_mode;
> +			return ret;
> +		}
> +	}
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && st->mux_st[AD4134_SDO_IN=
PUT])
> +		return mux_state_select(st->mux_st[AD4134_SDO_INPUT]);
> +
> +	return 0;
> +}
> +
> +/*
> + * Must be balanced with successful calls to ad4134_claim_reg_access().
> + */
> +static int ad4134_release_reg_access(struct ad4134_state *st)
> +{
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && st->mux_st[AD4134_SDO_IN=
PUT])
> +		return mux_state_deselect(st->mux_st[AD4134_SDO_INPUT]);
> +
> +	return 0;
> +}
> +
> +DEFINE_GUARD(__ad4134_reg_access_mode, struct ad4134_state *,
> +	     ad4134_claim_reg_access(_T), ad4134_release_reg_access(_T));
> +DEFINE_GUARD_COND(__ad4134_reg_access_mode, _try, ad4134_claim_reg_acces=
s(_T));
> +
> +/*
> + * When operating in modes other than minimum I/O mode, AD4134 ADC sampl=
e data
> + * on the DOUT lines is sampled on SCLK falling edge (SPI mode 1). In ad=
dition
> + * to that, when AD4134 SDO and DOUT0 pins are multiplexed by hardware O=
UTSIDE
> + * AD4134 SILICON, the multiplexer state must be set to route DOUT0 to t=
he SPI
> + * controller. With both SPI mode and multiplexer state properly set, ADC
> + * samples can be read normally. Successful call to this function must b=
e paired
> + * with a call to ad4134_release_sample_access().
> + */
> +static int ad4134_claim_sample_access(struct ad4134_state *st)
> +{
> +	unsigned int spi_mode =3D st->spi->mode & SPI_MODE_X_MASK;
> +	int ret;
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && spi_mode !=3D SPI_MODE_1=
) {
> +		st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +		st->spi->mode |=3D SPI_MODE_1;
> +		ret =3D spi_setup(st->spi);
> +		if (ret) {
> +			st->spi->mode &=3D ~SPI_MODE_X_MASK;
> +			st->spi->mode |=3D spi_mode;
> +			return ret;
> +		}
> +	}
> +
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && st->mux_st[AD4134_DOUT0_=
INPUT])
> +		return mux_state_select(st->mux_st[AD4134_DOUT0_INPUT]);
> +
> +	return 0;
> +}
> +
> +/*
> + * Must be balanced with successful calls to ad4134_claim_sample_access(=
).
> + */
> +static int ad4134_release_sample_access(struct ad4134_state *st)
> +{
> +	if (st->spi_mode !=3D AD4134_SPI_MODE_NO_CS && st->mux_st[AD4134_DOUT0_=
INPUT])
> +		return mux_state_deselect(st->mux_st[AD4134_DOUT0_INPUT]);
> +
> +	return 0;
> +}
> +
> +DEFINE_GUARD(__ad4134_sample_access_mode, struct ad4134_state *,
> +	     ad4134_claim_sample_access(_T), ad4134_release_sample_access(_T));
> +DEFINE_GUARD_COND(__ad4134_sample_access_mode, _try, ad4134_claim_sample=
_access(_T));
> +
>  static int ad4134_calc_spi_crc(u8 inst, u8 data)
>  {
>  	u8 buf[] =3D { inst, data };
> @@ -246,6 +357,10 @@ static int ad4134_reg_write(void *context, unsigned =
int reg, unsigned int val)
>  	};
>  	int ret;
> =20
> +	ACQUIRE(__ad4134_reg_access_mode, claim)(st);
> +	if (ACQUIRE_ERR(__ad4134_reg_access_mode, &claim))
> +		return -EBUSY;
> +
>  	ad4134_prepare_spi_tx_buf(reg, val, st->tx_buf);
> =20
>  	ret =3D spi_sync_transfer(st->spi, &xfer, 1);
> @@ -265,6 +380,10 @@ static int ad4134_data_read(struct ad4134_state *st,=
 unsigned int reg,
>  	u32 sample =3D 0;
>  	int ret;
> =20
> +	ACQUIRE(__ad4134_sample_access_mode, claim)(st);
> +	if (ACQUIRE_ERR(__ad4134_sample_access_mode, &claim))
> +		return -EBUSY;
> +
>  	/*
>  	 * To be able to read data from all 4 channels through a single line, we
>  	 * set DOUTx output format to 0 in the digital interface config register
> @@ -305,6 +424,10 @@ static int ad4134_register_read(struct ad4134_state =
*st, unsigned int reg,
>  	unsigned int inst;
>  	int ret;
> =20
> +	ACQUIRE(__ad4134_reg_access_mode, claim)(st);
> +	if (ACQUIRE_ERR(__ad4134_reg_access_mode, &claim))
> +		return -EBUSY;

[Severity: High]
Are these guard definitions and ACQUIRE() calls handling claim failures as
intended?

In ad4134_reg_write(), ad4134_data_read(), and ad4134_register_read(),
ACQUIRE() and ACQUIRE_ERR() are called with the unconditional guard classes
__ad4134_reg_access_mode and __ad4134_sample_access_mode rather than the
conditional _try variants (__ad4134_reg_access_mode_try and
__ad4134_sample_access_mode_try).

DEFINE_GUARD() defines a constructor of the form ({ _lock; _T; }), which
discards the return value of ad4134_claim_reg_access(st) or
ad4134_claim_sample_access(st) and unconditionally initializes claim to the
valid pointer st. As a result, ACQUIRE_ERR(..., &claim) always evaluates to=
 0.
If spi_setup() or mux_state_select() fails, the error is ignored, the SPI
transfer runs with the wrong SPI mode or mux routing, and scope exit runs
ad4134_release_*_access() -> mux_state_deselect(), calling up(&mux->lock) on
a semaphore that was never acquired.

Additionally, the conditional guards use the 3-argument DEFINE_GUARD_COND()
macro:

include/linux/cleanup.h:
#define DEFINE_GUARD_COND_3(_name, _ext, _condlock) \
	DEFINE_GUARD_COND_4(_name, _ext, _condlock, _RET)

Because ad4134_claim_reg_access() and ad4134_claim_sample_access() return 0
on success and a negative errno on failure, the default _RET condition trea=
ts
0 as failure and negative error codes as success. Should DEFINE_GUARD_COND()
pass _RET =3D=3D 0 as the fourth argument, and should the callers use
__ad4134_reg_access_mode_try and __ad4134_sample_access_mode_try?

[ ... ]

> @@ -593,10 +727,64 @@ static int ad4134_probe(struct spi_device *spi)

[ ... ]

> +	} else {
> +		/*
> +		 * This controls a multiplexer OUTSIDE OF AD4134 SILICON.
> +		 * See AD4134 IIO documentation for details.
> +		 */
> +		mux_st =3D devm_mux_state_get(dev, "reg_access");
> +		if (IS_ERR(mux_st))
> +			return dev_err_probe(dev, PTR_ERR(mux_st),
> +					     "failed to get reg_access mux-state\n");
> +
> +		st->mux_st[AD4134_SDO_INPUT] =3D mux_st;
> +
> +		mux_st =3D devm_mux_state_get(dev, "data_read");
> +		st->mux_st[AD4134_DOUT0_INPUT] =3D devm_mux_state_get(dev, "data_read"=
);
> +		if (IS_ERR(mux_st))
> +			return dev_err_probe(dev, PTR_ERR(mux_st),
> +					     "failed to get data_read mux-state\n");
> +
> +		st->mux_st[AD4134_DOUT0_INPUT] =3D mux_st;

[Severity: Medium]
In ad4134_probe(), when st->spi_mode is not AD4134_SPI_MODE_NO_CS,
devm_mux_state_get(dev, "data_read") is called twice in succession, and the
second call's result in st->mux_st[AD4134_DOUT0_INPUT] is later overwritten
by mux_st without checking for errors.

Was the second devm_mux_state_get(dev, "data_read") call left in by mistake
when introducing the mux_st local variable, leaving an extra struct mux_sta=
te
allocation and mux_chip reference held for the lifetime of the device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792792325.gi=
t.marcelo.schmitt@analog.com?part=3D13
