Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0227375F62
	for <devicetree@vger.kernel.org>; Fri, 12 Jun 2026 10:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781258745; cv=none; b=Edn3gf46jrsj/XU2i6XkGAwreRcbLHxLtAjYTZPfatZD7WMT0FBQ2fvdckuL4TFuH/d5KvXfvdssVvHiOMsdtkjoSl7iasopnEL0foTcCAtU3U9qzOgoDxNnZMr6zULrZOYMf9sgg0Jr+7H0hXVoq3M4k/OdgFFJFZUPps7wS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781258745; c=relaxed/simple;
	bh=cVdrUd0aJRaNU2UXeunI5dNRtftcKWJE9G/0QXtYNIE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=srddDlqmP/09hsFIjrIKmQzL+Dq2XTF/sW7c9Wy8jzMMfnXVZSlSAXQInJLtyQqkS0VOpEU317jmYbivEDa0tTIDB8xJP6lL4V0QxpyD8PKsxTf/n/D7Jqeg+6XCuulfSfqev4w/EzPEEFKbPVgGoOCTJeQgps5280k5O6vd+8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Luh9Qt+z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Luh9Qt+z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E87B1F000E9;
	Fri, 12 Jun 2026 10:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781258743;
	bh=cjJt6ADSQZnkzoFfmVtLCJ1hlvPn56J2B9KDgwxKAnU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Luh9Qt+zJ88pFG7PyQtxD8h1ReZRnHuetdtiLv6WH1Y52hp6fecR3AGQF5daDpYbn
	 GgUiwNQfpezDhrKln2d+Ni2TqXnm3erFcyedqn3QF+x3U0B4tkIopfdrZzD48vIMyU
	 5BU8WRAiA7AkV54h7A3iL2iG+I3mey6VwEFMbkHbXrwNh0wCN9Et3jRKGm3fB3LgSi
	 UTqZXMJgaJ1MmQxv8Q98c10BIVjGvtWQ+dfBzXtUa2nhkHnNECVXPM5uavLkX6CAKO
	 SdsS5mS9IApF+S8UtleOXs7j6vee2p1YnWGC5e+YxvJMIdszkT5DYcgTNDD2d/hkq7
	 JeEZxOGGamvvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] cpufreq: spacemit: Add K1 cpufreq driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shuwei Wu" <shuwei.wu@mailbox.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
References: <20260612-shadow-deps-v3-1-2f3ba88611ff@mailbox.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 10:05:42 +0000
Message-Id: <20260612100543.1E87B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unaligned initial cluster frequencies can cause cluster 1 to under=
voltage and crash during the first cpufreq transition.
--

commit de194d59d1b015bd0b960104ac00570cfd3ba072
Author: Shuwei Wu <shuwei.wu@mailbox.org>

cpufreq: spacemit: Add K1 cpufreq driver

This commit adds a CPU frequency scaling driver for the SpacemiT K1 SoC.
It handles two cluster clocks and one shared CPU voltage rail within a sing=
le
cpufreq policy.

> diff --git a/drivers/cpufreq/spacemit-k1-cpufreq.c b/drivers/cpufreq/spac=
emit-k1-cpufreq.c
> new file mode 100644
> index 0000000000000..631897eb80225
> --- /dev/null
> +++ b/drivers/cpufreq/spacemit-k1-cpufreq.c
[ ... ]
> +static int k1_cpufreq_set_target(struct cpufreq_policy *policy,
> +				 unsigned int index)
> +{
> +	struct k1_cpufreq_priv *priv =3D policy->driver_data;
> +	unsigned long old_freq =3D policy->cur * 1000UL;
> +	unsigned long new_freq =3D policy->freq_table[index].frequency * 1000UL;
> +	int ret;
> +
> +	if (!old_freq)
> +		old_freq =3D clk_get_rate(priv->cluster0_clk);
> +
> +	if (new_freq > old_freq) {
> +		ret =3D dev_pm_opp_set_rate(priv->cpu_dev, new_freq);

[Severity: High]
Could this cause an undervoltage crash on cluster 1 during the first transi=
tion?

The transition logic assumes old_freq (which comes from cluster 0) represen=
ts
the current speed of both clusters. If the bootloader leaves cluster 1 runn=
ing
at a higher frequency than cluster 0 (e.g., cluster 0 at 500 MHz, cluster 1=
 at
1.2 GHz), and new_freq is an intermediate value like 800 MHz:

new_freq (800) > old_freq (500), so dev_pm_opp_set_rate() sets the shared
regulator to the 800 MHz voltage level. Since cluster 1 is invisible to the
OPP and regulator core, its voltage drops to the 800 MHz level while it is
still physically running at 1.2 GHz.

[ ... ]
> +static int k1_cpufreq_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	priv->cluster0_clk =3D clk_get(priv->cpu_dev, NULL);
> +	if (IS_ERR(priv->cluster0_clk)) {
> +		ret =3D PTR_ERR(priv->cluster0_clk);
> +		dev_err_probe(priv->cpu_dev, ret, "failed to get cluster0 clock\n");
> +		goto free_cpumask;
> +	}
> +
> +	priv->cluster1_clk =3D clk_get(cpu4_dev, NULL);
> +	if (IS_ERR(priv->cluster1_clk)) {

[Severity: High]
Should the driver synchronize both cluster clocks to a safe state (like the
maximum of their initial frequencies) here during probe before registering
the cpufreq driver?=20

The clocks are acquired here but their initial rates are never read or alig=
ned,
leaving them vulnerable to the mismatch described above.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612-shadow-dep=
s-v3-0-2f3ba88611ff@mailbox.org?part=3D1
