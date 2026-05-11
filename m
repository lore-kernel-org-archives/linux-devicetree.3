Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E3D280CD2
	for <devicetree@vger.kernel.org>; Mon, 11 May 2026 23:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778543581; cv=none; b=BFxoYf37b2TFUoE1S2pcKm31NJDcuoACPDKK0G9nmrxksspZLR8Xq08h2afR1sLKVbDXEATezCOMKP46N35AmfNYtH2L/5Cq7475Yb6DnzIr3NkwffPV4sVVA8HlZnrkuf1JYRvHDsv240AK15UbLhSUbYJ139KVE0c9nNmxslk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778543581; c=relaxed/simple;
	bh=8nbjr3BTlySt/HulPsXjZLMEzscq5eUo83AQ3H+1e8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O9cuP3TrupKk97XRv/MHAIa4ULdahB8EZuKni5jI82x2JfjlTHHtWHJR7yDPrCPG3kvP520OhFiQuK5hgY2lpWP/BZ2zklAJpYckAo35yD0C5o3LzPdpLpk/jS5V1nd0zAE6zc+03670H8vsPTqSuqRbZoIAjJSnxgqm2MkzZ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gkOkpVpJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gkOkpVpJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 781C6C2BCB0;
	Mon, 11 May 2026 23:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778543580;
	bh=8nbjr3BTlySt/HulPsXjZLMEzscq5eUo83AQ3H+1e8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gkOkpVpJz4DomwN3afBeX1z3zQkCB5SEbtTAz6isXOajGKdAqJ4NuesixzWcth6vE
	 gBdGNHGHf1aRLVFbVmYwD5zvkK2ys/JD04Vwv0HQuZVCNjBb8o/ffExrCHZgndpV8J
	 N3Olvv7M4XXcIqWgO5qd8N0IdNdVznYnLf9FiWn6pWoKmmFEu7bJ/4Va3XWjIvfB88
	 xf2on4ZlC4WcwaZmc+rrCj70O5jMvj1shYSU3DKeZyP9ENKToB+c5vAheyPtGx7VGR
	 DVUVKbhqHM3ua3wlAtJ+eE9JTDZnYh0e0CO8JRTNy8T9/bC500Rb4oXLaHX1ufxfAh
	 mRCmHBXR7fMXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-3-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-3-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 23:52:59 +0000
Message-Id: <20260511235300.781C6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Uninitialized Hardware State / Early Boot Bypass for CSR_SRMCFG
- [High] Resource Control Bypass via Monitoring Group (MCID) evaluation flaw
- [High] Hardware/Software State Desync on Boot CPU Resume from Suspend
- [Medium] Redundant loop and Data Race in hotplug initialization
- [Medium] Initcall returns positive hotplug state ID on success
--

commit 0e2697a6f259670c211c47e45e2448410a9ac7b9
Author: Drew Fustini <fustini@kernel.org>

riscv: add support for srmcfg CSR from Ssqosid extension
   =20
This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
extension. It introduces a per-task srmcfg field mirrored to a per-CPU
cache to optimize context switching and configure resource management IDs.
   =20
Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0

