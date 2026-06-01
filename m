Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C56F2F39B9
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 21:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780347676; cv=none; b=iVM4RH8W4Xn0LS7tPxDR/8llWaRNraN9f6rJnS4RVbccnEexfQyU0P67K9sg78Y6k4SPrm3Yg+fepsbDoGqXBxnwcsNllM1gQ9axm1Fw+oQulx73x6tDp1Os074uMAwCUf8cZxHphnykLLmjkKD1b81i6KePCSvLK7uk1ZS+ans=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780347676; c=relaxed/simple;
	bh=690IjroTSNIPEAu3ZBT8GK2cTbewF8hY05Yuyka8ik0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pS5BkUQYsbKT13T2YBytumEjHOX99PccAgJPjHCk75+k5XWl0HqXwgPWFlfrwEVGIV2tdA6R8t8SrO7xp7/dKMPqNzIi8nSx8iU+J4ZIYT4hALH9XVO2k8ke3yBklVEJsRmuZPpNAU4xDwtSI2LDmmMxnL2up4ohGLZN72UTycA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kAv9lKkJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kAv9lKkJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88F1B1F00893;
	Mon,  1 Jun 2026 21:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780347674;
	bh=VJYITo3CSg2Xe36b2ZujeENYUyrTDK0uti7pkjE5O8w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kAv9lKkJsIGIyXsshEnc6ZLgCathBdEyyEfyctWEFOn8eO5hZ+89UjyeTRNnocoPZ
	 CCXd5XtRiOyV+4X0eYVJ1OcFI3GHc+jnutAB506aJ1F5j079wF/86ouaVL94/zqKRI
	 oIIeNJFEuySiWnUdW/9edM2bMKfS1V+4HkLagwQiRMHC7rEFY/YzveAOK1dyMaG9p8
	 rI3KyCQFJ3g0v06zK941kvLKpdFVisQiTn0YVlOMTI7uCEr0wGkjwbY/QV1/9Xj+BG
	 pnytMBAucnNmvjc0I9hBFtL4DDqMHfnk3JGdKBcXUPOCu5HV2vm1UW9UTectnTVo62
	 ClXES7biHsMnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v6 15/18] riscv_cbqri: resctrl: Add mbm_total_bytes
 bandwidth monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Drew Fustini" <fustini@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-15-baf00f50028a@kernel.org>
References: <20260601-ssqosid-cbqri-rqsc-v7-0-v6-15-baf00f50028a@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 21:01:14 +0000
Message-Id: <20260601210114.88F1B1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Critical] Use-After-Free of `mon_dom` due to non-blocking `cancel_delaye=
d_work()` in error and teardown paths.
- [High] Passing `any_cpu =3D false` when enabling MBM_TOTAL breaks monitor=
 reads and RMID resets on nohz_full systems, as it forces execution into an=
 IRQ-disabled IPI context.

Pre-existing issues:
- [High] AB-BA deadlock between cbqri_domain_list_lock and rdtgroup_mutex d=
ue to conflicting lock ordering in CPU hotplug and sysfs read paths.
--

commit 92a8d87e453213af4aa7b562d1f08a7080be5807
Author: Drew Fustini <fustini@kernel.org>

riscv_cbqri: resctrl: Add mbm_total_bytes bandwidth monitoring

Expose CBQRI bandwidth controller's combined read+write counter as
the L3 mbm_total_bytes event. A software accumulator keeps the
64-bit byte total monotonic across the 62-bit hardware counter wrap.

> diff --git a/drivers/resctrl/cbqri_resctrl.c b/drivers/resctrl/cbqri_resc=
trl.c
> index 14b955eb79491..efd75d241122f 100644
> --- a/drivers/resctrl/cbqri_resctrl.c
> +++ b/drivers/resctrl/cbqri_resctrl.c
> @@ -184,17 +191,67 @@ void resctrl_arch_mon_event_config_write(void *info)
>  void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_l3_mon_d=
omain *d,
>  			     u32 unused, u32 rmid, enum resctrl_event_id eventid)
>  {
> +	struct cbqri_resctrl_dom *hw_dom;
> +	struct rdt_ctrl_domain *cd;
> +
> +	if (irqs_disabled())
> +		return;
> +
> +	mutex_lock(&cbqri_domain_list_lock);

[Severity: High]
This is a pre-existing issue, but does expanding cbqri_domain_list_lock
usage here worsen an AB-BA deadlock with rdtgroup_mutex?

A deadlock can occur during CPU hotplug and sysfs reads due to conflicting
lock ordering:

Thread A (CPU Hotplug) takes cbqri_domain_list_lock in
cbqri_resctrl_online_cpu(), then calls resctrl_online_mon_domain() via
cbqri_attach_cpu_to_l3_mon(), which blocks waiting for rdtgroup_mutex.

Thread B (Sysfs read) takes rdtgroup_mutex in rdtgroup_mondata_show(), then
delegates the read via smp_call_on_cpu() to a worker thread.

Thread C (Worker) executes resctrl_arch_rmid_read(), which blocks waiting
for cbqri_domain_list_lock.

[ ... ]

> @@ -773,6 +906,61 @@ static int cbqri_resctrl_pick_bw_alloc(void)
[ ... ]
> +static void cbqri_resctrl_pick_counters(void)
> +{
[ ... ]
> +	/*
> +	 * mbm_total_bytes is surfaced on the L3 monitoring domain, so it
> +	 * needs a mon-capable L3 cache controller as well as a single
> +	 * mon-capable bandwidth controller.
> +	 */
> +	if (l3->ctrl && l3->ctrl->mon_capable && cbqri_find_only_mon_bc())
> +		resctrl_enable_mon_event(QOS_L3_MBM_TOTAL_EVENT_ID, false, 0, NULL);

[Severity: High]
Does passing any_cpu =3D false here break monitor reads and RMID resets on
nohz_full systems?

When any_cpu is false, the resctrl core ensures the read executes on a CPU
in the target domain. If all CPUs in that domain are nohz_full,
mon_event_read() falls back from smp_call_on_cpu() (process context) to
smp_call_function_any() (IPI hardirq context with interrupts disabled).

Because drivers/resctrl/cbqri_resctrl.c checks for irqs_disabled() in both
resctrl_arch_rmid_read() and resctrl_arch_reset_rmid() and silently aborts,
monitor reads and resets will fail on nohz_full systems.

[ ... ]

> @@ -854,6 +1054,7 @@ static int cbqri_attach_cpu_to_l3_mon(struct cbqri_c=
ontroller *ctrl,
[ ... ]
>  err_offline:
>  	/*
>  	 * cancel_delayed_work avoids deadlocking against the cqm_limbo
>  	 * worker which takes cpus_read_lock while this hotplug callback
>  	 * already holds cpus_write_lock. mbm_over is only
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
Does this non-blocking cancel_delayed_work() lead to a use-after-free of
mon_dom?

In drivers/resctrl/cbqri_resctrl.c:cbqri_attach_cpu_to_l3_mon(),
resctrl_online_mon_domain() schedules the mbm_over delayed work. If hardware
initialization fails later in the function, the error path executes
cancel_delayed_work(), which is non-blocking.

If the worker thread has already woken up and is actively blocked on
cpus_read_lock() waiting for the hotplug thread to drop cpus_write_lock(),
cancel_delayed_work() will return false.

The hotplug thread will then proceed to free mon_dom and drop the lock.
Once the lock is dropped, the worker thread resumes execution and will
access the freed mon_dom.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ssqosid-cb=
qri-rqsc-v7-0-v6-0-baf00f50028a@kernel.org?part=3D15
