Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74678265CA8
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727817; cv=none; b=aV+r6WF0ho4EHDEfrG477aO2GYpw5k8uqH7KyKlqdQU4Xwkm8E2AruMl1qfnDQBbjSDtKDgVdqnrWQN0GXY+XUXuqby3xrH7hIDOMFNKZG6AptV26FhG2nNZ7BpIrxv7l8RJK6tQFLnPKodB82jZsM2kbBCTXqZxm3l+urSeAXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727817; c=relaxed/simple;
	bh=4GvX1207IlhlAnKosEst2KE/AYpap1q0o2xA0Y+3ag8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJVgwywBq2E2YAhqFLKdQT/+lQbeZw0JExaucaaogQ56xXgq4J8gYMer7tETwMgEq7YvQNe0/wUROuJmcLgcVaPgbaemGDIzcqw4dabqW1mylGPUs4zzk1jGkpFfMTXCj8x5eLwYIEV5QI8lPhJteC7j4iboETLZBtheQsTcpQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JGrVzZ+O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JGrVzZ+O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2650B1F00899;
	Wed, 30 Sep 2026 00:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727814;
	bh=IlRwMQZeD4g8nc1zfteeWJPbBwtSCB5JmroDzWwoXr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JGrVzZ+OGOPdYaOgqMRi16WX1LbrVvn/gjce5KMNJx8S4u68S8/Nh/3G1IqnC4xh6
	 XsE5wTtouo1xr8x0DWhnf+8aQqNAkDColGSEaIZpm0FGaiVk4pZAB78WDdhlmZF3Ix
	 /Kb3u5qbPy19ygX4ZiKlmX64ksUSDY/LERdFbvZfn8vjDscdeo89kX8WugX0JZFzME
	 sHyDFvI5JYHD622uEJpq3HSKhacSWi26YUuoin27SCZXTnicnWalPqyHUwj5ilIEgG
	 uH3wiRzZl9JUKEd+6PQQMM3LzYEmSNx4pKrjcfc9zx05mfwW/Lt9fQ3gdkxuoEAp0f
	 e+zrP7LpXbr6g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 6/6] arm64: dts: exynos850: add PMU interrupt
 generation node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
 <20260930-exynos850-cpuhotplug-v7-6-203245826333@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 00:23:33 +0000
Message-Id: <20260930002334.2650B1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] cpu/hotplug: ignored PMU callback returns mask silent CPU wakeup f=
ailures
--

commit ed843ac940e60ee64cbd03b344104cc24b925c4a
Author: Alexey Klimov <alexey.klimov@linaro.org>

arm64: dts: exynos850: add PMU interrupt generation node

Add pmu_intr_gen node for Exynos850. This hw block is required
for different power management routines like CPU hotplug and
different sleep and idle states. Also reference this node from main PMU
node.

> diff --git a/arch/arm64/boot/dts/exynos/exynos850.dtsi b/arch/arm64/boot/=
dts/exynos/exynos850.dtsi
> index 8a4771899a8e6..803fc127d8956 100644
> --- a/arch/arm64/boot/dts/exynos/exynos850.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos850.dtsi
> @@ -231,6 +231,7 @@ gic: interrupt-controller@12a01000 {
>  		pmu_system_controller: system-controller@11860000 {
>  			compatible =3D "samsung,exynos850-pmu", "syscon";
>  			reg =3D <0x11860000 0x10000>;
> +			google,pmu-intr-gen-syscon =3D <&pmu_intr_gen>;

[Severity: High]
Does enabling CPU hotplug and PMU configuration here mask silent CPU wakeup
failures?

The hotplug framework requires an error code to abort the hotplug operation,
but exynos_cpuhp_pmu_online() in drivers/soc/samsung/exynos-pmu.c
unconditionally returns 0:

drivers/soc/samsung/exynos-pmu.c:exynos_cpuhp_pmu_online() {
...
	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
	/*
	 * Mark this CPU as having finished the hotplug.
	 * This means this CPU can now enter C2 idle state.
	 */
	clear_bit(cpu, pmu_context->in_cpuhp);
	raw_spin_unlock_irqrestore(&pmu_context->cpupm_lock, flags);

	return 0;
}

Similarly, exynos_cpu_pmu_online() returns NOTIFY_OK to the CPU_PM framework
even if the PMU failed to configure correctly:

drivers/soc/samsung/exynos-pmu.c:exynos_cpu_pmu_online() {
...
	pmu_context->pmu_data->cpu_pmu_online(pmu_context, cpu);
	raw_spin_unlock(&pmu_context->cpupm_lock);

	return NOTIFY_OK;
}

If topology_cluster_id() or topology_core_id() fails (or if a PMU hardware
initialization fails), the cpu_pmu_online callback returns an error code.
Since the error is unconditionally dropped, the CPU/PM frameworks are
incorrectly told the hardware operation succeeded.

Could this cause the CPU to fail to wake up, potentially hanging the hotplug
state machine or leaving the CPU permanently stuck in idle without the kern=
el
knowing?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-exynos850-=
cpuhotplug-v7-0-203245826333@linaro.org?part=3D6
