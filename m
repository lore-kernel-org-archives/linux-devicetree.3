Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677AC1A285
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 00:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779669968; cv=none; b=QhcUiXtXR+sRfsu3/OSEADZwOJuZFwz/H3CMInlahPTaP2DSdPHC1jZyntbmb9EDqRts2um53syuevm8UQHa7S+WA7i1YanwQJYr9sbZyxlwYO1hCVvFOy+bD4r/4Ep24McLRMLJHy0WaNdBNVj4s2PUbhPyF1+S+dAg11+lgUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779669968; c=relaxed/simple;
	bh=7NI5aaiaI12mgWK6ZF1vZ06Ww6pYkaWx/aDrc5daK14=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R4/G4Wt9kQpfwKKVc2lK7j9gaIuvAhii9HoQiyvb3zQAAr0SzZ46oszT0cqbo+daVk52TR4TF5DiBfvtF72o2Eqm0+4erW28aJwBzBp/WUQ3MEkFamhemwMgEOGbeQ3zgRc4q6mXyVoyQqYfujkYid7KejKNHTBplCDRpcEwrm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5UFZKI4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5UFZKI4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82941F000E9;
	Mon, 25 May 2026 00:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779669967;
	bh=JPVRXrJeqUbxsoUvdLOp9Lj8h6FLbbEf0dmNEEB746I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z5UFZKI4m2U4He+pscu8FtvEYHene6zMQmq60Ss05dLgb4fk75R7ho53MTnR9iDkr
	 22L2pI1V23acV2qnr2PtQdLk7PeuWQ/Z+HIB+RMz65CIHn+91RYjYvpyyIWV/uqjZV
	 XxxFYnhXOIDVvpj+EgWHGCk50ieQsaVnJe8aszXqnC+/c9GpGFAsgaxPmsfinUhWhw
	 gmbqSjqFp0yuhaRSBDY221JAM+8hguEIkl2dwBbBxjnyTgNyiDPabFPeH7aVaqh5e9
	 GEu04RVOX3T/JO/BDMCBwPqk6WoHKYOkJkM61XYbjlwuprRt3eyb7DhqOtZDDVdHUm
	 +g4hKfpQQIQCw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-12-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-12-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 00:46:06 +0000
Message-Id: <20260525004606.D82941F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Freeing the monitor domain after a non-sync cancellation of delaye=
d work causes a Use-After-Free vulnerability.
- [High] The `resctrl_arch_reset_rmid` re-arming logic is ineffective becau=
se the resctrl core never invokes it for Occupancy events.
- [Medium] The reported `num_rmid` capability is hardcoded to the first con=
troller's `mcid_count`, leading to incorrect capabilities reporting.
- [Low] The `cbqri_resctrl_counters` array is defined and populated but nev=
er used.
--

commit e0ea68d0dff2235cb1ae515b494803e2b894c85f
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add L3 cache occupancy monitoring

This commit exposes QOS_L3_OCCUP_EVENT_ID to allow userspace to read
per-MCID llc_occupancy. It creates L3 mon_domains lazily on the first CPU of
a cache_id, linked to the paired ctrl_domain. It also implements architectu=
re
specific resctrl hooks to read and reset RMIDs.

> resctrl_arch_reset_rmid() re-arms CONFIG_EVENT with EVT_ID=3DOccupancy.
> CONFIG_EVENT both resets the counter to 0 and selects the event, so
> re-arming with the same event keeps the MCID counting after reset rather
> than relying on sticky-last-event semantics that the CBQRI register
> definition does not guarantee.

[Severity: High]
Does the resctrl core actually invoke resctrl_arch_reset_rmid() for Occupan=
cy
events?

The resctrl core only invokes resctrl_arch_reset_rmid() individually for MBM
events during mon_event_read() (when rr->first is true). For
QOS_L3_OCCUP_EVENT_ID, mon_event_read() is never called with first =3D true,
and the recycle path (__check_limbo()) only reads the counter without
resetting.=20

Will this cause the Occupancy counter to stop functioning when an RMID is
recycled since it is never re-armed?

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index 1e6198e25fd29..3ba895c3f8111 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -32,7 +33,18 @@ struct cbqri_resctrl_dom {
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

[Severity: Low]
Is this array necessary?

The patch introduces this per-event controller array and populates it in
cbqri_resctrl_pick_counters(), but it appears to be unused.
resctrl_arch_rmid_read() dynamically resolves the controller via
cbqri_find_ctrl_domain() instead.

[ ... ]

> @@ -500,6 +630,14 @@ static int cbqri_resctrl_control_init(struct cbqri_r=
esctrl_res *cbqri_res)
>  		res->alloc_capable =3D ctrl->alloc_capable;
>  		INIT_LIST_HEAD(&res->ctrl_domains);
>  		INIT_LIST_HEAD(&res->mon_domains);
> +
> +		if (ctrl->mon_capable && res->rid =3D=3D RDT_RESOURCE_L3) {
> +			res->mon_scope =3D RESCTRL_L3_CACHE;
> +			res->mon.num_rmid =3D ctrl->mcid_count;

[Severity: Medium]
Will this expose an inflated number of RMIDs to userspace if subsequent
controllers have fewer MCIDs?

cbqri_resctrl_accumulate_caps() calculates max_rmid as the system-wide
minimum mcid_count across all controllers, which bounds internal
resctrl allocations.=20

However, res->mon.num_rmid is initialized here using only the first
controller's mcid_count. If a subsequent controller has a smaller mcid_coun=
t,
could this cause userspace to receive unexpected "Out of RMIDs" errors when
creating groups?

[ ... ]

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
> +			cancel_delayed_work(&mon_dom->cqm_limbo);
> +			if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +				cancel_delayed_work(&mon_dom->mbm_over);
> +			resctrl_offline_mon_domain(res, &mon_dom->hdr);
> +			list_del(&mon_dom->hdr.list);
> +			kfree(mon_dom);

[Severity: High]
Can this cause a use-after-free if the delayed work is executing?

cancel_delayed_work() is used without synchronization (_sync) to avoid a
deadlock against cpus_write_lock(). However, if the work is currently
executing but has not yet acquired cpus_read_lock() (or is preempted),
cancel_delayed_work() returns immediately.

The hotplug thread then frees the domain with kfree(mon_dom). When the
delayed work thread resumes and acquires cpus_read_lock(), won't it access
its work_struct and other fields within the freed mon_dom structure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D12
