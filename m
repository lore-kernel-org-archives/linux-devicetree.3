Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793284038;
	b=0cJmfPcaXz7pMl6+NMl1YGQu2pfBssMYpNpQgMM9C3E06kjx29/gM1K9f6K9QwXrAjdQ
	 8DGrYL1ywrgJqYLlikVueaGB0IIXBKSfK2nvpd7HmOgCDF9j9QDOrUd/bmx89iORZKWx+
	 5A2NvQFfGUL16TboHUud4rok1wOdq2Xk78Q8f3plysjsZP7JRv2CE8XMYslEuZcuCTSRy
	 642WIxqk3aZUjmN8z9yPJB94Pe5QBqy0YevZZeSLAunwtMlR11vVDrpz803CPXlNnAYx8
	 i84ghcMY3UM5/TAerB35fDSFapWu3x/EPddYqCUm+7lH230hFYHKLZ0CSajQlbUdBSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793284038;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=C42BufVBeEFXvCw5kXleBXxSFgzzMkCMeHsQQo2Gpwo=;
	b=Pfi0FKFzjttORz8ta0QV1mxaix6rrSrPz8yUhtrJmASQUDcgkNTez5o7mn/0xvEnvJYz
	 QKPC4ibt5qg4soixxuEkMgNUtpkfhUoPr5cOMCQxkq7hE5utrzX+JGzmFhGdQxOmChyL5
	 QMon/LfJKgdpAFP6VkX6m6HhnE0ECwN47aV2YHdRpcTxWxAvEpblB3oIQgVkrAh+U+c/K
	 FcHm9pkBlhDPRfX2CnXTUa+saBfy+hAOeKVCDHYhJQcny3CaB1xj6cKtCH6Ef/a5SLjLy
	 JGrhNTe/IaHz92rd/6pz0P4DX/Fe1Vy/77YCu57xP1PwgOJaSWJw7I9+tuPD3oaNe1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlbClg69;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7808E606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JlbClg69
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B879A1F01825;
	Thu, 29 Oct 2026 14:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793284038;
	bh=C42BufVBeEFXvCw5kXleBXxSFgzzMkCMeHsQQo2Gpwo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JlbClg69sSh0sVz1lHJ/QkX2oznvj2uvy0kb9Go7qdWUwIrJVfIixSAsWF6cMk1Y4
	 U+V61mROaIfkUZtECAQw/pmBTPYipUX3zApbJdl4n74QHQEpRTMSUCOaZQR3bN8KkC
	 yzlVKbEPMCg7piIzod65nerJ+ZB8Ymm3uijYMfTrgNGe6Pa0LHgHKZuWNcbMD1tgkA
	 lLAf+v+pgoiPvVISgr+4WDHoURKTnAFFHKoAlHywm5hBJpS/Cq9MqT03LAt5kbX+Bg
	 tDMguI7ExpnyoAvTD74Fv/Tb0Hmemy8E0vPLEAOrMU/jKstc+Nd2yUli/S/SYccopE
	 +2gEWltz2K+Aw==
Message-ID: <sashiko-outbox-189515@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 13/14] drm/msm: gate lpac behind modparam
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-13-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:27:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/msm: broken enable_lpac default and gating logic in msm_gpu_in=
it()
- [High] drm/msm: unfreed queue in msm_submitqueue_create() when lpac_rb is=
 NULL
- [Low] drm/msm: missing kernel-parameters.txt documentation for enable_lpac
--

commit 1335ae6013ec105c8c18047306da8e49457285e5
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

drm/msm: gate lpac behind modparam

This commit adds the enable_lpac module parameter in adreno_device.c and
checks it in msm_gpu_init() before creating the LPAC ringbuffer.

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 6e2333466d7f1..51781a2e8a00e 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -30,6 +30,10 @@ static bool skip_gpu;
>  MODULE_PARM_DESC(no_gpu, "Disable GPU driver register (0=3Denable GPU dr=
iver register (default), 1=3Dskip GPU driver register");
>  module_param(skip_gpu, bool, 0400);
> =20
> +int enable_lpac =3D 0;
> +MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=3Don , 0=3Ddi=
sable, -1=3Dauto (default))");
> +module_param(enable_lpac, int, 0600);

