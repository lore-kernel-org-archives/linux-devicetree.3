Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795817215;
	b=KS7AAS6PBTZeZzGXXILWl5lj3Il3sEbiuvMjB2tlgRWH+TboteeCnXkyPJCwP+HwDx8x
	 navqSVEyY40S+9HJyXDFnmgfkpSCX0Q+0NWlDZFXNtO6NNBGBqzq9pFJpQONFnG2NMgaK
	 kKlRqTYXu+grIaTxe5Cxin3VNkKY8L6uynCFpBJTNgPP/fWHJb4NcBldmCrfy+tGq7+fq
	 EBFsl23NU5fX0XeJHncUqMtK6p4BxGjiV3Q4ThM/NFPx+I5FChrCS5ZFfHqWDRc1vz/gT
	 GXIWTlkS4ARBvvMN6XQT4URUUosBpN71cdQqwZPiqYSxSU/VOaSyilOfcYLhPVApPsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795817215;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=stpZ/717q5+0/gx2jbbvpV8E2nzgOmMEOsyF8oGrDJg=;
	b=vu0yA9zcI/mcqZaz1hE3CdBiVHncmfeTQxXUA9e5SlYmZ7Dz8/fD71qkPcb76hX4tAU6
	 m6w6BCqk+baInzHmeNDNmgGiBPKrvXP0ZHWt8xE9/hfpZTw5m5A2dYlyFOs7Im5EBTT5k
	 8Ke76SgTHJrYD2CaVmMmOE9TlDTaTTV6CCdlpZnylvzpypmYM9u0JB22goYkV9pZFP68b
	 /InO0rCkthPchH8I9rWo0lq4jzh+IEE4uqy2zEhs0YcOLcYjC8CRMKb39+s/F9fTkMScs
	 OGMk85e2UsIa8X13C4wfNlypwd1zWX+w7kHmdT4+5pIj0jIBoTyaaLArtzxvTxF1LvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlKx4PFl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AF5606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 22:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OlKx4PFl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DE81F00898;
	Fri, 27 Nov 2026 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795817214;
	bh=stpZ/717q5+0/gx2jbbvpV8E2nzgOmMEOsyF8oGrDJg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OlKx4PFlBCBDBb1hdd+hOeUm3+OUBFY2KOL6DIjaWxM8LzivAXOMIGBnSNRHon6ie
	 eGAmyl6j9mkq3W2485j9NOZT5NaVb5/HLIRAEWhEn4abkx8b39zQz6b8cQStX9SIMV
	 BFEMiTV5XPaabGY/L84Esnx11zkjGlcrqdzQf9Lapg0JJlait+mgIyMhg0lPoc3Ne9
	 OJuD1kv96lKF9nsG0ZrgbdxnLOvbIMinP/ED03Paq0zxsIbXci74REk3Ku1nPtYZi4
	 UwtVTfV2WYbLqiYkZWh/8CQIxprU3H1rwMjU4/Uz7uX9tWgc9Rsw5rVK0o/lB96cD7
	 tnGpGVqy8S9GA==
Message-ID: <sashiko-outbox-238318@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/5] iio: adc: Add support for ADA4355 and similar
 ADCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Marcelo Schmitt" <marcelo.schmitt@analog.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <e82c0e4ce3968c6e26e05223510e8b51972a6e44.1795816065.git.marcelo.schmitt@analog.com>
References: <cover.1795816065.git.marcelo.schmitt@analog.com>
 <e82c0e4ce3968c6e26e05223510e8b51972a6e44.1795816065.git.marcelo.schmitt@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 22:06:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [Medium] iio: adc: ada4355: pass ret instead of PTR_ERR(st->back) in
  ada4355_probe()
- [Medium] iio: adc: ada4355: missing cleanup on frame error in
  ada4355_calibrate()
- [Medium] iio: adc: ada4355: reject non-positive sampling freq in
  ada4355_write_raw()
- [Medium] iio: adc: ada4355: missing vea and ved supply enable in
  ada4355_probe()
--

