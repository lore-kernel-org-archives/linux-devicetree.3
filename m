Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152F734CCE
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 06:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442627; cv=none; b=YohUDzJAHH5jiYdxHg25Rdl7VqaMeyZhndd6fj8hrkDnwbrsJKE9Qcqjv/FtO0ONLAvMR+nWsxlcnHWCSCsu0ukjHvh1gEHvn0Sl5ODlqEka3/UDhbEILYvBZ4AB+edOqL6EUu5wBZzeALp61GCv3qKqsx72YblcySwfhhRw9YU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442627; c=relaxed/simple;
	bh=BTr/0mZVfCgtdwBGPDup1Fybi+oikskdiXIYCWOnUmY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=gaycM3K7twIW6yCO8ygK0sKzG1PfxVTwIFaXSQgzNW4jkqt3zx7pH7Mb46KYgtgldlXJPIphAvyRigZjrTKA0ZJ/1huJUZs2vmW7GzdRgKs4BvUgd6UOoFRwAakzinG9fmlvXgcahuqEZ7WkrgBiqhMGZlpIZvZgawhXTTRKiSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E72VS6Ql; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E72VS6Ql"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B41F000FF;
	Thu,  8 Oct 2026 06:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791442625;
	bh=5JkS4S8csO0S8/5Z2UaJdgeNIirct0eqNxke05qanvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E72VS6QlXJyR+Qay/d1gf3oHkrhvNPCiYdc4aKYe3eIGhVLrMZtEvQAVRHfjks47W
	 ZwAcdoeonUtk8ypAUr/I3AxfLhZPYi08c0V6ve/QyXaTn0sXhUzX5C+ceEw/eI8MR5
	 bsUOcvDLlyVUqv8Bsfm/rbesx6ybBAnQDUHrOXnaOkdPtKh498d3CJm8tvXnY4RZxL
	 bM8nlGxDS41NgYXUXmkkGEMLSHNDVfswmCEIuGAg6hdH8zmwSpg2VmxChNJ5BdnW5O
	 EH0vxcObipNovIVeHvGa+UdLSChoFyk43PemDmu6LjU+tgqn+Zp4YgSmeQ/VGxSVqM
	 qOgQEgkdt9j9w==
Message-ID: <sashiko-outbox-163721@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/8] arm_mpam: Add device tree support for MSC
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-5-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-5-35196c2b43bf@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 06:57:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] of: error code leak from of_property_read_reg() in mpam_dt_parse=
_resources()
- [Low] of: unhandled error from get_cpumask_from_cache_id() leaves accessi=
bility mask incomplete
--

commit df5cdd0f6660fd3028a1a26bcd32ad8c47e80043
Author: James Morse <james.morse@arm.com>
arm_mpam: Add device tree support for MSC probing

The MPAM driver currently discovers MSCs only via ACPI. Add a device tree
path so MSCs can be probed on DT-based platforms by parsing MSC nodes,
computing cache-id and affinity, and creating the RIS entries.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index c68135ee0ffcb..0640690eae2c0 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

[ ... ]

> @@ -161,6 +164,171 @@ static void mpam_free_garbage(void)
>  	}
>  }
> =20
> +/* Called recursively to walk the list of caches from a particular CPU */

[ ... ]

