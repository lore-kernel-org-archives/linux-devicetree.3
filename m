Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C961147FAFE
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 10:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790938792; cv=none; b=mVgMMMMYwl9dnox75gJPMpBIEXK8B4El7F9FzeZFusnbBZjwAsUdyOkSUgPY2fP5+1fJm3R2sG048+Jm6U54qzyuX6tO+76Q9RhEl/NxDR2Z3SHH6fZiFps3lC8CCdJ4W8QYIx4O9RVU4mm4FAf89gZpMJGk0akQntFrO56Mf5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790938792; c=relaxed/simple;
	bh=PDxWCLBezlr8KyznqTTBDUOQnyJxuDv04te8rBd/+ms=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H+X9bMjPe7fUr+TYKfZh6aoJ8EFqnpG4wiHo1n/jAxpE9bQ6+xXLWdbRrMXUiYNt0j5269g00ovRiOiyXuM296fZ1/fU8GbmnsYZMxLfjIn/7YgJu6E6cotLPxcy6TnPQip0PSqxFEImnGTY7xtvxiX47D+l+706ycA/XEK747U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i7m776oy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i7m776oy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10CB1F000FF;
	Fri,  2 Oct 2026 10:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790938788;
	bh=2MEXWM3JoFLPdNdn+vpOdvg4TU5o8kM5jBJrZ5raSLI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=i7m776oypbDWejpQeSMzmc/ccQVFuqgTJzHJfJYN+v9ngOJmX6xCfVBRuvsY2mtK+
	 D+eOtK48BRSMQCAp6ArELUIc59o8pE72vdB2pdkD+kX2YnPUjJCkID+eqSfky3gSJa
	 jZGCqUNMllPAAO/Z7u8+iya+4uLnRahy8+/tgT82ClsbSzZpgmKf1Zw/gQAHU3bH+k
	 R1BXhZ+gwiYg7Q9LhSvw4CEwG1pz90V8dGYoRmKghE/qyQIhV61jL/OJyJor9Bp7Gi
	 uj3F6gzspCgv8S9Yxd5qqpHDX6OCr5O3+e4G5YAqqrX+chGj2D2cEkYO+aYsjp6etQ
	 sZaY24DM7HDAQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] thermal: add hardware-binning trip-point filtering
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Gaurav Kohli" <gaurav.kohli@oss.qualcomm.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-thermal_bin-v1-2-5a29be7e8ec5@oss.qualcomm.com>
References: <20261002-thermal_bin-v1-0-5a29be7e8ec5@oss.qualcomm.com>
 <20261002-thermal_bin-v1-2-5a29be7e8ec5@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 10:59:47 +0000
Message-Id: <20261002105947.E10CB1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] thermal: thermal_zone_set_supported_hw_bin() unconditionally fails=
 with -EINVAL
- [Medium] thermal: broken post-registration hardware binning API
- [Medium] thermal: TOCTOU double-fetch race and UAF in thermal_zone_get_hw=
_bin_info()
- [Low] thermal: unreachable subgroup match failure in thermal_of_trip_read=
_temperature()
--

commit 6467f849e176530b564d3eca94d59d40b3f0f114
Author: Amit Kucheria <amit.kucheria@oss.qualcomm.com>

thermal: add hardware-binning trip-point filtering support

Differences in SoC packaging can be used to provide multiple SoC SKUs at
different thermal and performance characteristics. The underlying SoC
remains the same except for how much heat the packaging can dissipate.
This patch adds thermal core/OF framework support to populate appropriate
trip points applicable to an SKU at runtime.

> diff --git a/Documentation/driver-api/thermal/hardware-binning.rst b/Docu=
mentation/driver-api/thermal/hardware-binning.rst
> index 0000000000000..fcb8cdd8b2d17
> --- /dev/null
> +++ b/Documentation/driver-api/thermal/hardware-binning.rst
[ ... ]
> +After registration
> +  Call ``thermal_zone_set_supported_hw_bin()`` (or the devm-managed
> +  ``devm_thermal_zone_set_supported_hw_bin()``) on an already-registered
> +  zone::

[Severity: Medium]
The documentation states thermal_zone_set_supported_hw_bin() can be called
after zone registration to provide hardware binning data.

However, OF trips are parsed synchronously during registration in
thermal_of_zone_register_with_bin(). Calling this API afterwards only updat=
es
the struct but fails to re-evaluate the already-parsed trips. This could
cause the thermal core to fall back to default temperatures.

