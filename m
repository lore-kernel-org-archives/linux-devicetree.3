Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793189055;
	b=03nur5xHboCdoFeLHRYQ/Ro3YK+z+eWG6x2kH8pJs6yf/d1U4sedUg4TDNaYBTri9nax
	 17GiwAnqjYb+N/tV24xmzI6pYV5d2GB/ZbyjElHnZa+uMSsIH0exU/6HZi1NXTSLDH0nr
	 bxQE0OMjuSErylAlHNyLda2kPD5tfWQH6BxNKkZX4DaLsp6N8p47aG3IQV7l4k4zqiODM
	 p+lXaEK7VIHrKx4ImcrVNeJKaZZlEgTZyftqihX04aDACbnUSg0ky62B+uyZehTHjsLOR
	 PkWaPWJh1tqTOW4YqcPIAzwraIrR+sEgIibjVZuI5ORnue0w8G4Dtar04sNuz4XxQkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793189055;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ykHJ1jPQGuhRMSDITQhCbzq/H8VB9vHGtlb6z5f6o+0=;
	b=vPdIJB52CFKzJTD5Dj4cOsrLXBq7XCkS5QCOokEzk9AFbPD0usC/Y95spTDG5/1ISvHJ
	 X+wl/xiFwvai8FsB9MKIsT8Td+Uj5yp+x7t7D9Xc4gOupV02J4VL9N4asubvJAiViHGYq
	 nWaddoEOsJg6ru8Y1We1VnQRieMfAjRcO2vCmqCBQZ8fIMGyDSjOxGkm3aGorG15ASW1I
	 F55P3Tzea4aTl8gKHPWjj5oN9ycGlrTjRzGcf9k8UQz+w5ULa/3rlzlgDl6tzU8PZjJtg
	 nhoA5tAJH1qwlEYPOpvh8ngDjtJtDrGE91mTF0wuT5/h1mTM/8K0mw3KFfwakzLDImw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8aV8Z7y;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A871F606A31C
	for <devicetree@vger.kernel.org>; Wed, 28 Oct 2026 12:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f8aV8Z7y
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 291F51F01828;
	Wed, 28 Oct 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793189054;
	bh=ykHJ1jPQGuhRMSDITQhCbzq/H8VB9vHGtlb6z5f6o+0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f8aV8Z7yOxVkPNj8OZuqImFCzCGkjW2iAPJZVN3dfJTu75T/JGWkY3b3ZTfnLCrds
	 wzs2Y7rpgozEIOSzJLpE8XYb/IH+NB1r2CROiusHOj3JH3Elh6w/pp9HTMOHHsQfw5
	 j+rIGyk99sGyJmuc87lLDpQ8WOqFHHd5vjq7qXcEC98BuUv7QWnqJjH8kLVJQsBV+G
	 YPJWcOkFHpjEnhD6J1kLv4jHTbOAeDoV26U+7P4SLaRejOg7HPbhhFh14CLkySncVX
	 NBuVq3hjfKhBleA9xCBrp/yOOHkGR9YtCta+4FIjKqjweNcScoBuvWpIPHlFf9+wiJ
	 PZIMJOKuPLpVg==
Message-ID: <sashiko-outbox-187855@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 5/6] arm_mpam: Add device tree support for MSC
 probing
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yin Li" <yin.li@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-5-bdda1e445cba@oss.qualcomm.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-5-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 28 Oct 2026 12:04:13 +0000
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
- [High] resctrl: mpam: DT MSCs all get id -1 and alias in mpam_vmsc_find()
- [Medium] resctrl: mpam: mpam_dt_parse_resources() returns stale error code
- [Medium] resctrl: mpam: undocumented DT bindings and broken parent check =
in MSC probe
--

commit 551add9668d2f1a68a508a323e1f2913890fe9b8
Author: James Morse <james.morse@arm.com>

arm_mpam: Add device tree support for MSC probing

This commit adds Device Tree support for probing MPAM MSC devices by
parsing MSC nodes, computing cache IDs and CPU affinity from cache nodes,
and creating RIS entries.

> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_device=
s.c
> index 0f984fcbcae91..091c8ba2e9742 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c

[ ... ]

> @@ -263,6 +266,171 @@ static void mpam_free_garbage(void)
>  	}
>  }
> =20

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
Can mpam_dt_parse_resources() return a stale error code when an MSC node
has an available child node without a reg property after a valid RIS child
node?

In the loop over child nodes, err is overwritten on every iteration by
of_property_read_reg(). When a child node has a valid reg property, num_ris
is incremented and mpam_dt_parse_resource() sets err to 0 on success.

However, if a subsequent available child node does not have a reg property,
of_property_read_reg() sets err to -EINVAL and the if (!err) block is
skipped. Because num_ris is already non-zero, if (!num_ris) is not taken,
and mpam_dt_parse_resources() returns -EINVAL to mpam_msc_drv_probe(),
which then calls mpam_msc_drv_remove() and tears down the previously
created RIS entries.

