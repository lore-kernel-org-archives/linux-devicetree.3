Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4C01096F
	for <devicetree@vger.kernel.org>; Wed, 30 Sep 2026 00:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790727906; cv=none; b=G1riMGy6Q1naz3oMbWfG116C//b9SiQktdVWbQfdXDmeQZKvh2OvcSKm5sKWkbcXMyPEr/LkL8cvM6ge6M2Q69JP5tMs6EqbrDKaMN97EfrIyU5J+4cO7GQ1TKnuxvJiHzS9ak7mfu/gugFAWz6oejA4O8lh5dVjrPwfePEXp7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790727906; c=relaxed/simple;
	bh=XaIaQrQvCGe4dF+dBj05sSnvPJlXkXfMZwDiXUgizeM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FQNXWYluRh5n0A86TPZJF3cTizCsEkcqYlQ9k9XYXcnW6Qc1k7gciZkdyTDKNNmyBIprQPAKb+Wd/cCgmNY5BRoCt/g7WPWLd7JDAroXYczs6j4gjxWVgXpc3K/jyu4ow/yefZNwCM8OoYtpKmK63YtyHO6O6Z9jY3tuLL+Rhow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dgFB7Cdt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dgFB7Cdt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDF021F000FF;
	Wed, 30 Sep 2026 00:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790727905;
	bh=zvFg+zZUn4IXrNr7yNC9Ot5brZRzz1McbQmPHr6G0hE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dgFB7Cdtp/tmyCjysAQvqeBPBMButpxuPRr+cgmQDaNRa4ipuDLuY+IEb7zmsR4mN
	 4KKrPe9ioMwHi+/9B9n2R4aK6qGcLda0xqXKC72vr4zmSNHNWGIXTd5eQtbsqa3AzY
	 PGu3S6xzBlYJKgyKWDw5ECU2Yfws9AYBj28qMPjPlmmtygdGW/2FiNLDltd6C5QeJi
	 3Zb6c8Ah4By8JvJ62ewAn5OrpTbde/aQrWum+6bGJU46sjnnYkcFCL1r7wRPD6bGIO
	 WQHqN2//5GaRQmIcwDtQBLm4UY73xiDSmY4X3pIEUD2ucQc4G8i93aAx19+Ca50Odt
	 1/dsuHt/xpN5g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/6] soc: samsung: exynos-pmu: add Exynos850 CPU
 hotplug support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexey Klimov" <alexey.klimov@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260930-exynos850-cpuhotplug-v7-4-203245826333@linaro.org>
References: <20260930-exynos850-cpuhotplug-v7-0-203245826333@linaro.org>
 <20260930-exynos850-cpuhotplug-v7-4-203245826333@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 30 Sep 2026 00:25:04 +0000
Message-Id: <20260930002504.EDF021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] syscon: use-after-free of devm regmap on probe failure or driver u=
nbind
- [High] soc: samsung: hardware registers incorrectly indexed by logical CP=
U ID
--

commit afd8000549f41385d9df745be4acc40a4d6c283b
Author: Alexey Klimov <alexey.klimov@linaro.org>

soc: samsung: exynos-pmu: add Exynos850 CPU hotplug support

This commit adds cpuhotplug support for Exynos850 platforms by introducing
SoC-specific PMU and PMU interrupt writes/updates. It also initializes a
syscon regmap with raw spinlocks in the main probe routine to handle these
states safely.