Additionally, when using devm_thermal_of_zone_register_with_bin(), the
binning info is not saved to tz->hw_bin_info, causing
thermal_zone_get_hw_bin_info() to incorrectly return NULL. Are there missing
updates to re-evaluate trips and store the binning info?

> +
> +      int thermal_zone_set_supported_hw_bin(struct thermal_zone_device *=
tz,
[ ... ]
> diff --git a/drivers/thermal/thermal_bin.c b/drivers/thermal/thermal_bin.c
> index 0000000000000..ef09619813696
> --- /dev/null
> +++ b/drivers/thermal/thermal_bin.c
[ ... ]
> +int thermal_zone_set_supported_hw_bin(struct thermal_zone_device *tz,
> +				      const u32 *vers, unsigned int count)
> +{
> +	u32 *copy;
> +
> +	if (WARN_ON(!tz || !vers || !count || count > THERMAL_HW_BIN_MAX_LEVELS=
))
> +		return -EINVAL;
> +
> +	/*
> +	 * The copy is allocated against the zone's parent device so that it
> +	 * is freed when that device goes away.  Reject zones registered
> +	 * without a parent rather than scribbling on dev=3DNULL inside devm.
> +	 */
> +	if (!tz->device.parent)
> +		return -EINVAL;

[Severity: High]
Does this check structurally guarantee failure?

The function checks if (!tz->device.parent) to allocate devm memory against
the parent device, returning -EINVAL if NULL. However, the thermal core
allocates struct thermal_zone_device dynamically in
thermal_zone_device_register_with_trips() and never sets tz->device.parent
(thermal zones are registered as virtual sysfs devices).

Because this seems to always be NULL, this API appears permanently unusable
for any platform driver. Should the memory be allocated against a different
device or managed differently?

> +
> +	copy =3D devm_kmemdup(tz->device.parent, vers, count * sizeof(u32),
> +			    GFP_KERNEL);
[ ... ]
> +const struct thermal_hw_bin_info *
> +thermal_zone_get_hw_bin_info(const struct thermal_zone_device *tz)
> +{
> +	/* Pairs with smp_store_release() in thermal_zone_set_supported_hw_bin(=
) */
> +	if (!tz || !smp_load_acquire(&tz->hw_bin_info.supported_hw_bin))
> +		return NULL;
> +
> +	return &tz->hw_bin_info;

[Severity: Medium]
Does returning the struct pointer here introduce a double-fetch race?

thermal_zone_get_hw_bin_info() uses an acquire load to check
tz->hw_bin_info.supported_hw_bin but returns a pointer to the mutable
structure instead of a safe array pointer.

Callers must fetch the array pointer a second time. Concurrently,
devm_thermal_zone_clear_supported_hw_bin() locklessly clears the pointer
during unbind:

	smp_store_release(&tz->hw_bin_info.supported_hw_bin, NULL);
	tz->hw_bin_info.supported_hw_bin_count =3D 0;

After this returns, devm frees the memory. The caller's second fetch can
dereference NULL or freed memory. Should this API return the snapshot of
the array pointer instead to avoid a use-after-free?

> +}
> +EXPORT_SYMBOL_GPL(thermal_zone_get_hw_bin_info);
> diff --git a/drivers/thermal/thermal_of.c b/drivers/thermal/thermal_of.c
> index fe47d74b7219e..8cc5b5aa141cd 100644
> --- a/drivers/thermal/thermal_of.c
> +++ b/drivers/thermal/thermal_of.c
[ ... ]
> +static int thermal_of_trip_read_temperature(struct device_node *np,
> +					    const struct thermal_hw_bin_info *hw,
> +					    int *temp)
> +{
[ ... ]
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

[Severity: Low]
Is this failure path unreachable?

This function loops to match a hardware bin subgroup, logging a warning and
returning -ENODEV if no match is found. However, this function is only
called from thermal_of_populate_trip() when thermal_of_trip_is_supported()
returns true.

Since thermal_of_trip_is_supported() executes the exact same match validati=
on
loop beforehand, it seems guaranteed that the loop will find a match. Can
this dead code be removed, or is there a case where it could still be
reached?

> +}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-thermal_bi=
n-v1-0-5a29be7e8ec5@oss.qualcomm.com?part=3D2
