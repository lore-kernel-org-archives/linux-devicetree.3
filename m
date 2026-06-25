Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF72340260
	for <devicetree@vger.kernel.org>; Thu, 25 Jun 2026 22:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782425481; cv=none; b=RcUqKhUzivdASfTWvyeSUKBnBKyeLrJMJyF2d7i0kBsQ/JlM8dXdt9JTWdiZ9m6FL9CuK9cPEXZYHXBEKl8aPgJD8MRYYpri7gZnYNIqUq9zoIJTu7K63UoxyuIatsrfRS41nbzsOAqalg3DqbGiC8SJiD4gTWBYMbwY8n6AC/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782425481; c=relaxed/simple;
	bh=14bINzOIHO2mDDKjnHwfqk2JKSeYXO/6/sjz1MVxb7k=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Kvhq4+ilAt0yJz3JLs4iggUVjFthh+mWtjZzOUUXbWDbtimEvyG1bBDbVCmwytzazeS0U7cRBNPNrgyAd+0JKnKXhpMB7Mo0tm5VgNmeAAuLFaLWu8fa2rZe5H1La0n63nNgm3UIz5IYqpvYeK1n5Uy8+oW1YvzZPcYbszcRBv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fliaplOZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fliaplOZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65F551F000E9;
	Thu, 25 Jun 2026 22:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782425479;
	bh=WLHLO0KdVrW9/2JY+adKZHxXr1QE3bj8AyOYwppkdMg=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=fliaplOZZWme6/PlGwUODkJJ0SoMVOvA0HLRnzBwOZ1j0vXe/ld/KyL9M/A5UwWZ+
	 YwAD2YtWacCHrlXCf2rr8Nr0WPivyLFHn7GDn7pVf7qi189CXzq24iqSFgaDpWBgcC
	 d+QnTv/dfmODy02YAwAXwI0s+yjViAULQ0jhcxGrHzXuWMxdiN6aPw03DEqbj1G7lN
	 99GWxc3h0JqTJ+l9R3DYaIHqDI3WKZLuxCaSOUSFlzFSWCSVLGmkep6WeGoklRy4IN
	 WCHYaNfmmJNvALtyvs5B+IrnkT3Cq8TgwlVGTX/7TuZ2US9Sousrkh9T8jJ4FCMtCo
	 HjzDfqvbgYzTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 8/8] iio: adc: ti-ads112c14: add measurement channel
 support
Reply-To: sashiko-reviews@lists.linux.dev
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260625-iio-adc-ti-ads122c14-v2-8-ceb9b0b561cb@baylibre.com>
References: <20260625-iio-adc-ti-ads122c14-v2-0-ceb9b0b561cb@baylibre.com>
 <20260625-iio-adc-ti-ads122c14-v2-8-ceb9b0b561cb@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 22:11:18 +0000
Message-Id: <20260625221119.65F551F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The parsed burnout current configuration (`measurement->burnout`=
) is never applied to the hardware.
- [Medium] Directly checking `fwnode_find_reference` for `avdd-supply` bypa=
sses the regulator framework's dummy fallback, causing probe to fail if the=
 supply is omitted from the devicetree.
- [Medium] Calculation of `ext_ref_uV` can underflow, leading to garbage sc=
aling values and bypassing validation checks.

Pre-existing issues:
- [High] Short reads from `i2c_smbus_read_i2c_block_data()` are not correct=
ly identified as errors, exposing uninitialized kernel stack memory to user=
space.
--

commit 61a17369383e7866b0adf6d21770ae99f4aca379
Author: David Lechner (TI) <dlechner@baylibre.com>

iio: adc: ti-ads112c14: add measurement channel support
   =20
Add support for parsing devicetree properties for measurement channels
and doing direct reads on these.
   =20
Channels are created dynamically since the number of possibilities is
unreasonably large.

