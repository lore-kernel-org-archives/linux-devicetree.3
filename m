Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDB23D668E
	for <devicetree@vger.kernel.org>; Thu,  8 Oct 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791451444; cv=none; b=YUYnDki3ayw08ZVKX+RNowajIEiVLRSSd3CrzLfTcrd6Az32MB+pv8bjLfB7tKm74zuWGhI5vjpvD4cjTCE/h7cJYXaJPe16i/A7jf8kzJkCQr7yprZTnkPIYaUyi2g6MmJcvQbpozNG2wMeb43JA7Xd04MbbljvwByZoTAUW2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791451444; c=relaxed/simple;
	bh=fSFbMUUasm2o2nmwa9iquRjJazC14r/XqeqjsBBLBCA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=DdVPoJciYGoC1hSO28J1tixLbI9UK3Wp80TIt1fquBprm4UsxuaTCrhBWUYwGkifwoXH8IVh9Vx8hXS/EyKYMVByqQjZl8bzf0+RUw9TOsG8RXz72q5k9VhK4mj95PnDoasOWF609Niy9HtFrtqcGPDmzGb/9X2OnZ0cA+psdBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2+CWmJF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2+CWmJF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 488FF1F00893;
	Thu,  8 Oct 2026 09:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791451439;
	bh=dfR38gV8CIYECTWIvkIHTjDSbyo4ORbsogbvtNJYQtY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k2+CWmJF9Uobgn2qEzTuMq6TsLj6tWDJSj57Oa8WYWAh+C9txSLPN078ZJQPSuZ4d
	 gho5tQ3fNMQtu8vnakrKZNH8dZh8MLFDPGevJcZFjgq0kMPnO4dpTw/MXMxJEqZ5kf
	 j/be3C5UWgzDNUNLY7y2i7xF1yLO4W7Q7gpzcvmMdiI5fosxo9+yOxr3EzvvsEEmoc
	 tyVG/P7DFsmbRL4x5TQLgqFzeMmIgv4B1VjK4LFJFmANBMuQ03Dg/HDQk2emiZk7nw
	 h14pqjdFlGnAqTEzQ1iVRqNMm0+EmbT1ocL7l92DQoGL09LluxRxgdjuIBSsEj8QsS
	 /YuHqm9bHZB1w==
Message-ID: <sashiko-outbox-163932@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 5/7] cpufreq: Add RISC-V RPMI cpufreq driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Yeong" <joshua.yeong@starfivetech.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261008091032.2832333-6-joshua.yeong@starfivetech.com>
References: <20261008091032.2832333-1-joshua.yeong@starfivetech.com>
 <20261008091032.2832333-6-joshua.yeong@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 09:23:58 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] cpufreq: data race on global driver_data during concurrent probe c=
auses NULL dereference
- [Medium] cpufreq: uninitialized stack memory read of args.args[0] on malf=
ormed DT
--

commit d5239b6ffbfd0e1e9bde3c75990dec71b8fdd74f
Author: Joshua Yeong <joshua.yeong@starfivetech.com>

cpufreq: Add RISC-V RPMI cpufreq driver

This patch adds a cpufreq driver for RISC-V platforms utilizing the RPMI
performance service group. The driver serves as a front-end over the RPMI
core to manage frequency switching and registers an energy model based on
the power cost of each level.

