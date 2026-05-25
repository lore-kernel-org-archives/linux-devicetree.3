Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB2249E5
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 01:27:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779672464; cv=none; b=iKiQ8IzuTCmvBC5XF9NITB+sNmK1rXnPAjiOp0b1zjPpK0x1ECtnFnCnz0HfiHg++QKjbO28FWAN8pq3rS45Vibo95CnWIVd5MboCYVZmYqRXZ4m/GOutqFNeJf9MmhW1IyFnwEJzAs0RQ0jJHHZKUOaQ9OkpWFE7DcYPQfxreo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779672464; c=relaxed/simple;
	bh=iUhlET6ygopBuCLy2tkk+WarYv1BE3PWgs8sWPkYL9E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X5QyO/+71c2Y5deEfg+ykGmd35ejO+bjftEEPXzfJQK7iQcEUPcNK9gsc4Qu9lq8zwv4l/JtEYQ/cVPMcbqwlqZncSoyQmqhAhV0DvDw1grx+WUGWy0XDc4JSCWoiKDcj2t8NerShlPYHexCC/vsUxLnEZjQKtAov9q8Cxmawkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M9ZVjL1Q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M9ZVjL1Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7007E1F000E9;
	Mon, 25 May 2026 01:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779672463;
	bh=0GzpiMGfemvO6BYqJnS9dgR7JKw8giv8E6pKgmBEIjo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M9ZVjL1QIgWJ4rpJ0+stR7i4RJWVYIXZga5k3mVynBeWEE3/qFN4MaP0IEcUPglrY
	 RJ88qzveRxMyDuufl+dDq8kNqImmOb6L2yL5p7uOQx47CqM4o2+RHBt2q+CEmrhcBZ
	 G0qcBD0okIjbszQP+OC2prGpP+I4r68W8wtnP8Iw+Bn7F91Zq98VrgzNFWSt+blaIx
	 xppSU1ObVyfanwIhkKAQltRSwOiAtVASTrqlLcrLLc1bjdJ9QJko3ozCRr4eg+bvNy
	 u7pVF7WS6CZ6gNUpWqjpV1cU1GI7pfbDOuE5HmZK5ZwbUbKoMTDNuRVNCFNMg001rS
	 0pVDSw66Tak6w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v5 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-15-78d3a7ba9dbe@kernel.org>
References: <20260524-ssqosid-cbqri-rqsc-v7-0-v5-15-78d3a7ba9dbe@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 01:27:42 +0000
Message-Id: <20260525012742.7007E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Domain bringup failure and redundant allocations due to bypassed=
 topology validation.
- [Medium] System RMID capacity artificially crippled by unused Bandwidth C=
ontrollers.

Pre-existing issues:
- [Critical] Use-after-free (UAF) execution context upon cpuhp read lock re=
lease.
- [High] Out-of-bounds RMID allocations lead to -ERANGE read failures and s=
tale monitoring state.
--

commit 1063299534eebd0856c698cf6583a1b91c07b030
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add mbm_total_bytes bandwidth monitoring

