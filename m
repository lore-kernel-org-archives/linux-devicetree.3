Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9A91C5D5E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779669009; cv=none; b=j3g3tpnmb7d0cDAGNQBnj3Bog7w0rwxCzAT6s864S4f/E4XPDCZtFx+PrB8gNF6+E43Do7sNH06CZ4nFlRk5dm63qklY+4Ore4rl2o2dqFb+aPsOYbs0avfvBYSv8mjjM38sZ2Dsib2lJtQynYmhsv5Vfh9yqT9GqLv4I0wTnzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779669009; c=relaxed/simple;
	bh=BQKGJJuO1YNExy+s4UZlleLCKfyz6L0Io/oh5+kXrlg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OHSLFbL7rYA5cr/wL28pIfCM6ZE/NeolGByrwH0+sGgvlHoPYAaqnyYDaeXW6vt/sZBPBKpqTRApzq57jkEZJ60fzGuN2fCJo/UYVamD6ycItx0moeCGrsw/xy0AlGFJXOwZwxGLUmGNXcc+20EKvfAaCg1ST+Y6WHF7MrvKyZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFKWULhA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFKWULhA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4E91F000E9;
	Mon, 25 May 2026 00:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779669007;
	bh=8IvEGoK6ZRR2K7o2fL58i8A7IFC6T9Qib46A+tSv6bw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nFKWULhAfF44d/UMTa0dWS1pUH5Yjk+cCmayUf+XMViOox9W/X03aXHi8yzS/vrQz
	 OXMtLqgps++DEuJCtk/ft8Vwsj4L6171dw2zGtT87cwS4v+QQvPBiTlWml/knD7Gpd
	 lhoAluLqQkcHewn9nxmzU+PVDbMrm6eKAnzNIBZKTH7OdUB+Ne5JZjFtqx7HZOdGmk
	 C25EL615dcJMRo8i27Sh6K1cLFUXYfM3eXXZFWNK22Oi25q8atamDYjYY1EK/7h8+S
	 b+EJ9a2zucyFr9Bb1rDENmN8PZCERUjxJnsP6BVbKLmsnkD7c6NLyroNzHQ6dI5M76
	 GAlZX5GPy2/fQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 03/18] riscv: add support for srmcfg CSR from
 Ssqosid extension
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-3-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-3-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:30:07 +0000
Message-Id: <20260525003007.7D4E91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing explicit restoration of the CSR_SRMCFG hardware register f=
or the currently executing task after PM resume.
- [High] Stale `cpu_srmcfg` cache is not invalidated during CPU offline, le=
ading to Resource Control bypass during CPU bring-up.
--

commit a2aa09c6b4fa4803db0225c807231e47944cc13e
Author: Drew Fustini <fustini@kernel.org>

riscv: add support for srmcfg CSR from Ssqosid extension

This commit adds support for the srmcfg CSR defined in the Ssqosid ISA
extension, allowing tasks to be tagged with Resource Control ID (RCID) and
Monitoring Counter ID (MCID). It handles context switching by saving and
restoring the srmcfg value per task, while caching it per-cpu to avoid
redundant writes.

Link: https://github.com/riscv/riscv-ssqosid/releases/tag/v1.0

> diff --git a/arch/riscv/kernel/qos.c b/arch/riscv/kernel/qos.c
> new file mode 100644
> index 0000000000000..2f3fbb08dcc97
> --- /dev/null
> +++ b/arch/riscv/kernel/qos.c

[ ... ]

> +static int riscv_srmcfg_pm_notify(struct notifier_block *nb,
> +				  unsigned long action, void *unused)
> +{
> +	switch (action) {
> +	case CPU_PM_EXIT:
> +	case CPU_PM_ENTER_FAILED:
> +		__this_cpu_write(cpu_srmcfg, U32_MAX);
> +		break;
> +	}
> +	return NOTIFY_OK;
> +}

[Severity: High]
Does this leave the currently executing task with an incorrect hardware CSR
state?

While the software cache is invalidated by setting cpu_srmcfg to U32_MAX,
the hardware CSR_SRMCFG register is not explicitly reprogrammed during
CPU_PM_EXIT.

Since the hardware state may be lost or reset to an implementation-defined
value upon resume, wouldn't the task running at resume time continue execut=
ing
with the wrong QoS tag until it is eventually preempted?

[ ... ]

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
> +				riscv_srmcfg_online, NULL);

[Severity: High]
Should a teardown callback be provided to cpuhp_setup_state() to invalidate
the cpu_srmcfg cache when a CPU goes offline?

Without a teardown callback, a CPU going offline retains its previous
cpu_srmcfg value. When brought back online, its hardware CSR is reset.

Tasks scheduling before the CPU reaches the CPUHP_AP_ONLINE_DYN state might
skip the CSR write if their thread srmcfg tag matches the stale cache. Could
this allow those early context switches to bypass resource constraints by
running with the hardware-reset CSR?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D3
