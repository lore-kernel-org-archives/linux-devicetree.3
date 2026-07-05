Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC34B27CCE0
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280147; cv=none; b=fwLv4bpiW2rkcBb2GNWCASwAQkgYUwkGpbgRspjU/yDqSDlpD4r5ay8MA7LSMJ7cu5BY/BYFpIi/EqVZXSL+2xffLbXcVIzbAKnnCHJ6erZ2ZeK4NrYAJDTP8J+nTGUMSyrCvjpeGffwMDPAThNOSod1ftozpAFIqI5LdTmTzJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280147; c=relaxed/simple;
	bh=XnjhRCKdnD+DJGHJRn+RqZBHNt9bXsRSQM3Sk/4WL0k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Zbub1MYkv/KX1Pof5SFMBb9wemUWZYc+PE1URaWQRHuKXZsCyn06SNjb1Juhd+Cc478nAukYTUzUyZGU9TTrAfMB4CznwrUg9mR9PCaJaAnLgUJ+6FMnvGvmxqXdVOlA/4zzzr9k39pKyBI9o6O8Ds+66fuCzAMevufca1WobaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lP7JXCvY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lP7JXCvY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 206D31F000E9;
	Sun,  5 Jul 2026 19:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783280146;
	bh=B6sL/F7/0pCBbV/20BbP75600PKz6ddx4Z78ItWsyPs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lP7JXCvYfmICcNS+Gyt6u5XRb60FwCcikne/iYdTDyF7uRJV3x3VE8keR25wXOmuF
	 Q2VhjGKxHsISGkM7dovtrk8hQRMpY26sj8CtVicbXjaqc6SYTYC3Rd7+pJj54wpEJM
	 XDEuqiMnUj09kWaK8sJBomAN+w8GXwZ8iHx5+Thz3qF9AzO6UgmYUkFsUXVTcZ7qIc
	 gmZdAXSYDIrZ7fodiT2WpyZRRZCk3ex0F9tb2JDqdNKgTqKmYD8qMeKMwSquougSX4
	 HR66sA1qBG7feqLKBHBD6y9RdSqEeFEGemK+rcKAOGfgCgpIv24WcY1TTuXWcwTHDl
	 7QMHXBq2ASwxA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 13/13] drm/msm: add lpac ring to devcoredump
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-13-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-13-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:35:45 +0000
Message-Id: <20260705193546.206D31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unchecked error pointer causes kernel panic during devcoredump
--

commit d796b03f3d2b7a2a3e2dcafef659304fe3dd3b3e
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

drm/msm: add lpac ring to devcoredump

This commit adds the LPAC ring state to the devcoredump to aid in debugging
GPU issues. It updates the loop conditions in the adreno GPU state functions
to include the LPAC ringbuffer data if it is present on the device.

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 94dbec9464a4d..030bb1aeb7ee1 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -782,25 +782,26 @@ int adreno_gpu_state_get(struct msm_gpu *gpu, struc=
t msm_gpu_state *state)
> =20
>  	ktime_get_real_ts64(&state->time);
> =20
> -	for (i =3D 0; i < gpu->nr_rings; i++) {
> +	for (i =3D 0; i < gpu->nr_rings + !!gpu->lpac_rb; i++) {
> +		struct msm_ringbuffer *ring =3D i < gpu->nr_rings ? gpu->rb[i] : gpu->=
lpac_rb;

[Severity: High]
This isn't a bug introduced by this patch, but this devcoredump modification
exposes a pre-existing unhandled error pointer.

In msm_gpu_init(), if the allocation of gpu->lpac_rb fails (e.g., due to me=
mory
pressure), it returns an error pointer. Due to a pre-existing bug, the error
check incorrectly evaluates IS_ERR(gpu->rb[i]) instead of IS_ERR(gpu->lpac_=
rb):

drivers/gpu/drm/msm/msm_gpu.c:msm_gpu_init() {
    ...
	if (IS_ERR(gpu->rb[i])) {
    ...
}

Since an error pointer evaluates to true for !!gpu->lpac_rb, will this loop
include the error pointer and cause a kernel panic when it attempts to
dereference ring->memptrs->fence below?

>  		int size =3D 0, j;
> =20
> -		state->ring[i].fence =3D gpu->rb[i]->memptrs->fence;
> -		state->ring[i].iova =3D gpu->rb[i]->iova;
> -		state->ring[i].seqno =3D gpu->rb[i]->fctx->last_fence;
> -		state->ring[i].rptr =3D get_rptr(adreno_gpu, gpu->rb[i]);
> -		state->ring[i].wptr =3D get_wptr(gpu->rb[i]);
> +		state->ring[i].fence =3D ring->memptrs->fence;
> +		state->ring[i].iova =3D ring->iova;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D13
