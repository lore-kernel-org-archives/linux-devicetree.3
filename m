Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A6663446C7
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:57:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347439; cv=none; b=NxJdQaK4vB83ao2BCIqFhz7NGDXmeYhwJysCnGwh5CFBPg90efVGqSU7NqYWVjgRu/E4yn4caw7Ua1DXj6Bd3xkQPh7DwSa7HJGnoNGiwfS9ETvRg6mhJ2M8QmRN55T3/lcPqDH5TNSErhe7Y5HgaaeM+btRaDZEtnxDMTrivfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347439; c=relaxed/simple;
	bh=2270sOzRH022udFLUuodMG7LPR86UD2gl0LEYQ0lMug=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WeQDSupsm9jSVSqupxvbtb+/ybJUmtwos0AMFDBWWWxUh724MckHfCTbW0WdPH8bKRo9VfZUlJU06oWsVF2s5qP4k5NOGVt0YwEj6676focb4NUz5vvENJi5lXM9CMdErv1l5B1KIrGAFRDCiMsH8MM/sU4SEBZ07t+do86lnk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6Ncf2Jg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6Ncf2Jg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDA51F00893;
	Mon,  1 Jun 2026 20:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347437;
	bh=zSQ4OZhniwGtTxlu1IEfkfphBUNakKpoSzYVNSlQz9I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=U6Ncf2JggKgKIkyr1+4pmoUuBAexXFpPa8su0IgBtqE5bmFsMqQtvkxz5uUV3kcMD
	 WrB1HMoAY54ZREo1bKj3WO2Y7CNTrH+zrrW78CdAcTHz2J0Dgy684pN7cho5r6LSBW
	 kiYL2nV8WBPzSEhS2hDRa/0U39tlZnYeZ3bsEg6N0QZnyT5ry/vhrQ/P/3jUsCYVZk
	 Mk2actnKpoWgWKdamBKr/urCSuD4XEuEQReovjEcodnYDCpOOdIIWb7ZMhO9qLWquA
	 8JY3A+jakOhUg3cM+9Zv2md+UXNBnMgZSVDDTijqVj3MHnFb9wGPu26liyJfw6lwiz
	 vIoMtpo7T6N3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 13/18] riscv_cbqri: resctrl: Add MB_MIN bandwidth
 allocation via Rbwb
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-13-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-13-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:57:17 +0000
Message-Id: <20260601205717.7FDA51F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Blind assignment during reset can violate the hardware bandwidth s=
um invariant.
- [High] Memory bandwidth capacity leak upon resctrl group removal (rmdir) =
allows Denial of Service.
- [High] Unbounded `max_rmid` causes massive memory allocation failure when=
 a bandwidth controller is monitor-capable but the L3 controller is not.
- [High] Domain initialization fails unconditionally if the bandwidth contr=
oller's global capacity (MRBWB) exceeds U16_MAX.

Pre-existing issues:
- [High] Use-after-free in `cbqri_detach_cpu_from_l3_mon` due to unsafe `ca=
ncel_delayed_work`.
--

commit 2593653f0061033605146d0d48bff0500eba1f1d
Author: Drew Fustini <fustini@kernel.org>

    riscv_cbqri: resctrl: Add MB_MIN bandwidth allocation via Rbwb
   =20
    Add bandwidth allocation through Rbwb (reserved bandwidth blocks)
    exposed as the MB_MIN resource. Rbwb's sum constraint does not fit MBA's
    percentage cap, so MB_MIN lands as a new RDT_RESOURCE_* rather than
    masquerading as MBA.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index f379058b0114b..1d312004b07d9 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c
