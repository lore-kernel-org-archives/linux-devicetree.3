Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793522763;
	b=KISpbEFraMZZnWWqHEO4vm6QkbSLzdgeVmhgvFYtHB/oWQNTc6AYaRkAPXuK+YlR/LWT
	 PtsbEqaS65IAJcERvacGni0vd3Es//69p6M3Hd96AnpEnAkgWAl/vSPUPTVjdZnrBCDlb
	 nrf3NXvc3LzV853DADKqh1Bnm3JxBZNLv2e6C9eow060acYce/XG/q5mNHuSXlbmD3xiW
	 YXt8U8yQiNc5JlaGb9qN9Us12M4ziCpDSEpepfcygZvJopO96aeEsyUDnpauHWVywyUV+
	 +RvD8vdX/zLph8FtBNFIzUKwzr1OBXJPt0HQgf1/Z+Zx9yDHi5cXEG6Z2Itwu/+zKIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793522763;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=qtdKx141v8KBlJu41Rw7tDYEQBgZ0gP3sm2y+3yt0g4=;
	b=JFcCBoNFMyA1y5hSBOHdhvj22QfKDqDqS94Spc+RUr0dgNnj5ur4gKCevXoRa65Kj1d7
	 NxxG92lo9Bip9zyinmnw/Y1rZJnRC/catyhWSCvWQJEKm4qobgsQIRqqxK6UMUqxqjKZq
	 KcMz2EUI64RRYwm9N/uU3NZQK/BBc117pgZtayl89nhC/nk9ikuP8IBcxiaWml2NkfS14
	 sUR6iIH82HPcCgQ7Q721Rh8rTY7AKObRKJho47Z0eCBmEst3VnOdGJW6BUFq5bBKba+RC
	 db4rTjiQm7+8DEE4kDo2Zg/ae/eP6AhcTzzKJJb4xz+J9bsneIW9Mh0D7w0QzPBUvsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEFTbln5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7756606A324
	for <devicetree@vger.kernel.org>; Sun,  1 Nov 2026 08:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PEFTbln5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1138F1F000C1;
	Sun,  1 Nov 2026 08:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793522762;
	bh=qtdKx141v8KBlJu41Rw7tDYEQBgZ0gP3sm2y+3yt0g4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PEFTbln58H7hkr3oRZ3hA4gbut5usSQvg5vdnSkrFmofQ/Ea4aeor0WPDJNKyUDIr
	 DBexHuUsuFwwDKRcos2uXHwZjGwfS42MzvkoUCrVDHgm11K37FOXcus+wBP4b53EFR
	 UU9Qh4AKsdpezNOgR9XUwJXUP9lW8W4ak0yaJhqw1e5jTvrHY8nYpmbn6IXZCtAasZ
	 ajv8VELb2JlU+wICJoO7xq1Jk+VfFQK6Auv2Fo5YNZVPYwxgpRuxLVHoDBytuZopLu
	 Y1HsEMxRvsYqtC16KWQrKVDB59g3FWD9qVal746Jah/DHEQ5RyZZtKbnZhlqokYXCs
	 riagmnK2mz4Jg==
Message-ID: <sashiko-outbox-192339@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 04/15] accel/rocket: let the core suspend after a
 reset
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261101082307.151957-5-gahing@gahingwoo.com>
References: <20261101082307.151957-1-gahing@gahingwoo.com>
 <20261101082307.151957-5-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 01 Nov 2026 08:46:01 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] accel/rocket: asynchronous autosuspend in rocket_reset() skips dom=
ain reset
- [Medium] accel/rocket: pm_runtime_put_autosuspend() precedes detach and r=
eset
--

commit a40b84e5c2017a835f035c1e3114023e0444d2a9
Author: Jiaxing Hu <gahing@gahingwoo.com>

accel/rocket: let the core suspend after a reset

This commit replaces pm_runtime_put_noidle() with
pm_runtime_put_autosuspend() in rocket_reset() when dropping the
in-flight job's runtime PM reference so that the NPU core can runtime
suspend and power-cycle its domain after a timeout.

Link: https://lore.kernel.org/all/20260819073530.6087-1-royalnet026@gmail.c=
om/