[Severity: Low]
Should this new module parameter also be documented in
Documentation/admin-guide/kernel-parameters.txt?

[ ... ]

> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 4244d9324cda7..f6927c797fa5c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c

[ ... ]

> @@ -1012,7 +1013,7 @@ int msm_gpu_init(struct drm_device *drm, struct pla=
tform_device *pdev,
>  		memptrs_iova +=3D sizeof(struct msm_rbmemptrs);
>  	}
> =20
> -	if (config->has_lpac) {
> +	if (config->has_lpac && enable_lpac !=3D 0) {

[Severity: High]
Does the default value and tri-state logic for enable_lpac match the
documented behavior?

In drivers/gpu/drm/msm/adreno/adreno_device.c, enable_lpac is initialized
to 0, whereas MODULE_PARM_DESC() documents -1 (auto) as the default:

    int enable_lpac =3D 0;
    MODULE_PARM_DESC(enable_lpac, "Enable LPAC (A7xx+ only) (1=3Don , 0=3Dd=
isable, -1=3Dauto (default))");

Because enable_lpac defaults to 0 instead of -1, LPAC remains disabled by
default even on targets that set ADRENO_QUIRK_LPAC (such as gen70900 in
the subsequent patch "drm/msm: enable LPAC on gen70900").

In addition, adreno_gpu_init() in drivers/gpu/drm/msm/adreno/adreno_gpu.c
computes has_lpac solely from ADRENO_QUIRK_LPAC:

    adreno_gpu_config.has_lpac =3D !!(config->info->quirks & ADRENO_QUIRK_L=
PAC);

and msm_gpu_init() requires both config->has_lpac and enable_lpac !=3D 0.
Unlike enable_preemption in a6xx_gpu_init(), this does not distinguish
between 1 (force on) and -1 (auto based on ADRENO_QUIRK_LPAC), so passing
msm.enable_lpac=3D1 cannot enable LPAC on an A7xx+ GPU unless
ADRENO_QUIRK_LPAC is already set in the catalog.

Furthermore, because enable_lpac is only checked when creating
gpu->lpac_rb in msm_gpu_init(), other LPAC paths remain out of sync with
the parameter:

1. msm_gpu_init() still allocates memptrs using config->has_lpac:

    memptrs =3D msm_gem_kernel_new(drm,
        sizeof(struct msm_rbmemptrs) * (nr_rings + config->has_lpac),

2. adreno_hw_init() in drivers/gpu/drm/msm/adreno/adreno_gpu.c still
configures the LPAC SMMU aperture based on ADRENO_QUIRK_LPAC rather than
whether LPAC is enabled:

    if (info->quirks & ADRENO_QUIRK_LPAC) {
        ret =3D qcom_scm_set_gpu_smmu_lpac_aperture(1);
        if (ret)
            DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture:=
 %d\n", ret);
    }

Should enable_lpac be initialized to -1 and evaluated when setting
config->has_lpac (and checked consistently in adreno_hw_init())?

>  		gpu->lpac_rb =3D msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_io=
va);

[Severity: High]
When enable_lpac is 0, msm_gpu_init() leaves gpu->lpac_rb as NULL. Can
this cause msm_submitqueue_create() to leak the queue allocation when
userspace requests an LPAC submitqueue?

In drivers/gpu/drm/msm/msm_submitqueue.c, msm_ioctl_submitqueue_new() ->
msm_submitqueue_create() allocates queue before checking whether ring
(priv->gpu->lpac_rb) is NULL:

    queue =3D kzalloc_obj(*queue);

    if (flags & MSM_SUBMITQUEUE_LPAC) {
        ring_nr =3D priv->gpu->nr_rings;
        ring =3D priv->gpu->lpac_rb;
    } else {
        ring =3D priv->gpu->rb[ring_nr];
    }

    if (!ring)
        return -EINVAL;

When priv->gpu->lpac_rb is NULL and userspace passes MSM_SUBMITQUEUE_LPAC
to DRM_IOCTL_MSM_SUBMITQUEUE_NEW, msm_submitqueue_create() returns -EINVAL
without freeing queue.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-descriptiv=
e-name-lpac-upstream-v2-0-a21a5c850961@gmail.com?part=3D13
