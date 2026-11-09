Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794222485;
	b=FJx4XMRjM97UD+bCRCtOLampqePyiCwV5SK2QCT3TttdEbOJJLIQ55yHXZlH3rHSjmPx
	 dO0myXvmEIQq0kLizL6kf+C4A2/CqdGkFT4qSTKTFl1ZMBNT3wyNC6ojlzld5Zt+IvrA+
	 o3Ic2GxOCl9r7j9MMReLPyxd0L/4Ir4W859f4fhjkzehkDSE6hDbS1g03r2K3Hae/TwCC
	 sEdKtz9Z/1QayP5og2Pnn9BbHYZgQwpxf1ZpYLpEjcpxkCI+9eVoiNnu2WK7zRPMYr0Xc
	 ncO2+uSBRkTt9DD3ZKTCCrrqlSMQWUzbyzrIuBvVcmdV5SKscGy2isKR0hBL+a65MWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794222485;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pdHzXegQ+XvZ3k1muU8qOHmHXIWhdGvV2NXRM9RO0cM=;
	b=wSSQrn8JukyWFHpHNJMuHJRr9cnM+CC4nKuA0bH7FUNX86vf618RQ2XcSxPx0vua37pp
	 FwttB4UEIroAGVaeimmjGo2gzFwXo3MBA7Goxa9MWm+TxB7VEe+hZGlti3BhfRYyFwQQm
	 mhK5+Knsq1ghzWtqCKkRxe1O+ijG9hlPI7SI3xkXvRKN/jgsCoMnSPH2jxi+0VvIB5d9I
	 +eQPlLYct4n8UMVeAu4jbRozxyMB/1PM/YtyhOqPjqhAk1LacjaLyGCEijko/Jtv0fQQ9
	 SdGiNn7Du8D49ZNVokzfrWzmnKZ6qO8u56YPfU8n99XlyhMxPUuAT00ik+pE0SAaCqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkUFpLVi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B90606A31C
	for <devicetree@vger.kernel.org>; Mon,  9 Nov 2026 11:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HkUFpLVi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B4E1F008A2;
	Mon,  9 Nov 2026 11:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794222484;
	bh=pdHzXegQ+XvZ3k1muU8qOHmHXIWhdGvV2NXRM9RO0cM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkUFpLViIyMRm1a2yAbQjnl9lxeXpS7RT8A8iZoFK7bsuqbNPApAYrIZ3hRi0MBs3
	 g91dELOV//a9KFH7IVLWFyJiu/w4Zfv9+41c+Zimk3yU01vTIW4vkLVEjnL9Z/qnqf
	 UVI4IIdOnjlr7YAYWqyoDmJhqJWYG+r+TxDD8UXGJT4yWO83kRyVqp47Jx+5LB+o72
	 62lCSZukZ62ue1GnDYd/qOO8HvXHLy55WuU9w7eBjlcoEe1sdbohrxBCK6pyf2opsR
	 jnnfaQ1jU/ltySqeoCwMfD6wzVwWQ1c4o+t87zCJ2FQ2D+/raZzYf0chUch0hLMGWY
	 b1WO46NxGHvXw==
Message-ID: <sashiko-outbox-204858@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/7] arm_mpam: Add device tree support for MSC
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261109-mpam-resctrl-dt-knp-support-v5-5-150335a79381@oss.qualcomm.com>
References: <20261109-mpam-resctrl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com>
 <20261109-mpam-resctrl-dt-knp-support-v5-5-150335a79381@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 11:08:04 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] resctrl: mpam: DT MSCs all get id -1 and collide in
  mpam_vmsc_find()
- [Medium] resctrl: mpam: stale error returned by
  mpam_dt_parse_resources()
- [Medium] resctrl: mpam: uncleared cpumask in
  mpam_get_cpumask_from_cache_id()
- [Medium] arm_mpam: undocumented DT bindings and broken child handling
  in MSC probe
- [Medium] arm_mpam: broken DT parent and error checks in
  update_msc_accessibility()
--

commit 6c78e8406d4a4b369efac7e14139c25fdb9faa61
Author: James Morse <james.morse@arm.com>

arm_mpam: Add device tree support for MSC probing

This commit adds Device Tree probing support for MPAM MSCs, parsing MSC
and cache nodes to determine cache IDs, CPU accessibility masks, and RIS
entries.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index bea231dac7e66..78caa8ae13490 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
[ ... ]
> @@ -263,6 +266,171 @@ static void mpam_free_garbage(void)
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
> +
> +		__mpam_get_cpumask_from_cache_id(cpu, cpu_node, cache_id,
> +						 cache_level, affinity);
> +	}
> +
> +	return 0;
> +}

[Severity: Medium]
Does the Device Tree path in mpam_get_cpumask_from_cache_id() leave stale or
uninitialized bits in affinity by not calling cpumask_clear(affinity) before
the loop?

Unlike acpi_pptt_get_cpumask_from_cache_id(), which clears the output mask =
on
entry, __mpam_get_cpumask_from_cache_id() only sets matching bits with
cpumask_set_cpu(). In traffic_matches_l3(), tmp_cpumask is allocated with
alloc_cpumask_var() without __GFP_ZERO when CONFIG_CPUMASK_OFFSTACK=3Dy and
passed via find_l3_equivalent_bitmask() to mpam_get_cpumask_from_cache_id(),
leaving uninitialized heap bits in the cpumask_equal() comparison.

[ ... ]

