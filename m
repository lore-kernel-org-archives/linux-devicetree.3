Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19EA935676A
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 22:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778539436; cv=none; b=YNYOYN0WF9aJx5yiFEDWIUBbRm/r7o5RLkuV1KdQXs5mnpWExhdepgPRadF6deu7PbuceG6kJ0KGgtC6FtRQE477Wt4oBdmDhaq3Vrt9XzPslrr0tIcTwif2hrKi6/7+Hz0dB0UhDPmZglyajd0v6I3OelTV5XBNGsFBoYTXfYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778539436; c=relaxed/simple;
	bh=D1IjLmrvVjZAK20ubVo+Q5/KtIK9sCjmA9kI871fuGI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LfMhXHvNchlkzhEF04XwLbRYqEzT2gMzgPXJgQL+YWyxZxqz6FtoLzqp3LsILf3xdzsmsBj3WPkwYxMCFBmzP8H8Tn9jvcUs7Iy2NbB76ucP9IU9RTsGQenTzkT1FZMwxPjulqNlLrxHEsXMwpuEE1dmHqr055HAddjXC6zRoo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h+9FwTQ9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h+9FwTQ9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ED49C2BCB0;
	Mon, 11 May 2026 22:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778539435;
	bh=D1IjLmrvVjZAK20ubVo+Q5/KtIK9sCjmA9kI871fuGI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=h+9FwTQ9cq9R3WXMpFjPHRTu51iTovdiIR9+q15haV4cB7lJA3WY8orZ2SNOhUKhH
	 GbRTc5CVP9cYizEDSW8S4dQ7QDfnbV0te2eHNKJBAkHynPmzukC5ZTHcYtf1lQo98p
	 5mOyLYrXUO9qhnlwB3r6MbpFIhKJHxexYgniOdK6/dyrM+M5pfglHFqJSWgI/4wCuL
	 dLiH/muilMOSt0Qq3LHyzGQDpF+kBlbA1KgOZe9hpYKdvdWgPvRlosRO9HG+u8Y68V
	 SItpmWS/zPVdT59KG0NRcQJGzvXqe7XeQ3YCxRIFEpI/Ukxu/dW4x9JkB+z4xo3O0P
	 pB4NJSDrluerQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 07/11] iio: frequency: adf41513: driver
 implementation
Reply-To: sashiko@lists.linux.dev
To: "Rodrigo Alencar via B4 Relay" <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260510-adf41513-iio-driver-v12-7-34af2ed2779f@analog.com>
References: <20260510-adf41513-iio-driver-v12-7-34af2ed2779f@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:43:54 +0000
Message-Id: <20260511224355.6ED49C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Hardware state is lost if system suspend occurs while device is po=
wered down.
- [High] `adf41513_calc_fixed_mod` uses uninitialized `regs_hw` cache durin=
g probe, causing an incorrect initial output frequency.
- [High] Arithmetic underflow in `adf41513_calc_fixed_mod` causes valid fre=
quency configurations to fail with `-ERANGE`.
- [Medium] The phase adjustment bit (`ADF41513_REG2_PHASE_ADJ_MSK`) is set =
but never cleared, causing unintended phase shifts on subsequent frequency =
updates.
- [Medium] Software state is permanently modified before SPI write succeeds=
, causing a state mismatch on SPI failure.
--

commit 5877506cf62b15b22549417e5996d3ed6f4bfd57
Author: Rodrigo Alencar <rodrigo.alencar@analog.com>
Subject: iio: frequency: adf41513: driver implementation

This commit introduces a driver for the Analog Devices ADF41513 PLL
frequency synthesizer. The driver supports integer-N and fractional-N
synthesis modes, high-resolution microhertz frequency calculations, and
includes power management suspend/resume callbacks.

> diff --git a/drivers/iio/frequency/adf41513.c b/drivers/iio/frequency/adf=
41513.c
> --- /dev/null
> +++ b/drivers/iio/frequency/adf41513.c

[ ... ]

