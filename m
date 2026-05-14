Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F873F4135
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 05:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778736638; cv=none; b=H9qi5Xn7WLxRSezGE8wzhHm9xFVZonjE52iVH0TAvbGyXf+BZkZH1BSanwk4Fq7/vVrCU7K4RaCXtmPkyitOAjufsEMplx1rKg/aPRWu4fqov0Yz9w2QEl/3/buRaxKT+YfiZ6hLOOq/w/r+ck419WFXya7/2Xm9us7EhzU1ir4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778736638; c=relaxed/simple;
	bh=pj1r/ahPAcrqS31dS4bSUJH4jafb55WbZ3z1N3TQzaE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dHgTrIu4NosHOGpGi6hgaVkpQQJCYvkiGVm6yKL3JqWiX1mk1Q9nPNuAjd8G+EMjh6TqruS3Mr11Fw44/L8jOvk92P263Nedm1iSsIKKQ1D4RL8u89gMCGINDktMfYbMvdBsomoidZQJC+26EvsInQVQYcT39flPfqs2oQdnymo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qgGtgJJO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qgGtgJJO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB9A1C2BCB7;
	Thu, 14 May 2026 05:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778736638;
	bh=pj1r/ahPAcrqS31dS4bSUJH4jafb55WbZ3z1N3TQzaE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qgGtgJJOPZtzCNrCQKKf2EX2JohTZe/HiSG3RP472Y3DfJkVFb5XUv5ESbOVDsyc7
	 3QKxM5XLXRVb3Sm3cewtdyMzKYtMlb3yBnmAdOaSWr4ZpX2EgdRU0YAn22eB2GeK20
	 T1qjMW/mKDN7dSzyJgjDe2dPaWvCLxO8TE6AsWYsaa3HWKbczE9Nlaf1e7cylIzJWs
	 T2qops4nGpGw/Al4PfO0xcGBFdo7yBIhVRIS26e78bRToIFlLeCIH0JqQZC7+31UVe
	 pQQgG0iBQLmryP0jUgOFusVl24o0zSP6KVn9QR8XXPJTxs/b5CtwJ2/JuwbG8ZI3+E
	 c/s/tngYb+w/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/6] soc: samsung: exynos-pmu: generalise
 gs101-specific cpu{idle,hotplug} for Exynos SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: conor+dt@kernel.org, robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-3-54fec5f65362@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 05:30:37 +0000
Message-Id: <20260514053037.BB9A1C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardware register misprogramming due to incorrect CPU index from s=
mp_processor_id().
- [High] Use-After-Free of device node intr_gen_node.
- [High] Missing teardown of global notifiers on probe failure causes Use-A=
fter-Free.
- [Medium] Missing of_node_put() on error path causes a device node referen=
ce leak.
--

commit 00ecbc34b3961a015d2064ffdbd5f20fb602ef73
Author: Alexey Klimov <alexey.klimov@linaro.org>

soc: samsung: exynos-pmu: generalise gs101-specific cpu{idle,hotplug} for E=
xynos SoCs

This patch generalises cpuhotplug and cpuidle support for GS101-based SoCs
to be reused for other Exynos-based SoCs. It introduces cpu_pmu_offline and
cpu_pmu_online callbacks in exynos_pmu_data and updates gs101 platform data
to use them.

> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyno=
s-pmu.c
> index d58376c38179b..660416c0db432 100644
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
[ ... ]
> @@ -425,6 +346,11 @@ static int setup_cpuhp_and_cpuidle(struct device *de=
v)
>  		return 0;
>  	}
> =20
> +	if (!pmu_context->pmu_data->cpu_pmu_offline || !pmu_context->pmu_data->=
cpu_pmu_online) {
> +		dev_err(dev, "PMU write/read sequence is not present for cpuhotplug an=
d cpuidle\n");
> +		return -ENODEV;
> +	}
> +

Does this return path leak the intr_gen_node device node reference?
of_parse_phandle() acquires a reference to it earlier in this function,
which needs to be released via of_node_put() before returning.

[ ... ]
> @@ -458,17 +384,17 @@ static int setup_cpuhp_and_cpuidle(struct device *d=
ev)
> =20
>  	/* set PMU to power on */
>  	for_each_online_cpu(cpu)
> -		gs101_cpuhp_pmu_online(cpu);
> +		exynos_cpuhp_pmu_online(cpu);
> =20
>  	/* register CPU hotplug callbacks */
>  	cpuhp_setup_state(CPUHP_BP_PREPARE_DYN,	"soc/exynos-pmu:prepare",
> -			  gs101_cpuhp_pmu_online, NULL);
> +			  exynos_cpuhp_pmu_online, NULL);
> =20
>  	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "soc/exynos-pmu:online",
> -			  NULL, gs101_cpuhp_pmu_offline);
> +			  NULL, exynos_cpuhp_pmu_offline);
> =20
>  	/* register CPU PM notifiers for cpuidle */
> -	cpu_pm_register_notifier(&gs101_cpu_pm_notifier);
> +	cpu_pm_register_notifier(&exynos_cpu_pm_notifier);
>  	register_reboot_notifier(&exynos_cpupm_reboot_nb);
>  	return 0;
>  }

This problem wasn't introduced by this patch, but is there a use-after-free
of intr_gen_node in setup_cpuhp_and_cpuidle()?

of_node_put(intr_gen_node) is called immediately after of_address_to_resour=
ce(),
but later the node pointer is passed to of_syscon_register_regmap():

	ret =3D of_address_to_resource(intr_gen_node, 0, &intrgen_res);
	of_node_put(intr_gen_node);
	...
	ret =3D of_syscon_register_regmap(intr_gen_node,
					pmu_context->pmuintrgen);

Also, this problem wasn't introduced by this patch, but does this function
need to provide a teardown mechanism for these global notifiers?

If exynos_pmu_probe() fails after this point, the devres-managed pmu_context
will be freed.

Since cpuhp_setup_state() and cpu_pm_register_notifier() don't use devm_
variants, subsequent CPU hotplug or idle events could invoke the dangling
callbacks and access the freed pmu_context, potentially causing a
use-after-free.

> diff --git a/drivers/soc/samsung/gs101-pmu.c b/drivers/soc/samsung/gs101-=
pmu.c
> index 17dadc1b9c6ec..5f2a599241447 100644
> --- a/drivers/soc/samsung/gs101-pmu.c
> +++ b/drivers/soc/samsung/gs101-pmu.c
[ ... ]
> @@ -322,11 +322,68 @@ static const struct regmap_access_table gs101_pmu_w=
r_table =3D {
>  	.n_no_ranges =3D ARRAY_SIZE(gs101_pmu_ro_registers),
>  };
> =20
> +/*
> + * gs101_cpu_pmu_ prefix functions are common code shared by CPU PM noti=
fiers
> + * (CPUIdle) and CPU hotplug callbacks. Functions should be called with =
IRQs
> + * disabled and cpupm_lock held.
> + */
> +static int gs101_cpu_pmu_online(struct exynos_pmu_context *pmu_context, =
unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	unsigned int cpuhint =3D smp_processor_id();

This problem wasn't introduced by this patch, but will smp_processor_id()
return the correct CPU index during hotplug startup?

During CPU hotplug startup, exynos_cpuhp_pmu_online() is called via
CPUHP_BP_PREPARE_DYN, which executes on the Boot Processor.

As a result, smp_processor_id() returns the Boot Processor's ID instead of =
the
target CPU's ID, which could misconfigure the Boot Processor's register whi=
le
leaving the target CPU uninitialized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-exynos850-=
cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3D3