> +static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_no=
de *np,
> +				  u8 ris_idx)
> +{
> +	int err =3D 0;
> +	u32 level =3D 0;
> +	u32 cache_id;
> +	struct device *dev =3D &msc->pdev->dev;
> +	struct device_node *cache __free(device_node) =3D NULL;
> +	struct device_node *parent __free(device_node) =3D of_get_parent(np);
> +
> +	if (of_device_is_compatible(np, "arm,mpam-cache")) {
> +		cache =3D of_parse_phandle(np, "arm,mpam-device", 0);
> +		if (!cache) {
> +			dev_err_once(dev, "Failed to read phandle\n");
> +			return -EINVAL;
> +		}
> +	} else if (of_device_is_compatible(parent, "cache")) {
> +		cache =3D of_node_get(parent);
> +	} else {
> +		/* For now, only caches are supported */
> +		cache =3D NULL;
> +		return err;
> +	}
> +
> +	err =3D of_property_read_u32(cache, "cache-level", &level);
> +	if (err) {
> +		dev_err_once(dev, "Failed to read cache-level\n");
> +		return err;
> +	}
> +
> +	cache_id =3D cache_of_calculate_id(cache);
> +	if (cache_id =3D=3D ~0U) {
> +		dev_err_once(dev, "Failed to calculate cache-id\n");
> +		return -ENOENT;
> +	}
> +
> +	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
> +}

[Severity: Medium]
Does mpam_dt_parse_resource() check the wrong parent node and rely on
undocumented Device Tree properties when called for a child RIS node?

Commit "dt-bindings: arm: Add MPAM MSC binding" only defines compatible, re=
g,
and arm,not-ready-us on the MSC node with additionalProperties: false,
without child RIS nodes, arm,mpam-cache, or arm,mpam-device. Even if a child
RIS node is passed as np from mpam_dt_parse_resources(), of_get_parent(np)
returns the arm,mpam-msc node rather than the parent cache node, so
of_device_is_compatible(parent, "cache") is false and the RIS is skipped.

> +
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
Can mpam_dt_parse_resources() return a stale error from
of_property_read_reg() and abort probing of an MSC with valid RIS children?

If an available child node with a valid reg property (incrementing num_ris)
is followed by an available child node without reg, of_property_read_reg()
sets err to a negative errno, the if (!num_ris) fallback is skipped because
num_ris is non-zero, and mpam_dt_parse_resources() returns that negative
errno to mpam_msc_drv_probe(), which tears down the MSC.

[ ... ]

> @@ -2392,15 +2550,34 @@ static int mpam_msc_setup_error_irq(struct mpam_m=
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

[Severity: Medium]
Does update_msc_accessibility() leave msc->accessibility empty for standalo=
ne
MSCs placed under a bus node such as /soc?

When an MSC node is under a simple-bus node rather than directly under
of_root or a cache node, update_msc_accessibility() logs an error and leaves
msc->accessibility empty, causing do_mpam_msc_drv_probe() to fail with
-EINVAL and preventing mpam_num_msc from reaching fw_num_msc. In addition,
the return value of get_cpumask_from_cache() is ignored, so if
mpam_get_cpumask_from_cache_id() fails on a later CPU after setting earlier
CPU bits, probing continues with a partial accessibility mask. Also, as not=
ed
earlier, mpam_dt_parse_resources() and mpam_dt_parse_resource() still conta=
in
broken parent and error handling for undocumented child RIS nodes.

[ ... ]

> @@ -2574,15 +2754,45 @@ static int mpam_msc_drv_probe(struct platform_dev=
ice *pdev)
[ ... ]
> +static void mpam_dt_create_foundling_msc(void)
> +{
> +	for_each_compatible_node_scoped(cache, NULL, "cache") {
> +		for_each_child_of_node_scoped(cache, child) {
> +			if (!of_match_node(mpam_of_match, child))
> +				continue;
> +			if (!of_device_is_available(child))
> +				continue;
> +			if (of_node_check_flag(child, OF_POPULATED))
> +				continue;
> +			if (!of_platform_device_create(child, NULL, NULL))
> +				pr_err("Failed to create MSC device for %pOF\n", child);
> +		}
> +	}
> +}

[Severity: High]
Do all Device Tree MSCs get msc->id =3D=3D -1 and collide in mpam_vmsc_find=
()?

Platform devices created from Device Tree (both via
of_platform_default_populate() and of_platform_device_create()) have
pdev->id set to PLATFORM_DEVID_NONE (-1), which do_mpam_msc_drv_probe()
copies into msc->id:

drivers/resctrl/mpam_devices.c:do_mpam_msc_drv_probe() {
	...
	msc->id =3D pdev->id;
	msc->pdev =3D pdev;
	...
}

drivers/resctrl/mpam_devices.c:mpam_vmsc_find() {
	...
	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
		if (vmsc->msc->id =3D=3D msc->id)
			return vmsc;
	}

	return mpam_vmsc_alloc(comp, msc);
}

When two DT MSCs create a RIS in the same mpam_component (for example,
multiple MSCs backing slices of the same cache, or undescribed RIS entries
placed into the shared MPAM_CLASS_UNKNOWN component during
mpam_msc_hw_probe()), mpam_vmsc_find() matches the first MSC's vmsc because
both have id =3D=3D -1. The second MSC's RIS is then linked to the first MS=
C's
vmsc, so mpam_ris_hw_probe() and runtime configuration dereference
ris->vmsc->msc and access the first MSC without holding its locks, and
mpam_ris_destroy() later performs a use-after-free write in
clear_bit(ris->ris_idx, &msc->ris_idxs) if the first MSC was freed first.

Comparing vmsc->msc =3D=3D msc in mpam_vmsc_find() (or assigning unique IDs=
 to
DT MSCs) would avoid the collision.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-mpam-resct=
rl-dt-knp-support-v5-0-150335a79381@oss.qualcomm.com?part=3D5
