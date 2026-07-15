Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEEC18AE3
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784073933; cv=none; b=Jcg4/qXxP80mXAId/PqGIK9DzonAZBFnjYIxDUNySaUkF2uEJr58y+xNc+Dx3xVcbjXyQFnKzqckC7gyqVuK/vdnnxhuDP1uTrxH/HcKppLJENaac0bgTWojFXQJVKm7K9DsP/BR9ksuOWCJbMx8DON0PcM8sTvlG0vCr64bizY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784073933; c=relaxed/simple;
	bh=0LPvdgFsCk1QwQTxoztYVMokCQFkj5HFn0fYbtb609U=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kH8KTcy5TnUlQ0UK5Y/q3YSOip7ia7xz+TkSGyXoAwTcMtRA42fyE6c2RDSlXuHn9rgSdFz3vpEWPgGLGVc4+WZz/mVJtAer4A3Om2PuWb25EJzlbGx0V9vwGorH22zKrnlTuylBU617/thr3qj1o3tePnKovY6bBJ8zLndvdRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ErLZ7dtk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ErLZ7dtk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D6111F000E9;
	Wed, 15 Jul 2026 00:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784073931;
	bh=m2DmVhskzwTgMWy9NdOE3rsvRzJ7TDucKgOPQgi/3m4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ErLZ7dtkNk5pdvlgCUKUx2aoDD2mv4fCtitR9ivMWyOSsvAbHks2RuxOFEMsynzWY
	 ENm0oxF2ma2d8UWVaRyOpQHvzuRJ5dvP3ON2hcJeRdl4KKEVmwqGJ4liOxYakB8sYg
	 jap/T/APPZeuFGHpBcH4v8bx65Mj7s+Y3ysAqHa7t39tI0N6qTURtMDEvi/XQb9Vz1
	 kBxscJlEZlooq35IC1QB5vYe2y9LvL5Ym5AEQrtUZzsuGBIfrYrbyzkJTwS5GD9Zw/
	 d+/u1RNvP2Z8gi7haX2p3GozBnwKhnkbhUrDR0iaKQX1PLf/eTEw7N/bOAxRTB56La
	 C0SUoQj5lRsYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 8/8] iio: adc: ti-ads112c14: add measurement channel
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RGF2aWQgTGVjaG5lciAoVEkp?= <dlechner@baylibre.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714-iio-adc-ti-ads122c14-v4-8-25f8e3084485@baylibre.com>
References: <20260714-iio-adc-ti-ads122c14-v4-0-25f8e3084485@baylibre.com>
 <20260714-iio-adc-ti-ads122c14-v4-8-25f8e3084485@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 00:05:30 +0000
Message-Id: <20260715000531.4D6111F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Probe will erroneously fail if `refp-supply` is present but `avdd-=
supply` is missing in the device tree.
- [High] An I2C short read leaves stack memory uninitialized, exposing it t=
o user space.
- [Medium] The scale calculation in `ads112c14_populate_scale_available()` =
can overflow `u64` when a large external reference resistor is configured.
- [Medium] Calculation of excitation currents above 60 =C2=B5A overflows th=
e 3-bit IMAG bitfields, resulting in silently incorrect hardware configurat=
ion.
- [Medium] Incompatible format specifiers break `IIO_CHAN_INFO_SCALE` writi=
ng due to integer composition mismatch.
--

--- Patch [8]: [PATCH v4 8/8] iio: adc: ti-ads112c14: add measurement chann=
el support ---
commit 0662f6e0d1a8a66e59b6cab55397eee9f82357fd
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: add measurement channel support

Add support for parsing devicetree properties for measurement channels
and doing direct reads on these. There are quite a lot of conditions
that have to be met for each measurement to be made, so quite a bit of
state and algorithms are required to handle it. Channels are created
dynamically since the number of possibilities is unreasonably large.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> index 17bb6472a39b5..fef3a9c37cedc 100644
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c

[ ... ]

