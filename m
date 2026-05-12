Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E51B3383304
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 04:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778558496; cv=none; b=VKZm/Xwvy9dXHMmE39/C7HuIwx8Pn0Bd0YMuUEBFJD8+68iuHW285grEeT216+6DGdRdMx2JD2SocXZBvTc+4eA1HYHhQqmCab9h9Yu3uXa5SbfAHWAkFlWkoG8CEyu7/6Pin5FIWvZ27zwTi6+KrfS/ZtxWD5BCBQvdi89p9CE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778558496; c=relaxed/simple;
	bh=pDHdcvZxyP7oH7hQAZhM7f3KkD9CzmJZDqA+2QnjQ1w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R1TmUZJ9lOEzVXPiFAfLU7LMZFutDxBOabqVMA/+/zZmwZ/CUixgH8gGgK3VuhBnqqfBYnSsDohiTxK0zjiUJkfH/UBgV/Vk3RxQy+4XHXTwLS/jLJ21Ymkm+BycqfMUsRSfKcdK74r+m3ZOYIVr2rhiEquMDvcf/w3JGmHyJj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OPx02vmq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OPx02vmq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51715C2BCB0;
	Tue, 12 May 2026 04:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778558495;
	bh=pDHdcvZxyP7oH7hQAZhM7f3KkD9CzmJZDqA+2QnjQ1w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=OPx02vmqGbgVwVKkQNcpF69SGGpUYo0bbtu1vXUVtfmSWuS0UT8Y6qwIpaDWN3XHf
	 xqys5hXcOnlVNW0UQWDJi0ATnrX8Ud5T2OxpRnGaxVqITX2zJG6ki9rcFQ3lVdOufj
	 5lUn6TZeqeu5ShymH4Gl88q0AJAZB/Md8VgfEAE+8Mzmom1r/4ruoCp8tAXUDNvW0R
	 5o8m2ekdXFvAeufbjVMI3w4EBJHssXDNXtNGaJOEvXm22D4AKkbQWQEY7uepDY+H/o
	 EWw9di4ZN1LZdsP7ZWB7zf5rAVrvL3HVHf+/U4QekgfDw31KOHC4Voian1MadDnNyw
	 90V1lmHntUtkg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 11/18] riscv_cbqri: resctrl: Add cache allocation
 via capacity block mask
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-11-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-11-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:01:34 +0000
Message-Id: <20260512040135.51715C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] Initialization and reset loops unconditionally iterate over `CDP_N=
UM_TYPES`, sending invalid access types to non-CDP hardware.
- [High] Missing upper bounds check on `rcid_count` leads to silent resourc=
e isolation bypass via integer truncation.
- [Medium] `cbqri_resctrl_setup()` fails to clean up globally visible state=
 on initialization failure.
- [Medium] Using `wait_event()` to wait for a previous initcall creates a d=
ormant deadlock trap.
- [Medium] Unnecessary use of `synchronize_rcu()` inside CPU hotplug callba=
cks causes severe latency spikes.
- [Medium] The `cbqri_domain_list_lock` mutex is completely redundant.
- [Low] Enabling CONFIG_RISCV_ISA_SSQOSID and CONFIG_RESCTRL_FS without CON=
FIG_RISCV_CBQRI_DRIVER causes a linker error.
- [Low] Use of non-existent macro `kzalloc_obj` in `cbqri_new_domain()`.
--

commit 8f17399147965ff9d1d7a5a7237300d91e824dd5
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add cache allocation via capacity block mask
   =20
This commit wires the CBQRI capacity controllers into the resctrl subsystem.
It exposes L2 and L3 resources and handles domains lazily during CPU hotplu=
g.

> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -595,6 +595,7 @@ config RISCV_ISA_SSQOSID
>  	bool "Ssqosid extension support for supervisor mode Quality of Service =
ID"
>  	depends on 64BIT
>  	default n
> +	select ARCH_HAS_CPU_RESCTRL

If CONFIG_RISCV_CBQRI_DRIVER is disabled, does this cause a linker error
when CONFIG_RESCTRL_FS is enabled? The riscv implementation of the
resctrl_arch_* functions is in cbqri_resctrl.c, which seems to only be
compiled when the driver is enabled.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> --- /dev/null
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> +u32 resctrl_arch_get_num_closid(struct rdt_resource *res)
> +{
> +	struct cbqri_resctrl_res *hw_res;
> +
> +	hw_res =3D container_of(res, struct cbqri_resctrl_res, resctrl_res);
> +
> +	/*
> +	 * fs/resctrl calls this for resctrl-defined rids that CBQRI may not
> +	 * back (e.g. RDT_RESOURCE_MBA from set_mba_sc() during unmount).
> +	 * Unpicked rids have ctrl =3D=3D NULL. Report no closids.
> +	 */
> +	if (!hw_res->ctrl)
> +		return 0;
> +
> +	return hw_res->ctrl->rcid_count;
> +}

Is there a bounds check needed for rcid_count against the 12-bit maximum?

