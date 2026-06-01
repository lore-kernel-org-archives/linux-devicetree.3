Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD76387590
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 20:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347519; cv=none; b=mDZ/hVUOz2tRNUHuPD7QTHV5HQKBIlUt6QiEGOQFc/cuKY5BLJ0CjN06Lf4+gRzBrtsABIxWuaU0pc8jxh/GvhQ41Q6PHmDoT25YZKO6K5zgKNZ8yEx/85OZvcdyevWCpofh/HTKYMRyQZX+PLepkTITenaaqTgHycG9rg2zxYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347519; c=relaxed/simple;
	bh=wXaKrxsGrMdEcw8lpaAFE2h9yUmpt94DXQsyo78jjww=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CczAoBk1rXq6weg3APgFWmsqR15LzAZ7DwIRf+Hfzhyu8nw5ujhFBYUxj89vRXEdgL8tt5cZlnxT7GdBamLAq13Bl1/IgcosxfIogN6m58Lrvy3zP+SxqkvNgS3BBY8ETna4tDEtI1od7+k62+zX+ICfHcY4LupSbvoENlQvXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDpIo0ra; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iDpIo0ra"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AC91F00893;
	Mon,  1 Jun 2026 20:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347518;
	bh=IYDRNnuROLOtVYAoatCkT4iZkFN9NGyijQWjPkqP9Rc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iDpIo0ra0Ro7xuGLZPn0ILkxA/9DgMPgzfSKsxJ/evkJMSMfy+oauVf34MDQXyvg+
	 xYgUzkJz5Xor/cznJgzk3e0ucFISJsq02TkbghggEUOMv82HbOZeUkVgdaRckxiLkX
	 uGrV/emnPPssN6fbgyE6Fqa4UnrE0n/ShDSyOmhsOnMGy1Qd2mVxz91cxTCkObw3FT
	 WlntYomb+eIVaXgYobzlzFHlYhCyhGPRcQviNHa5anybtRU2YRo5hC1FMYHAuEG0EO
	 zbJmAhxF5u8WWDKYx8m7PavLF+nv/7PyTbh0NUjf7obTcko5Ey4qizadVxp6+t7l3/
	 3eu0ur/FG3Z5Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 12/18] riscv_cbqri: resctrl: Add L3 cache
 occupancy monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-12-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-12-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 20:58:37 +0000
Message-Id: <20260601205837.C1AC91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Non-sync cancellation of `cqm_limbo` and `mbm_over` delayed work d=
uring CPU offline and error paths leads to a use-after-free of the `rdt_l3_=
mon_domain` structure.
- [High] AB-BA deadlock between `cbqri_domain_list_lock` and `rdtgroup_mute=
x` during concurrent CPU hotplug operations and RMID reads.
- [High] Self-deadlock on `cbqri_domain_list_lock` during CPU offline domai=
n teardown when flushing limbo RMIDs.
- [High] `max_rmid` remains at its uninitialized `U32_MAX` value if an L2 c=
apacity controller is `mon_capable`, leading to a massive OOM allocation du=
ring filesystem mount.
- [Medium] Userspace reads of LLC occupancy will fail with `-EIO` when targ=
eting `nohz_full` CPUs due to incorrectly registering the event with `any_c=
pu =3D false`.
--

commit e556b965bbc51629bbf2d48c342592c000877b63
Author: Drew Fustini <fustini@kernel.org>
Subject: riscv_cbqri: resctrl: Add L3 cache occupancy monitoring

Expose QOS_L3_OCCUP_EVENT_ID so userspace can read per-MCID
llc_occupancy. The result is converted from capacity blocks to bytes
using cache_size and ncblks. Each MCID is armed once with the Occupancy
event by cbqri_init_mon_counters() and free runs thereafter.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c

[ ... ]

