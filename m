Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794122790;
	b=grqCwr4gKpFKmiU2SYyU6sIszix383Sshw3NRcmC9zj3q5IF59gEqpnGrIzpXWXgvkSn
	 D8iH3UpiHO7ILpTnB/asfFO+DpGtVcADZP1cgS2a27lHoc6vc/A4rlXVJnYYi0BA4u7xL
	 C7HHj0KQTsa5Dz8BK16L/VXPbzQeoLor/+9f60QRI1eCU4sNhdwwCk3zJ+O1ZjqyGVPG0
	 mUq+Ai7Ny5j2a6QwWCFPBinCnHskdk/jz5YGmVSrCcF8Nv6+bm5pDRP2f/vIxGC+qjxvO
	 N/RrCNo1SpY/ZmT0X/h+Ssw58ezoZxCVQ+2UnsTeU0DTWAjaobSLR4b8ikeqmtDFmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794122790;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q+FhEVnh9nJXmILawYsoL2w3vAYxzbDAZ6wcjLb1LnY=;
	b=xOo0mz+iDx+QipWJxlU3ZqG3AWNNxnEXYxwv9DuHsNRAiU4HRPcPR38Q36o55jis1Vav
	 bXK94D9f6LHX1MxCb++7bLwyRCj+w7cRw1cUxKwT+hA7OaiGq1PenA3z2b2hFtZDbnS+5
	 vRCcXWRVjkZ5GpstpaFAzgcSfVB5DTTOFMhF0yETb39bXXXTeQJ7xynSDZsbFIF3I6s2h
	 q2ECNd1Q6xvETEBedZLqzvJHHc+skTaCF7YjSTuPL3rq/0PnRbRa622hv/N4HLGSNTpXA
	 Qy1Fqpm9B4ucaDN5YfAJYLYa8ciwj1QZSnNyQou+YDU78yrAFyGtRE/PSJihjzBuD9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoOt4w46;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D62606A31C
	for <devicetree@vger.kernel.org>; Sun,  8 Nov 2026 07:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SoOt4w46
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42A0A1F0089F;
	Sun,  8 Nov 2026 07:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794122789;
	bh=q+FhEVnh9nJXmILawYsoL2w3vAYxzbDAZ6wcjLb1LnY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SoOt4w46EAMG8pI4YsJTHwfWO6Ky0uVhJ03dcmwikOOaZEfpR+c/p1GKnLWHsd0Gj
	 W5vUiJMhdhl63jYqamh3+nZUjxWC33P38VkQQ1ST6Rar2JCpQbNQczqCraMCHPmen5
	 APext606goGdHuWFF1rqMQQ0q+AJfpA2lVAyVSouQhdKpLtQx9VGoBaqzbHkvoK2d1
	 vRDkT2iI4rllnf98pOoOiArQE56uY+f+WL5IAhDkR5UgM4XpKR/Gh37iuhlAkmgp0E
	 WQcw6uYmkud7vTq8oBpyCG92EFmO0WOtn6Flo7aZLZ0bBYUYWkm9qrIYJ1Yhd3Wi53
	 Cefnkck1IPvsw==
Message-ID: <sashiko-outbox-203619@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v16 04/16] accel/rocket: let the core suspend after a
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261108065917.135194-5-gahing@gahingwoo.com>
References: <20261108065917.135194-1-gahing@gahingwoo.com>
 <20261108065917.135194-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 07:26:28 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] accel/rocket: asynchronous autosuspend in rocket_reset() skips
  domain reset
- [Medium] accel/rocket: rocket_core_reset() runs without PM ref if job
  IRQ races
--

commit aed4735942793150a3547c69cb7317b3ba01d633
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: let the core suspend after a reset

