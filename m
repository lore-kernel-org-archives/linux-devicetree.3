Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837282E7F38
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 09:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011346; cv=none; b=eOfXYV1m4uhtUM6va6Qrl6Xfbgk6Eewpqw7SM+AIrR29j/K3WYrnrCcew7f3LgqWL7bPst8NoJiN7rqeau9dmEoXwB1akN1lr+sNllmo2MDZ8/wmFPH4owZ7hw2InFaxtEDiCGqnx3kX2E9SI8/0UJTv/HsxLNq9FXmpwSRovwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011346; c=relaxed/simple;
	bh=HBwi3946IyyE1+iWNCfvvfG4l/sQ6Pvxk89moR8MG1A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UTc9uiiFNv6qvjk2MELMTEccQlOQe7EaSi7Ap5iQ+OdoYTK2r97HwYsUoekKu/+V+T592XYBDVgu+XMLhG5WvyyATm0zX1X5uQNIbWdM+86jt95B3ajY2fOpCYLtKmf7pPlHHrjDaoXAll+K8V5+PXRvNZjfenLXKVxg8cTth2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QS8zhgnS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QS8zhgnS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E24A1C2BCB0;
	Sun, 17 May 2026 09:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779011346;
	bh=HBwi3946IyyE1+iWNCfvvfG4l/sQ6Pvxk89moR8MG1A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QS8zhgnS+Ne2gKypzQ0EHq8lawQ7XxJCIIvExfDgOYwNGJq2Slp68N63S+dxWUYBq
	 jrMlh/eieFMdnyCEOJoqYLJVNd8vGi1Qder6Uq/+P1GC7bPZTu92vZ4N5NGWVEGUS8
	 KezITc21lwD5hkH3Zf3kb8wfK3v78V0eoYAofFLXY910nE+PXm2YWh4R4HpY9o2RGy
	 Wl0tv2FWtV1yM9/oT7ydfIZLwSlp+K76Vlvmnpcyblydx4CwxQekFUwAYBr+TSVEau
	 bO9RVZNSs1h/689/+iCnpf/ckG4KSEhrnsZo6TWGDkj+SDcemu+uZfA8GeSwudLwSO
	 59hfPfOH1f22g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 08/12] iio: frequency: adf41513: driver
 implementation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260517-adf41513-iio-driver-v13-8-bb6e134a360f@analog.com>
References: <20260517-adf41513-iio-driver-v13-8-bb6e134a360f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 09:49:05 +0000
Message-Id: <20260517094905.E24A1C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Variable modulus fractional calculation (frac2) can mathematically=
 exceed the mod2 limit due to truncation error magnification.
- [High] Cached software state is modified before SPI writes and is not rev=
erted if the write fails, causing state corruption.
- [Medium] Repeated `dev_warn` inside the frequency calculation loop causes=
 kernel log spam.
--

commit 747ff374d7103b5e48e4b8ca3fdb7f75aac19a6d
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: adf41513: driver implementation

This commit adds support for the Analog Devices ADF41513 26.5 GHz
Integer-N/Fractional-N PLL Frequency Synthesizer.

> diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf=
41513.c
> new file mode 100644
> index 0000000000000..20ea7e82818f2
> --- /dev/null
> +++ b/drivers/iio/frequency/adf41513.c

[ ... ]