> @@ -363,6 +363,9 @@ int resctrl_arch_update_one(struct rdt_resource *r, s=
truct rdt_ctrl_domain *d,
>  	case RDT_RESOURCE_L2:
>  	case RDT_RESOURCE_L3:
>  		return cbqri_apply_cache_config_dom(dom, r, closid, t, cfg_val);
> +	case RDT_RESOURCE_MB_MIN:
> +		/* sum(Rbwb) <=3D MRBWB validation runs inside cbqri_apply_rbwb(). */
> +		return cbqri_apply_rbwb(dom->hw_ctrl, closid, cfg_val, true);

[Severity: High]
Does this code leak memory bandwidth capacity when a resctrl group is remov=
ed?

When a resctrl group is removed via rmdir, the CLOSID is freed by the core,
but no architecture hook is invoked to reset the hardware or software cache.
This means ctrl->rbwb_cache[closid] permanently retains the deleted group's
bandwidth allocation.

Later, when cbqri_apply_rbwb() is called to modify bandwidth for any active
group, it sums across all ctrl->rcid_count CLOSIDs, including the unallocat=
ed
ones. The stranded bandwidth from deleted groups is included in the sum,
causing new allocations to be rejected with -EINVAL.

Can an attacker with mkdir permissions repeatedly create groups, assign high
bandwidth, and remove them, to permanently starve the default group and
active processes?

[ ... ]

> @@ -422,9 +433,22 @@ u32 resctrl_arch_get_config(struct rdt_resource *r, =
struct rdt_ctrl_domain *d,
>  	return val;
>  }
> =20
> +/*
> + * RCID 0 carries the remaining MRBWB after every other RCID is seeded w=
ith
> + * the minimum Rbwb of 1. cbqri_probe_bc() rejects a bandwidth controller
> + * with mrbwb < rcid_count, so this subtraction cannot underflow.
> + */
> +static u64 cbqri_rcid0_rbwb(struct cbqri_controller *ctrl)
> +{
> +	if (WARN_ON_ONCE(ctrl->bc.mrbwb < ctrl->rcid_count))
> +		return 1;
> +	return ctrl->bc.mrbwb - (ctrl->rcid_count - 1);
> +}

[Severity: High]
Does this calculation cause unconditional initialization failure on systems
where MRBWB exceeds U16_MAX?

The maximum reserved bandwidth blocks (mrbwb) is a 32-bit field in hardware
capabilities, but cbqri_apply_rbwb() enforces a strict hardware limitation
of 16 bits per RCID (rejecting values > U16_MAX).

If the global mrbwb exceeds 65535, this function returns a value exceeding
U16_MAX, causing cbqri_apply_rbwb() to reject it with -EINVAL. This in turn
causes domain initialization to fail, preventing CPUs from coming online
with resctrl.

[ ... ]

> @@ -439,15 +463,41 @@ void resctrl_arch_reset_all_ctrls(struct rdt_resour=
ce *r)
>  		return;
> =20
>  	list_for_each_entry(d, &r->ctrl_domains, hdr.list) {
> -		for (i =3D 0; i < hw_res->ctrl->rcid_count; i++) {
> -			for (t =3D 0; t < CDP_NUM_TYPES; t++) {
> +		dom =3D container_of(d, struct cbqri_resctrl_dom,
> +				   resctrl_ctrl_dom);
> +
> +		switch (r->rid) {
> +		case RDT_RESOURCE_MB_MIN:
> +			/*
> +			 * CBQRI section 4.5: Rbwb >=3D 1, sum(Rbwb) <=3D MRBWB.
> +			 * Walk N-1..1 first so RCID 0 lands last with the
> +			 * remaining budget.
> +			 */
> +			for (i =3D 0; i < hw_res->ctrl->rcid_count; i++) {
> +				u32 rcid =3D (i + 1) % hw_res->ctrl->rcid_count;
> +				u64 rbwb =3D (rcid =3D=3D 0) ?
> +					cbqri_rcid0_rbwb(dom->hw_ctrl) : 1;
>  				int rerr;
> =20
> -				rerr =3D resctrl_arch_update_one(r, d, i, t, default_ctrl);
> +				rerr =3D cbqri_apply_rbwb(dom->hw_ctrl, rcid, rbwb, false);
>  				if (rerr)
> -					pr_err_ratelimited("rid=3D%d reset RCID %u type %u failed (%d)\n",
> -							   r->rid, i, t, rerr);
> +					pr_err_ratelimited("RBWB reset RCID %u failed (%d)\n",
> +							   rcid, rerr);

[Severity: High]
Does this error handling violate the hardware bandwidth sum invariant?

If cbqri_apply_rbwb() fails for any RCID (such as an MMIO error), it logs
the error but continues the loop, leaving that RCID at its previous
(potentially large) bandwidth.

When it later blindly writes MRBWB - (N-1) to RCID 0 with check_sum =3D fal=
se,
the total sum of all RCIDs in the hardware will exceed the hardware's MRBWB
capacity. Could this violate the CBQRI invariant and potentially lock up the
controller?

[ ... ]

> @@ -590,6 +665,31 @@ static int cbqri_resctrl_control_init(struct cbqri_r=
esctrl_res *cbqri_res)
>  			res->mon_capable =3D true;
>  		}
>  		break;
> +
> +	case RDT_RESOURCE_MB_MIN:
> +		res->name =3D "MB_MIN";
> +		res->schema_fmt =3D RESCTRL_SCHEMA_RANGE;
> +		/*
> +		 * resctrl requires a cache scope for MBA-style domains.
> +		 * Use L3 as a proxy until the resctrl supports non-cache
> +		 * scopes for bandwidth resources.
> +		 */
> +		res->ctrl_scope =3D RESCTRL_L3_CACHE;
> +		/* Rbwb is an integer block count, not a percentage. No MBA delay_line=
ar. */
> +		res->membw.throttle_mode =3D THREAD_THROTTLE_UNDEFINED;
> +		res->membw.min_bw =3D 1;
> +		res->membw.max_bw =3D ctrl->bc.mrbwb;

[Severity: High]
Does setting max_bw to ctrl->bc.mrbwb expose an unclamped 32-bit maximum
bandwidth to userspace?

If ctrl->bc.mrbwb exceeds U16_MAX, exposing this value to userspace allows
requests that bypass core validation but will ultimately fail at the hardwa=
re
layer in cbqri_apply_rbwb().

> +		res->membw.bw_gran =3D 1;
> +		/*
> +		 * CBQRI section 4.5 caps sum(Rbwb) <=3D MRBWB. Default new
> +		 * groups to min_bw so mkdir cannot overflow that sum.
> +		 */
> +		res->membw.default_to_min =3D true;
> +		res->alloc_capable =3D ctrl->alloc_capable;
> +		INIT_LIST_HEAD(&res->ctrl_domains);
> +		INIT_LIST_HEAD(&res->mon_domains);

[Severity: High]
Does enabling MB_MIN cause massive memory allocation failures due to an
unbounded max_rmid?

In cbqri_resctrl_accumulate_caps(), exposed_mon_capable is set to true if
any hardware controller has mon_capable =3D=3D true, which now includes the
bandwidth controller backing MB_MIN.

However, max_rmid is conditionally bounded only by the L3 capacity
controller. If the system has a monitor-capable bandwidth controller but no
monitor-capable L3 capacity controller, max_rmid remains U32_MAX.

Later, resctrl_init() invokes rmid_init(), which attempts to allocate
structures for U32_MAX RMIDs. This will fail with -ENOMEM and completely
abort resctrl initialization.

[ ... ]

> @@ -893,14 +1054,24 @@ static int cbqri_attach_cpu_to_all_ctrls(unsigned =
int cpu)
>  	lockdep_assert_held(&cbqri_domain_list_lock);
> =20
>  	list_for_each_entry(ctrl, &cbqri_controllers, list) {
> -		if (ctrl->type !=3D CBQRI_CONTROLLER_TYPE_CAPACITY)
> -			continue;
> -		if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> -			continue;
> -		if (!ctrl->alloc_capable)
> +		switch (ctrl->type) {
> +		case CBQRI_CONTROLLER_TYPE_CAPACITY:
> +			if (!cpumask_test_cpu(cpu, &ctrl->cache.cpu_mask))
> +				continue;
> +			if (!ctrl->alloc_capable)
> +				continue;
> +			err =3D cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> +			break;
> +		case CBQRI_CONTROLLER_TYPE_BANDWIDTH:
> +			if (!cpumask_test_cpu(cpu, &ctrl->mem.cpu_mask))
> +				continue;
> +			if (!ctrl->alloc_capable)
> +				continue;
> +			err =3D cbqri_attach_cpu_to_bw_ctrl(ctrl, cpu);
> +			break;
> +		default:
>  			continue;
> -
> -		err =3D cbqri_attach_cpu_to_cap_ctrl(ctrl, cpu);
> +		}
>  		if (err) {
>  			cbqri_detach_cpu_from_all_ctrls(cpu);

[Severity: High]
This is a pre-existing issue, but does cbqri_detach_cpu_from_l3_mon() have a
use-after-free bug due to an unsafe cancel_delayed_work()?

If cbqri_detach_cpu_from_all_ctrls() eventually calls into
cbqri_detach_cpu_from_l3_mon():

drivers/resctrl/cbqri_resctrl.c:cbqri_detach_cpu_from_l3_mon() {
    ...
            cancel_delayed_work(&mon_dom->cqm_limbo);
            ...
            kfree(mon_dom);
    ...
}

The CPU offline callback runs under cpus_write_lock(). If the worker has
already dequeued from the workqueue but is preempted right before acquiring
cpus_read_lock(), cancel_delayed_work() returns false and does not wait.

The callback then proceeds to kfree(mon_dom). When the hotplug callback
finishes and releases the write lock, the worker acquires the read lock and
dereferences the freed mon_dom pointer, resulting in a use-after-free.

>  			break;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D13
