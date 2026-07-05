Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED83333429
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279593; cv=none; b=PSZ7Bxfb6pTzuvymxWi0SEC+o8KEh1hWdjG+57lv41IFdjMM4JW94b5Q47FL7aOdq/D0aQbeMRzF9KuAVXfAH9jBP4Vzd8p+p3f/xupcXma6iKGM9IBHOgnIy5EthgmZT5BGRy82lV/fN01lQQggn3sdWALcAyOUDs40gbLGufk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279593; c=relaxed/simple;
	bh=OPcBsQabSU8DQ1VLxVLSfAmQQ7vwIsMiHNIj7SXSd4M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RSmDmmdnuKW7pK6XQrW5anbCPNMiqC5YYQ+Y6CxInWc7MPi41wA864rM51T9qsX/ZaR8vESATyZYVvwAWySTfRtCSvrblbeZywDPGp5V5PmH+UdgrBnRUjgw2aSX1LQ10xQ/aN4tl9F25gEp3BEAmGaWnJYHZ7q+0Gx455zYqew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVN2xFQf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVN2xFQf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BE491F000E9;
	Sun,  5 Jul 2026 19:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279591;
	bh=7UQOgOAI5nxW8bvgCfSkzB57DLphhrhZkQ78TZh9kZs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVN2xFQfCj2yoVngrT75ID6Snysn+6tfaJWPwChqjER6K/1BS8cViyj/RI1973Nyz
	 UaETg5+/dJr9H9z+WkmH5ovMOtQmJtT/isC2mbXs1xWIvgXhdWf7iCV4hrRsvINspc
	 rrYm78JT0OQQx7PIkmK+7I204LSQ+xQQHE+U+J1z+fc0X1E0do4PQoHM1EZqSjvz9H
	 k7BF6HIrV5wo0aiQAdWVfqCk3fc6qseMZISWJ2cR6ByrydMdVOZxrHVStiK9Pc/Sr8
	 nW9PRCWjnMUCark78mUoSUfKXQ/M2vflvaoCzOzuZFqVM39XG/GJlSGjyM+Z2h1sBv
	 bDv7ONhP55s3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 10/13] drm/msm: initialize LPAC ring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-10-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:26:30 +0000
Message-Id: <20260705192631.1BE491F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Unconditional execution of LPAC initialization on all A6xx/A7x=
x GPUs will crash hardware without LPAC support.
- [High] The error check for the LPAC ringbuffer allocation evaluates the w=
rong variable, ignoring allocation failures and reading out-of-bounds.
- [Medium] The GPU hangcheck timer does not monitor the LPAC ring, causing =
LPAC-only hangs to go undetected.
- [Medium] Missing cleanup of `gpu->lpac_rb` in the error path of `msm_gpu_=
init()`.
- [Low] Unconditional allocation of the LPAC ringbuffer wastes resources fo=
r all MSM GPUs.
--

commit 35c6bd5d02bb9ed8858bdd2395719b06651d77e8
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

drm/msm: initialize LPAC ring

Program all the register needed to start up LPAC and send initialization
sequence. Additionally, now that the LPAC ring is live, make the code aware
of it.

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/=
adreno/a6xx_gpu.c
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c

[ ... ]

> @@ -1481,6 +1567,10 @@ static int hw_init(struct msm_gpu *gpu)
>  	if (ret)
>  		goto out;
> =20
> +	ret =3D lpac_cp_init(gpu);
> +	if (ret)
> +		goto out;
> +

[Severity: Critical]
Will this unconditional execution of LPAC initialization cause a regression=
 on
hardware without LPAC support?

During hw_init(), the driver unconditionally writes to LPAC-specific regist=
ers
and calls lpac_cp_init(). This function sends a CP_ME_INIT packet to the LP=
AC
ring and waits for it to idle using a6xx_idle().

On older GPUs lacking LPAC hardware (e.g., A630), the CP engine ignores this
ring, causing the idle wait to time out and hw_init() to return -EINVAL.

>  	/*
>  	 * Try to load a zap shader into the secure world. If successful

[ ... ]

> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c

[ ... ]

> @@ -1006,6 +1009,15 @@ int msm_gpu_init(struct drm_device *drm, struct pl=
atform_device *pdev,
>  		memptrs_iova +=3D sizeof(struct msm_rbmemptrs);
>  	}
> =20
> +	gpu->lpac_rb =3D msm_ringbuffer_new(gpu, nr_rings, memptrs, memptrs_iov=
a);
> +

[Severity: Low]
Does this unconditional allocation of the LPAC ringbuffer waste resources f=
or
legacy non-LPAC GPUs?

A GEM object, DRM scheduler kthread, and fence context are allocated for ev=
ery
MSM GPU even if they do not support LPAC.

> +	if (IS_ERR(gpu->rb[i])) {
> +		ret =3D PTR_ERR(gpu->rb[i]);
> +		DRM_DEV_ERROR(drm->dev,
> +					  "could not create lpac ringbuffer %d\n", ret);
> +		goto fail;
> +	}
> +

[Severity: High]
Does this check the wrong variable for the LPAC allocation failure?

The error check evaluates gpu->rb[i] instead of gpu->lpac_rb. If the LPAC
allocation fails, gpu->lpac_rb holds an error pointer but the initialization
succeeds.

This later causes a kernel panic when the error pointer is dereferenced dur=
ing
device setup. Additionally, because the loop counter i equals nr_rings here,
checking gpu->rb[i] results in an out-of-bounds array read if nr_rings equa=
ls
MSM_GPU_MAX_RINGS.

[Severity: Medium]
If GPU initialization fails and we take this goto fail path, is there a mem=
ory
leak for the LPAC ringbuffer?

The fail path in msm_gpu_init() iterates over gpu->rb and destroys those
ringbuffers, but it lacks a call to msm_ringbuffer_destroy(gpu->lpac_rb).

>  	gpu->nr_rings =3D nr_rings;
> =20
>  	refcount_set(&gpu->sysprof_active, 1);

[ ... ]

> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h

[ ... ]

> @@ -181,6 +181,8 @@ struct msm_gpu {
>  	struct msm_ringbuffer *rb[MSM_GPU_MAX_RINGS];
>  	int nr_rings;
> =20
> +	struct msm_ringbuffer *lpac_rb;
> +

[Severity: Medium]
Is the GPU hangcheck timer missing monitoring for the LPAC ring?

In msm_gpu.c:hangcheck_handler(), the code only monitors the primary active
ring:

	struct msm_ringbuffer *ring =3D gpu->funcs->active_ring(gpu);
	...
	if (fence_after(ring->fctx->last_fence, ring->hangcheck_fence))
		hangcheck_timer_reset(gpu);

If a task submitted to the LPAC ring hangs and the primary ring is idle,
fence_after() evaluates to false and the timer is not reset. The stall goes
undetected, leaving the task hanging indefinitely without GPU recovery.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D10
