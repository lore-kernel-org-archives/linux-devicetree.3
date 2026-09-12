Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE793BE175
	for <devicetree@vger.kernel.org>; Sat, 12 Sep 2026 07:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789196953; cv=none; b=nLKP7G1YAxLBNZkstSrGfMUpBrnZZjrDTHE+ADHlw2IyWCIqF2dzDZsIIqUUc7uAgEGm2OxaHtpgBQ4ECb4prEzp3y5Numc4A1/pLSlUSlBE9LLIWvnoSeT+2X3le8BaTivZc6Xp9DbSBvv3m4roPPs1l+PQDsKtJTyyLPR4WbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789196953; c=relaxed/simple;
	bh=T1eZJr6R3S1YdLObsmsgfsmB+gEz/SBMCxf0cMNyK74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BUzOya7ll8bwQ72WpjArfIiUuzVLWQi+1fXYxOco007cWzYqa10Mq+zsUAFwkWwDXgfEVqaxav9jO4yqNUmR+A9e7YPFUFWFMJicW1Mu535s3YfAQGvjnKMZNPr4UGqXf8EF/3zwNaXnSSGSEZICJZCxXb6gJMED+/u+wugjPt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILtnHbDb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILtnHbDb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B179B1F000FF;
	Sat, 12 Sep 2026 07:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789196952;
	bh=zl0iqCS8nhqYlcJGKx7KMg90qGu1Mxf6CtfB0KoaZmA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ILtnHbDbJ8asMo1iz9muGlMAnvZe4kMb57LWjMBfJVZ5WodAXQLbnVhRuKr72M4J+
	 nRSNdAqffNnb6vz7lk1or2wc4wh+FEalb0WjDGyxKQ7SaexV9b75mKGGqSbu+b9Smq
	 S7W54Cob35b91Rq36zEaMjggSLGbvDjxtw2Utyc6yKq47gIWJMSTRpN/vdCH9oLFOx
	 4XB0UlqRny3BnFFcx1hCpkoPsDMM9bB7z4i37hPRKubgFgAe7LCv2ljQLhDaxkYDAP
	 XaVwB6WBN4+msFcsVWS2U6XxcHRFAdFJLibg5N/e2EMEp2CN/Gw5ib+7Y/sxtRvkSI
	 IqZyhQ7SqfBpg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 03/14] accel/rocket: wait for a running IRQ handler
 before resetting a core
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: conor+dt@kernel.org, robh@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260912065053.1519165-4-gahing@gahingwoo.com>
References: <20260912065053.1519165-1-gahing@gahingwoo.com>
 <20260912065053.1519165-4-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 12 Sep 2026 07:09:11 +0000
Message-Id: <20260912070911.B179B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardirq handler reads hardware registers on a potentially suspende=
d device without checking if it is active.
- [High] Missing `synchronize_irq()` in runtime suspend callback allows pow=
ering down hardware while an IRQ handler is mid-flight.
- [High] The threaded IRQ handler accesses hardware registers without verif=
ying the device is awake.
- [High] Leaking an `iommu_group` reference upon job completion.
- [High] Calling `drm_sched_fini()` on the error path of a failed `drm_sche=
d_init()` causes a NULL pointer dereference.
--

commit f451c258aa3279d254b112c34e76371c476fb507
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: wait for a running IRQ handler before resetting a core

rocket_reset() calls drm_sched_stop(), which stops the scheduler and
returns. It does not wait for a threaded handler that is already running,
so the comment that follows, "Remaining interrupts have been handled",
states an assumption rather than something the code arranges.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.c=
om/
Link: https://lore.kernel.org/all/CAEWPSH5mxTbUkNouxm6yecMZYvDowquhvYvhaXQ8=
HoMtHD5U1g@mail.gmail.com/

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 575945015ca3b..0be8db391989b 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c

[ ... ]

drivers/accel/rocket/rocket_job.c:rocket_job_irq_handler() {
	struct rocket_core *core =3D data;
	u32 raw_status =3D rocket_pc_readl(core, INTERRUPT_RAW_STATUS);

[Severity: High]
This is a pre-existing issue, but does this unconditional register read
crash the system if the device is suspended when the shared interrupt fires?

The driver registers its hardware IRQ with IRQF_SHARED (shared with the
IOMMU). If the shared interrupt fires while the rocket device is
runtime-suspended, rocket_job_irq_handler() immediately executes
rocket_pc_readl() without checking if it is active. Accessing registers
while the device's clocks are disabled triggers an SError kernel panic.

drivers/accel/rocket/rocket_drv.c:rocket_device_runtime_suspend() {
	...
	clk_bulk_disable_unprepare(ARRAY_SIZE(rdev->cores[core].clks),
				   rdev->cores[core].clks);

	return 0;
}

[Severity: High]
This is a pre-existing issue, but does missing synchronize_irq() allow
powering down hardware while an IRQ handler is mid-flight?

The rocket_device_runtime_suspend() callback disables clocks via
clk_bulk_disable_unprepare() without prior synchronization of the shared IRQ
line. If an interrupt fires just before this callback, the handler may run
concurrently with the suspend sequence, disabling hardware clocks while the
IRQ handler is still executing, leading to SError kernel panics.

drivers/accel/rocket/rocket_job.c:rocket_job_handle_irq() {
	pm_runtime_mark_last_busy(core->dev);

	scoped_guard(mutex, &core->job_lock) {
		/*
		 * Stopping the block belongs under the lock. hw_submit() writes
		 * OPERATION_ENABLE too, and outside the lock this zero can land
		 * after that one and stop a task that has only just started.
		 */
		rocket_pc_writel(core, OPERATION_ENABLE, 0x0);
		rocket_pc_writel(core, INTERRUPT_CLEAR, 0x1ffff);

[Severity: High]
This is a pre-existing issue, but does the threaded IRQ handler access
hardware registers without verifying the device is awake?

If the threaded handler is awakened (e.g., if the hardirq reads 0xffffffff
from powered-off hardware, which evaluates as true for DPU interrupt bits),
it unconditionally writes to OPERATION_ENABLE and INTERRUPT_CLEAR. Since it
does not call pm_runtime_get_if_active(), these writes will cause an SError
if the device is suspended.

drivers/accel/rocket/rocket_job.c:rocket_job_handle_irq() {
			...
			iommu_detach_group(NULL, iommu_group_get(core->dev));

[Severity: High]
This is a pre-existing issue, but does this leak an iommu_group reference
upon job completion?

iommu_group_get() increments the reference count of the group, but
iommu_detach_group() does not consume it. Since there is no corresponding
iommu_group_put() called, this causes a persistent kobject refcount leak
that eventually overflows.

drivers/accel/rocket/rocket_job.c:rocket_job_init() {
	...
err_sched:
	drm_sched_fini(&core->sched);

	destroy_workqueue(core->reset.wq);
	return ret;
}

[Severity: High]
This is a pre-existing issue, but does calling drm_sched_fini() on the error
path of a failed drm_sched_init() cause a NULL pointer dereference?

If drm_sched_init() fails, it cleans up internally, leaving sched->sched_rq
as NULL but sched->num_rqs > 0. The driver's err_sched path unconditionally
calls drm_sched_fini(), which iterates up to num_rqs and attempts to kfree
sched->sched_rq[i], dereferencing the NULL sched_rq pointer array.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260912065053.1519=
165-1-gahing@gahingwoo.com?part=3D3
