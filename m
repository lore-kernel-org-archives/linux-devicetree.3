Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A95361656
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780346972; cv=none; b=VnxRb2o9/8Ky5Zht/tSMqx5Cjf7ATnjOHQ4jdAJ5sWaY85l6V4kGMj38IBPiJvBHlv35+M/J75SKemHO4Z4+BUfjt+n6uUwdv/S9JqdlbU9vOoYljkmHoNZMESNeNiSDOvX3lCKaZ2O6iiw8sxlPywnJE5JKSQA5plxaMaijpKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780346972; c=relaxed/simple;
	bh=XzoNiEoq1efEspU+Wa/WFdP72jW0jTqXt8hvpiStz4s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Sd72DbGa3O7pCv3DKMC8M4yTxQ82wyxq7ofyMsURwpJ6js6LEjpmMUm4N5GWavrEifd4U5fXc07nQRfA7uDGPZP8IMevOOluUoQ2IxnVcco4xD+OZHicFeVdqqtK0eo4hy2Ut0B6txnKbFqkqHHwXRGrHEdiKONh+52UrwfKwGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Txo7jaH4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Txo7jaH4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9481F00893;
	Mon,  1 Jun 2026 20:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780346971;
	bh=dmPUeRJnK95d8VsPX4SaMEJhi1b22huQy5RXkRNdKyw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Txo7jaH4jtX9tU8b9vvbq7TlUOmENHlgyveq2pesP0Ceme5X1iH0FrRPcLyOMEIZc
	 QpX7dH/WwyIu6YwWjco86MF1m1J1RbyFuwgqlQ6v8132KqEfd+EkUqMb11PZEkwqzx
	 cl2F3Vug3v3muhtQi0VrHwKQXi3b5OSHOpWEh2vbn9qTLvpmA/q1fPjE61Kj5b0cXT
	 9qMukSPx1VoBchquqJh30H79hgiUrD3x9QsXm0jMCs4QsBDYI5PF+tUm+dEjt2Y8vL
	 RGLxepLqo8Cgj/uFRdc0QoqoRoAp47uJrIVC8y/eetE9kRWrVaxjrM97FaRRGxPnrj
	 5UEgbPnVQeS5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-3-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-3-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:49:30 +0000
Message-Id: <20260601204931.3A9481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] CPU hotplug cache invalidation in riscv_srmcfg_offline() is overwr=
itten before the CPU halts.
- [High] PM exit notifier invalidates software cache but fails to eagerly r=
estore the hardware CSR.
- [Medium] Failure in cpuhp_setup_state() skips PM notifier registration, s=
ilently breaking suspend/resume QoS tracking.
--

commit bc4841378eac220040a12e4f7c694dde12285eb1
Author: Drew Fustini <fustini@kernel.org>

riscv: add support for srmcfg CSR from Ssqosid extension

This patch adds support for the srmcfg CSR defined in the Ssqosid ISA
extension, tracking resource allocation (RCID) and usage (MCID). It adds
a per-task thread_struct field and per-CPU cached variables to update the
CSR during context switches.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0

[ ... ]

> diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> new file mode 100644
> index 0000000000000..d18b99b195e79
> --- /dev/null
> +++ b/arch/riscv/kernel/qos.c

[ ... ]

> +/*
> + * Invalidate the cache on offline too. The sentinel persists across the
> + * offline period, so a CPU brought back online finds the cache already
> + * invalidated before it is schedulable. This closes the window where a
> + * task scheduled before riscv_srmcfg_online() runs could match a stale
> + * cache and skip the CSR write while the hardware CSR was reset across
> + * hart stop/start.
> + */
> +static int riscv_srmcfg_offline(unsigned int cpu)
> +{
> +	per_cpu(cpu_srmcfg, cpu) =3D U32_MAX;

[Severity: High]
Will this U32_MAX sentinel be overwritten before the CPU actually halts?

Because riscv_srmcfg_offline() executes at CPUHP_AP_ONLINE_DYN, the dying C=
PU
continues tearing down and eventually context switches to the idle thread to
physically offline.

This context switch invokes __switch_to_srmcfg(), which writes the hardware
CSR and overwrites the cpu_srmcfg cache with the idle task's value,
permanently losing the U32_MAX sentinel.

When the CPU comes back online, its hardware CSR is in an implementation
defined reset state, but the software cache holds a valid value. Any early
tasks sharing this stale value might skip the CSR write and execute with
incorrect QoS tags until riscv_srmcfg_online() is reached.

> +	return 0;
> +}
> +
> +/*
> + * CPU PM notifier: invalidate the cached srmcfg on resume from a deep
> + * idle / suspend. Ssqosid v1.0 leaves CSR_SRMCFG state across low-power
> + * transitions implementation-defined, and the boot CPU never goes
> + * through the cpuhp online callback during system suspend, so without
> + * this hook __switch_to_srmcfg() would skip the CSR write when the
> + * outgoing task happens to share its srmcfg with the pre-suspend cache.
> + */
> +static int riscv_srmcfg_pm_notify(struct notifier_block *nb,
> +				  unsigned long action, void *unused)
> +{
> +	switch (action) {
> +	case CPU_PM_EXIT:
> +	case CPU_PM_ENTER_FAILED:
> +		__this_cpu_write(cpu_srmcfg, U32_MAX);

[Severity: High]
Does this notifier need to eagerly restore the hardware CSR for the current=
ly
executing thread?

It sets cpu_srmcfg to U32_MAX to force a CSR write on the next context
switch. However, upon waking from low-power states like suspend-to-RAM, the
CPU does not immediately context switch.

It unwinds the suspend stack, resumes executing the interrupted thread, and
services pending interrupts.=20

Because the hardware CSR is not explicitly restored here, all code executing
between wakeup and the first context switch might run with the hardware's
implementation defined reset value for CSR_SRMCFG instead of the task's
assigned QoS tags.

> +		break;
> +	}
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block riscv_srmcfg_pm_nb =3D {
> +	.notifier_call =3D riscv_srmcfg_pm_notify,
> +};
> +
> +static int __init riscv_srmcfg_init(void)
> +{
> +	int err;
> +
> +	if (!riscv_has_extension_unlikely(RISCV_ISA_EXT_SSQOSID))
> +		return 0;
> +
> +	/*
> +	 * cpuhp_setup_state() invokes the startup callback locally on every
> +	 * already-online CPU, so no separate seed loop is needed here.
> +	 */
> +	err =3D cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "riscv/srmcfg:online",
> +				riscv_srmcfg_online, riscv_srmcfg_offline);
> +	if (err < 0) {
> +		pr_warn("srmcfg cpuhp registration failed (%d), cpus brought online af=
ter boot will not invalidate the CSR_SRMCFG cache\n",
> +			err);
> +		return err;

[Severity: Medium]
Is it intentional to skip PM notifier registration if CPU hotplug setup fai=
ls?

This early return skips cpu_pm_register_notifier() entirely.=20

While cpuhp_setup_state() failures are rare, PM notifiers do not strictly
depend on CPU hotplug registration. If this error path is taken, tasks waki=
ng
from suspend could run with incorrect QoS tags because the PM notifier is n=
ever
registered.

> +	}
> +
> +	cpu_pm_register_notifier(&riscv_srmcfg_pm_nb);
> +	return 0;
> +}
> +arch_initcall(riscv_srmcfg_init);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D3