> diff --git a/drivers/soc/samsung/exynos-pmu.c b/drivers/soc/samsung/exyno=
s-pmu.c
> --- a/drivers/soc/samsung/exynos-pmu.c
> +++ b/drivers/soc/samsung/exynos-pmu.c
[ ... ]
> @@ -480,6 +489,21 @@ static int exynos_pmu_probe(struct platform_device *=
pdev)
>  		ret =3D of_syscon_register_regmap(dev->of_node, regmap);
>  		if (ret)
>  			return ret;
> +	/*
> +	 * For SoCs that support cpuhotplug/cpuidle via PMU updates callbacks.
> +	 * Such callbacks are executed under raw_spinlock so we need a custom
> +	 * regmap too.
> +	 */
> +	} else if (pmu_context->pmu_data && pmu_context->pmu_data->pmu_cpuhp) {
> +		regmap =3D devm_regmap_init_mmio(dev, pmu_base_addr, &regmap_pmu);
> +		if (IS_ERR(regmap))
> +			return dev_err_probe(dev, PTR_ERR(regmap),
> +					     "hotplug regmap init failed\n");
> +
> +		ret =3D of_syscon_register_regmap(dev->of_node, regmap);

[Severity: High]
Does this sequence create a use-after-free if probe fails later or the driv=
er
unbinds? The driver allocates a devm-managed regmap via
devm_regmap_init_mmio() and permanently registers it with the global syscon
list via of_syscon_register_regmap().

If probe fails later, for instance when calling devm_mfd_add_devices(),
devres will automatically free the regmap. However, syscon does not support
unregistering, so the syscon list will retain a dangling pointer to the
freed regmap. Any subsequent driver requesting this syscon node by phandle
could dereference freed memory.

> diff --git a/drivers/soc/samsung/exynos850-pmu.c b/drivers/soc/samsung/ex=
ynos850-pmu.c
> new file mode 100644
> --- /dev/null
> +++ b/drivers/soc/samsung/exynos850-pmu.c
[ ... ]
> +static int exynos850_cpu_pmu_offline(struct exynos_pmu_context *pmu_cont=
ext, unsigned int cpu)
> +	__must_hold(&pmu_context->cpupm_lock)
> +{
> +	int cluster_id, core_id;
> +	u32 reg, mask;
> +
> +	cluster_id =3D topology_cluster_id(cpu);
> +	if (cluster_id < 0) {
> +		pr_err_ratelimited("invalid cluster ID for cpu: %u\n", cpu);
> +		return -EINVAL;
> +	}
> +
> +	core_id =3D topology_core_id(cpu);
> +	if (core_id < 0) {
> +		pr_err_ratelimited("invalid core ID for cpu: %u\n", cpu);
> +		return -EINVAL;
> +	}
> +
> +	/* set cpu inform hint */
> +	regmap_write(pmu_context->pmureg, EXYNOS850_CPU_INFORM(cpu), CPU_INFORM=
_C2);
> +
> +	mask =3D BIT(cpu);

[Severity: High]
Are we passing a logical Linux CPU ID directly into hardware-facing macros
and bitmask generators here? Logical CPU IDs are not guaranteed to match
physical hardware core indices, especially when booting with maxcpus, during
kdump, or with sparse topologies.

If the logical and physical IDs diverge, the bit shifts and register access=
es
will target the wrong CPU's hardware registers. If cpu is 32 or higher,
BIT(cpu) assigned to a 32-bit mask could invoke undefined behavior or
truncate.

> diff --git a/include/linux/soc/samsung/exynos-regs-pmu.h b/include/linux/=
soc/samsung/exynos-regs-pmu.h
> --- a/include/linux/soc/samsung/exynos-regs-pmu.h
> +++ b/include/linux/soc/samsung/exynos-regs-pmu.h
[ ... ]
> @@ -1015,6 +1015,11 @@
>  #define EXYNOS_GRP2_INTR_BID_UPEND				(0x0208)
>  #define EXYNOS_GRP2_INTR_BID_CLEAR				(0x020c)
> =20
> +/* Exynos850 PMU Alive */
> +#define EXYNOS850_CPU_INFORM(cpu)		(0x0860 + ((cpu) & 7) * 4)

[Severity: High]
Can this macro cause register clashing if the logical CPU ID exceeds 7? The
macro applies a hardcoded masking based on the assumption that it receives
a flat 0-7 physical index. If cpu is a logical ID, this assumption might
not hold.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260930-exynos850-=
cpuhotplug-v7-0-203245826333@linaro.org?part=3D4
