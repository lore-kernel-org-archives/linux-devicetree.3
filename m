Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7499630C601
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347370; cv=none; b=Jg7/0+pw1lliRIA+6Jr1XAVmOHLbsngE/o5aDTg7JsEzPst2p+QEOUQlAL8Njlrafk8ZGVy8/ZczkpxjGo68Z2vjBzYZPrwEaaf4Okmrjbo45FV2dKjUSxqJNjzejm1vVGuSsY+b/QCpRckU0aRPaIIqUEw8ClgPeeeXB/Y+6eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347370; c=relaxed/simple;
	bh=11u+oP1PLl6thbz7DHUvFwZFauWXVUOU5v17zThd5ZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=d+69/NnIHRWF06Axs6Gpibhh4Ur5DnLURmUgx1sRlM0BmQ2KnjjLjsjRmvZe14op/QlbS97UYnxN6WdggWziVdnGI57g2ReA+J+enZKwwOTcL/XYMCJbtuEPLmRRr90EwO5Zjorht0Et2/xrKgXCzWQJBSz/jUrownYCDe1HF6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BJop6cZE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BJop6cZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D86481F00893;
	Mon,  1 Jun 2026 20:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347369;
	bh=JIBF5GqcvuH43nFVvv7JvmP588bXopVcdDNUtOZPO74=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BJop6cZEmR5vyK40LfBgE3MOoZWYJfGt6BnCj/Qv/UHcrcYTnYhPHM0Q8ynU6HkQ6
	 6u9ofyaTzNcuG0tnQhKiXRK3R4vIN2jpmU4oTowjf0YX4jmfG/Jp525T/JqUfs12X2
	 MhaWtMg5TkUOKPVKfRugD74zNT9a/dSGjAcnxOeeTIZyZWkYk3OcvWC2idcW3xN94B
	 TdOToQNtTQntAzeNPPk9tQxS1ZjsSJcTTrbLgCFl+tuTAiDDwq0t0ATTkVoRGXVLnj
	 yCwsnUkAzKUMvakaqlaRfw/m9Z9LY/h4/GQx78ReyVhgwzga3NBF4bA0VzMaWzYQF5
	 ccxMBHRowBjkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-11-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-11-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:56:08 +0000
Message-Id: <20260601205608.D86481F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Mismatched alloc_capable capabilities between capacity controlle=
rs at the same cache level are silently ignored, violating the intended fat=
al configuration error check.
- [Low] Kconfig allows enabling RESCTRL_FS without building the RISC-V resc=
trl architecture backend, resulting in a linker error.
--

commit d73c0a3857753716bda7153acbb1f89effd9457a
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add cache allocation via capacity block mask

Wire CBQRI capacity controllers into resctrl as RDT_RESOURCE_L2 and
RDT_RESOURCE_L3 schemata. Mismatched CC caps at the same cache level
are treated as a fatal configuration error since fs/resctrl exposes
a single per-rid cap set. Domains are created lazily in the cpuhp
online callback so cpu_mask reflects only currently online CPUs.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 6abbb21f3a0dc..390353a6153a2 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
>  	bool "Ssqosid extension support for supervisor mode Quality of Service =
ID"
>  	depends on 64BIT
>  	default n
> +	select ARCH_HAS_CPU_RESCTRL

[Severity: Low]
Does selecting ARCH_HAS_CPU_RESCTRL here unconditionally allow RESCTRL_FS
to be enabled, even if the RISC-V backend driver isn't built?

Since the backend implementation in cbqri_resctrl.c is gated by
RISCV_CBQRI_DRIVER:

config RISCV_CBQRI_RESCTRL_FS
    bool
    default y if RISCV_CBQRI_DRIVER && RESCTRL_FS

Could this result in a linker error for missing resctrl_arch_* symbols if
RISCV_ISA_SSQOSID is enabled but RISCV_CBQRI_DRIVER is disabled?

[ ... ]

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> new file mode 100644
> index 0000000000000..fb6d82aa3ffc2
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> +static int cbqri_resctrl_pick_caches(void)
> +{
> +	struct cbqri_controller *ctrl;
> +
> +	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> +		struct cbqri_resctrl_res *cbqri_res;
> +		enum resctrl_res_level rid;
> +
> +		if (ctrl->type !=3D CBQRI_CONTROLLER_TYPE_CAPACITY)
> +			continue;
> +		if (!ctrl->alloc_capable) {
> +			if (ctrl->mon_capable)
> +				pr_warn_once("CC @%pa: monitor-only controllers aren't supported\n",
> +					     &ctrl->addr);
> +			continue;
> +		}

[ ... ]

> +		cbqri_res =3D &cbqri_resctrl_resources[rid];
> +		if (cbqri_res->ctrl) {
> +			/*
> +			 * CCs at the same cache level must agree on every cap
> +			 * resctrl exposes globally. Reject mismatches at pick
> +			 * time so the inconsistency is visible at boot.
> +			 */
> +			if (cbqri_res->ctrl->rcid_count !=3D ctrl->rcid_count ||
> +			    cbqri_res->ctrl->cc.ncblks !=3D ctrl->cc.ncblks ||
> +			    cbqri_res->ctrl->cc.supports_alloc_at_code !=3D
> +				    ctrl->cc.supports_alloc_at_code ||
> +			    cbqri_res->ctrl->alloc_capable !=3D ctrl->alloc_capable) {

[Severity: Medium]
Is this alloc_capable mismatch check dead code?

Because the earlier loop condition explicitly skips controllers where
alloc_capable is false:

    if (!ctrl->alloc_capable) {
        ...
        continue;
    }

Will both cbqri_res->ctrl and the current ctrl always have alloc_capable
set to true at this point in cbqri_resctrl_pick_caches? This seems to
cause non-alloc-capable controllers to be silently ignored rather than
triggering the fatal configuration error described in the commit message.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D11
