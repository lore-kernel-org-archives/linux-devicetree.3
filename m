Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794560496;
	b=FKr9irV0yHEE8sHS9zBgQAuRLjd5e7dpaSAvSGVsf1ySrXgk8t7gqqLiaOKwTAEz6LyR
	 9O50W/90cjuLICOxBr6m9fD5EO6RT6L5nwNRrVyXmEO2XavKj7T79eCZaP+Fcmer2VCzL
	 2DbCgjfe/X+EZ8eZAFFZ46RENt2ZskmuP1oR0yUjY5RbPla75ta9lQiOWs+VypDDrDAKv
	 vIsVaGddAU7tpKmeMjqs/ORRfHYOdbbcAksUnKd/HIJ/3/1ov2spNr14cs8EbOliru7JO
	 ZFRvxvtaa4A1wTcTIjFPNCVsceBYoyIZ9caDJ+v3TM15cDtybTzNrsxgUZvCsSUQ37g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794560496;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nmrQPfar2Rl3XcsyTUTPY9KPhyopLaHKuluJnWvLwts=;
	b=c/rd4SruesTwJA6oqLFXFhJgKVGIwDuhvzemS7vXqPG8tMmq7+Te/2OpOen9u3DTP5ot
	 FPVCg4yUO5SHlS5foSznbMRh40Z69E6mZiSddBlZsMIXl8hxeroshqbhDIDilsficvTwr
	 tNmcgK2fLxyJYHRFP5193gfmeLE4BT+9r/TmQv0YtDuQZ6FKdnwVaEde3oU67yxzaklrx
	 q2V/7jvGKwXKDS35oXJ4A0bUGJ9HiM4CS7QC/KtxgGyUSxYg4zNm0/AXYw/+GWOn4wWsU
	 9fI6dO8M810tn5Zk+/7u4KKwp5js5cD3Wo2gSrc2LLfv/OPzhFcDQEtzusILURScsSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHb2avZk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D981D606A33B
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 09:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lHb2avZk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEC01F000C4;
	Fri, 13 Nov 2026 09:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794560496;
	bh=nmrQPfar2Rl3XcsyTUTPY9KPhyopLaHKuluJnWvLwts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lHb2avZkguBNdm+7PyDua7r41u71B0m7h5df6x6oc7VGqIznj9z3sBIzZGsgHQkWF
	 V7uWu3mHb301t/Q5x93GCpc3mx+tNmwxkhWMRvj2j38Ldy3lXZiEh/vsLX3XEzAGKz
	 OBhxszlYRiATV82ootwgIqrh7uEjQQsfE/uqAaXeXO1WwBf18nKp/d9ugtVfpE1gap
	 xv/k5ZjFeBb6sMmvMQnbJBM9r76pb5Bd9uaVRaF0BA/t59PlcNsOU4kbMsPpxSVKHv
	 XPPK0o7opJ6qoXYJpBHwwCQKmXe5JW7XccSAe4OSV+Cfg4Zm1Ys/WIX1WgjfqiIPe2
	 sO9+6bcaVyOtQ==
Message-ID: <sashiko-outbox-212494@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/6] thermal: add hardware-binning trip-point
 filtering support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261113-thermal_bin-v3-2-878df6eef8bc@oss.qualcomm.com>
References: <20261113-thermal_bin-v3-0-878df6eef8bc@oss.qualcomm.com>
 <20261113-thermal_bin-v3-2-878df6eef8bc@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 09:01:35 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Low] thermal: dead code and masked errors in
  thermal_of_populate_trip() bin parsing
- [Low] thermal: duplicated devres logic in
  devm_thermal_of_zone_register_with_bin()
--

commit 587b57fa5fb124fbca43f4241cacd250c0901807
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: add hardware-binning trip-point filtering support