This commit replaces pm_runtime_put_noidle() with
pm_runtime_put_autosuspend() in rocket_reset() and moves the release after
rocket_core_reset() so the NPU stays powered during reset and can suspend
afterward.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.c=
om/

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index abef12b86d481..4a577b642849d 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -395,6 +395,8 @@ static void rocket_job_handle_irq(struct rocket_core =
*core)
>  static void
>  rocket_reset(struct rocket_core *core, struct drm_sched_job *bad)
>  {
> +	bool put_job_ref;
> +
>  	if (!atomic_read(&core->reset.pending))
>  		return;
> =20
> @@ -413,11 +415,10 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
>  	/*
>  	 * Remaining interrupts have been handled, but we might still have
>  	 * stuck jobs. Let's make sure the PM counters stay balanced by
> -	 * manually calling pm_runtime_put_noidle().
> +	 * dropping the job's reference once the core has been reset.
>  	 */
>  	scoped_guard(mutex, &core->job_lock) {
> -		if (core->in_flight_job)
> -			pm_runtime_put_noidle(core->dev);
> +		put_job_ref =3D core->in_flight_job;
> =20
>  		iommu_detach_group(NULL, core->iommu_group);
> =20
> @@ -427,6 +428,9 @@ rocket_reset(struct rocket_core *core, struct drm_sch=
ed_job *bad)
>  	/* Proceed with reset now. */
>  	rocket_core_reset(core);

[Severity: Medium]
As reported by Igor Paunovic on v8 [1], can rocket_core_reset() still run
without a runtime PM reference if the in-flight job completes concurrently
with the timeout?

kworker                           <irq/thread>
rocket_reset()
  drm_sched_stop()
  lock(&core->job_lock)
  pm_runtime_get_if_active()
  ...
  pm_runtime_put_autosuspend()
  unlock(&core->job_lock)
  synchronize_irq(core->irq)
                                  rocket_job_handle_irq()
                                    lock(&core->job_lock)
                                    pm_runtime_put_autosuspend(core->dev)
                                    core->in_flight_job =3D NULL
                                    unlock(&core->job_lock)
  lock(&core->job_lock)
  put_job_ref =3D core->in_flight_job (NULL)
  unlock(&core->job_lock)
  rocket_core_reset(core)  <-- no runtime PM reference held

Because rocket_job_handle_irq() already dropped the job's runtime PM
reference and rocket_reset() dropped its temporary reference before
synchronize_irq(), core->dev has usage_count =3D=3D 0 during
rocket_core_reset().  If the autosuspend timer expires before
rocket_core_reset() finishes, the NPU core is reset while unpowered, which
hangs the board.

> =20
> +	if (put_job_ref)
> +		pm_runtime_put_autosuspend(core->dev);
> +
>  	/* NPU has been reset, we can clear the reset pending bit. */
>  	atomic_set(&core->reset.pending, 0);

[Severity: High]
Does pm_runtime_put_autosuspend() actually power-cycle the domain when
another job is already queued or submitted right after the reset?

rocket_core_init() enables autosuspend with a 50 ms delay:

drivers/accel/rocket/rocket_core.c:rocket_core_init() {
	...
	pm_runtime_use_autosuspend(dev);
	...
	pm_runtime_set_autosuspend_delay(dev, 50);
}

pm_runtime_put_autosuspend() only arms the 50 ms timer and leaves
core->dev in RPM_ACTIVE, after which rocket_reset() immediately calls
drm_sched_start(&core->sched, 0).  Any job already queued in the scheduler
or submitted within the next 50 ms calls pm_runtime_resume_and_get() in
rocket_job_run(), sees the device still active, and cancels the timer
without ever calling rocket_device_runtime_suspend().  On RK3576, the
power domain is never switched off and back on, leaving the NPU bus
interface and IOMMU wedged for subsequent jobs.

[1] https://lore.kernel.org/r/CAEWPSH7tM9WQUJ0H13ghkiHGzDcdycC1syTuO5B8DpC6=
cUSnfg@mail.gmail.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261108065917.1351=
94-1-gahing@gahingwoo.com?part=3D4