> diff --git a/arch/riscv/include/asm/qos.h b/arch/riscv/include/asm/qos.h
> new file mode 100644
> index 0000000000000..6988fe37551ee
> --- /dev/null
> +++ b/arch/riscv/include/asm/qos.h
> @@ -0,0 +1,64 @@
[ ... ]
> +static inline void __switch_to_srmcfg(struct task_struct *next)
> +{
> +	u32 thread_srmcfg;
> +
> +	thread_srmcfg =3D READ_ONCE(next->thread.srmcfg);
> +
> +	/* Default-group tasks (thread.srmcfg =3D=3D 0) follow this CPU's defau=
lt. */
> +	if (thread_srmcfg =3D=3D 0)
> +		thread_srmcfg =3D __this_cpu_read(cpu_srmcfg_default);

Does this logic correctly handle tasks assigned to a specific monitoring
group but the default resource group?

The srmcfg CSR encodes both the Resource Control ID (RCID) and Monitoring
Counter ID (MCID).

If a task is placed in the default resource allocation group (RCID=3D0) but
is assigned a specific monitoring group (MCID!=3D0), its thread.srmcfg will
be non-zero.

The thread_srmcfg =3D=3D 0 check will fail, bypassing the cpu_srmcfg_default
override. This would allow the task to escape the CPU's restricted RCID
allocation.

Could the RCID and MCID fields be extracted and evaluated independently?

> diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> new file mode 100644
> index 0000000000000..75bda2ed89e1f
> --- /dev/null
> +++ b/arch/riscv/kernel/qos.c
> @@ -0,0 +1,49 @@
[ ... ]
> +/* cached value of srmcfg csr for each cpu */
> +DEFINE_PER_CPU(u32, cpu_srmcfg);

Will this cause the CSR write to be bypassed during early boot?

DEFINE_PER_CPU places the cache in .bss or implicitly zero-initializes it.

During early boot, context switches occur to threads like idle or init
before the arch_initcall executes, and these early threads have
thread.srmcfg =3D=3D 0.

When __switch_to_srmcfg() checks if thread_srmcfg !=3D __this_cpu_read(cpu_=
srmcfg),
it will evaluate to 0 !=3D 0 and skip writing the CSR. This means the CPU
would execute all early boot code with an implementation-defined,
potentially random hardware CSR state.

Could we statically initialize the per-CPU variable, for example:

DEFINE_PER_CPU(u32, cpu_srmcfg) =3D U32_MAX;

> +
> +/* default srmcfg value for each cpu, set via resctrl cpu assignment */
> +DEFINE_PER_CPU(u32, cpu_srmcfg_default);
> +
> +/*
> + * Seed the per-CPU srmcfg cache to a sentinel that no real srmcfg encod=
ing
> + * can produce (MCID << 16 | RCID, both fields well under 16 bits) so the
> + * next __switch_to_srmcfg() unconditionally writes the CSR. Ssqosid v1.0
> + * leaves CSR state across hart stop/start implementation-defined, so the
> + * cached value cannot be trusted after online.
> + */
> +static int riscv_srmcfg_online(unsigned int cpu)
> +{
> +	per_cpu(cpu_srmcfg, cpu) =3D U32_MAX;
> +	return 0;
> +}

How is the boot CPU's cache handled during system resume from suspend?

During system suspend, non-boot CPUs are hotplugged out, but the boot CPU
remains online and enters sleep. The hardware CSR register loses its state
during sleep, reverting to an undefined power-on state.

Because the boot CPU is never offlined, its cpu_srmcfg software cache is
not invalidated by the hotplug callback upon resume.

If a task is scheduled with an srmcfg matching the pre-suspend cache,
__switch_to_srmcfg() will falsely assume the hardware CSR is valid and
skip the write, leaving the boot CPU executing with an invalid hardware tag.

> +
> +static int __init riscv_srmcfg_init(void)
> +{
> +	unsigned int cpu;
> +	int err;
> +
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> +		return 0;
> +
> +	/* Seed already-online CPUs. The cpuhp callback covers later onlines. */
> +	for_each_online_cpu(cpu)
> +		per_cpu(cpu_srmcfg, cpu) =3D U32_MAX;

Is this manual iteration over online CPUs necessary?

The cpuhp_setup_state() function used below implicitly invokes the
callback locally on all already-online CPUs. Iterating here is redundant
and might cause a data race with concurrent context switches.

> +
> +	err =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> +				riscv_srmcfg_online, NULL);
> +	if (err < 0)
> +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online af=
ter boot will not invalidate the CSR_SRMCFG cache\n",
> +			err);
> +	return err;
> +}
> +arch_initcall(riscv_srmcfg_init);

Does this return a false failure during boot?

When cpuhp_setup_state() dynamically allocates a hotplug state and succeeds,
it returns a positive integer ID.

Returning this positive value from an arch_initcall will be interpreted by
the kernel's initcall infrastructure as a failure, generating a misleading
boot warning like "initcall returned with error code".

Should this evaluate the return value and explicitly return 0 when err >=3D=
 0?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D3
