Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91B44908D7
	for <devicetree@vger.kernel.org>; Sat, 25 Jul 2026 05:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784955932; cv=none; b=lnzvARslMITK+FX/gsA+M7fjzwrvXyvJN2uHCJ9fhdxT9wFwg5zAlVAFBpntYbDHlBmMX7SClDRkELW5kb4maaE7nTv0LzlHU+MbrQcp1DJeW1f48iIP90LeezEuxS/AZW3mL1BUgtqq0RkUHFJ+deEJ7zThH0sBTRYNPRuNAqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784955932; c=relaxed/simple;
	bh=cthF1bJZ90U1uAzr9Mmt5PQuRel3qCWka5oafCdUfA4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IkL2xb1K+FkC/RlMiNU80hShIqXEoWEhjB/s7CvAPKnGuUhiI8Os+j6cgofawA2DAt7YMjAi91TIkmHlnpQyPATKy8Bo8QeNLit4Qz9j/Ub1EkvUOaynzmw+MXADG6CymDcnaN8rEWYuXGc9/AFujdmaGnY3pgwV8Be8M4p8TVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+CsFBSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+CsFBSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FEEF1F000E9;
	Sat, 25 Jul 2026 05:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784955930;
	bh=GXJnhZf3O9BDdmnRyZyAEoVbDcvDgbstiYUjYyIK5V4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E+CsFBSPMJUxvNByeRBAHS33GnTsSf2C8eLSoiFRKe2mweYmEpgWemNj2+j3PWou0
	 ExN97AD+wq2Nv7x/NN2EBfzGMWMVjIb5KTCgxirVqS3A2LVCqW0N2gpW/tWCNsveGF
	 rPB9REUErKa7P0TzrdRJLULNeAn1es8o3b2HVyj2aF+T1eZM1j7mOPFEJaIOH6ys1a
	 SUbEEquphRSAO/kdkI/qHxF1MR53g5zoO3J1B+QrJKLePkWPZh3Q9PTJQVAFcsJvAW
	 tnfNaCjHRP+7eK3kz6uDlGhEgh0b7HZg+N2jdKchJ32VfDdrkREWbN7ZYrX6AMOL42
	 0g/vQ0I1mdzYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RESEND 11/17] drm/spacemit: add Saturn DPU DRM device
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Cody Kang" <codykang.hk@gmail.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, neil.armstrong@linaro.org, olteanv@gmail.com, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260725-k3-display-v1-11-6de34d80e86c@gmail.com>
References: <20260725-k3-display-v1-0-6de34d80e86c@gmail.com>
 <20260725-k3-display-v1-11-6de34d80e86c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 25 Jul 2026 05:05:29 +0000
Message-Id: <20260725050530.3FEEF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Stalling the atomic commit pipeline by calling wait_for_flip_done(=
) before commit_hw_done()
- [High] Sleeping functions (usleep_range) called from atomic context in CR=
TC enable/disable
- [High] Sleeping function called from atomic context in plane update due t=
o missing prepare_fb
--

--- Patch [11]: [PATCH RESEND 11/17] drm/spacemit: add Saturn DPU DRM devic=
e driver ---
commit db43bd6ae677a859cea76ccf2390ca3d109d0fe0
Author: Cody Kang <codykang.hk@gmail.com>

drm/spacemit: add Saturn DPU DRM device driver

Add the DRM device for the SpacemiT K3 Saturn display processing unit
and hook the driver up to the build. The SoC has two DPU instances;
each drives one CRTC that scans out a single primary plane in linear
RGB at up to 3840x2160@60 and feeds a downstream DP/eDP controller
over an OF-graph endpoint. Buffers use drm_gem_shmem_helper. The
AFBC/compressed decode path is not exposed and writeback is not
implemented.

[ ... ]

> diff --git a/drivers/gpu/drm/spacemit/spacemit_drm.c b/drivers/gpu/drm/sp=
acemit/spacemit_drm.c
> new file mode 100644
> index 0000000000000..9fb6a7661b484
> --- /dev/null
> +++ b/drivers/gpu/drm/spacemit/spacemit_drm.c
> @@ -0,0 +1,132 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025-2026 SpacemiT Co., Ltd.
> + *
> + */

