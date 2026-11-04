Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812020;
	b=xGPme04Fqv9VxROv68od/1IGLhLo2FFI7hcQL5n/eyb1KXq26KVzv+0qyU2468I2yTsX
	 MudmSz8aJEoQ24KeHDQaWtagF/Crl8ZilnPI5S0+evnzuGO9V7U6TtOTXpUVPMWrDKto+
	 i0r1IU0V/Cz0bfYtAaDzw5fUqaPHZKHIah/R+KHEmHbPegNrFNfAZlspJ/SY4+Wj6Uzda
	 ITRYJpEV302uPou189tYYasuST3kSDLm8AVBAizaImqhHQ3l/N3SE4Dh7AnFdmHHrRO8u
	 5NdrjkiFsTIDbrUrtZadhxd3PccYYWgHvDTR8mCFrGfojDvBUFOL5vvdcXTKHjYdv3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812020;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=jlG2D95jrtnr5YmQZPiWMyChBWG34t/0zw5bZ4eGsUQ=;
	b=uL+cpm/EfUDVVZHzeCesICAVXcL1D7Zt6tw/bsNGsouoQjoOLlNCo9jrnng+TEdsmHj2
	 WNBVY/Z2sFKT3nBpN24AtRh9i+KwW/8M7OYAfHKi8Ony2EPUc1V7ZBw0+TyjRRgqLwdTn
	 XvJ/Sl79rHWifPK5z4SsUbvYz//tvkDFKSOgijm2KEXvz1Ka6czqxFi5KsyoY/CQXqly2
	 xSARdEN7ywMQF3eAttOJW8RDwowhIywlcM1T6cAV1KMyOLLMTKkpkBQUO8wiNFCIrOmy4
	 8StGB2mCGNbjmXQe9e7Iqeb255+mi6QeSFjoTP0vQysXtLaBLyNy0YSQZy5ubYKMTvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0EouqNf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2562606A32F
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G0EouqNf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612611F000C1;
	Wed,  4 Nov 2026 17:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793812019;
	bh=jlG2D95jrtnr5YmQZPiWMyChBWG34t/0zw5bZ4eGsUQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=G0EouqNfO4mT0iEJiMhfrrlR+IbMAlDfX377kWn57JdLxtt0RArNJc9ufvcu+jtgv
	 aQwogmGFY1ZbM9eS1kjgX4UzLwkfKu261zueFJa/dYsMMP2LLVRejOAc1LBGUWB8E0
	 wsKVLu8PePLFXlWFlvHf3IlXHGg9T5btkxxFI+k8mqlsGceNWHDtPoZNInwhnH0GZA
	 eB9BBbw3ujvGkK10TNPVUn9JBYLrO10+KVhmtQdC8b5gc+g00UDQqxUkA9RDadB3yE
	 wz0ifDhkx5BO32RCoDIynaoqfoA6l+ZAzHnl4w3CMiP/Pif55wV1Lawm6Gq9+riOij
	 stDGy7OluAlJA==
Message-ID: <sashiko-outbox-197711@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/6] riscv_cbqri: resctrl: Add cache allocation via
 capacity block mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
References: <20261104-dfustini-atl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org>
 <20261104-dfustini-atl-sc-cbqri-dt-v10-2-1636a003a3c0@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 17:06:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] resctrl: cbqri: ZERO_SIZE_PTR deref on CDP mount when rcid_count i=
s 1
- [Medium] resctrl: cbqri: stale cpu_srmcfg_default and CSR_SRMCFG across c=
puhp
--

commit ba22d9f49019cdbd30a554bde797ded425016085
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add cache allocation via capacity block mask

This commit wires RISC-V CBQRI capacity controllers into resctrl as L2 and
L3 cache resources, managing control domains across CPU hotplug and exposing
capacity block mask configuration.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> new file mode 100644
> index 0000000000000..165b0027bbe0f
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> +int resctrl_arch_set_cdp_enabled(enum resctrl_res_level rid, bool enable)
> +{
> +	struct cbqri_resctrl_res *cbqri_res;
> +
> +	if (rid !=3D RDT_RESOURCE_L2 && rid !=3D RDT_RESOURCE_L3)
> +		return -ENODEV;
> +
> +	cbqri_res =3D &cbqri_resctrl_resources[rid];
> +	if (!cbqri_res->resctrl_res.cdp_capable)
> +		return -ENODEV;
> +
> +	cbqri_res->cdp_enabled =3D enable;
> +	return 0;
> +}