> @@ -2394,15 +2552,34 @@ static int mpam_msc_setup_error_irq(struct mpam_m=
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
Does the Device Tree parsing in mpam_dt_parse_resources(),
mpam_dt_parse_resource(), and update_msc_accessibility() match the
documented binding and expected DT hierarchy?

In the companion commit ("dt-bindings: arm: Add MPAM MSC binding"), RIS
child nodes, arm,mpam-cache, and arm,mpam-device were dropped from
Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml, which sets
additionalProperties: false and only defines compatible, reg, and
arm,not-ready-us. Yet mpam_dt_parse_resources() and
mpam_dt_parse_resource() still parse child RIS nodes, arm,mpam-cache, and
arm,mpam-device.

Furthermore, when mpam_dt_parse_resources() passes a child node iter as np
to mpam_dt_parse_resource(), parent =3D of_get_parent(np) resolves to the M=
SC
node (arm,mpam-msc) rather than its parent cache node, so
of_device_is_compatible(parent, "cache") will evaluate to false.

In addition, update_msc_accessibility() checks whether parent =3D=3D of_roo=
t or
is compatible with "cache". If a standalone MSC node is placed under a
standard bus node such as /soc rather than directly under /, parent =3D=3D
of_root is false, leaving msc->accessibility empty and causing
do_mpam_msc_drv_probe() to fail with -EINVAL.

[ ... ]

> @@ -2576,15 +2756,45 @@ static int mpam_msc_drv_probe(struct platform_dev=
ice *pdev)
>  	return 0;
>  }
> =20
> +static const struct of_device_id mpam_of_match[] =3D {
> +	{ .compatible =3D "arm,mpam-msc", },
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, mpam_of_match);
> +
>  static struct platform_driver mpam_msc_driver =3D {
>  	.driver =3D {
>  		.name =3D "mpam_msc",
>  		.suppress_bind_attrs =3D true,
> +		.of_match_table =3D of_match_ptr(mpam_of_match),
>  	},
>  	.probe =3D mpam_msc_drv_probe,
>  	.remove =3D mpam_msc_drv_remove,
>  };
> =20
> +/*
> + * MSCs that are declared by the firmware as being part of a cache may n=
ot
> + * be created automatically as platform devices, since there is no
> + * dedicated cache driver.
> + *
> + * Deal with theo MSCs here.
> + */
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
Will all Device Tree MSCs receive msc->id =3D=3D -1 and alias each other in
mpam_vmsc_find()?

On ACPI systems, acpi_mpam_parse_msc() allocates each platform_device with
platform_device_alloc("mpam_msc", tbl_msc->identifier), giving each MSC a
unique pdev->id.

On Device Tree systems, platform devices created via standard DT bus
population or via mpam_dt_create_foundling_msc() ->
of_platform_device_create() go through of_device_add(), which sets:

drivers/of/platform.c:of_device_add() {
	...
	ofdev->name =3D dev_name(&ofdev->dev);
	ofdev->id =3D PLATFORM_DEVID_NONE;
	...
}

When do_mpam_msc_drv_probe() initializes the MSC, it copies pdev->id
directly:

drivers/resctrl/mpam_devices.c:do_mpam_msc_drv_probe() {
	...
	msc->id =3D pdev->id;
	msc->pdev =3D pdev;
	...
}

As a result, every DT-probed struct mpam_msc gets msc->id =3D=3D -1. When t=
wo
or more MSCs belong to the same struct mpam_component (for example,
multiple MSCs under the same cache node or referencing the same cache, or
multiple MSCs with undescribed RIS indices placed into the shared
MPAM_CLASS_UNKNOWN component during mpam_msc_hw_probe() ->
mpam_get_or_create_ris()), mpam_ris_create_locked() calls mpam_vmsc_find():

drivers/resctrl/mpam_devices.c:mpam_vmsc_find() {
	...
	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
		if (vmsc->msc->id =3D=3D msc->id)
			return vmsc;
	}

	return mpam_vmsc_alloc(comp, msc);
}

Because vmsc->msc->id =3D=3D msc->id evaluates -1 =3D=3D -1, the second MSC=
 (msc2)
reuses the first MSC's struct mpam_vmsc (vmsc1, where vmsc1->msc =3D=3D msc=
1)
instead of allocating its own.

During mpam_msc_hw_probe(msc2), mpam_ris_hw_probe(ris2) resolves
ris->vmsc->msc to msc1 while holding msc2's locks:

drivers/resctrl/mpam_devices.c:mpam_ris_hw_probe() {
	struct mpam_msc *msc =3D ris->vmsc->msc;
	...
	lockdep_assert_held(&msc->probe_lock);
	lockdep_assert_held(&msc->part_sel_lock);
}

This triggers lockdep assertion failures on msc1 and performs unserialized
register accesses against msc1 instead of msc2.

Furthermore, during teardown in mpam_msc_drv_remove() or mpam_disable(),
destroying msc1 leaves vmsc1 alive because ris2 is still linked in
vmsc1->ris. Once msc1 is freed by mpam_free_garbage(), destroying msc2
calls mpam_ris_destroy(ris2), which dereferences the freed msc1 via
vmsc->msc:

drivers/resctrl/mpam_devices.c:mpam_ris_destroy() {
	struct mpam_vmsc *vmsc =3D ris->vmsc;
	struct mpam_msc *msc =3D vmsc->msc;
	...
	clear_bit(ris->ris_idx, &msc->ris_idxs);
}

causing a use-after-free write. Formatting msc->id with %u in
mpam_msc_setup_error_irq() and __mpam_irq_handler() will also log
msc:4294967295.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028-mpam-resct=
rl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com?part=3D5