> @@ -181,6 +181,89 @@ void resctrl_arch_mon_event_config_write(void *info)
> +int resctrl_arch_rmid_read(struct rdt_resource *r, struct rdt_domain_hdr=
 *hdr,
> +			   u32 closid, u32 rmid, enum resctrl_event_id eventid,
> +			   void *arch_priv, u64 *val, void *arch_mon_ctx)
> +{
[ ... ]
> +	if (irqs_disabled())
> +		return -EIO;
> +
> +	/*
> +	 * cbqri_domain_list_lock serialises the list walk against
> +	 * cbqri_detach_cpu_from_ctrl_domains().
> +	 */
> +	mutex_lock(&cbqri_domain_list_lock);

[Severity: High]
During CPU hotplug, cbqri_resctrl_online_cpu() acquires
cbqri_domain_list_lock and eventually calls resctrl_online_mon_domain()
which acquires the core framework rdtgroup_mutex.

However, when reading monitoring data, the core framework acquires
rdtgroup_mutex and then invokes resctrl_arch_rmid_read() which acquires
cbqri_domain_list_lock here.

Does this establish an AB-BA lock inversion between cbqri_domain_list_lock
and rdtgroup_mutex?

[Severity: High]
Additionally, when a CPU goes offline, cbqri_resctrl_offline_cpu() acquires
cbqri_domain_list_lock before initiating domain teardown.

If the domain is torn down, the resctrl core flushes busy RMIDs by calling
__check_limbo(), which invokes this resctrl_arch_rmid_read() hook.

Since this hook unconditionally attempts to acquire cbqri_domain_list_lock,
does this cause a self-deadlock when offlining a CPU with active monitoring
traffic?

[ ... ]

> @@ -500,6 +582,13 @@ static int cbqri_resctrl_control_init(struct cbqri_r=
esctrl_res *cbqri_res)
[ ... ]
> +		if (ctrl->mon_capable && res->rid =3D=3D RDT_RESOURCE_L3) {
> +			res->mon_scope =3D RESCTRL_L3_CACHE;
> +			resctrl_enable_mon_event(QOS_L3_OCCUP_EVENT_ID,
> +						 false, 0, NULL);
> +			res->mon_capable =3D true;
> +		}

[Severity: Medium]
The L3 occupancy event is registered with any_cpu set to false. This
requires the core to read the event from a specific CPU using
smp_call_function_any().

If that CPU is configured as nohz_full, the read executes in an IPI context
with interrupts disabled. Since resctrl_arch_rmid_read() correctly returns
-EIO when irqs_disabled(), will userspace reads fail on nohz_full CPUs?

Could any_cpu be true here to avoid cross-CPU IPIs, since the MMIO reads
can be safely executed from any CPU?

[ ... ]

> @@ -510,6 +599,7 @@ static int cbqri_resctrl_control_init(struct cbqri_re=
sctrl_res *cbqri_res)
[ ... ]
> +	l3_ctrl =3D cbqri_resctrl_resources[RDT_RESOURCE_L3].ctrl;
> +	if (l3_ctrl && l3_ctrl->mon_capable)
> +		max_rmid =3D min(max_rmid, l3_ctrl->mcid_count);
> +
> +	if (!exposed_mon_capable) {
> +		max_rmid =3D 1;
> +		return;
>  	}

[Severity: High]
If the hardware has an L2 monitoring controller but no L3 monitoring,
exposed_mon_capable becomes true but max_rmid is never narrowed from its
initial U32_MAX value.

When the core framework mounts the filesystem, it will query
resctrl_arch_system_num_rmid_idx() which returns max_rmid. Will this
cause an immediate OOM panic when it attempts to allocate
U32_MAX * sizeof(struct rmid_entry)?

[ ... ]

> @@ -560,13 +673,89 @@ static struct rdt_ctrl_domain *cbqri_create_ctrl_do=
main(struct cbqri_controller
[ ... ]
> +err_offline:
> +	/*
> +	 * cancel_delayed_work avoids deadlocking against the cqm_limbo
> +	 * worker which takes cpus_read_lock while this hotplug callback
> +	 * already holds cpus_write_lock. mbm_over is only
> +	 * INIT_DELAYED_WORK'd when MBM_TOTAL was enabled, so gate the
> +	 * cancel on the same condition to avoid touching a zeroed work
> +	 * struct.
> +	 */
> +	cancel_delayed_work(&mon_dom->cqm_limbo);
> +	if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +		cancel_delayed_work(&mon_dom->mbm_over);
> +	resctrl_offline_mon_domain(res, &mon_dom->hdr);
> +err_listdel:
> +	list_del(&mon_dom->hdr.list);
> +err_free:
> +	kfree(mon_dom);
> +	return err;
> +}

[Severity: High]
If a worker thread is currently executing but blocked waiting for
cpus_read_lock(), cancel_delayed_work() will return immediately because
the work is no longer pending in the queue.

After the hotplug thread drops cpus_write_lock(), the worker could unblock
and continue executing, accessing the mon_dom structure after it was freed.
Does this create a use-after-free window?

[ ... ]

> +static void cbqri_detach_cpu_from_l3_mon(struct rdt_resource *res,
> +					 unsigned int cpu)
> +{
[ ... ]
> +			cancel_delayed_work(&mon_dom->cqm_limbo);
> +			if (resctrl_is_mon_event_enabled(QOS_L3_MBM_TOTAL_EVENT_ID))
> +				cancel_delayed_work(&mon_dom->mbm_over);
> +			resctrl_offline_mon_domain(res, &mon_dom->hdr);
> +			list_del(&mon_dom->hdr.list);
> +			kfree(mon_dom);
> +		}
> +	}
>  }

[Severity: High]
Similarly here, if a worker thread is already executing and waiting on
cpus_read_lock(), cancel_delayed_work() won't wait for it to finish.
Will this lead to a use-after-free on mon_dom once the lock is dropped
and the worker continues?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D12