[ ... ]

> +/*
> + * Note about terminology between x86 (Intel RDT/AMD QoS) and RISC-V:
> + *   CLOSID on x86 is RCID on RISC-V
> + *     RMID on x86 is MCID on RISC-V
> + *
> + * schemata_list_add() halves this count when CDP is enabled because a
> + * CDP CLOSID takes two hardware IDs on x86. CBQRI selects the code or
> + * data allocation with the AT field next to the RCID, so every CLOSID
> + * resctrl hands out under CDP is already a distinct RCID and the RCIDs
> + * from rcid_count/2 upward sit idle. Skipping the halving would need a
> + * resctrl change, so it is left as is.
> + */
> +u32 resctrl_arch_get_num_closid(struct rdt_resource *res)
> +{
> +	struct cbqri_resctrl_res *hw_res;
> +
> +	hw_res =3D container_of(res, struct cbqri_resctrl_res, resctrl_res);
> +
> +	if (!hw_res->nr_ctrls)
> +		return 0;
> +
> +	return hw_res->ctrls[0]->rcid_count;
> +}

[ ... ]

> +static void cbqri_resctrl_control_init(struct cbqri_resctrl_res *cbqri_r=
es)
> +{
> +	struct rdt_resource *res =3D &cbqri_res->resctrl_res;
> +	struct cbqri_controller *ctrl;
> +
> +	if (!cbqri_res->nr_ctrls)
> +		return;
> +	ctrl =3D cbqri_res->ctrls[0];
> +
> +	switch (res->rid) {
> +	case RDT_RESOURCE_L2:
> +	case RDT_RESOURCE_L3:
> +		res->name =3D (res->rid =3D=3D RDT_RESOURCE_L2) ? "L2" : "L3";
> +		res->schema_fmt =3D RESCTRL_SCHEMA_BITMAP;
> +		res->ctrl_scope =3D (res->rid =3D=3D RDT_RESOURCE_L2) ?
> +				    RESCTRL_L2_CACHE : RESCTRL_L3_CACHE;
> +		res->cache.cbm_len =3D ctrl->cc.ncblks;
> +		res->cache.shareable_bits =3D 0;
> +		res->cache.min_cbm_bits =3D 1;
> +		res->cache.arch_has_sparse_bitmasks =3D false;
> +		res->cdp_capable =3D ctrl->cc.supports_alloc_at_code;
> +		res->alloc_capable =3D ctrl->alloc_capable;
> +		INIT_LIST_HEAD(&res->ctrl_domains);
> +		INIT_LIST_HEAD(&res->mon_domains);
> +		break;
> +	default:
> +		break;
> +	}
> +}

[Severity: High]
What happens if a CBQRI capacity controller reports rcid_count =3D=3D 1 and
supports_alloc_at_code =3D=3D true, and userspace mounts resctrl with CDP
enabled (-o cdp, -o cdpl2, or -o cdpl3)?

In drivers/resctrl/cbqri_devices.c, riscv_cbqri_register_cc() only rejects
rcid_count =3D=3D 0, so a controller with rcid_count =3D=3D 1 is accepted. =
Here,
cbqri_resctrl_control_init() sets res->cdp_capable =3D
ctrl->cc.supports_alloc_at_code without requiring ctrl->rcid_count >=3D 2, =
and
resctrl_arch_set_cdp_enabled() allows enabling CDP whenever res->cdp_capable
is true.

When mounting with CDP enabled, rdt_get_tree() -> schemata_list_create() ->
schemata_list_add() halves num_closid:

    s->num_closid =3D resctrl_arch_get_num_closid(r);
    if (resctrl_arch_get_cdp_enabled(r->rid))
            s->num_closid /=3D 2;