> diff --git a/drivers/accel/rocket/rocket_job.c b/drivers/accel/rocket/roc=
ket_job.c
> index 5b2abf40b618c..152a9098634b9 100644
> --- a/drivers/accel/rocket/rocket_job.c
> +++ b/drivers/accel/rocket/rocket_job.c
> @@ -467,12 +467,12 @@ rocket_reset(struct rocket_core *core, struct drm_s=
ched_job *bad)
> =20
>  	/*
>  	 * No handler is running now, but we might still have stuck jobs. Let's
> -	 * make sure the PM counters stay balanced by manually calling
> -	 * pm_runtime_put_noidle().
> +	 * make sure the PM counters stay balanced by putting the reference the
> +	 * job took, and request idle while doing it so the core can suspend.
>  	 */
>  	scoped_guard(mutex, &core->job_lock) {
>  		if (core->in_flight_job)
> -			pm_runtime_put_noidle(core->dev);
> +			pm_runtime_put_autosuspend(core->dev);

[Severity: High]
As reported by Sashiko on v14 [1], can pm_runtime_put_autosuspend() skip
the required power domain cycle when another job is already queued or
submitted shortly after the reset?

In rocket_core_init(), runtime PM autosuspend is configured with a 50 ms
delay:

    pm_runtime_use_autosuspend(dev);
    ...
    pm_runtime_set_autosuspend_delay(dev, 50);

When rocket_reset() calls pm_runtime_put_autosuspend(core->dev), it marks
the device busy and schedules the autosuspend timer 50 ms in the future,
returning while core->dev is still in RPM_ACTIVE. Immediately after that,
rocket_reset() runs rocket_core_reset(core), clears core->reset.pending,
and restarts the scheduler via drm_sched_start(&core->sched, 0).

If another job is already queued in the scheduler (for example from a
multi-job submission in rocket_ioctl_submit()) or submitted within the
50 ms window, rocket_job_run() will call:

    ret =3D pm_runtime_resume_and_get(core->dev);

while core->dev is still RPM_ACTIVE, which increments usage_count and
cancels the pending autosuspend without ever suspending the device or
cycling its power domain. On RK3576, won't this leave the NPU bus
interface and IOMMU wedged for subsequent jobs?

[Severity: Medium]
Also in rocket_reset(), is it safe to call
pm_runtime_put_autosuspend(core->dev) before
iommu_detach_group(NULL, core->iommu_group) and rocket_core_reset(core)
have completed?

Unlike the normal completion path in rocket_job_handle_irq(), which
detaches the IOMMU group before dropping the runtime PM reference:

    iommu_detach_group(NULL, iommu_group_get(core->dev));
    dma_fence_signal(core->in_flight_job->done_fence);
    pm_runtime_put_autosuspend(core->dev);
    core->in_flight_job =3D NULL;

rocket_reset() drops the last runtime PM reference on core->dev before
calling iommu_detach_group() and rocket_core_reset():

    scoped_guard(mutex, &core->job_lock) {
            if (core->in_flight_job)
                    pm_runtime_put_autosuspend(core->dev);

            iommu_detach_group(NULL, core->iommu_group);

            core->in_flight_job =3D NULL;
    }

    /* Proceed with reset now. */
    rocket_core_reset(core);

If autosuspend_delay_ms is set to 0 or negative via sysfs, or if the reset
worker is preempted past the autosuspend delay, runtime suspend on pm_wq
can run rocket_device_runtime_suspend() and drop supplier references via
__rpm_put_suppliers(core->dev) concurrently with iommu_detach_group() and
rocket_core_reset(core).

Could this turn off core clocks and the power domain before
rocket_core_reset() pulses the synchronous reset lines, and race with
rk_iommu_identity_attach() in drivers/iommu/rockchip-iommu.c:

    iommu->domain =3D identity_domain;
    ...
    ret =3D pm_runtime_get_if_in_use(iommu->dev);
    WARN_ON_ONCE(ret < 0);
    if (ret > 0) {
            rk_iommu_disable(iommu);
            pm_runtime_put(iommu->dev);
    }

such that both rk_iommu_identity_attach() and rk_iommu_suspend() skip
rk_iommu_disable(iommu)?

[1] https://lore.kernel.org/r/20260924102135.92217-5-gahing@gahingwoo.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261101082307.1519=
57-1-gahing@gahingwoo.com?part=3D4