If the firmware reports an rcid_count greater than 4096, fs/resctrl would
permit creating groups with closid >=3D 4096.

This could lead to FIELD_PREP() silently truncating the upper bits in
resctrl_arch_set_closid_rmid(), causing the task to run in a different group
and bypassing the intended hardware isolation.

[ ... ]

> +static struct rdt_ctrl_domain *cbqri_new_domain(struct cbqri_controller =
*ctrl)
> +{
> +	struct cbqri_resctrl_dom *hw_dom;
> +	struct rdt_ctrl_domain *domain;
> +
> +	hw_dom =3D kzalloc_obj(*hw_dom, GFP_KERNEL);

Does kzalloc_obj exist in the kernel? It looks like this might cause a
build failure due to an implicit function declaration.

[ ... ]

> +static int cbqri_init_domain_ctrlval(struct rdt_resource *r, struct rdt_=
ctrl_domain *d)
> +{
> +	struct cbqri_resctrl_res *hw_res;
> +	enum resctrl_conf_type t;
> +	int err =3D 0;
> +	int i;
> +
> +	hw_res =3D container_of(r, struct cbqri_resctrl_res, resctrl_res);
> +
> +	for (i =3D 0; i < hw_res->ctrl->rcid_count; i++) {
> +		/*
> +		 * Seed both DATA and CODE staged slots so a later mount
> +		 * with -o cdp does not see stale CODE values.
> +		 * CDP_NUM_TYPES is 1 on non-CDP controllers.
> +		 */
> +		for (t =3D 0; t < CDP_NUM_TYPES; t++) {
> +			err =3D resctrl_arch_update_one(r, d, i, t,
> +						      resctrl_get_default_ctrl(r));

Does this loop correctly handle non-CDP hardware? A comment mentions that
CDP_NUM_TYPES is 1 on non-CDP controllers, but since it is a compile-time e=
num
constant, the loop will always execute for t =3D CDP_CODE.

This could cause resctrl_arch_update_one() to send CBQRI_AT_CODE to
controllers that do not support it, potentially triggering a hardware fault=
 and
aborting initialization.

[ ... ]

> +static void cbqri_detach_cpu_from_ctrl_domains(struct rdt_resource *res,
> +					       unsigned int cpu)
> +{
> +	struct rdt_ctrl_domain *domain, *tmp;
> +
> +	list_for_each_entry_safe(domain, tmp, &res->ctrl_domains, hdr.list) {
> +		if (!cpumask_test_cpu(cpu, &domain->hdr.cpu_mask))
> +			continue;
> +		cpumask_clear_cpu(cpu, &domain->hdr.cpu_mask);
> +		if (cpumask_empty(&domain->hdr.cpu_mask)) {
> +			resctrl_offline_ctrl_domain(res, domain);
> +			list_del_rcu(&domain->hdr.list);
> +			synchronize_rcu();

Could this synchronize_rcu() call cause severe latency spikes during CPU
hotplug?

This function is called synchronously from cbqri_resctrl_offline_cpu() while
the core kernel holds the global cpu_hotplug_lock. It seems fs/resctrl mana=
ges
these lists using standard locks, so the RCU primitives might not be necess=
ary
here.

[ ... ]

> +static int cbqri_resctrl_setup(void)
> +{
> +	int rid;
> +	int err;
> +
> +	/* Wait for cacheinfo so cbqri_probe_cc()'s lazy fill has data. */
> +	wait_event(wait_cacheinfo_ready, cacheinfo_ready);

Could this wait_event() potentially put the init thread to sleep indefinite=
ly?

Because cbqri_resctrl_setup() and __cacheinfo_ready() both run as initcalls=
 on
the same kernel_init thread, if the previous initcall failed or the order
changed, wait_event() would sleep forever since no other thread exists to
wake it up.

[ ... ]

> +	cbqri_resctrl_accumulate_caps();
> +
> +	if (!exposed_alloc_capable) {
> +		pr_debug("no resctrl-capable CBQRI controllers found\n");
> +		return -ENODEV;
> +	}
> +
> +	err =3D resctrl_init();
> +	if (err)
> +		return err;

If resctrl_init() fails, should this function call cbqri_resctrl_teardown()
or otherwise revert the global state?

Since cbqri_resctrl_accumulate_caps() sets exposed_alloc_capable to true,
leaving it set on failure would cause resctrl_arch_alloc_capable() to
incorrectly return true.

[ ... ]

> +static int cbqri_resctrl_online_cpu(unsigned int cpu)
> +{
> +	struct cbqri_controller *ctrl;
> +	int err =3D 0;
> +
> +	mutex_lock(&cbqri_domain_list_lock);

Is the cbqri_domain_list_lock mutex necessary?

Since cbqri_resctrl_online_cpu() and cbqri_resctrl_offline_cpu() are invoked
exclusively by the CPU hotplug state machine, the core kernel already
serializes them globally using the cpu_hotplug_lock.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D11