commit 16b7c5a177ca16d48ca83a8d082c7d1e3ecf562a
Author: Marcelo Schmitt <marcelo.schmitt@analog.com>

iio: adc: Add support for ADA4355 and similar ADCs

This commit adds an IIO ADC driver for the Analog Devices ADA4355 and
ADA4356 14-bit, 125 MSPS analog-to-digital converters with IIO backend
support.

> diff --git a/drivers/iio/adc/ada4355.c b/drivers/iio/adc/ada4355.c
> new file mode 100644
> index 0000000000000..5a3f480362538
> --- /dev/null
> +++ b/drivers/iio/adc/ada4355.c
> @@ -0,0 +1,822 @@

[ ... ]

> +static int ada4355_calibrate(struct ada4355_state *st)
> +{
> +	int ret, ret2;
> +
> +	/* all points invalid */
> +	bitmap_fill(st->calib_map, st->calib_map_size);
> +
> +	ret =3D ada4355_calibrate_prepare(st);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The frame signal has to be aligned first: the pattern match block
> +	 * only reports meaningful per-lane errors once the word boundary is
> +	 * known.
> +	 */
> +	ret =3D ada4355_calibrate_lane(st, IIO_BACKEND_CALIB_SOURCE_FRAME,
> +				     ADA4355_FRAME_LANE,
> +				     ADA4355_MAX_DATA_LANES * ADA4355_MAX_TEST_POINTS);
> +	if (ret)
> +		return ret;

[Severity: Medium]
Should this error path call ada4355_calibrate_stop(st) like the data-lane
loop below does?  If frame-lane calibration fails during a runtime clock
update (ada4355_write_raw() -> ada4355_update_clock()), returning directly
leaves backend channel 0 enabled and the ADC stuck in
ADA4355_TEST_MODE_USER outputting the 0xFFFC calibration pattern.

[ ... ]

> +static int ada4355_write_raw(struct iio_dev *indio_dev,
> +			     struct iio_chan_spec const *chan,
> +			     int val, int val2, long mask)
> +{
> +	struct ada4355_state *st =3D iio_priv(indio_dev);
> +	long r_clk;
> +
> +	IIO_DEV_ACQUIRE_DIRECT_MODE(indio_dev, claim);
> +	if (IIO_DEV_ACQUIRE_FAILED(claim))
> +		return -EBUSY;
> +
> +	switch (mask) {
> +	case IIO_CHAN_INFO_SAMP_FREQ:
> +		r_clk =3D clk_round_rate(st->clk, val);
> +		if (r_clk < 1 || r_clk > ADA4355_MAX_SAMP_RATE_SPS)
> +			return -ERANGE;
> +
> +		return ada4355_update_clock(st, r_clk);

[Severity: Medium]
Should val <=3D 0 be rejected before calling clk_round_rate()?
clk_round_rate() takes an unsigned long, so a negative val wraps to a large
positive rate that the clock provider can clamp into
[1, ADA4355_MAX_SAMP_RATE_SPS] (and 0 can round up to the minimum supported
rate), reconfiguring the ADC clock instead of returning an error.

[ ... ]

> +static int ada4355_probe(struct spi_device *spi)
> +{

[ ... ]

> +	ret =3D devm_regulator_get_enable(dev, "vcc");
> +	if (ret < 0)
> +		return dev_err_probe(dev, PTR_ERR(st->back),
> +				     "failed to get vcc supply\n");

[Severity: Medium]
Does this pass PTR_ERR(st->back) instead of ret to dev_err_probe()?
st->back is still NULL here, so ada4355_probe() returns 0 on regulator
failure, skipping deferred probe and leaving the device bound without
completing setup or registering the IIO device.

[Severity: Medium]
Should ada4355_probe() also enable the vea and ved supplies?  The
Documentation/devicetree/bindings/iio/adc/adi,ada4355.yaml binding defines
vea-supply and ved-supply for the 1.8V analog and digital ADC rails, so
boards driving them from external regulators will leave those rails
unpowered.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795816065.gi=
t.marcelo.schmitt@analog.com?part=3D5