[ ... ]

> +static void spacemit_drm_atomic_commit_tail(struct drm_atomic_commit *ol=
d_state)
> +{
> +	struct drm_device *dev =3D old_state->dev;
> +
> +	drm_atomic_helper_commit_modeset_disables(dev, old_state);
> +
> +	drm_atomic_helper_commit_modeset_enables(dev, old_state);
> +
> +	drm_atomic_helper_commit_planes(dev, old_state,
> +					DRM_PLANE_COMMIT_ACTIVE_ONLY);
> +
> +	drm_atomic_helper_wait_for_flip_done(dev, old_state);
> +
> +	drm_atomic_helper_commit_hw_done(old_state);

[Severity: High]
Does calling drm_atomic_helper_wait_for_flip_done() before
drm_atomic_helper_commit_hw_done() stall the commit pipeline?

drm_atomic_helper_commit_hw_done() signals that the driver has finished
programming the hardware, which unblocks subsequent non-blocking atomic com=
mits.

Waiting for the VBLANK page flip to complete before signaling hw_done blocks
all subsequent commits, artificially serializing the commit pipeline and
defeating the non-blocking design of atomic KMS.

Could this lead to UI stutter and performance regressions?

> +
> +	drm_atomic_helper_cleanup_planes(dev, old_state);
> +}

I also noticed a few additional regressions in files that appear to be part=
 of
this driver series:

[Severity: High]
Are these usleep_range() calls safe in atomic context?

According to DRM subsystem guidelines, CRTC atomic enable/disable callbacks
execute in atomic context during non-blocking commits where sleeping is
forbidden.

Both spacemit_crtc_atomic_enable() and dpu_pm_suspend() (called from
spacemit_crtc_atomic_disable()) invoke usleep_range():

drivers/gpu/drm/spacemit/spacemit_crtc.c:spacemit_crtc_atomic_enable() {
    ...
		dpu_reset_assert(a_crtc->dev, "mclk", a_crtc->mclk_reset);
		dpu_reset_assert(a_crtc->dev, "aclk", a_crtc->aclk_reset);
		dpu_reset_assert(a_crtc->dev, "dsc", a_crtc->dsc_reset);
		usleep_range(10000, 20000);
    ...
}

drivers/gpu/drm/spacemit/spacemit_crtc.c:dpu_pm_suspend() {
    ...
	dpu_reset_assert(dev, "aclk", a_crtc->aclk_reset);
	dpu_reset_assert(dev, "dsc", a_crtc->dsc_reset);
	usleep_range(10000, 20000);
    ...
}

Calling sleeping functions in this context causes kernel warnings and system
instability.

Should non-sleeping delays like udelay() be used instead?


[Severity: High]
Does spacemit_plane_atomic_update() sleep in atomic context?

The DRM subsystem guidelines explicitly state that Plane atomic update call=
backs
execute in atomic context where sleeping is forbidden.

spacemit_plane_atomic_update() calls spacemit_dmmu_map():

drivers/gpu/drm/spacemit/spacemit_planes.c:spacemit_plane_atomic_update() {
    ...
		ret =3D spacemit_dmmu_map(plane->state->fb,
					&spacemit_pstate->mmu_tbl, tbu_id,
					a_crtc->cl_rdma, plane);
    ...
}

which then calls drm_gem_shmem_get_pages_sgt():

drivers/gpu/drm/spacemit/spacemit_dmmu.c:spacemit_dmmu_map() {
    ...
	sgt =3D drm_gem_shmem_get_pages_sgt(to_drm_gem_shmem_obj(fb->obj[0]));
	if (IS_ERR(sgt))
    ...
}

This helper acquires a sleeping mutex via dma_resv_lock_interruptible(). Th=
is
causes a sleep in atomic context, risking kernel panics.

Should the driver implement a prepare_fb hook (e.g.
drm_gem_shmem_plane_helper_prepare_fb) to pin the pages and obtain the SGT
outside of the atomic update phase?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260725-k3-display=
-v1-0-6de34d80e86c@gmail.com?part=3D11