> +/*
> + * The cacheinfo structures are only populated when CPUs are online.
> + * This helper walks the device tree to include offline CPUs too.
> + */
> +int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
> +				   cpumask_t *affinity)
> +{
> +	int cpu;
> +
> +	if (!acpi_disabled)
> +		return acpi_pptt_get_cpumask_from_cache_id(cache_id, affinity);
> +
> +	for_each_possible_cpu(cpu) {
> +		struct device_node *cpu_node __free(device_node) =3D of_get_cpu_node(c=
pu, NULL);
> +		if (!cpu_node) {
> +			pr_err("Failed to find cpu%d device node\n", cpu);
> +			return -ENOENT;
> +		}

[Severity: Low]
Does this code leave the affinity mask partially populated on failure?

If of_get_cpu_node() fails for any CPU, the loop immediately aborts and ret=
urns
-ENOENT. Any CPUs that were successfully processed prior to the failure rem=
ain
populated in the affinity mask.

> +
> +		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
> +						 cache_level, affinity);
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
> +{
> +	u64 ris_idx =3D 0;
> +	int err, num_ris =3D 0;
> +	struct device_node *np;
> +
> +	np =3D msc->pdev->dev.of_node;
> +	for_each_available_child_of_node_scoped(np, iter) {
> +		err =3D of_property_read_reg(iter, 0, &ris_idx, NULL);
> +		if (!err) {
> +			/*
> +			 * ris_idx is read as u64 but indexes a 4-bit RIS selector
> +			 * (0..MPAM_MSC_MAX_NUM_RIS). Reject out-of-range values here,
> +			 * before it is narrowed to u8, so a large value cannot be
> +			 * truncated into a valid-looking index.
> +			 */
> +			if (ris_idx >=3D MPAM_MSC_MAX_NUM_RIS)
> +				return -EINVAL;
> +			num_ris++;
> +			err =3D mpam_dt_parse_resource(msc, iter, ris_idx);
> +			if (err)
> +				return err;
> +		}
> +	}
> +
> +	if (!num_ris)
> +		err =3D mpam_dt_parse_resource(msc, np, 0);
> +
> +	return err;
> +}

[Severity: Medium]
Can this function spuriously fail if a child node lacks a reg property?

In mpam_dt_parse_resources(), the loop variable err is overwritten by the
result of of_property_read_reg() for each child node. If a child node lacks
a reg property, of_property_read_reg() fails and sets err to a negative err=
or
code.

If this failing child node is the last one processed in the loop, the loop
terminates with err holding that negative value. Provided at least one valid
RIS node was successfully processed earlier (num_ris > 0), the fallback blo=
ck
is bypassed.

The function then returns the leaked err value, causing the MSC probe to
fail.

[ ... ]

> @@ -1987,15 +2145,34 @@ static int mpam_msc_setup_error_irq(struct mpam_m=
sc *msc)
>   */
>  static void update_msc_accessibility(struct mpam_msc *msc)
>  {
> +	struct device *dev =3D &msc->pdev->dev;
> +	struct device_node *parent;
>  	u32 affinity_id;
>  	int err;
> =20
> -	err =3D device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
> -				       &affinity_id);
> -	if (err)
> +	if (!acpi_disabled) {
> +		err =3D device_property_read_u32(&msc->pdev->dev, "cpu_affinity",
> +					       &affinity_id);
> +		if (err)
> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
> +		else
> +			acpi_pptt_get_cpus_from_container(affinity_id,
> +							  &msc->accessibility);
> +
> +		return;
> +	}
> +
> +	/* Where an MSC can be accessed from depends on the path to of_node. */
> +	parent =3D of_get_parent(msc->pdev->dev.of_node);
> +	if (parent =3D=3D of_root) {
>  		cpumask_copy(&msc->accessibility, cpu_possible_mask);
> -	else
> -		acpi_pptt_get_cpus_from_container(affinity_id, &msc->accessibility);
> +	} else {
> +		if (of_device_is_compatible(parent, "cache"))
> +			get_cpumask_from_cache(parent, &msc->accessibility);
> +		else
> +			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
> +	}
> +	of_node_put(parent);
>  }

[Severity: Low]
Is the error from get_cpumask_from_cache() intentionally ignored here?

The error code from mpam_get_cpumask_from_cache_id() propagates up through
get_cpumask_from_cache() to update_msc_accessibility(), but it is not check=
ed.
This allows the driver probe to continue with a partially populated CPU
accessibility mask instead of failing cleanly.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-mpam-resct=
rl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com?part=3D5