This commit adds Device Tree trip-point filtering and per-bin temperature
selection via the thermal-hw-bin and temperature-bin properties, along with
devm_thermal_of_zone_register_with_bin() for platform drivers to supply
decoded fuse masks at zone registration time.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index 9e96fb1b033e9..57500e565560c 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -57,21 +57,168 @@ static int thermal_of_get_trip_type(struct device_no=
de *np,

[ ... ]

> +static bool thermal_of_trip_is_supported(struct device_node *np,
> +					 const struct thermal_hw_bin_info *hw)
> +{
> +	unsigned int levels, ngroups, i;
> +	int count;
> +
> +	if (!hw)
> +		return true;
> +
> +	levels =3D hw->supported_hw_bin_count;
> +
> +	count =3D of_property_count_u32_elems(np, "thermal-hw-bin");
> +	if (count =3D=3D -EINVAL)
> +		return true;
> +	if (count < 0) {
> +		pr_warn_once("%pOF: error reading thermal-hw-bin: %d\n", np, count);
> +		return false;
> +	}
> +	if (count =3D=3D 0)
> +		return true;
> +
> +	if (count % levels) {
> +		pr_warn("%pOF: thermal-hw-bin length %d not a multiple of supported_hw=
_bin_count %u; disabling trip\n",
> +			np, count, levels);
> +		return false;
> +	}
> +
> +	ngroups =3D count / levels;
> +	for (i =3D 0; i < ngroups; i++)
> +		if (thermal_of_match_hw_bin_group(np, hw, levels, i))
> +			return true;
> +
> +	return false;
> +}

[ ... ]

> +static int thermal_of_trip_read_temperature(struct device_node *np,
> +					    const struct thermal_hw_bin_info *hw,
> +					    s32 *temp)
> +{

[ ... ]

> +	levels =3D hw->supported_hw_bin_count;
> +	count_hw =3D of_property_count_u32_elems(np, "thermal-hw-bin");
> +	if (count_hw <=3D 0 || count_hw % levels)
> +		return -EINVAL;
> +
> +	ngroups =3D count_hw / levels;
> +	if (count_temp !=3D (int)ngroups)
> +		return -EINVAL;
> +
> +	for (i =3D 0; i < ngroups; i++) {
> +		if (thermal_of_match_hw_bin_group(np, hw, levels, i)) {
> +			u32 utmp;
> +
> +			if (of_property_read_u32_index(np, "temperature-bin",
> +						       i, &utmp))
> +				return -EINVAL;
> +			*temp =3D (s32)utmp;
> +			return 0;
> +		}
> +	}
> +
> +	pr_warn("%pOF: no thermal-hw-bin sub-group matched for temperature-bin\=
n", np);
> +	return -ENODEV;
>  }
> =20
>  static int thermal_of_populate_trip(struct device_node *np,
> -				    struct thermal_trip *trip)
> +				    struct thermal_trip *trip,
> +				    const struct thermal_hw_bin_info *hw)
>  {
>  	u32 hysteresis;
>  	s32 temperature;
>  	int ret;
> =20
> -	ret =3D of_property_read_s32(np, "temperature", &temperature);
> -	if (ret < 0) {
> -		pr_err("missing temperature property\n");
> -		return ret;
> +	if (!thermal_of_trip_is_supported(np, hw)) {
> +		pr_debug("%pOF: trip skipped: no thermal-hw-bin match\n", np);
> +		return -ENODEV;
>  	}
> +
> +	ret =3D thermal_of_trip_read_temperature(np, hw, &temperature);

[Severity: Low]
Does calling thermal_of_trip_is_supported() before
thermal_of_trip_read_temperature() leave the no-match path in
thermal_of_trip_read_temperature() unreachable and mask malformed
Device Tree properties?

Whenever thermal_of_trip_read_temperature() reaches its sub-group loop
with a non-NULL hw, thermal_of_trip_is_supported() has already verified
that count_hw % levels =3D=3D 0 and that a sub-group matches, so the second
loop repeats the same property reads and the trailing warning and -ENODEV
return in thermal_of_trip_read_temperature() cannot be reached.

Because thermal_of_trip_is_supported() returns false on count < 0 or
count % levels !=3D 0, a temperature-bin trip with a malformed
thermal-hw-bin property returns -ENODEV and is silently skipped by
thermal_of_trips_init() instead of failing registration with -EINVAL, and
a count_temp !=3D ngroups mismatch is likewise hidden when no sub-group
matches.  In addition, of_property_count_u32_elems() returns -EINVAL both
when thermal-hw-bin is absent and when its byte length is not a multiple
of 4, so returning true on count =3D=3D -EINVAL (without checking
of_property_present()) or count =3D=3D 0 enables a scalar-temperature trip
with a truncated or empty thermal-hw-bin property on all hardware.

[ ... ]

> @@ -510,6 +679,46 @@ struct thermal_zone_device *devm_thermal_of_zone_reg=
ister(struct device *dev, in
>  }
>  EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register);
> =20
> +/**
> + * devm_thermal_of_zone_register_with_bin - register a thermal zone with=
 hardware binning info
> + *
> + * Like devm_thermal_of_zone_register(), but passes @hw_bin_info to the =
trip-point
> + * parser so that trips can be filtered and per-bin temperatures selecte=
d at
> + * zone registration time.  Use this when fuse values are read before zo=
ne
> + * registration (e.g. in a platform driver's probe function).
> + *
> + * @dev:         device structure pointer to sensor
> + * @id:          the sensor identifier
> + * @data:        private data stored in the thermal zone 'devdata' field
> + * @ops:         ops structure associated with the sensor
> + * @hw_bin_info: hardware binning info for trip filtering (may be NULL)
> + */
> +struct thermal_zone_device *
> +devm_thermal_of_zone_register_with_bin(struct device *dev, int id, void =
*data,
> +				       const struct thermal_zone_device_ops *ops,
> +				       const struct thermal_hw_bin_info *hw_bin_info)
> +{
> +	struct thermal_zone_device **ptr, *tzd;
> +
> +	ptr =3D devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr),
> +			   GFP_KERNEL);
> +	if (!ptr)
> +		return ERR_PTR(-ENOMEM);
> +
> +	tzd =3D thermal_of_zone_register_with_bin(dev->of_node, id, data,
> +						ops, hw_bin_info);
> +	if (IS_ERR(tzd)) {
> +		devres_free(ptr);
> +		return tzd;
> +	}
> +
> +	*ptr =3D tzd;
> +	devres_add(dev, ptr);
> +
> +	return tzd;
> +}
> +EXPORT_SYMBOL_GPL(devm_thermal_of_zone_register_with_bin);

[Severity: Low]
This isn't a bug, but devm_thermal_of_zone_register_with_bin() duplicates
the devres handling of devm_thermal_of_zone_register(); having
devm_thermal_of_zone_register() call
devm_thermal_of_zone_register_with_bin(dev, sensor_id, data, ops, NULL)
directly would avoid the duplication and the extra static
thermal_of_zone_register() wrapper.

Also, the kernel-doc comment above places the function description before
the @argument list and omits a Return: section, which causes W=3D2
kernel-doc warnings.  In thermal_of_trip_read_temperature(), the missing
hw warning uses pr_warn() on every trip node whereas hardware-binning.rst
states that it warns once.  Finally, the new
F: Documentation/driver-api/thermal/hardware-binning.rst line in
MAINTAINERS is already covered by F: Documentation/driver-api/thermal/.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-thermal_bi=
n-v3-0-878df6eef8bc@oss.qualcomm.com?part=3D2