> diff --git a/drivers/iio/adc/ti-ads112c14.c b/drivers/iio/adc/ti-ads112c1=
4.c
> --- a/drivers/iio/adc/ti-ads112c14.c
> +++ b/drivers/iio/adc/ti-ads112c14.c
> @@ -308,106 +463,6 @@ static int ads112c14_prepare_measurement_channel(st=
ruct ads112c14_data *data,
>  						 const struct iio_chan_spec *chan)
>  {
>  	struct ads112c14_measurement *measurement =3D &data->measurements[chan-=
>scan_index];
>  	u32 refp_buf_en, refn_buf_en, ref_val, ref_sel;
>  	int ret;
> =20

[ ... ]

>  	ret =3D regmap_update_bits(data->regmap, ADS112C14_REG_DATA_RATE_CFG,
>  				 ADS112C14_DATA_RATE_CFG_GC_EN,
>  				 FIELD_PREP(ADS112C14_DATA_RATE_CFG_GC_EN,
>  					    measurement->global_chop));
>  	if (ret)
>  		return ret;

[Severity: Medium]
Is the burnout configuration supposed to be applied to the hardware here?

The parsed burn-out-current-nanoamp is saved to measurement->burnout in
ads112c14_parse_channels(), but this function does not appear to write it
to the ADS112C14_REG_DEVICE_CFG register. This might cause the feature to
be silently ignored even when configured in the devicetree.

[ ... ]

> @@ -494,7 +670,6 @@ static int ads112c14_read_raw(struct iio_dev *indio_d=
ev,
>  	case IIO_CHAN_INFO_RAW: {
>  		u8 buf[3];
>  		int ret;
> =20
>  		if (!iio_device_claim_direct(indio_dev))
>  			return -EBUSY;
> =20
>  		ret =3D ads112c14_single_conversion(data, chan, buf);
>  		iio_device_release_direct(indio_dev);
>  		if (ret < 0)
>  			return ret;
> =20
>  		switch (data->chip_info->resolution_bits) {
>  		case 16:
>  			*val =3D get_unaligned_be16(buf);

[Severity: High]
This isn't a bug introduced by this patch, but does this adequately handle
short reads?

The i2c_smbus_read_i2c_block_data() function called by
ads112c14_single_conversion() returns the positive number of bytes read on
success. If a short read occurs, ret will be positive and bypass the
ret < 0 check.=20

Could this proceed to process a partially uninitialized buf array and expose
kernel stack memory to userspace?

[ ... ]

> @@ -1021,76 +1142,6 @@ static int ads112c14_probe(struct i2c_client *clie=
nt)
>  	if (device_property_present(dev, "refp-supply")) {
>  		ret =3D devm_regulator_get_enable_read_voltage(dev, "refp");
>  		if (ret < 0)
>  			return dev_err_probe(dev, ret, "failed to get refp voltage\n");
> =20
>  		refp_uV =3D ret;
> =20
>  		struct fwnode_handle *refp_fwnode __free(fwnode_handle) =3D
>  			fwnode_find_reference(dev->fwnode, "refp-supply", 0);
>  		if (IS_ERR(refp_fwnode))
>  			return dev_err_probe(dev, PTR_ERR(refp_fwnode),
>  					     "failed to get refp fwnode\n");
> =20
>  		struct fwnode_handle *avdd_fwnode __free(fwnode_handle) =3D
>  			fwnode_find_reference(dev->fwnode, "avdd-supply", 0);
>  		if (IS_ERR(avdd_fwnode))
>  			return dev_err_probe(dev, PTR_ERR(avdd_fwnode),
>  					     "failed to get avdd fwnode\n");

[Severity: Medium]
Will this rigidly fail the probe if the avdd-supply is absent?

By directly using fwnode_find_reference(), it seems we bypass the regulator
framework's dummy fallback. If the devicetree omits avdd-supply, this
appears to return -ENOENT and fail unconditionally rather than treating
the missing reference as simply not matching refp_fwnode.

> =20
>  		/* REFP buffer should not be enabled when connected to AVDD */
>  		data->refp_is_avdd =3D refp_fwnode =3D=3D avdd_fwnode;
>  	}
> =20
>  	if (device_property_present(dev, "refn-supply")) {
>  		ret =3D devm_regulator_get_enable_read_voltage(dev, "refn");
>  		if (ret < 0)
>  			return dev_err_probe(dev, ret, "failed to get refn voltage\n");
> =20
>  		refn_uV =3D ret;
>  	} else {
>  		data->refn_is_gnd =3D true;
>  	}
> =20
>  	data->ext_ref_uV =3D refp_uV - refn_uV;
> =20
>  	if (data->ext_ref_uV && data->ext_ref_ohms)
>  		return dev_err_probe(dev, -EINVAL,
>  				     "ti,refp-refn-resistor-ohms property should not be present when=
 refp-supply or refn-supply is present\n");
> =20
>  	if (need_ext_ref && !data->ext_ref_uV && !data->ext_ref_ohms)
>  		return dev_err_probe(dev, -EINVAL,
>  				     "external reference measurements require either refp-supply or =
ti,refp-refn-resistor-ohms property\n");

[Severity: Medium]
Can this subtraction underflow if refp-supply is missing but refn-supply is
present?

If refp_uV is 0 and refn_uV is greater than 0, subtracting them as unsigned
32-bit integers will wrap to a large positive number. This seems like it
would bypass the subsequent !data->ext_ref_uV validation check and lead to
incorrect values when computing full_scale in ads112c14_populate_tables().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625-iio-adc-ti=
-ads122c14-v2-0-ceb9b0b561cb@baylibre.com?part=3D8