With rcid_count =3D=3D 1, s->num_closid becomes 0. Next, closid_init() comp=
utes
rdt_min_closid =3D=3D 0:

    list_for_each_entry(s, &resctrl_schema_all, list)
            rdt_min_closid =3D min(rdt_min_closid, s->num_closid);

    closid_free_map =3D bitmap_alloc(rdt_min_closid, GFP_KERNEL);
    if (!closid_free_map)
            return -ENOMEM;
    bitmap_fill(closid_free_map, rdt_min_closid);

    /* RESCTRL_RESERVED_CLOSID is always reserved for the default group */
    __clear_bit(RESCTRL_RESERVED_CLOSID, closid_free_map);

Because bitmap_alloc(0, GFP_KERNEL) returns ZERO_SIZE_PTR, Could
__clear_bit() immediately fault on ZERO_SIZE_PTR? Should
cbqri_resctrl_control_init() or resctrl_arch_set_cdp_enabled() require
rcid_count >=3D 2 for CDP?

[ ... ]

> +static int cbqri_resctrl_online_cpu(unsigned int cpu)
> +{
> +	mutex_lock(&cbqri_domain_list_lock);
> +	cbqri_attach_cpu_to_all_ctrls(cpu);
> +	mutex_unlock(&cbqri_domain_list_lock);
> +
> +	/*
> +	 * Seed the per-CPU default RCID/MCID to the reserved (0, 0) pair and
> +	 * notify the resctrl core so it tracks this CPU in the default group.
> +	 */
> +	resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0);
> +	resctrl_online_cpu(cpu);
> +	return 0;
> +}
> +
> +static int cbqri_resctrl_offline_cpu(unsigned int cpu)
> +{
> +	resctrl_offline_cpu(cpu);
> +
> +	mutex_lock(&cbqri_domain_list_lock);
> +	cbqri_detach_cpu_from_all_ctrls(cpu);
> +	mutex_unlock(&cbqri_domain_list_lock);
> +	return 0;
> +}

[Severity: Medium]
Can CSR_SRMCFG and per_cpu(cpu_srmcfg, cpu) become out of sync with
per_cpu(cpu_srmcfg_default, cpu) across CPU hotplug?

When a CPU assigned to a non-default resctrl group is taken offline,
cbqri_resctrl_offline_cpu() calls resctrl_offline_cpu(cpu), which removes t=
he
CPU from the group's cpu_mask without resetting cpu_srmcfg_default to (0, 0=
).
Because the CPU is no longer in the group's cpu_mask or cpu_online_mask, a
subsequent rmdir of that group or unmount of resctrl will not clear
cpu_srmcfg_default on the offline CPU either.

In addition, riscv/srmcfg:online (registered at arch_initcall in
arch/riscv/kernel/qos.c) and cbqri:online (registered at late_initcall in
cbqri_arch_late_init()) both use CPUHP_AP_ONLINE_DYN, so
riscv_srmcfg_reset_cache() runs before cbqri_resctrl_online_cpu() on CPU
online and sets per_cpu(cpu_srmcfg, cpu) =3D U32_MAX while cpu_srmcfg_defau=
lt
still holds the stale pre-offline RCID/MCID.

Inside cbqri_resctrl_online_cpu(), cbqri_attach_cpu_to_all_ctrls(cpu) runs
before resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0) and performs
operations that can sleep (such as mutex_lock(), kzalloc_obj() with
GFP_KERNEL, and usleep_range() in cbqri_wait_busy_flag()). If a context
switch occurs on the onlining CPU during cbqri_attach_cpu_to_all_ctrls(),
__switch_to_srmcfg() sees cpu_srmcfg =3D=3D U32_MAX, writes the stale
cpu_srmcfg_default into CSR_SRMCFG, and caches that stale value in
cpu_srmcfg.

When cbqri_resctrl_online_cpu() then calls
resctrl_arch_set_cpu_default_closid_rmid(cpu, 0, 0), it only updates
cpu_srmcfg_default in memory and never calls resctrl_arch_sched_in(current)
to refresh CSR_SRMCFG and cpu_srmcfg on the running CPU.

Should cbqri_resctrl_offline_cpu() reset the CPU's default CLOSID/RMID and
refresh CSR_SRMCFG, and should cbqri_resctrl_online_cpu() set the default to
(0, 0) and call resctrl_arch_sched_in(current) so CSR_SRMCFG and cpu_srmcfg
stay synchronized?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-dfustini-a=
tl-sc-cbqri-dt-v10-0-1636a003a3c0@kernel.org?part=3D2