Expose CBQRI bandwidth controller's combined read+write counter as
the L3 mbm_total_bytes event. A software accumulator keeps the
64-bit byte total monotonic across the 62-bit hardware counter wrap.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -305,6 +344,82 @@ int resctrl_arch_rmid_read(struct rdt_resource *r, s=
truct rdt_domain_hdr *hdr,
>  		mutex_unlock(&ctrl->lock);
>  		break;
> =20
> +	case QOS_L3_MBM_TOTAL_EVENT_ID: {
> +		struct cbqri_controller *bc;
> +
> +		/*
> +		 * The L3 monitoring domain's id is the L3 cache id. The
> +		 * matching ctrl domain's hw_dom->paired_bc was cached at
> +		 * add time to avoid walking cbqri_controllers on every read.
> +		 */
> +		d =3D cbqri_find_ctrl_domain(&r->ctrl_domains, hdr->id);
> +		if (!d) {
> +			err =3D -ENOENT;
> +			break;
> +		}
> +		hw_dom =3D container_of(d, struct cbqri_resctrl_dom, resctrl_ctrl_dom);
> +		bc =3D hw_dom->paired_bc;
> +		if (!bc) {
> +			err =3D -ENOENT;
> +			break;
> +		}
> +		if (WARN_ON_ONCE(!bc->mbm_total_states)) {
> +			err =3D -EIO;
> +			break;
> +		}
> +		if (rmid >=3D bc->mcid_count) {
> +			err =3D -ERANGE;
> +			break;
> +		}

[Severity: High]
This is a pre-existing issue, but will the core allocate out-of-bounds
RMIDs that trigger this -ERANGE error? Looking at
cbqri_resctrl_control_init(), num_rmid is bound to the local capacity
rather than the global minimum (max_rmid). Could this lead to stale
monitoring state and bypass the max_rmid-bounded reset loop?

> +
> +		mutex_lock(&bc->lock);

[ ... ]

> @@ -824,15 +948,54 @@ static int cbqri_resctrl_pick_bw_alloc(void)
>  }
> =20
>  /*
> - * Pick one controller per monitoring event.  L3 OCCUP comes from the
> - * picked L3 CC (if mon_capable).
> + * Pick one controller per monitoring event. L3 OCCUP comes from the
> + * picked L3 CC if mon_capable. MBM_TOTAL from the only mon-capable BC,
> + * but only when the system exposes exactly one L3 cache. Pairing a
> + * single BC with multiple L3 domains would overcount system bandwidth
> + * by a factor equal to the L3 domain count.
>   */
>  static void cbqri_resctrl_pick_counters(void)
>  {
>  	struct cbqri_resctrl_res *l3 =3D &cbqri_resctrl_resources[RDT_RESOURCE_=
L3];
> +	struct cbqri_controller *ctrl, *prev;
> +	unsigned int l3_count =3D 0;
> =20
>  	if (l3->ctrl && l3->ctrl->mon_capable)
>  		cbqri_resctrl_counters[QOS_L3_OCCUP_EVENT_ID] =3D l3->ctrl;
> +
> +	/* Count distinct L3 cache_ids */
> +	list_for_each_entry(ctrl, &cbqri_controllers, list) {

[ ... ]

> +		if (!seen)
> +			l3_count++;
> +	}
> +
> +	if (l3_count > 1) {
> +		pr_warn_once("multiple L3 domains (%u) detected. mbm_total_bytes disab=
led\n",
> +			     l3_count);
> +		return;
> +	}

[Severity: Medium]
When mbm_total_bytes is disabled here, will the unused Bandwidth
Controller's smaller mcid_count still artificially clamp the global
max_rmid in cbqri_resctrl_accumulate_caps()? The unused BC remains
mon_capable, which might restrict valid occupancy monitoring system-wide.

> +
> +	cbqri_resctrl_counters[QOS_L3_MBM_TOTAL_EVENT_ID] =3D
> +		cbqri_find_only_mon_bc();
>  }

[ ... ]

> @@ -948,6 +1111,26 @@ static int cbqri_attach_cpu_to_l3_mon(struct cbqri_=
controller *ctrl,
>  	else
>  		list_add_tail(&mon_dom->hdr.list, &res->mon_domains);
> =20
> +	/*
> +	 * Pair this L3 domain with the system's mon-capable BC and
> +	 * initialise the BC's per-MCID software accumulators before
> +	 * resctrl_online_mon_domain() exposes the domain to userspace.
> +	 * A concurrent sysfs read of mbm_total_bytes between online and
> +	 * BC init would otherwise pass the !bc->mbm_total_states check
> +	 * with a half-initialised pointer.
> +	 */
> +	hw_dom =3D container_of(ctrl_dom, struct cbqri_resctrl_dom, resctrl_ctr=
l_dom);
> +
> +	hw_dom->paired_bc =3D cbqri_find_only_mon_bc();
> +	if (hw_dom->paired_bc) {
> +		err =3D cbqri_init_bc_mon_counters(hw_dom->paired_bc);

[Severity: Medium]
If mbm_total_bytes was disabled in cbqri_resctrl_pick_counters() due to
multiple L3 domains, does this unconditionally allocate memory and issue
MMIO resets for an unused BC? Could an initialization failure in this unused
BC cause the entire L3 bringup to abort here?

> +		if (err) {
> +			pr_err("BC @%pa: mon init failed (%d)\n", &hw_dom->paired_bc->addr, e=
rr);
> +			hw_dom->paired_bc =3D NULL;
> +			goto err_listdel;
> +		}
> +	}
> +
>  	err =3D resctrl_online_mon_domain(res, &mon_dom->hdr);
>  	if (err)
>  		goto err_listdel;
> =20
>  	err =3D cbqri_init_mon_counters(ctrl);
>  	if (err)
>  		goto err_offline;
> =20
>  	return 0;
> =20
>  err_offline:
>  	/*
>  	 * cancel_delayed_work (not _sync) avoids deadlocking against the
>  	 * cqm_limbo worker which takes cpus_read_lock while this hotplug
>  	 * callback already holds cpus_write_lock. mbm_over is only
>  	 * INIT_DELAYED_WORK'd when MBM_TOTAL was enabled, so gate the
>  	 * cancel on the same condition to avoid touching a zeroed work
>  	 * struct.
>  	 */
>  	cancel_delayed_work(&mon_dom->cqm_limbo);
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +		cancel_delayed_work(&mon_dom->mbm_over);
>  	resctrl_offline_mon_domain(res, &mon_dom->hdr);
>  err_listdel:
>  	list_del(&mon_dom->hdr.list);
>  err_free:
>  	kfree(mon_dom);
>  	return err;
>  }

[Severity: Critical]
This is a pre-existing issue, but since this patch introduces a new trigger
instance for mbm_over, does this create a use-after-free window?

Since cancel_delayed_work() is used without _sync, if a worker is currently
stalled waiting on the cpus_read_lock, won't kfree(mon_dom) execute
synchronously here? Once the write lock is dropped, couldn't the pending
worker resume and dereference the freed memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-ssqosid-cb=
qri-rqsc-v7-0-v5-0-78d3a7ba9dbe@kernel.org?part=3D15
