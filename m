Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C9A32BF41
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 05:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562002; cv=none; b=aGjcsEkWLG8QOgF3Vbg+6nilEe8UvIY+MM5gj4okq/yCll5o9/G0/pQ8yi1P70VOW+Z/i8p6pddDRTzmnAVhWeCjwSmFfm/7ur0UByeDvzql0k+woGCSyU1Pepeze0OxDFO/nrsUfyALf1oalPkwmQyFDdACHRcs5xaHjkgG2EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562002; c=relaxed/simple;
	bh=nAwPH0HShXi20JmeJgbDSSSwIbW0HJWe0hNRMSirly0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=nouev3YibjfEVRSd/fs04yUSi6jqSHQbSeZG7q5Lk0NB6I4WF87wB3kClVH6ygEIvdTC7arfSIPXpfgeN2PJzSxuP/n/v7a7h+Md/IYSMgO3JB3kByZ5IAL2BRgl9rxRfC789+66RkQtCj0sePsBPtZdpRPAkIO6kqxcbB4tNXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYmQi+cz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYmQi+cz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38B24C2BCB0;
	Tue, 12 May 2026 05:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778562001;
	bh=nAwPH0HShXi20JmeJgbDSSSwIbW0HJWe0hNRMSirly0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qYmQi+czqHMmJ3QyVL8/1dNHk73HEFiALfE5GsS4qRlpsOu5mvG3m8omu98otAq7v
	 cM2Sk5N7Dx27/CZ1eqXWn40JR94zu2OIjZzsG8CBvPTW32eO23HXILDzXx7hsK2Z7f
	 qXUL0hh62eOcj5YyYyeDD/qfCgRmBULN1Ih+HjQKVurcMbzYVqr+gsUuqSfTfifcE8
	 BKFUoBkWIsKgkxRpaVGlMClarGiYF47RpOcHnaVZc5x2XJ3aCL0WHfplcgv4X+BKUg
	 hKY3Czr6mOTjIQWV3N4tIlMSlOyl46o486G+nqxKoWrzzU7Kc0kceBoxpKzJ5nxh0Q
	 T3e4xCPDW7dXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v4 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Reply-To: sashiko@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, krzk+dt@kernel.org
In-Reply-To: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-12-eb53831ef683@kernel.org>
References: <20260510-ssqosid-cbqri-rqsc-v7-0-v4-12-eb53831ef683@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:00:00 +0000
Message-Id: <20260512050001.38B24C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [High] AB-BA deadlock between CPU hotplug lock and `cqm_limbo` workqueue =
synchronization.
- [High] Unconditional call to `cancel_delayed_work_sync()` on uninitialize=
d `mbm_over` work struct.
- [High] Partial CPU hotplug failures leak CPUs in `ctrl_domain` and cause =
permanent state corruption.
- [High] `cbqri_resctrl_online_cpu()` ignores controllers that are only cap=
able of monitoring.
- [High] `resctrl_arch_reset_rmid()` is never invoked for L3 Occupancy duri=
ng RMID recycle, leading to broken monitoring.
- [Medium] `resctrl_arch_rmid_read()` unconditionally fails with `-EIO` on =
`nohz_full` CPUs.
- [Medium] Duplicate hardware initialization loops introduce unnecessary MM=
IO overhead during L3 monitoring domain setup.
- [Low] The `cbqri_resctrl_counters` array is populated but never read.
--

commit 3c72f0947f0494c3b85bcbe44e05864be0ec064e
Author: Drew Fustini <fustini@kernel.org>

    riscv_cbqri: resctrl: Add L3 cache occupancy monitoring
   =20
    Expose QOS_L3_OCCUP_EVENT_ID so userspace can read per-MCID
    llc_occupancy. The result is converted from capacity blocks to bytes
    using cache_size and ncblks.

>     resctrl_arch_reset_rmid() re-arms CONFIG_EVENT with EVT_ID=3DOccupanc=
y.
>     CONFIG_EVENT both resets the counter to 0 and selects the event, so
>     re-arming with the same event keeps the MCID counting after reset rat=
her
>     than relying on sticky-last-event semantics that the CBQRI register
>     definition does not guarantee.