> @@ -263,12 +302,112 @@ static const struct regmap_config ads112c14_regmap=
_config =3D {
>  	.cache_type =3D REGCACHE_MAPLE,
>  };
> =20
> +static int ads112c14_prepare_measurement_channel(struct ads112c14_data *=
data,
> +						 const struct iio_chan_spec *chan)
> +{
> +	struct ads112c14_measurement *measurement =3D &data->measurements[chan-=
>scan_index];
> +	u32 refp_buf_en, refn_buf_en, ref_val, ref_sel;
> +	int ret;
> +
> +	ret =3D regmap_update_bits(data->regmap, ADS112C14_REG_MUX_CFG,

[ ... ]

> +	ret =3D regmap_update_bits(data->regmap, ADS112C14_REG_IDAC_MAG_CFG,
> +				 ADS112C14_IDAC_MAG_CFG_I2MAG |
> +				 ADS112C14_IDAC_MAG_CFG_I1MAG,
> +				 FIELD_PREP(ADS112C14_IDAC_MAG_CFG_I2MAG,
> +					    measurement->idac2_mag) |
> +				 FIELD_PREP(ADS112C14_IDAC_MAG_CFG_I1MAG,
> +					    measurement->idac1_mag));
                                            ^^^^

[Severity: Medium]
If measurement->idac1_mag or idac2_mag exceeds the 3-bit capacity of the
I1MAG and I2MAG register fields, will FIELD_PREP silently truncate the valu=
e?

Because FIELD_PREP is being called with a non-constant variable, its
compile-time bounds checks are bypassed. The ads112c14_populate_idac_mag()
function can calculate values up to 11, which would truncate to 3 here and
silently misconfigure the hardware excitation current.

> +	if (ret)
> +		return ret;

[ ... ]

> @@ -356,6 +496,7 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  			      int *val, int *val2, long mask)
>  {
>  	struct ads112c14_data *data =3D iio_priv(indio_dev);
> +	struct ads112c14_measurement *measurement =3D NULL;
>  	const int *scale_avail;
>  	u32 vref_uV, fsr_bits;
> =20
> @@ -363,8 +504,8 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  	vref_uV =3D ADS112C14_INT_REF1_mV * (MICRO / MILLI);
> =20
>  	if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
> -		/* Not implemented yet. */
> -		return -EINVAL;
> +		measurement =3D &data->measurements[chan->scan_index];
> +		fsr_bits =3D data->chip_info->resolution_bits - measurement->bipolar;
>  	} else {
>  		/* All SYS_MON channels are using signed coding. */
>  		fsr_bits =3D data->chip_info->resolution_bits - 1;
> @@ -394,7 +535,8 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  			return -EINVAL;
>  		}
> =20
> -		*val =3D sign_extend32(*val, fsr_bits);
> +		if (!measurement || measurement->bipolar)
> +			*val =3D sign_extend32(*val, fsr_bits);
                            ^^^^

[Severity: High]
Does an I2C short read in ads112c14_single_conversion() leave the buffer
uninitialized?

When ads112c14_single_conversion() calls i2c_smbus_read_i2c_block_data(), it
returns the number of bytes read upon success. A short read (e.g. 1 or 2 by=
tes)
would return a positive value, bypassing the (ret < 0) error check in
ads112c14_read_raw().

If that happens, could the remaining uninitialized bytes on the kernel stac=
k be
sign-extended and exposed to user space?

> =20
>  		return IIO_VAL_INT;
>  	}

[ ... ]

