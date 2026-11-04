Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793816943;
	b=js+HMCGt5o4wamKNQDTsCCJqdMeR7XLdeU63q5X2oDeU/+XxCw5TZzhJ/U/IoyWrRu+Q
	 NYgYDTpJQBpcA0TEp8PTiC/zOj+l/y7fCrIspjSmS0mg5kDDU0gVGwcUwYP4iutBz+cHS
	 mbKSh5jIwSIGEIJKH8wNZzFYL5uJtBksq7pDP6KwW5GRZj83oPq7QAIkVJ4rvPw8mC4w5
	 ryQhQkLDOe5Qn90n0B3xxLbTMFXqY2ApaRlUF7a1fjvIOxO0OK/mXdLURKUYHwDypyfY3
	 Ae7ZrrT7SBD/mYKfTqKcKW8hkv+rOsIU/2CMdlWmROy0yQuGa3bSNWhfSuQoXh4Fy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793816943;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YUqvw0T/G8xQxYBCUB5FZ/LZ272UA8h8fWU/tbjv8vE=;
	b=wDXKQRenyqEewkKnK+OvM+Hx1t3b+amit+skWil1tA6c8udGjZABCzubX8zxcETIf98n
	 Jkoj1KZL2mjoVMHnBSBF1KvJdT6YzurQjMjgot5fvEkiZw2v6UabGqu0ru8tgGFhQcDmm
	 FkPFSCnZLZt2EvT6Mla5DRqe4czKE3iBkaM3bYl+lh2uRy5BizfXi/jF4afCsczBQuupM
	 9WyB96Wpx+iPzb0f1qvHQg+Hq0PtCI17O2C/k94YeMBcL2A82GxxvI6b/lHbhKs7kkBan
	 M0q7GVFwVmlTuezfgHAYAeFOMWAev3NoiBIgjfw7b8Jj+BJ4P7ojGHE7ianXFH4u2+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uh2iFqAZ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E692606C452
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uh2iFqAZ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DF5E1F00A24;
	Wed,  4 Nov 2026 18:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793816943;
	bh=YUqvw0T/G8xQxYBCUB5FZ/LZ272UA8h8fWU/tbjv8vE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Uh2iFqAZJ4NdNvRodYb7fg24TEBMyWQ0TD/nu5J6ZTa7jVZRAiv1K5wIFE68FAfz0
	 46+omZkTomQjnj/QpVczLF7ddtzomjCrdMQfGA3c8jXuvvi7fTZnreuJsNA6y0Mr5C
	 K7B3iLMmkKbcH9kQUoq1RQboNrO5yDAurX07m94/DCDbV20C04jLEvJDykHLH0xcHs
	 P26UUjBm4jFw2+f/HRPE/fYfB2EPknLBVGG5IH1Jn43lFNxFyVmfKh1HfydbNjnrVi
	 iQEcOaUgf4smw+oXjd3JSFiHi3gYwWFVUYIWsEAIxPabJJRHPTiXCvoJuLzwOTtUQt
	 YcpDrhiDmjxww==
Message-ID: <sashiko-outbox-197849@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/9] cpufreq: tegra194: move MPIDR read to CPU hotplug
 callback
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Gupta" <sumitg@nvidia.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104181521.3003578-2-sumitg@nvidia.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-2-sumitg@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:29:02 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] cpufreq: tegra194: out-of-bounds MMIO and LUT read on bad MPIDR
--

commit 13d8e373c1e546a0ef275842259e4854d9497025
Author: Sumit Gupta <sumitg@nvidia.com>

cpufreq: tegra194: move MPIDR read to CPU hotplug callback

This commit moves the per-CPU MPIDR read from probe-time SMP calls to a CPU
hotplug online callback so that CPUs offline at boot do not use uninitializ=
ed
core and cluster IDs. It also validates the CPU count against the SoC data =
at
probe and skips populating the MMIO scratch register address when a CPU's
MPIDR exceeds the SoC bounds.

> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra19=
4-cpufreq.c
> index 1eb96e9f3310d..be81ffd23edd5 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
[ ... ]
> @@ -121,11 +124,44 @@ static void tegra234_get_cpu_cluster_id(u32 cpu, u3=
2 *cpuid, u32 *clusterid)
>  		*clusterid =3D MPIDR_AFFINITY_LEVEL(mpidr, 2);
>  }
> =20
> +static int tegra_cpufreq_cpu_online(unsigned int cpu, struct hlist_node =
*node)
> +{
> +	struct tegra194_cpufreq_data *data;
> +	u32 cpuid, clusterid;
> +
> +	data =3D hlist_entry(node, struct tegra194_cpufreq_data, cpuhp_node);
> +
> +	data->soc->ops->get_cpu_cluster_id(cpu, &cpuid, &clusterid);
> +
> +	data->cpu_data[cpu].cpuid =3D cpuid;
> +	data->cpu_data[cpu].clusterid =3D clusterid;
> +
> +	/* Derive per-core register address only when ccplex MMIO is mapped. */
> +	if (data->regs) {
> +		if (clusterid >=3D data->soc->num_clusters ||
> +		    cpuid >=3D data->soc->maxcpus_per_cluster) {
> +			pr_warn_once("cpufreq: cpu%u: bad MPIDR (cluster %u, core %u)\n",
> +				     cpu, clusterid, cpuid);
> +		} else {
> +			u32 index =3D clusterid * data->soc->maxcpus_per_cluster + cpuid;
> +
> +			data->cpu_data[cpu].freq_core_reg =3D
> +				SCRATCH_FREQ_CORE_REG(data, index);
> +		}
> +	}
> +
> +	return 0;
> +}

[Severity: High]
When a CPU has an out-of-bounds MPIDR (clusterid >=3D data->soc->num_cluste=
rs or
cpuid >=3D data->soc->maxcpus_per_cluster), tegra_cpufreq_cpu_online() leav=
es
data->cpu_data[cpu].freq_core_reg as NULL so NDIV accesses are skipped, but
still stores the out-of-bounds cpuid and clusterid into data->cpu_data[cpu]
and returns 0.

In tegra194_cpufreq_init(), only clusterid >=3D data->soc->num_clusters is
checked on policy->cpu:

    if (clusterid >=3D data->soc->num_clusters || !data->bpmp_luts[clusteri=
d])
            return -EINVAL;

Neither cpuid >=3D data->soc->maxcpus_per_cluster on policy->cpu nor the MP=
IDR
values of sibling CPUs added to policy->cpus are checked there.

When cpufreq later queries the frequency for that CPU via
tegra194_get_speed(), it calls tegra194_calculate_speed() before checking
get_cpu_ndiv():

    rate =3D tegra194_calculate_speed(cpu);

    /* get last written ndiv value */
    ret =3D data->soc->ops->get_cpu_ndiv(cpu, data->cpu_data[cpu].cpuid, cl=
usterid, &ndiv);
    if (WARN_ON_ONCE(ret))
            return rate;

    cpufreq_for_each_valid_entry(pos, data->bpmp_luts[clusterid]) {

On Tegra234, tegra194_calculate_speed() queues tegra_read_counters() ->
tegra234_read_counters(), which computes the counter address directly from =
the
stored clusterid and cpuid without checking freq_core_reg or bounds:

    actmon_reg =3D CORE_ACTMON_CNTR_REG(data, data->cpu_data[c->cpu].cluste=
rid,
                                      data->cpu_data[c->cpu].cpuid);

    val =3D readq(actmon_reg);

And after tegra194_calculate_speed() returns, tegra234_get_cpu_ndiv() retur=
ns
-EINVAL for the NULL freq_core_reg, triggering WARN_ON_ONCE(ret) in
tegra194_get_speed().

In addition, on Tegra194 (where data->regs is NULL),
tegra_cpufreq_cpu_online() skips the bounds check altogether,
tegra194_get_cpu_ndiv() succeeds via system register read, and
tegra194_get_speed() indexes data->bpmp_luts[clusterid] without bounds
validation if a sibling CPU has clusterid >=3D data->soc->num_clusters.

Can this cause an out-of-bounds MMIO read in tegra234_read_counters(), a
WARN_ON_ONCE() splat, or an out-of-bounds read of data->bpmp_luts[clusterid]
in tegra194_get_speed() when a CPU reports a bad MPIDR?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104181521.3003=
578-1-sumitg@nvidia.com?part=3D1
