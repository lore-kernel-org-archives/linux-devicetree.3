Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793817393;
	b=M/6K852yZAE5sUmmI90mZ1s0kt/3TQSZnInytYV4gN8kb6BjdkKW+yQxYF/z0RrxAP+i
	 iHkOwwG9K901XvaWbmFL9i/CPtAdF5upycTBoS+jxo29wZdesTmQd0vaE1aMARbUrjFpa
	 Tkg5+C4EToy0gM4XxhAhJri47MjN33tnO31ETBPwgvKapM2v1Y/Rl4aOVFf5if8RTmIJC
	 8VjPvX6pXd6A32R9PtJhxJnC6dydPX1hMcTBJn+K++aQFqX1Nf6d5OfCaceNPozZ+f9Sy
	 8eMDWiReUnH2cc1hm4n+1EYqNGeZnDtwKYFQGajwLcleBOS9phhoxFw6hL2a9GDAikg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793817393;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=WonaQ6YLiTebAREY96ThbhwG68zS5AB/6u2f+OPXS6Q=;
	b=1gWcaGzz60oNcpt953nehcVp3qCim6eWMo3SDhmfbG71G8T0n90c0WWz97q/S+JLJ3Eh
	 TF0zPlp88il9ZkJ2F8hApcFEbJbhHkL23Gk97CoYql9b9u+DW85hoi9ZSuQxKViYAbnOK
	 NOt4D5oPzEl/u3XsChux6YV+jJ5lsR+Hv+1y0TLgtOEbNxjoUhRvyIlXTsDyZJ2UBcBt2
	 ybzmNm7BGNtFXhxhkw9XCR2anrpO70qKO78FQ/uD6JXqAIm/PzSCi/3sx/XkJVsy/NXmK
	 ld9c6G5u0zywhMjqDnLuQsEUKUTBCPVWBJRWAOeF2AbrQZlFSqFhOE1oVlpGP8Vz+dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Nku/RXUx";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A091606A331
	for <devicetree@vger.kernel.org>; Wed,  4 Nov 2026 18:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nku/RXUx
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C3841F000C1;
	Wed,  4 Nov 2026 18:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793817393;
	bh=WonaQ6YLiTebAREY96ThbhwG68zS5AB/6u2f+OPXS6Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Nku/RXUxDh+kpKX+TZfMvEQYPyDasuO5DOuV7RqZOQLq3uhROCkLS/jWUTd2oAq6k
	 8wJ5eJV8GCeR+0bHWaIksqcYbBHjfKUGXsxL4y7PRdxRtZ5qdcVgJJh6qdW7qkyfyD
	 WI0UTwNRiGO6XwKoV1LsP5hgGj+L5j/6kANt2PL5Dq4uOnn7+YHyYVhBIHl+UeuV6Y
	 gBHDluTKXypf7sDTF11VxpKiNdByBwr5MvfsH2Wb2yINJpchfxPsP4CTdlzWDAwioK
	 FklAXkira0rDIZXrNQfmZ1gSHkYMk7u8rsgFfQRqyrLmqv//q87s+tx0fWenlnxUjE
	 w+V60e84jknxA==
Message-ID: <sashiko-outbox-197853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 7/9] cpufreq: tegra194: derive frequency domain from
 device tree
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sumit Gupta" <sumitg@nvidia.com>, devicetree@vger.kernel.org
Cc: robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104181521.3003578-8-sumitg@nvidia.com>
References: <20261104181521.3003578-1-sumitg@nvidia.com>
 <20261104181521.3003578-8-sumitg@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 18:36:32 +0000
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
- [High] cpufreq: tegra194: unvalidated cluster LUT for multi-cluster policy
- [High] cpufreq: tegra194: unvalidated cpuid and clusterid in tegra194_get=
_speed()
--

commit 92b7184ee71717b6f0c29371b05878084c1e552d
Author: Sumit Gupta <sumitg@nvidia.com>

cpufreq: tegra194: derive frequency domain from device tree

This commit updates tegra194_cpufreq_init() to group CPUs into policies usi=
ng
the device tree performance-domains property when present, allowing a single
policy to span multiple clusters and storing the domain index in clkid.

> diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra19=
4-cpufreq.c
> index 047166463efef..1328aa0a1bd1a 100644
> --- a/drivers/cpufreq/tegra194-cpufreq.c
> +++ b/drivers/cpufreq/tegra194-cpufreq.c
[ ... ]
> @@ -528,21 +529,45 @@ static int tegra194_cpufreq_init(struct cpufreq_pol=
icy *policy)
>  {
>  	struct tegra194_cpufreq_data *data =3D cpufreq_get_driver_data();
>  	int maxcpus_per_cluster =3D data->soc->maxcpus_per_cluster;
> -	u32 clusterid =3D data->cpu_data[policy->cpu].clusterid;
>  	struct cpufreq_frequency_table *freq_table;
>  	struct cpufreq_frequency_table *bpmp_lut;
> -	u32 start_cpu, cpu;
> +	struct of_phandle_args args;
> +	u32 start_cpu, cpu, clusterid;
>  	int ret;
> =20
> +	/* Covers all possible CPUs, so offline siblings are grouped too. */
> +	ret =3D of_perf_domain_get_sharing_cpumask(policy->cpu, "performance-do=
mains",
> +						 "#performance-domain-cells",
> +						 policy->cpus, &args);
> +	if (!ret) {
> +		if (args.args_count !=3D 1) {
> +			pr_err("cpufreq: cpu%u: invalid #performance-domain-cells\n",
> +			       policy->cpu);
> +			of_node_put(args.np);
> +			return -EINVAL;
> +		}
> +
> +		for_each_cpu(cpu, policy->cpus)
> +			data->cpu_data[cpu].clkid =3D args.args[0];
> +
> +		of_node_put(args.np);
> +	} else if (ret =3D=3D -ENOENT) {
> +		/* Legacy grouping for DTs without performance-domains. */
> +		start_cpu =3D rounddown(policy->cpu, maxcpus_per_cluster);
> +		for (cpu =3D start_cpu; cpu < (start_cpu + maxcpus_per_cluster); cpu++)
> +			if (cpu_possible(cpu))
> +				cpumask_set_cpu(cpu, policy->cpus);
> +	} else {
> +		pr_err("cpufreq: cpu%u: failed to get performance domain: %d\n",
> +		       policy->cpu, ret);
> +		return ret;
> +	}
> +
> +	/* The BPMP LUT is indexed by the MPIDR cluster id, not clkid. */
> +	clusterid =3D data->cpu_data[policy->cpu].clusterid;
>  	if (clusterid >=3D data->soc->num_clusters || !data->bpmp_luts[clusteri=
d])
>  		return -EINVAL;

[Severity: High]
Since policy->cpus can now span multiple clusters, what happens when
tegra194_get_speed() is called for a CPU in another cluster of the same
policy (for example via cpufreq_get(), or after the initial policy->cpu goes
offline and cpufreq_offline() migrates policy->cpu to a sibling in a second
cluster without re-running tegra194_cpufreq_init())?

tegra194_cpufreq_init() only validates clusterid and
data->bpmp_luts[clusterid] for the initial policy->cpu, but
tegra194_get_speed() indexes data->bpmp_luts[] using the queried CPU's own
clusterid:

drivers/cpufreq/tegra194-cpufreq.c:tegra194_get_speed() {
	...
	u32 clusterid =3D data->cpu_data[cpu].clusterid;
	...
	cpufreq_for_each_valid_entry(pos, data->bpmp_luts[clusterid]) {
}

If tegra_cpufreq_bpmp_read_lut() returned -BPMP_EINVAL for that secondary
cluster (leaving data->bpmp_luts[clusterid] as NULL), or if that CPU's
clusterid is >=3D data->soc->num_clusters on an SoC where get_cpu_ndiv() do=
es
not depend on freq_core_reg (such as Tegra194 or Tegra264), can
tegra194_get_speed() dereference a NULL pointer or read out of bounds in
data->bpmp_luts[]?

[Severity: High]
Can tegra194_get_speed() also trigger an out-of-bounds MMIO read in
tegra234_sample_counters() when cpuid or clusterid is out of bounds?

In tegra_cpufreq_cpu_online(), cpuid and clusterid from MPIDR are stored in
data->cpu_data[cpu] unconditionally, and if either is out of bounds, it logs
a warning, leaves freq_core_reg as NULL, and still returns 0:

drivers/cpufreq/tegra194-cpufreq.c:tegra_cpufreq_cpu_online() {
	...
	data->cpu_data[cpu].cpuid =3D cpuid;
	data->cpu_data[cpu].clusterid =3D clusterid;

	/* Derive per-core register address only when ccplex MMIO is mapped. */
	if (data->regs) {
		if (clusterid >=3D data->soc->num_clusters ||
		    cpuid >=3D data->soc->maxcpus_per_cluster) {
			pr_warn_once("cpufreq: cpu%u: bad MPIDR (cluster %u, core %u)\n",
				     cpu, clusterid, cpuid);
}

tegra194_cpufreq_init() does not check cpuid >=3D data->soc->maxcpus_per_cl=
uster
for policy->cpu, nor does it validate clusterid or cpuid for cross-cluster =
or
initially offline sibling CPUs in policy->cpus (which may later come online
via tegra194_cpufreq_online() without re-running tegra194_cpufreq_init()).

When tegra194_get_speed() runs on such a CPU, it calls
tegra194_calculate_speed() before get_cpu_ndiv() checks freq_core_reg:

drivers/cpufreq/tegra194-cpufreq.c:tegra194_get_speed() {
	...
	/* reconstruct actual cpu freq using counters */
	rate =3D tegra194_calculate_speed(cpu);

	/* get last written ndiv value */
	ret =3D data->soc->ops->get_cpu_ndiv(cpu, data->cpu_data[cpu].cpuid, clust=
erid, &ndiv);
}

On Tegra234 and Tegra238, tegra194_calculate_speed()->tegra_read_counters()=
->
tegra234_sample_counters() computes actmon_reg directly from the unvalidated
clusterid and cpuid without checking freq_core_reg:

drivers/cpufreq/tegra194-cpufreq.c:tegra234_sample_counters() {
	...
	actmon_reg =3D CORE_ACTMON_CNTR_REG(data, data->cpu_data[c->cpu].clusterid,
					  data->cpu_data[c->cpu].cpuid);

	val =3D readq(actmon_reg);
}

Could this read past the mapped MMIO region in data->regs?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104181521.3003=
578-1-sumitg@nvidia.com?part=3D7