The resctrl core only calls mon_event_read() with first=3Dtrue (which
triggers the arch reset hook) for Memory Bandwidth Monitoring events,
never for L3 Occupancy.

Because resctrl_arch_reset_rmid() is never invoked for L3 Occupancy during
RMID recycle, will the counter fail to re-arm when a new monitoring group
is created, causing it to stop counting or inherit dirty data from previous
users?

>     The L3 mon_domain is created lazily on the first CPU of a cache_id and
>     linked to the paired ctrl_domain.
>    =20
>     Assisted-by: Claude:claude-opus-4-7
>     Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
>     Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
>     Signed-off-by: Drew Fustini <fustini@kernel.org>

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index 82b157d35576b..d8fd9b06703fa 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -33,6 +34,13 @@ struct cbqri_resctrl_dom {
> =20
>  static struct cbqri_resctrl_res cbqri_resctrl_resources[RDT_NUM_RESOURCE=
S];
> =20
> +/*
> + * Per-event controller table. Only events CBQRI can back occupy a
> + * slot, so other events do not bloat the array.
> + */
> +#define CBQRI_MAX_EVENT QOS_L3_OCCUP_EVENT_ID
> +static struct cbqri_controller *cbqri_resctrl_counters[CBQRI_MAX_EVENT +=
 1];

This array is allocated and initialized in cbqri_resctrl_pick_counters()
and nulled out during teardown, but its contents appear to never be accessed
by any logic in the driver.=20

Is this array just dead code?

[ ... ]

> @@ -205,10 +225,101 @@ int resctrl_arch_rmid_read(struct rdt_resource *r,=
 struct rdt_domain_hdr *hdr,
>  			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
>  			   void *arch_priv, u64 *val, void *arch_mon_ctx)
>  {
> -	return -ENODATA;
> +	struct cbqri_resctrl_dom *hw_dom;
> +	struct cbqri_controller *ctrl;
> +	struct rdt_ctrl_domain *d;
> +	u64 ctr_val;
> +	int err;
> +
> +	resctrl_arch_rmid_read_context_check();
> +
> +	/*
> +	 * Each branch takes a sleeping mutex. Bail if called with IRQs
> +	 * disabled (e.g. smp_call_function_any() from nohz_full CPUs).
> +	 */
> +	if (irqs_disabled())
> +		return -EIO;

The resctrl core intentionally reads remote domains via
smp_call_function_any() when the target CPU is nohz_full, running the
callback in hardirq context.

Will rejecting calls in atomic context completely break cache occupancy
monitoring for nohz_full CPUs, as any attempt to read their statistics
will always fail with -EIO?

[ ... ]

> @@ -577,6 +725,71 @@ static struct rdt_ctrl_domain *cbqri_create_ctrl_dom=
ain(struct cbqri_controller
>  	return domain;
>  }
> =20
> +static int cbqri_attach_cpu_to_l3_mon(struct cbqri_controller *ctrl,
> +				      struct rdt_resource *res, unsigned int cpu)
> +{

[ ... ]

> +	err =3D resctrl_online_mon_domain(res, &mon_dom->hdr);
> +	if (err)
> +		goto err_listdel;
> +
> +	err =3D cbqri_init_mon_counters(ctrl);

During domain initialization, resctrl_online_mon_domain() internally
calls resctrl_arch_reset_rmid_all(), which loops over all max_rmid to
issue CONFIG_EVENT MMIO operations.

Immediately after this returns, cbqri_init_mon_counters() is called,
which loops over ctrl->mcid_count to issue the exact same CONFIG_EVENT
MMIO operations again.

Since each CBQRI MMIO operation can sleep and take up to 1ms, does
doing this twice per domain initialization introduce strictly redundant
and significant latency during CPU hotplug?

> +	if (err)
> +		goto err_offline;
> +
> +	return 0;
> +
> +err_offline:
> +	cancel_delayed_work_sync(&mon_dom->cqm_limbo);
> +	cancel_delayed_work_sync(&mon_dom->mbm_over);

The resctrl core only initializes mbm_over if resctrl_is_mbm_enabled()
is true. Since the CBQRI driver only enables the L3 Occupancy event and
not MBM, mbm_over remains completely zero-initialized from allocation.

Can calling cancel_delayed_work_sync() on a zeroed structure pass an
uninitialized timer to del_timer_sync() and trigger kernel panics?

> +	resctrl_offline_mon_domain(res, &mon_dom->hdr);
> +err_listdel:
> +	list_del(&mon_dom->hdr.list);
> +err_free:
> +	kfree(mon_dom);
> +	return err;
> +}
> +
> +static int cbqri_attach_cpu_to_cap_ctrl(struct cbqri_controller *ctrl,
> +					unsigned int cpu)
> +{

The hotplug callback cbqri_resctrl_online_cpu() unconditionally skips
controllers if !ctrl->alloc_capable.

Will this cause controllers that are only capable of monitoring to be
ignored entirely, meaning no CPUs will ever be attached and no monitoring
domains will be created on monitoring-only hardware?

>  	struct cbqri_resctrl_res *hw_res;
>  	struct rdt_ctrl_domain *domain;
>  	struct rdt_resource *res;
>  	int dom_id;
> +	int err;
> =20
[ ... ]

>  	domain =3D cbqri_find_ctrl_domain(&res->ctrl_domains, dom_id);
>  	if (domain) {
>  		cpumask_set_cpu(cpu, &domain->hdr.cpu_mask);
> -		return 0;
> +	} else {
> +		domain =3D cbqri_create_ctrl_domain(ctrl, res, cpu, dom_id);
> +		if (IS_ERR(domain))
> +			return PTR_ERR(domain);
>  	}
> =20
> -	domain =3D cbqri_create_ctrl_domain(ctrl, res, cpu, dom_id);
> -	if (IS_ERR(domain))
> -		return PTR_ERR(domain);
> +	if (ctrl->mon_capable && ctrl->cache.cache_level =3D=3D 3) {
> +		err =3D cbqri_attach_cpu_to_l3_mon(ctrl, res, cpu);
> +		if (err)
> +			return err;

If cbqri_attach_cpu_to_l3_mon() fails here, the error is returned, but the
CPU is not removed from the ctrl_domain mask and the domain structure is
not freed.

Because the CPU hotplug core handles a startup failure by rolling back
from the previous state, the offline callback for the current state
(cbqri_resctrl_offline_cpu) is not invoked.

Does this leave the CPU permanently stranded in the ctrl_domain mask and
leak the newly allocated domain structure?

> +	}
> =20
>  	return 0;
>  }
> =20
> +static void cbqri_detach_cpu_from_l3_mon(struct rdt_resource *res,
> +					 unsigned int cpu)
> +{
> +	struct rdt_l3_mon_domain *mon_dom, *tmp;
> +
> +	lockdep_assert_held(&cbqri_domain_list_lock);
> +
> +	list_for_each_entry_safe(mon_dom, tmp, &res->mon_domains, hdr.list) {
> +		if (!cpumask_test_cpu(cpu, &mon_dom->hdr.cpu_mask))
> +			continue;
> +		cpumask_clear_cpu(cpu, &mon_dom->hdr.cpu_mask);
> +		if (cpumask_empty(&mon_dom->hdr.cpu_mask)) {
> +			cancel_delayed_work_sync(&mon_dom->cqm_limbo);

This function is executed as a CPU hotplug callback, meaning the thread
holds cpus_write_lock(). Concurrently, the cqm_handle_limbo() worker
function in the resctrl core begins by acquiring cpus_read_lock().

If the worker starts executing while the hotplug thread is active, the
worker will block on cpus_read_lock(), while the hotplug thread blocks in
cancel_delayed_work_sync() waiting for the worker to finish.

Could this create an unresolvable AB-BA deadlock that hangs the system
during CPU offline operations?

> +			cancel_delayed_work_sync(&mon_dom->mbm_over);

(As mentioned above, mbm_over appears to be uninitialized here as well.)

> +			resctrl_offline_mon_domain(res, &mon_dom->hdr);
> +			list_del(&mon_dom->hdr.list);
> +			kfree(mon_dom);
> +		}
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-ssqosid-cb=
qri-rqsc-v7-0-v4-0-eb53831ef683@kernel.org?part=3D12