> +static int adf41513_calc_fixed_mod(struct adf41513_state *st,
> +				   struct adf41513_pll_settings *result)
> +{
> +	u64 resolution_uhz =3D div_u64(result->pfd_frequency_uhz, ADF41513_FIXE=
D_MODULUS);
> +	u64 target_frequency_uhz =3D result->target_frequency_uhz;
> +	u64 freq_error_uhz;
> +	u32 int_val, frac1;
> +	bool lsb_p1_offset =3D !FIELD_GET(ADF41513_REG5_LSB_P1_MSK, st->regs_hw=
[ADF41513_REG5]);

During setup, st->regs_hw is initialized to 0xFFFFFFFF to force a full write
on the first sync.

Since regs_hw is all 1s, lsb_p1_offset will evaluate to false here, but the
true intended configuration in st->regs has this bit as 0.

Will this cause the algorithm to skip subtracting the offset while the hard=
ware
actually adds it? Should this check read from st->regs[ADF41513_REG5] inste=
ad?

[ ... ]

> +	/* compute frac1 and fixed modulus error */
> +	frac1 =3D mul_u64_u64_div_u64(freq_error_uhz, ADF41513_FIXED_MODULUS,
> +				    result->pfd_frequency_uhz);
> +	freq_error_uhz -=3D mul_u64_u32_div(result->pfd_frequency_uhz, frac1,
> +					  ADF41513_FIXED_MODULUS);
> +
> +	/* check if freq error is within a tolerance of 1/2 resolution */
> +	if (freq_error_uhz > (resolution_uhz >> 1) && frac1 < (ADF41513_FIXED_M=
ODULUS - 1)) {
> +		frac1++;
> +		freq_error_uhz =3D resolution_uhz - freq_error_uhz;

The resolution_uhz calculation uses div_u64(), which truncates the true
frequency step.

Because of this truncation, is it possible for freq_error_uhz to be strictly
greater than resolution_uhz here?

If so, does the unsigned subtraction resolution_uhz - freq_error_uhz underf=
low
and produce a large value that falsely triggers the -ERANGE error below?

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

[ ... ]

> +	if (st->settings.mode =3D=3D ADF41513_MODE_INTEGER_N) {
> +		st->regs[ADF41513_REG6] |=3D ADF41513_REG6_INT_MODE_MSK;
> +		st->regs[ADF41513_REG6] &=3D ~ADF41513_REG6_BLEED_ENABLE_MSK;
> +	} else {
> +		st->regs[ADF41513_REG6] &=3D ~ADF41513_REG6_INT_MODE_MSK;
> +		st->regs[ADF41513_REG6] |=3D ADF41513_REG6_BLEED_ENABLE_MSK;
> +	}
> +
> +	return adf41513_sync_config(st, sync_mask | ADF41513_SYNC_REG0);
> +}

If the adf41513_sync_config() SPI write fails, st->settings and st->regs
have already been updated with the new configuration.

Will a subsequent read of the frequency channel via adf41513_pll_get_rate()
return this failed frequency instead of the actual physical hardware freque=
ncy?

[ ... ]

> +static int adf41513_write_raw(struct iio_dev *indio_dev,
> +			      struct iio_chan_spec const *chan,
> +			      int val, int val2, long info)
> +{

[ ... ]

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
> +		return adf41513_sync_config(st, ADF41513_SYNC_REG0);

The ADF41513_REG2_PHASE_ADJ_MSK bit is set in the software shadow register,
but does not appear to be cleared after the shift completes.

Because the hardware evaluates the PHASE_ADJ bit in REG2 on every REG0 writ=
e,
could this cause unintended phase shifts during future frequency updates?

[ ... ]

> +static int adf41513_pm_resume(struct device *dev)
> +{
> +	struct adf41513_state *st =3D dev_get_drvdata(dev);
> +
> +	guard(mutex)(&st->lock);
> +	if (st->powerdown)
> +		return 0; /* nothing to do */
> +
> +	return adf41513_resume(st);
> +}

If the system cuts power to the regulators during sleep, the chip wakes up
in its default Power-On Reset (POR) state.

If st->powerdown is true, this function returns early and st->regs_hw is
not invalidated.

Could this leave the software state out of sync with the physical hardware,
causing future partial writes to leave the chip unconfigured?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-adf41513-i=
io-driver-v12-0-34af2ed2779f@analog.com?part=3D7
