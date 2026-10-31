Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793454006;
	b=0it9uwUI+b6o/R8i5y3MUQruxGmbVg1AV8J7enfwIRvRYyREKMq5rtx9kKMHvydqNAK8
	 fsgRXVDBUvdFz1n4ncpyXbXr/fH7KG+P1aYXHldAv8YN7krlu/JNrXmN9vQUn1c67Q8H7
	 uqqi/DymqYIYXR9ju1NUzW6BRAsUuuEa62VTsLt8Qh+j4mlEKKg9N8ry9xA9AhDpJTKTL
	 cC/rFvr0oY2JrsVl4B7uteBXmXgNOHaeh9KcoiLBjv4g1zgDcXCk6Wvn3fJs/IK2gXsLh
	 /TC7Dbl+ZKkOV2mUM8TGDfkmyDhVzmT9khfqYOLUdRRkIQNxUqAOjFw6TfBEkv1CoUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793454006;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=A5SaVcGzALhMrp321uHRS8hjpvwjij+H0NgDs+v68Kg=;
	b=E1wIxKdt3Mxi429A9/UVvgzdiU1WAk0TZe6zec5ZmNUWkdJjs0O+SiakT8AS1t3MZjI6
	 XeVhEVFFOlu9n7XpY9OH+Pf3eR00vw0Bh5zz2b9JgwuRRo+8HCHXOVUytCd8QQ7UZgCw4
	 rjVM4cB5gKRhoEpDldQ1ZOznONAE6t5NUQ0YmYPlbl+ymwjCVoyW4tC4gAmUiuxq7whSy
	 F+ml6mpzL7av4EWOfcjrZU4Yt2mRj7Tnsr1FakONgBridg1za0fxvqjckc5G9HtJPkrpk
	 JSs4qoerATzHcQyAfJU97hVHHjsJnSKYkzoDk3f2JLn8g0PKnIDxu+U2CgJMuAbL3iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaL2Mlcu;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C9606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LaL2Mlcu
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3611F000C1;
	Sat, 31 Oct 2026 13:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793454005;
	bh=A5SaVcGzALhMrp321uHRS8hjpvwjij+H0NgDs+v68Kg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LaL2MlcuLC8plPmK9W8Vbd+1qplz7FmzwJE3hfLHtW10mBfYHroapgZpWPyw/wTcP
	 KsVUf5M3I2aXr8LKcL2uA8JDwl8kgGiUBo638xD6A7b+bRfrdFXDhTXh2iy0vLJja5
	 iAWIPYtxgjCeg/ZB+ZTkRRK6OvzeoTCn7wZdsSQax/ja51j4avMXNtszLYFh/acHup
	 hKPMduJPolY29XeqoiRZsV59sZNDAy8Jh8dxiVVxFwsilodePODD3hhs7iMIHzxeJI
	 Q8Pl/78HEKCnwEeUNKd9oUF+yk0xA69XJC7UcGa2GyL2pXzWpGhdk4mhG/kQ30fVE8
	 ByS6k31zgCHMQ==
Message-ID: <sashiko-outbox-191983@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/6] thermal: add hardware-binning trip-point
 filtering support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031-thermal_bin-v2-2-d76fd073ae98@oss.qualcomm.com>
References: <20261031-thermal_bin-v2-0-d76fd073ae98@oss.qualcomm.com>
 <20261031-thermal_bin-v2-2-d76fd073ae98@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 13:40:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] thermal: -ENODEV collision in thermal_of_trips_init() masks bad =
trip types
- [Low] thermal: redundant hw-bin matching and dead code in trip temperatur=
e parser
- [Low] thermal: duplicated devres logic in devm_thermal_of_zone_register_w=
ith_bin()
--

commit 88b6a2a4f7fe7c6179c38cf14f96ebaa3d58c33a
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: add hardware-binning trip-point filtering support

This commit adds Device Tree parsing support for the thermal-hw-bin and
temperature-bin properties to filter trip points and select per-bin trip
temperatures based on SoC hardware version information. It also introduces
devm_thermal_of_zone_register_with_bin() so platform sensor drivers can pass
decoded fuse bitmasks during thermal zone registration.

> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index fe47d74b7219e..c5ec7d2a38caf 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
> @@ -60,18 +60,165 @@ static int thermal_of_get_trip_type(struct device_no=
de *np,
>  	return -ENODEV;
>  }
> =20
> +/*
> + * thermal_of_match_hw_bin_group - test one thermal-hw-bin sub-group
> + * @np:     device node containing the property
> + * @hw:     hardware binning info (must be non-NULL)
> + * @levels: number of words per sub-group, equal to hw->supported_hw_bin=
_count
> + * @group:  sub-group index to test
> + *
> + * Returns true if every word in sub-group @group has a non-zero bitwise
> + * AND with the corresponding hw->supported_hw_bin[] entry.  The caller =
is
> + * responsible for ensuring @group < total-cells / @levels.
> + */
> +static bool thermal_of_match_hw_bin_group(struct device_node *np,
> +					  const struct thermal_hw_bin_info *hw,
> +					  unsigned int levels, unsigned int group)
> +{
> +	unsigned int j;
> +	u32 val;
> +
> +	for (j =3D 0; j < levels; j++) {
> +		if (of_property_read_u32_index(np, "thermal-hw-bin",
> +					       group * levels + j, &val))
> +			return false;
> +		if (!(val & hw->supported_hw_bin[j]))
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +/**
> + * thermal_of_trip_is_supported - check if a trip node is valid for this=
 hardware
> + * @np:  device node for the trip point
> + * @hw:  hardware binning info (may be NULL)
> + *
> + * If @hw is NULL or the trip node has no thermal-hw-bin property, the t=
rip is
> + * considered valid for all hardware.  Otherwise, the property is read a=
s groups
> + * of hw->supported_hw_bin_count 32-bit masks; the trip is valid if any =
group
> + * matches (bitwise AND non-zero for every word in the group).
> + *
> + * Return: true if the trip is valid for the running hardware, false oth=
erwise.
> + */
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
> +
> +/**
> + * thermal_of_trip_read_temperature - read trip temperature, with bin su=
pport
> + * @np:   device node for the trip point
> + * @hw:   hardware binning info (may be NULL)
> + * @temp: output temperature in millicelsius
> + *
> + * Tries the scalar 'temperature' property first.  If absent, falls back=
 to
> + * 'temperature-bin', selecting the entry whose corresponding thermal-hw=
-bin
> + * sub-group matches the running hardware.  Returns -ENODEV if temperatu=
re-bin
> + * is present but no sub-group matches (caller should skip this trip).
> + *
> + * Return: 0 on success, negative errno on failure.
> + */
> +static int thermal_of_trip_read_temperature(struct device_node *np,
> +					    const struct thermal_hw_bin_info *hw,
> +					    s32 *temp)
> +{
> +	unsigned int levels, ngroups, i;
> +	int count_hw, count_temp;
> +	s32 t;
> +
> +	if (!of_property_read_s32(np, "temperature", &t)) {
> +		*temp =3D t;
> +		return 0;
> +	}
> +
> +	count_temp =3D of_property_count_elems_of_size(np, "temperature-bin",
> +						     sizeof(u32));
> +	if (count_temp < 0)
> +		return -EINVAL;
> +
> +	if (!hw) {
> +		u32 utmp;
> +
> +		pr_warn("%pOF: temperature-bin requires platform hw binning info; usin=
g first entry\n",
> +			np);
> +		if (of_property_read_u32_index(np, "temperature-bin", 0, &utmp))
> +			return -EINVAL;
> +		*temp =3D (s32)utmp;
> +		return 0;
> +	}
> +
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
> +}
> +
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
As reported by Sashiko on v1 [1], thermal_of_populate_trip() calls
thermal_of_trip_is_supported(np, hw) before
thermal_of_trip_read_temperature(np, hw, &temperature) and returns -ENODEV
immediately when thermal_of_trip_is_supported() returns false.

When hw is non-NULL and thermal-hw-bin is valid,
thermal_of_trip_is_supported() already iterates through all ngroups
sub-groups via thermal_of_match_hw_bin_group() and only returns true if at
least one sub-group matches. When thermal_of_trip_read_temperature() then
runs for a temperature-bin trip, it re-reads thermal-hw-bin and executes the
same thermal_of_match_hw_bin_group() loop a second time, leaving the traili=
ng
pr_warn() and -ENODEV return in thermal_of_trip_read_temperature()
unreachable.

In addition, having thermal_of_trip_is_supported() run first causes malform=
ed
DT properties to be masked:

1. If a trip using temperature-bin has a thermal-hw-bin property whose leng=
th
   is not a multiple of supported_hw_bin_count (count % levels !=3D 0) or f=
ails
   with count < 0 (such as -ENODATA), thermal_of_trip_is_supported() returns
   false. That causes thermal_of_populate_trip() to return -ENODEV and
   thermal_of_trips_init() to silently skip the trip instead of reaching the
   -EINVAL return in thermal_of_trip_read_temperature().

2. In thermal_of_trip_is_supported(), of_property_count_u32_elems(np,
   "thermal-hw-bin") returns -EINVAL both when the property is absent and
   when its byte length is not a multiple of sizeof(u32). Checking for
   count =3D=3D -EINVAL (as well as count =3D=3D 0) and returning true trea=
ts a
   non-u32-aligned or empty thermal-hw-bin property as matching all hardwar=
e.

Could the thermal-hw-bin lookup and sub-group matching be consolidated into=
 a
single helper so each trip node is validated and matched once, and malformed
properties return -EINVAL?

> +	if (ret)
> +		return ret;
>  	trip->temperature =3D temperature;
> =20
>  	ret =3D of_property_read_u32(np, "hysteresis", &hysteresis);
> @@ -94,7 +241,9 @@ static int thermal_of_populate_trip(struct device_node=
 *np,
>  	return 0;
>  }
> =20
> -static struct thermal_trip *thermal_of_trips_init(struct device_node *np=
, int *ntrips)
> +static struct thermal_trip *thermal_of_trips_init(struct device_node *np,
> +						  int *ntrips,
> +						  const struct thermal_hw_bin_info *hw)
>  {
>  	int ret, count;
> =20
> @@ -114,9 +263,12 @@ static struct thermal_trip *thermal_of_trips_init(st=
ruct device_node *np, int *n
> =20
>  	count =3D 0;
>  	for_each_child_of_node_scoped(trips, trip) {
> -		ret =3D thermal_of_populate_trip(trip, &tt[count++]);
> +		ret =3D thermal_of_populate_trip(trip, &tt[count], hw);
> +		if (ret =3D=3D -ENODEV)
> +			continue;
>  		if (ret)
>  			return ERR_PTR(ret);
> +		count++;
>  	}

[Severity: Medium]
Does treating -ENODEV as a skipped trip here mask invalid trip types in the
device tree?

Later in thermal_of_populate_trip(), thermal_of_get_trip_type() is called:

drivers/thermal/thermal_of.c:thermal_of_populate_trip() {
	...
	ret =3D thermal_of_get_trip_type(np, &trip->type);
	if (ret < 0) {
		pr_err("wrong trip type property\n");
		return ret;
	}
}

When a trip node's type string does not match any entry in trip_types[],
thermal_of_get_trip_type() returns -ENODEV. Previously,
thermal_of_trips_init() treated that -ENODEV return as a fatal error and
aborted thermal zone registration with ERR_PTR(-ENODEV).

Because thermal_of_trips_init() now continues on -ENODEV to skip unmatched
hardware-bin trips, an unrecognized trip type property will also be ignored
after partially writing tt[count].temperature and tt[count].hysteresis,
registering the thermal zone without that trip point instead of failing
registration. Should thermal_of_get_trip_type() return -EINVAL on an
unrecognized type, or should hardware-bin filtering use a distinct return
value?

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
This isn't a bug, but there are a few small duplication and documentation
items worth cleaning up:

1. devm_thermal_of_zone_register_with_bin() duplicates the devres_alloc(),
   error handling, and devres_add() body of devm_thermal_of_zone_register().
   Could devm_thermal_of_zone_register() simply call
   devm_thermal_of_zone_register_with_bin(dev, sensor_id, data, ops, NULL),
   which would also remove the need for the static thermal_of_zone_register=
()
   wrapper?

2. In the kernel-doc comment for devm_thermal_of_zone_register_with_bin(),
   the function description is placed before the @argument list instead of
   after it, and a Return: section is missing (which triggers a kernel-doc
   warning under W=3D2 builds).

3. Documentation/driver-api/thermal/hardware-binning.rst states that when a
   trip uses temperature-bin without bin info:

     If a trip uses ``temperature-bin`` but no bin info has been provided f=
or the
     zone, the core cannot select an entry; it warns once and falls back to=
 the
     first ``temperature-bin`` value.

   However, thermal_of_trip_read_temperature() uses pr_warn() rather than
   pr_warn_once(), so it warns for every trip node.

4. In MAINTAINERS:

     F:	Documentation/driver-api/thermal/
     +F:	Documentation/driver-api/thermal/hardware-binning.rst

   Is the new file entry needed when the directory entry right above it
   already covers Documentation/driver-api/thermal/?

[1] https://lore.kernel.org/r/20261002-thermal_bin-v1-2-5a29be7e8ec5@oss.qu=
alcomm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-thermal_bi=
n-v2-0-d76fd073ae98@oss.qualcomm.com?part=3D2