> diff --git a/drivers/cpufreq/riscv-rpmi-cpufreq.c b/drivers/cpufreq/riscv=
-rpmi-cpufreq.c
> new file mode 100644
> index 0000000000000..1a5d0248f879e
> --- /dev/null
> +++ b/drivers/cpufreq/riscv-rpmi-cpufreq.c
> @@ -0,0 +1,294 @@
[ ... ]
> +static int rpmi_perf_init(struct cpufreq_policy *policy)
> +{
> +	struct cpufreq_frequency_table *freq_table;
> +	struct rpmi_perf_cpufreq_data *data;
> +	struct rpmi_perf_domain *domain;
> +	struct platform_device *pdev =3D cpufreq_get_driver_data();
> +	struct rpmi_perf **mpxy_perf =3D dev_get_platdata(&pdev->dev);
> +	struct of_phandle_args args;
> +	int ret, nr_opp;
> +	struct device *cpu_dev;
> +
> +	cpu_dev =3D get_cpu_device(policy->cpu);
> +	if (!cpu_dev) {
> +		pr_err("failed to get cpu%d device\n", policy->cpu);
> +		return -ENODEV;
> +	}
> +
> +	data =3D kzalloc(sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	ret =3D of_perf_domain_get_sharing_cpumask(policy->cpu,
> +						 "performance-domains",
> +						 "#performance-domain-cells",
> +						 policy->cpus, &args);
> +	if (ret) {
> +		dev_err(cpu_dev, "%s: failed to get performance domain info: %d\n",
> +			__func__, ret);
> +		goto out_free_priv;
> +	}
> +
> +	/* A domain ID only means something to the provider the CPU names. */
> +	if (args.np !=3D dev_of_node(pdev->dev.parent)) {
> +		dev_err(cpu_dev, "performance domain of %pOF, not of %pOF\n",
> +			args.np, dev_of_node(pdev->dev.parent));
> +		of_node_put(args.np);
> +		ret =3D -ENODEV;
> +		goto out_free_priv;
> +	}
> +
> +	domain =3D rpmi_perf_domain_by_id(*mpxy_perf, args.args[0]);

[Severity: Medium]
Does this read uninitialized stack memory if the device tree is malformed or
specifies #performance-domain-cells =3D <0>?

If of_perf_domain_get_sharing_cpumask() resolves the phandle but
args.args_count is 0, the args.args array will be left uninitialized since
struct of_phandle_args args was declared on the stack.

Unconditionally consuming args.args[0] could leak uninitialized kernel stack
memory into the domain ID lookup, potentially logging garbage values on
failure and causing erratic domain resolution.

> +	of_node_put(args.np);
> +	if (!domain) {
> +		dev_err(cpu_dev, "performance domain %u is not usable\n",
> +			args.args[0]);
> +		ret =3D -EINVAL;
> +		goto out_free_priv;
> +	}
[ ... ]
> +static int rpmi_cpufreq_probe(struct platform_device *pdev)
> +{
> +	struct rpmi_perf **mpxy_perf =3D dev_get_platdata(&pdev->dev);
> +	struct device *dev =3D &pdev->dev;
> +	int ret;
> +
> +	if (!mpxy_perf || !*mpxy_perf)
> +		return -EINVAL;
> +
> +	/*
> +	 * There is one cpufreq driver for the whole system, so only one
> +	 * provider can drive the CPUs. Refuse another one rather than point
> +	 * the registered driver at its domains.
> +	 */
> +	if (rpmi_perf_cpufreq_driver.driver_data)
> +		return dev_err_probe(dev, -EBUSY,
> +				     "CPUs are already driven by another provider\n");
> +
> +	rpmi_perf_cpufreq_driver.driver_data =3D pdev;
> +
> +	ret =3D cpufreq_register_driver(&rpmi_perf_cpufreq_driver);
> +	if (ret) {
> +		rpmi_perf_cpufreq_driver.driver_data =3D NULL;
> +		return dev_err_probe(dev, ret, "registering cpufreq failed\n");
> +	}

[Severity: High]
Is this check-and-set sequence protected against concurrent probing?

If multiple riscv-rpmi-cpufreq platform devices probe concurrently (such as
from asynchronous probing or manual sysfs binds), multiple threads might
bypass the initial if (rpmi_perf_cpufreq_driver.driver_data) check and
overwrite driver_data.

Both threads would then attempt to register the driver. The cpufreq core's
internal locks would cause the second thread to fail with -EEXIST.

The failing thread would execute this error path and set driver_data to NUL=
L,
corrupting the state established by the successful thread.

Later, when the cpufreq core invokes rpmi_perf_init(), it calls
cpufreq_get_driver_data(), which would return NULL. The function then attem=
pts
to access pdev->dev.parent, which could lead to a NULL pointer dereference.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008091032.2832=
333-1-joshua.yeong@starfivetech.com?part=3D5