> +static int adf41513_calc_pfd_frequency(struct adf41513_state *st,
> +				       struct adf41513_pll_settings *result,
> +				       u64 fpfd_limit_uhz)
> +{
> +	result->ref_div2 =3D st->data.ref_div2_en;
> +	result->ref_doubler =3D st->data.ref_doubler_en;
> +
> +	if (st->data.ref_doubler_en &&
> +	    st->ref_freq_hz > ADF41513_MAX_REF_FREQ_DOUBLER_HZ) {
> +		result->ref_doubler =3D 0;
> +		dev_warn(&st->spi->dev, "Disabling ref doubler due to high reference f=
requency\n");

Will this cause kernel log spam if an application frequently changes the
frequency? Since ref_doubler_en and ref_freq_hz are constant after probe,
could we validate this once during initialization or use dev_warn_once()
here?

> +	}

[ ... ]

> +static int adf41513_calc_variable_mod(struct adf41513_state *st,
> +				      struct adf41513_pll_settings *result)
> +{

[ ... ]

> +	/* calculate frac1 and frac2 */
> +	frac1 =3D mul_u64_u64_div_u64(freq_error_uhz, ADF41513_FIXED_MODULUS,
> +				    result->pfd_frequency_uhz);
> +	freq_error_uhz -=3D mul_u64_u32_div(result->pfd_frequency_uhz, frac1,
> +					  ADF41513_FIXED_MODULUS);
> +	frac2 =3D mul_u64_u64_div_u64(freq_error_uhz, mod2 * ADF41513_FIXED_MOD=
ULUS,
> +				    result->pfd_frequency_uhz);

Can this calculation result in a frac2 value that exceeds mod2?=20

Because mul_u64_u32_div() truncates the remainder during the integer
division, the subtracted value might be smaller than the exact mathematical
contribution of frac1. This leaves freq_error_uhz artificially larger than
its theoretical bound.=20

When frac2 is computed by multiplying this enlarged error by
(mod2 * ADF41513_FIXED_MODULUS), couldn't the result exceed mod2? If
the hardware requires frac2 < mod2, should we cap frac2 or handle the
remainder differently?

> +
> +	/* integer part */
> +	result->actual_frequency_uhz =3D (u64)int_val * result->pfd_frequency_u=
hz;

[ ... ]

> +static int adf41513_set_frequency(struct adf41513_state *st, u64 freq_uh=
z, u16 sync_mask)
> +{
> +	struct adf41513_pll_settings result;
> +	int ret;
> +
> +	ret =3D adf41513_calc_pll_settings(st, &result, freq_uhz);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* apply computed results to pll settings */
> +	st->settings =3D result;

If adf41513_sync_config() fails at the end of this function, does this leave
st->settings corrupted? If so, subsequent reads might incorrectly report the
failed frequency as active.

> +
> +	dev_dbg(&st->spi->dev,

[ ... ]

> +static int adf41513_suspend(struct adf41513_state *st)
> +{
> +	st->regs[ADF41513_REG6] |=3D FIELD_PREP(ADF41513_REG6_POWER_DOWN_MSK, 1=
);
> +	return adf41513_sync_config(st, ADF41513_SYNC_DIFF);

Similarly, if adf41513_sync_config() fails here, the power-down bit remains
set in st->regs[ADF41513_REG6]. Could this inadvertently power down the PLL
during a later register sync?

> +}

[ ... ]

> +static int adf41513_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long info)
> +{
> +	struct adf41513_state *st =3D iio_priv(indio_dev);
> +	u64 tmp64 =3D iio_val_s64_compose(val, val2);
> +	u16 phase_val;
> +	int ret;
> +
> +	guard(mutex)(&st->lock);
> +
> +	switch (info) {
> +	case IIO_CHAN_INFO_FREQUENCY:
> +		return adf41513_set_frequency(st, tmp64, ADF41513_SYNC_DIFF);
> +	case IIO_CHAN_INFO_PHASE:
> +		if (tmp64 >=3D ADF41513_MAX_PHASE_MICRORAD)
> +			return -EINVAL;
> +
> +		phase_val =3D DIV_U64_ROUND_CLOSEST(tmp64 << 12,
> +						  ADF41513_MAX_PHASE_MICRORAD);
> +		phase_val =3D min(phase_val, ADF41513_MAX_PHASE_VAL);
> +		st->regs[ADF41513_REG2] |=3D ADF41513_REG2_PHASE_ADJ_MSK;
> +		FIELD_MODIFY(ADF41513_REG2_PHASE_VAL_MSK,
> +			     &st->regs[ADF41513_REG2], phase_val);
> +		ret =3D adf41513_sync_config(st, ADF41513_SYNC_REG0);
> +		if (ret)
> +			return ret;
> +
> +		/* clear phase adjust for the next sync */
> +		st->regs[ADF41513_REG2] &=3D ~ADF41513_REG2_PHASE_ADJ_MSK;

If adf41513_sync_config() fails above, the early return leaves the
ADF41513_REG2_PHASE_ADJ_MSK bit set in st->regs. Could this cause unintended
phase adjustments during subsequent frequency changes or register syncs?

> +		return 0;
> +	default:
> +		return -EINVAL;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260517-adf41513-i=
io-driver-v13-0-bb6e134a360f@analog.com?part=3D8
