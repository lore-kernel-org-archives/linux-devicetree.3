Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FEC3BE15C
	for <devicetree@vger.kernel.org>; Thu, 14 May 2026 06:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778738675; cv=none; b=lFxYoR9VAmCURzwwMGeXCsbMbZ4k8THRnRW/PCf+/r3RjRaPr5eAnPXTkrHIHBcMT4BIj+NQRjmrTIc3hCH7zApZ4bDhsUZTSWaZtdU+M/ppLM0LPQRy3SX2gTE0p3gsBEmThB8GishnwTYBlprNZZZAiEFWzZNdv2pD1nimMjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778738675; c=relaxed/simple;
	bh=C3Cj/atw6HELOZuzEZVAoilWlens2k84W0p8eihiWKI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PwtjE2ISOMUfWw2mKIdm7ZoOvEadVvdGy1cxKoKkZ5jsc6LAEtf0Z+T6aU3qiq9QO66YoGS6Mk0SdRX53u0VzdGg6VbFxueI2ifo610PaCjy7RT0OQRqq8rCP//fZJgupXGRBywKNFeQ5ktT2Yxmt0nvL9KIKMyYTwdZejzwJYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iv9fGcUa; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iv9fGcUa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1E2C2BCB7;
	Thu, 14 May 2026 06:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778738675;
	bh=C3Cj/atw6HELOZuzEZVAoilWlens2k84W0p8eihiWKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=iv9fGcUadiuWaR2FdQnvTDcROz1Rsh33G6XUVANJMmLB1vhPy4AozLKybcyQSYEh0
	 XDazBM19OWsIHgCxhoRpvAX90b95OU/uVSdPFhZb0M/oAVIHfoMo6Tq8qZQxmRiz7h
	 YW5lVFGxaerLo8rR8TJusB4Z9KAMjAkaITKwvErq6z8WFev9JYDu2y2e9XkqNqrwO/
	 A1lG8pTLnR9THmOBvphmCgVN6Z0CD7AFJmEKa2ejRDEJ8vWX78RiQTzt3kCQ731JQk
	 crt+asGfmmPNusBqMvTjYaR+lhXiVg7Ce6UbZ61X4uVPBd7/DoYtult/R6/+hzg679
	 VEadzVgBbpmAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: robh@kernel.org, conor+dt@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260513-exynos850-cpuhotplug-v4-4-54fec5f65362@linaro.org>
References: <20260513-exynos850-cpuhotplug-v4-4-54fec5f65362@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 06:04:34 +0000
Message-Id: <20260514060434.BB1E2C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] exynos850_cpu_pmu_online() and exynos850_cpu_pmu_offline() incorre=
ctly configure PMU registers for the executing control CPU instead of the t=
arget CPU.
- [High] Lock nesting violation (sleeping in atomic context) when accessing=
 the Exynos850 syscon regmap.
- [Low] Missing parentheses around the macro argument `cl` in `EXYNOS850_CL=
USTER_CPU_OFFSET`.
--

commit 1fa894e1840a285a12214486e682639554622ecb
Author: Alexey Klimov <alexey.klimov@linaro.org>

soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support

This commit adds CPU hotplug support for Exynos850 platforms by providing
specific PMU and interrupt generation register updates for sleep states
and CPU online/offline transitions.

> diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/ex=
ynos850-pmu.c
> new file mode 100644
> index 0000000000000..40df158819239
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos850-pmu.c

[ ... ]

> +static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_cont=
ext, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	u32 this_cluster =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 2);
> +	u32 cluster_cpu =3D MPIDR_AFFINITY_LEVEL(read_cpuid_mpidr(), 1);
> +	unsigned int cpuhint =3D smp_processor_id();

Since exynos850_cpu_pmu_offline() is invoked during the CPUHP_BP_PREPARE_DYN
hotplug state, won't this code execute on the control CPU (Boot Processor)
instead of the target CPU being taken offline?

By using read_cpuid_mpidr() and smp_processor_id() here, it looks like this
reads the physical ID and hardware MPIDR of the executing control CPU rather
than deriving them from the target cpu argument.

> +	u32 reg, mask;
> +
> +	/* set cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpuhint),
> +		     CPU_INFORM_C2);

Could calling regmap_write() here cause a lock nesting regression?

Because cpupm_lock is a raw_spinlock_t, and the pmureg for Exynos850 is
created via syscon_node_to_regmap(), pmureg is protected by a standard
spinlock_t instead of a raw spinlock. Acquiring a spinlock_t while holding
a raw_spinlock_t can lead to a sleeping in atomic context bug on PREEMPT_RT.

> +
> +	mask =3D BIT(cpu);

Does this need to convert the logical cpu parameter to a physical core ID
using cpu_logical_map(cpu) before using it as a hardware bitmask?

Using the logical CPU index directly might configure the wrong hardware
registers if the logical to physical mapping is not 1:1.

[ ... ]

> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/=
soc/samsung/exynos-regs-pmu.h
> index 9c4d3da41dbf2..93c4d724c8eac 100644
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h

[ ... ]

> @@ -1015,6 +1015,11 @@
>  #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
>  #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
> =20
> +/* Exynos850 PMU Alive */
> +#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)
> +#define EXYNOS850_CLUSTER_CPU_OFFSET(cl, cpu)	(0x1000 + ((cl * 0x400) + =
((cpu) * 0x80)))

Is it safer to wrap the cl argument in parentheses?

If an arithmetic expression is passed for cl in the future, operator
precedence could cause it to evaluate incorrectly and result in out-of-boun=
ds
register offsets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513-exynos850-=
cpuhotplug-v4-0-54fec5f65362@linaro.org?part=3D4
