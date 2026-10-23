Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792738382;
	b=BRS/Po4uT7TkVY39ginT81ZIkDSlfx5N/uNNk/g00+KokFH2vTJbOC0VqbuuyianHwJ7
	 aPanzvxdiFCl7mCuVbnPCoRt/jee3VMwQ3t/qcJRl2lKW3xMpF7+2L9wpOL7WF54rA8pW
	 GLKizpnQbeSf/jB3EcRd4i6Bkp0vcTPdqBQOCyDfN53NETo2y6XP2cr2mIR6R4eaZkJ14
	 ivSOwTgstPH13wZcUXtCFUQo2VuNhJ9cziAvzOFwQOq2x82y6RjtPzd0AT4Qh48OoE4Ja
	 I2Fp37y43M5EEbu63dILZAJ8j1731n46TeqfRkHVDKOs9UpsfpkjBs5pCddAREs2KtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792738382;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K5h3cwsuiRcInadr7PzSvsCxI5d5TOfSKWhJFO5Ento=;
	b=BU2kcOXOohcHFvhM5IbGWcfZTRxKjryI1w8dXgzxJWfK31nZ0he1Zk+8R1SMRTKyDzqV
	 +r0ZDfH2g+DNoIsBRJC4QcxTllgnp9xbnxjarWI6agIAsziYgFufIFm37HKWTAHD3XY0A
	 PBOYxuT+QdMUVPoekQXVthRTfDFWuzVPTKvJTtBocg7gk53IDcWaL4XoO6k4jL4wqXgtF
	 kPyWsMD/NID7KFLkJn+0KqIraBya4ktf5zgAs/tSpcSb8t3m0F25OEiV/liR2/DHJ+iXs
	 Px3NUlkw1VMMilrx2DJzEBIfu283zbRLomzUa11vflWPurpzc9tP0U9K9IwYG8yVIag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqJ9HTFl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FD17606A31B
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 06:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lqJ9HTFl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9634C1F01825;
	Fri, 23 Oct 2026 06:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792738382;
	bh=K5h3cwsuiRcInadr7PzSvsCxI5d5TOfSKWhJFO5Ento=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lqJ9HTFlus9etyAL9vvhV+IzoZHdhGKUhTvg6thMLnx8fYKwEZDsjVp8IZr1pBNsa
	 TP5IP3aNy0AvRqcu6Pfdu/EDEC6K0vA9mZvdUsGMA6Rcf8rsFhMCBT0K/TUZzsu8od
	 QkMgVjLRX31UdRAqo6iUBH6lHTP+WLEQlbW1SXicZLGahVFvmSIuRsovSLnV6WZVZ2
	 Odho7j1d7g5Zizlj/6ukM/dRTIxsD+71u6LsPxWJrXTjF5icLY5/FuyhdvLkHnwwvX
	 xG2c+5DZ7dJZ+F92jm2zOpr77/cZbYZoensP3jbTUUN6g1xm1wIPUfB5UVpBAMFiir
	 kE4nZVQIkhODw==
Message-ID: <sashiko-outbox-182369@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/16] accel/thames: Add IOCTL for memory
 synchronization
Reply-To: sashiko-reviews@lists.linux.dev
To: "Tomeu Vizoso" <tomeu.vizoso@gmail.com>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261023-thames-v3-11-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
 <20261023-thames-v3-11-3ab40aa17157@tomeuvizoso.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 06:53:01 +0000
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
- [High] accel/thames: thames_ioctl_bo_prep() syncs caches when wait fails
- [Medium] accel/thames: DMA direction mismatch when syncing contiguous BOs
--

commit 85aeec13be820dd1a0897aae141a1833daad8267
Author: Tomeu Vizoso <tomeu.vizoso@gmail.com>

accel/thames: Add IOCTL for memory synchronization

This commit adds DRM_THAMES_BO_PREP and DRM_THAMES_BO_FINI ioctls to the
thames accel driver so userspace can wait for in-flight jobs and synchronize
CPU caches with non-coherent DSP memory.

> diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/tha=
mes_gem.c
> index c9fd08c7aaf4d..5a4dc497768f8 100644
> --- a/drivers/accel/thames/thames_gem.c
> +++ b/drivers/accel/thames/thames_gem.c
> @@ -942,3 +942,66 @@ int thames_ioctl_bo_mmap_offset(struct drm_device *d=
dev, void *data, struct drm_
>  	return 0;
>  }
> =20
> +int thames_ioctl_bo_prep(struct drm_device *ddev, void *data, struct drm=
_file *file)
> +{
> +	struct drm_thames_bo_prep *args =3D data;
> +	struct thames_gem_object *bo;
> +	struct drm_gem_object *gem_obj;
> +	unsigned long timeout =3D drm_timeout_abs_to_jiffies(args->timeout_ns);
> +	long ret =3D 0;
> +
> +	if (args->reserved !=3D 0)
> +		return -EINVAL;
> +
> +	gem_obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	ret =3D dma_resv_wait_timeout(gem_obj->resv, DMA_RESV_USAGE_READ, true,=
 timeout);
> +	if (ret =3D=3D 0)
> +		ret =3D timeout ? -ETIMEDOUT : -EBUSY;
> +	else if (ret > 0)
> +		ret =3D 0;
> +
> +	bo =3D to_thames_bo(gem_obj);
> +	if (bo->flags & DRM_THAMES_BO_CONTIGUOUS)
> +		dma_sync_single_for_cpu(ddev->dev, bo->base.dma_addr, gem_obj->size,
> +					DMA_BIDIRECTIONAL);
> +	else
> +		dma_sync_sgtable_for_cpu(ddev->dev, bo->shmem.sgt, DMA_BIDIRECTIONAL);

[Severity: High]
Should thames_ioctl_bo_prep() skip the cache invalidation when
dma_resv_wait_timeout() fails?

If the wait times out (-ETIMEDOUT), is polled while fences are still active
(-EBUSY), or is interrupted by a signal (-ERESTARTSYS), ret is negative, yet
the code still calls dma_sync_single_for_cpu() or dma_sync_sgtable_for_cpu(=
).

This transfers DMA buffer ownership to the CPU and invalidates CPU cache
lines while the DSP or DRU DMA engine is still actively accessing the buffe=
r.
It also performs full-buffer cache maintenance on every non-blocking poll or
signal-interrupted retry, and contradicts the struct drm_thames_bo_prep
comment in include/uapi/drm/thames_accel.h:

include/uapi/drm/thames_accel.h:
 * Waits for the DSP to be done with the buffer and invalidates the CPU cac=
hes,
 * so that what the DSP wrote is visible to the CPU.  The DSP is not cohere=
nt
 * with the CPU, and the wait and the cache invalidation are deliberately t=
he
 * same operation: userspace has no way of skipping the wait and keeping the
 * invalidation, so a mapping is never handed out with stale cache lines.

> +	/* Order the cache maintenance before the CPU reads. */
> +	mb();
> +
> +	drm_gem_object_put(gem_obj);
> +
> +	return ret;
> +}
> +
> +int thames_ioctl_bo_fini(struct drm_device *ddev, void *data, struct drm=
_file *file)
> +{
> +	struct drm_thames_bo_fini *args =3D data;
> +	struct thames_gem_object *bo;
> +	struct drm_gem_object *gem_obj;
> +
> +	if (args->reserved !=3D 0)
> +		return -EINVAL;
> +
> +	gem_obj =3D drm_gem_object_lookup(file, args->handle);
> +	if (!gem_obj)
> +		return -ENOENT;
> +
> +	bo =3D to_thames_bo(gem_obj);
> +	if (bo->flags & DRM_THAMES_BO_CONTIGUOUS) {
> +		dma_sync_single_for_device(ddev->dev, bo->base.dma_addr, gem_obj->size,
> +					   DMA_BIDIRECTIONAL);

[Severity: Medium]
Does syncing contiguous buffer objects with DMA_BIDIRECTIONAL in
thames_ioctl_bo_prep() and thames_ioctl_bo_fini() mismatch the direction us=
ed
when allocating them?

In drivers/accel/thames/thames_gem.c, contiguous buffers are allocated and
initially synced in thames_gem_create() with DMA_TO_DEVICE:

drivers/accel/thames/thames_gem.c:thames_gem_create() {
	...
	bo->alloc_vaddr =3D dma_alloc_noncoherent(dev, bo->alloc_size, &bo->alloc_=
dma,
						DMA_TO_DEVICE, GFP_KERNEL | __GFP_NOWARN);
	...
	dma_sync_single_for_device(dev, bo->alloc_dma, bo->alloc_size, DMA_TO_DEVI=
CE);
}

And freed in thames_gem_bo_free() with DMA_TO_DEVICE:

drivers/accel/thames/thames_gem.c:thames_gem_bo_free() {
	...
	if (bo->alloc_vaddr)
		dma_free_noncoherent(drm_dev_dma_dev(obj->dev), bo->alloc_size, bo->alloc=
_vaddr,
				     bo->alloc_dma, DMA_TO_DEVICE);
}

When CONFIG_DMA_API_DEBUG is enabled, calling dma_sync_single_for_cpu() and
dma_sync_single_for_device() with DMA_BIDIRECTIONAL on an allocation created
with DMA_TO_DEVICE triggers check_sync() warnings for direction mismatch and
for syncing device read-only DMA memory for the CPU.

Should thames_gem_create() and thames_gem_bo_free() use DMA_BIDIRECTIONAL f=
or
contiguous BOs as well?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-thames-v3-=
0-3ab40aa17157@tomeuvizoso.net?part=3D11