> @@ -486,7 +650,13 @@ static int ads112c14_write_raw(struct iio_dev *indio=
_dev,
>  	case IIO_CHAN_INFO_SCALE: {
>  		guard(mutex)(&data->lock);
> =20
> -		if (chan->channel =3D=3D ADS112C14_SYS_MON_CHANNEL_SHORT) {
> +		if (chan->channel < ADS112C14_SYS_MON_CHANNEL_BASE) {
> +			struct ads112c14_measurement *measurement;
> +
> +			measurement =3D &data->measurements[chan->scan_index];
> +			scale_avail =3D measurement->scale_available;
> +			gain_val =3D &measurement->gain_val;
> +		} else if (chan->channel =3D=3D ADS112C14_SYS_MON_CHANNEL_SHORT) {
>  			scale_avail =3D data->sys_mon_chan_short_scale_available;
>  			gain_val =3D &data->sys_mon_chan_short_gain_val;
>  		} else {

[Severity: Medium]
Will this break IIO_CHAN_INFO_SCALE writing due to mismatched units?

The driver's ads112c14_write_raw_get_fmt() specifies IIO_VAL_INT_PLUS_NANO,
which tells the IIO core to parse user strings into nanounits. However, the
scale_avail arrays generated by ads112c14_populate_scale_available() store
values in picounits.

When the user value (in nanounits) is checked via iio_val_s64_compose() aga=
inst
the scale_avail array (in picounits) further down in ads112c14_write_raw(),
will it always fail to match and return -EINVAL?

[ ... ]

> +static void ads112c14_populate_scale_available(int (*scale_avail)[2],
> +					       u32 full_scale, u32 fsr_bits)
> +{
> +	for (u32 i =3D 0; i < ARRAY_SIZE(ads112c14_pga_gains_x10); i++) {
> +		u64 gain_x10 =3D ads112c14_pga_gains_x10[i];
> +		s64 scale;
> +
> +		scale =3D div64_u64((u64)PICO * 10U * full_scale,
> +				  gain_x10 * BIT(fsr_bits));
                ^^^^

[Severity: Medium]
Could this calculation overflow a 64-bit unsigned integer?

If a large external reference resistor is configured (e.g., 10 Megaohms) via
the ti,refp-refn-resistor-ohms property, full_scale will be 10,000,000.
The arithmetic (u64)PICO * 10U * 10,000,000 evaluates to 10^20, which excee=
ds
the maximum capacity of a u64 (~1.84 * 10^19).

> +
> +		iio_val_s64_decompose(scale, &scale_avail[i][0],
> +				      &scale_avail[i][1]);
> +	}
> +}

[ ... ]

> @@ -608,13 +1029,76 @@ static int ads112c14_probe(struct i2c_client *clie=
nt)
>  	if (ret)
>  		return ret;
> =20
> +	if (device_property_present(dev, "ti,refp-refn-resistor-ohms")) {

[ ... ]

> +	if (device_property_present(dev, "refp-supply")) {
> +		ret =3D devm_regulator_get_enable_read_voltage(dev, "refp");
> +		if (ret < 0)
> +			return dev_err_probe(dev, ret, "failed to get refp voltage\n");
> +
> +		refp_uV =3D ret;
> +
> +		struct fwnode_handle *refp_fwnode __free(fwnode_handle) =3D
> +			fwnode_find_reference(dev->fwnode, "refp-supply", 0);
> +		if (IS_ERR(refp_fwnode))
> +			return dev_err_probe(dev, PTR_ERR(refp_fwnode),
> +					     "failed to get refp fwnode\n");
> +
> +		struct fwnode_handle *avdd_fwnode __free(fwnode_handle) =3D
> +			fwnode_find_reference(dev->fwnode, "avdd-supply", 0);
> +		if (IS_ERR(avdd_fwnode))
> +			return dev_err_probe(dev, PTR_ERR(avdd_fwnode),
> +					     "failed to get avdd fwnode\n");
                        ^^^^

[Severity: High]
Does this cause the probe to erroneously abort if "avdd-supply" is omitted =
in
the device tree?

If "refp-supply" is defined but "avdd-supply" is not, fwnode_find_reference=
()
will return -ENOENT for avdd_fwnode. The probe function will unconditionally
fail here, even though the regulator framework can safely provide a dummy
regulator for an optional avdd-supply.

> +
> +		/* REFP buffer should not be enabled when connected to AVDD */
> +		data->refp_is_avdd =3D refp_fwnode =3D=3D avdd_fwnode;
> +	}
> +
> +	if (device_property_present(dev, "refn-supply")) {
> +		ret =3D devm_regulator_get_enable_read_voltage(dev, "refn");
> +		if (ret < 0)

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-iio-adc-ti=
-ads122c14-v4-0-25f8e3084485@baylibre.com?part=3D8
