Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88891DDC1B
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779670257; cv=none; b=TWJDbcyhocLvV4T9F8JNto+xoZgHZgXXpXJwV5zApWp1FIsqoFvU8845snVquWWIpBkDf3L5cS3vi1hgLljeTNjPxPnSMd4HbY7LZAFsU4MW1Cw1LAFVgizQeMLEozuMe52IG1XLjn6GY3EqO7dQrYXJ7k4cH461QKnuqaJEHFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779670257; c=relaxed/simple;
	bh=dN1VYHpdZoe37L4NW2porP2ifDHmwcnTBIhHshqoqd0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Iw+FEnf9K0mQUWEoNbZXAZwyOI2Zsb8ayKoWBqV6pwS1sbmIHvgw+2vl3CwgFFmp72PmhAZBAdZbHZgDK3UB0XMbV63SjlJCLzSJtEOh80QiOsbf/D3q8UvhxkCqhrWXEmYQBscZ23gOCbmp1pscknFEpy3ZfB4X0YjHp19qVlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E4QBUZBw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E4QBUZBw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 312281F000E9;
	Mon, 25 May 2026 00:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779670256;
	bh=m6tiG/ZqTTiv8DiAgDhPEps5J5WI6LWUP3rK9wsuinU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E4QBUZBwEqBzkzza3wk34f1DIpdz70XVULfjd5YneU3at95QUzs/N5EIRiGkXt8Ea
	 5ua6lUy/CZS17GNdDVYBJxamfHC/KKeGgywghQ6abwAibu/ZtSt9Meao2D5a0WJ9Qs
	 ttLzumGZP6Fn1onkb0JKdqnNlDvPGlPfRtBoOpwLzIhSzMB5yGcwxNqenlzrUXTBEJ
	 VJo+kMhkcB9fVKvlrZlDwc72taXV+VP2hIUIR5ZGef6Kdnve7iMn4CRGRMVYD9VoZx
	 2SrrCrRH6yRg8I3qcOZYB6fBMaLDtp38xsUYgyP9XceESHRNpGVEvMneUQsCj4lbg0
	 AQjx+JnAPKSeQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-11-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-11-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:50:55 +0000
Message-Id: <20260525005056.312281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The CPU hotplug callbacks do not notify the generic resctrl subsys=
tem when CPUs come online or go offline, leaving the `rdtgroup` cpumasks ou=
t of sync.
- [High] The per-CPU default CLOSID and RMID are not reset to the reserved =
defaults when a CPU comes online.
- [High] CONFIG_RISCV_ISA_SSQOSID unconditionally selects ARCH_HAS_CPU_RESC=
TRL without requiring the implementation driver, leading to build failures.
- [High] Missing rollback on partial failure in CPU hotplug online callback=
 leaves the system in an inconsistent state.
--

commit 31a7934518aa1237167aa6b7e0cb45ba9107610b
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add cache allocation via capacity block mask

This commit wires CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2
and RDT_RESOURCE_L3 schemata. It treats mismatched controller capacities at
the same cache level as a fatal error and creates domains lazily during CPU
hotplug.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6abbb21f3a0dc..390353a6153a2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
>  	bool "Ssqosid extension support for supervisor mode Quality of Service =
ID"
>  	depends on 64BIT
>  	default n
> +	select ARCH_HAS_CPU_RESCTRL

[Severity: High]
Could this lead to build failures if the CBQRI driver is not enabled?

The Kconfig symbol RISCV_ISA_SSQOSID unconditionally selects
ARCH_HAS_CPU_RESCTRL, which signals to the core kernel that the architecture
provides the resctrl_arch_* interface. This permits CONFIG_RESCTRL_FS to be
enabled.

However, since the implementation resides in drivers/resctrl/cbqri_resctrl.c
which is only compiled when CONFIG_RISCV_CBQRI_DRIVER is set, enabling
RISCV_ISA_SSQOSID and RESCTRL_FS without RISCV_CBQRI_DRIVER might cause
linker errors due to undefined references to the resctrl_arch_* functions.
Would it be safer to add a dependency on the driver?

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> new file mode 100644
> index 0000000000000..1e6198e25fd29
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_resctrl.c
> @@ -0,0 +1,736 @@

[ ... ]

> +static int cbqri_resctrl_online_cpu(unsigned int cpu)
> +{
> +	struct cbqri_controller *ctrl;
> +	int err =3D 0;
> +
> +	mutex_lock(&cbqri_domain_list_lock);
> +
> +	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> +		if (ctrl->type !=3D CBQRI_CONTROLLER_TYPE_CAPACITY)
> +			continue;
> +		if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> +			continue;
> +		if (!ctrl->alloc_capable)
> +			continue;
> +
> +		err =3D cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> +		if (err)
> +			break;
> +	}

[Severity: High]
Does this loop leave the system in an inconsistent state if it fails partway
through?

If cbqri_attach_cpu_to_cap_ctrl() succeeds for an earlier controller
but fails for a subsequent one, the loop breaks and returns an error. The C=
PU
hotplug framework will abort the bring-up without invoking the teardown
callback cbqri_resctrl_offline_cpu().

Will this leak the rdt_ctrl_domain structs for the controllers that
were successfully attached?

> +
> +	mutex_unlock(&cbqri_domain_list_lock);
> +	return err;
> +}

[Severity: High]
Should we reset the per-CPU default closid and rmid when a CPU comes online?

When a CPU is offlined while in a custom resctrl group, its cpu_srmcfg_defa=
ult
might still hold that custom closid/rmid. When the CPU comes back online, it
conceptually returns to the default rdtgroup, so it might need its state
reset via resctrl_arch_set_cpu_default_closid_rmid() to prevent tasks from
running with stale assignments.

[Severity: High]
Does this missing notification leave the generic resctrl subsystem out of s=
ync?

The generic fs/resctrl layer usually relies on the architecture to notify it
via resctrl_online_cpu() to update resource group masks. Without this, newly
onlined CPUs might not be added to the default resctrl group, potentially
breaking sysfs CPU tracking.

> +
> +static int cbqri_resctrl_offline_cpu(unsigned int cpu)
> +{
> +	int rid;
> +
> +	mutex_lock(&cbqri_domain_list_lock);
> +
> +	for (rid =3D 0; rid < RDT_NUM_RESOURCES; rid++) {
> +		struct cbqri_resctrl_res *hw_res =3D &cbqri_resctrl_resources[rid];
> +
> +		if (!hw_res->ctrl)
> +			continue;
> +		cbqri_detach_cpu_from_ctrl_domains(&hw_res->resctrl_res, cpu);
> +	}
> +
> +	mutex_unlock(&cbqri_domain_list_lock);
> +	return 0;
> +}

[Severity: High]
Does this also need to call resctrl_offline_cpu() to notify the core layer?

Without notifying the generic layer, offlined CPUs might remain tracked
permanently in the rdtgroup cpumasks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D11
