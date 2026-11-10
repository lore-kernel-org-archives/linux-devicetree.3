Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794299873;
	b=GJztKN2UURYZVCn/npgeVlRaMUazfTwWm7bj1Y118XrRTR6mzBtO1GatnnbtOqs0o5Ln
	 wbCxfsQ1kHKwx9aaomHD+/ErI/3pf8F/uBUvotV6ctz8NO9M0ZRdOr61RmKWrap7m040Y
	 V+3o2aOcgQWgpyJs8935NAB12yWi/8UuBaAydl/aTGlk+B3BWmoljAkjdWTybjOEcsSwu
	 KcdMPTYCK9nGESHciDStMRu3RKybLoczGVq+LfnLlkkJKfC0VyuKhQlsa8o0efcqMJrx7
	 skOM10dQ0LuDZ3BXv6Y8MWe9CbX9bHB5BUq+H1iIsAAuztJl16SPshhUiWSqTiBVNHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794299873;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Aly/Y/UQ0Al5RhWH/2fM9QPIEAX0MH/sAfQnF/CfcVk=;
	b=4uv7qP10uedWObwzvAPJb399dOkDClegVyAIrYSpLItOyaQLbAXV5I6bqDsaS1fJQoVm
	 3U5CvQGrQnNv1OQFKpUbqNjUgzOJpY33vkQB2MFA1Pq1tIIHKfd8I97AIXG4osTtORVpm
	 +8jJgqJ5FltlHN6ZsiPtvEtDXPPkL40x0vKHF4YlxC2y7SL7uhJ5RGrLQkthdbAXwbiIy
	 vgEHA+4+LGbKSAkrUwkp9OpCF7mk+adRvwxlqfGp5Esc5RsGHPUcYcYfkzWHmzMi4/wc2
	 yMRoGqSjR4PpLL4MiRpP5YdB0Y7eKNC/ttiVwEpgwg7tvOOp3IakgObVNV7M+rwZduw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKJcz4hz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49447606A321
	for <devicetree@vger.kernel.org>; Tue, 10 Nov 2026 08:37:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UKJcz4hz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A48A1F008A1;
	Tue, 10 Nov 2026 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794299872;
	bh=Aly/Y/UQ0Al5RhWH/2fM9QPIEAX0MH/sAfQnF/CfcVk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UKJcz4hzxvYodGhzbjwu6R+bh6weINMjow6RyfrqWSulbFIcIRDEgLyOAJGFpcK7D
	 2G4sYUhYEJH/4cADYSWRc45nhSGds/5Z4Z6WQFQqINXqiIuEB/5tatdl7gBQ5Vyhxf
	 YvkshOtxszMmuh6kG9kZ0+xQQAtVKqudzxE5SkAyoHltIepZ5OSDXlhWwd00HTFG/l
	 Kdx/T1f54CaqKsJEdPRJBIxJzhcKAgE6+lOr7rHVF/ZPkLcdoQ8wndMCp6viOzgfdC
	 yzCYCTczydYUHUHKyLmUWWPG3vVbvYPTJ+43HZYbW2WjfPZq9JkhGJAqVJAgAJVpyz
	 VDDz4PJBTSthg==
Message-ID: <sashiko-outbox-206639@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] media: verisilicon: Reinitialize the IOMMU after a
 timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arun Iyengar" <aiyengar1990@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261110-hantro-robust-v1-4-6b6269c05bfa@gmail.com>
References: <20261110-hantro-robust-v1-0-6b6269c05bfa@gmail.com>
 <20261110-hantro-robust-v1-4-6b6269c05bfa@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Nov 2026 08:37:52 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential
issues to consider:
- [High] media: verisilicon: failed attach in hantro_iommu_restore()
  detaches IOMMU
- [High] media: verisilicon: race in hantro_iommu_restore() with
  vsi_iommu_flush_tlb()
- [Medium] media: verisilicon: unconditional IOMMU domain swap in
  hantro_iommu_restore()
- [Medium] media: verisilicon: hantro_watchdog() restores IOMMU without
  stopping AV1 core
- [Medium] media: verisilicon: hantro_iommu_restore() fails with -EBUSY
  on ARM32
- [Medium] media: verisilicon: check iommu_is_dma_domain() in
  hantro_alloc_empty_domain()
--

commit 61759d53b32f194a0a0f3fec45e34dc338e8cad9
Author: Arun Iyengar <aiyengar1990@gmail.com>

media: verisilicon: Reinitialize the IOMMU after a timeout

This commit allocates an empty IOMMU paging domain at probe and attaches
and detaches it in hantro_watchdog() after a job timeout to reinitialize
the VPU IOMMU.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index 702d878c7b509..c85c8f07db34d 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
[ ... ]
> @@ -112,6 +113,31 @@ void hantro_irq_done(struct hantro_dev *vpu,
>  	}
>  }
> =20
> +/*
> + * A job that timed out can leave the IOMMU stalled, for instance on a p=
age
> + * fault the core never recovered from, and a hardware reset of the core=
 can
> + * leave the IOMMU state out of sync with its driver. Attach the empty d=
omain
> + * and detach it again to return to the default DMA domain: the IOMMU dr=
iver
> + * then disables and fully reinitializes the IOMMU, which keeps all the
> + * mappings of the default domain.
> + */
> +static void hantro_iommu_restore(struct hantro_dev *vpu)
> +{
> +	int ret;
> +
> +	if (!vpu->empty_domain)
> +		return;
> +
> +	ret =3D iommu_attach_device(vpu->empty_domain, vpu->dev);
> +	if (ret) {
> +		dev_warn(vpu->dev, "Failed to attach the empty IOMMU domain: %d\n",
> +			 ret);
> +		return;
> +	}

[Severity: High]
Can a failed iommu_attach_device() here leave the Rockchip IOMMU
permanently detached from its default DMA domain?

Most Rockchip VPU device tree nodes lack reset lines and the decoder reset
callbacks only write registers, so a wedged core can keep AXI transactions
pending and cause rk_iommu_enable() to fail when attaching
vpu->empty_domain:

drivers/iommu/rockchip-iommu.c:rk_iommu_attach_device() {
	...
	ret =3D rk_iommu_identity_attach(&rk_identity_domain, dev, old);
	if (ret)
		return ret;

	iommu->domain =3D domain;
	...
	ret =3D rk_iommu_enable(iommu);
	if (ret) {
		WARN_ON(rk_iommu_identity_attach(&rk_identity_domain, dev,
						 iommu->domain));
	}
	...
}

Because rk_iommu_attach_device() falls back to &rk_identity_domain while
__iommu_group_set_domain_internal() leaves group->domain as default_domain
without re-attaching the single group device, rk_iommu_resume() skips
rk_iommu_enable() on subsequent runtime PM cycles and the IOMMU stays in
identity bypass while DMA buffers still use default_domain IOVAs.

> +
> +	iommu_detach_device(vpu->empty_domain, vpu->dev);
> +}

[Severity: High]
Can attaching and detaching vpu->empty_domain in hantro_iommu_restore()
race with concurrent DMA mappings on the RK3588 AV1 decoder and corrupt
list traversal in vsi_iommu_flush_tlb()?

hantro_watchdog() runs without vpu_mutex while V4L2 buffer ioctls (such as
VIDIOC_REQBUFS or VIDIOC_QBUF) map or unmap buffers on default_domain. On
rockchip,rk3588-av1-vpu (which sits behind verisilicon,iommu-1.2),
vsi_iommu_attach_device() moves iommu->node from default_domain->iommus to
empty_domain->iommus under empty_domain->lock without taking
default_domain->lock, while vsi_iommu_flush_tlb() drops iommu->lock before
advancing to the next entry:

CPU0 (hantro_watchdog)            CPU1 (V4L2 buffer map/unmap)
hantro_iommu_restore()            vsi_iommu_map()
                                    lock(&default_domain->lock)
                                    vsi_iommu_flush_tlb(default_domain)
                                      list_for_each_entry(iommu,
                                          &default_domain->iommus, node)
                                        lock(&iommu->lock)
                                        ...
                                        unlock(&iommu->lock)
  iommu_attach_device(empty_domain)
    vsi_iommu_attach_device()
      lock(&empty_domain->lock)
      lock(&iommu->lock)
      list_del_init(&iommu->node)
      list_add_tail(&iommu->node,
          &empty_domain->iommus)
      unlock(&iommu->lock)
      unlock(&empty_domain->lock)
                                        pm_runtime_put_autosuspend()
                                        /* follows node.next into
                                         * &empty_domain->iommus */
                                        <-- out-of-bounds dereference

vsi_iommu_flush_tlb() misses the &default_domain->iommus loop termination
check and dereferences container_of(&empty_domain->iommus, struct
vsi_iommu, node) out of bounds.

> =20
>  void hantro_watchdog(struct work_struct *work)
>  {
>  	struct hantro_dev *vpu;
> @@ -124,6 +150,7 @@ void hantro_watchdog(struct work_struct *work)
>  		vpu_err("frame processing timed out!\n");
>  		if (ctx->codec_ops->reset)
>  			ctx->codec_ops->reset(ctx);
> +		hantro_iommu_restore(vpu);
>  		hantro_job_finish(ctx, VB2_BUF_STATE_ERROR);
>  	}
>  }

[Severity: Medium]
Does calling hantro_iommu_restore() when ctx->codec_ops->reset is NULL
switch the IOMMU to an empty page table while the RK3588 AV1 decoder core
is still running?

rk3588_vpu981_codec_ops[HANTRO_MODE_AV1_DEC] defines no .reset callback,
so on a timeout the AV1 core is neither stopped nor reset before
vsi_iommu_attach_device() programs an empty page table and flushes the TLB
while the core may still be issuing DMA transactions.

> @@ -1085,6 +1112,32 @@ static void hantro_reset_assert(struct hantro_dev =
*vpu)
>  	reset_control_assert(vpu->resets);
>  }
> =20
> +static void hantro_free_empty_domain(void *data)
> +{
> +	iommu_domain_free(data);
> +}
> +
> +static int hantro_alloc_empty_domain(struct hantro_dev *vpu)
> +{
> +	struct iommu_domain *domain;
> +
> +	if (!iommu_get_domain_for_dev(vpu->dev))
> +		return 0;
> +
> +	domain =3D iommu_paging_domain_alloc(vpu->dev);

[Severity: Medium]
Does allocating vpu->empty_domain for every Hantro device with an IOMMU
domain leak DMA mappings and clock enable references on Allwinner H6?

allwinner,sun50i-h6-vpu-g2 uses sun50i-iommu, where
sun50i_iommu_domain_alloc_paging() initializes sun50i_domain->refcnt to 1
and sun50i_iommu_attach_device() increments it to 2 before calling
sun50i_iommu_identity_attach():

drivers/iommu/sun50i-iommu.c:sun50i_iommu_attach_device() {
	...
	refcount_inc(&sun50i_domain->refcnt);

	if (iommu->domain =3D=3D domain)
		return 0;

	sun50i_iommu_identity_attach(&sun50i_iommu_identity_domain, dev, old);

	sun50i_iommu_attach_domain(iommu, sun50i_domain);

	return 0;
}

Because sun50i_iommu_identity_attach() only decrements refcnt from 2 to 1,
it never calls sun50i_iommu_detach_domain(), so each attach/detach cycle
in hantro_iommu_restore() calls sun50i_iommu_enable() twice without
disabling, leaking two dma_map_single() mappings and two
clk_prepare_enable() references per timeout (or failing with -EINVAL when
sibling devices share the singleton generic_single_device_group).

[Severity: Medium]
On 32-bit ARM platforms such as RK3288, does allocating vpu->empty_domain
cause iommu_attach_device() in hantro_iommu_restore() to fail with -EBUSY
on every timeout?

CONFIG_ROCKCHIP_IOMMU selects CONFIG_ARM_DMA_USE_IOMMU on 32-bit ARM,
where group->default_domain is forced to IOMMU_DOMAIN_IDENTITY while
arm_setup_iommu_dma_ops() attaches an unmanaged mapping->domain to
group->domain, causing __iommu_attach_group() to reject
iommu_attach_device(vpu->empty_domain, vpu->dev) with -EBUSY because
group->domain !=3D group->default_domain.

[Severity: Medium]
What happens in hantro_iommu_restore() when the VPU is attached to an
IOMMU_DOMAIN_IDENTITY passthrough domain?

iommu_get_domain_for_dev() is still non-NULL in passthrough mode, so
hantro_iommu_restore() transiently enables empty paging on a device doing
direct DMA and then detaches back to group->default_domain; on RK3588 AV1,
that re-attaches the standalone static struct iommu_domain
vsi_identity_domain via vsi_iommu_identity_attach(), which passes it to
to_vsi_domain() and takes spin_lock_irqsave(&vsi_domain->lock, flags) on
out-of-bounds memory. Checking iommu_is_dma_domain() on the domain
returned by iommu_get_domain_for_dev(vpu->dev) in
hantro_alloc_empty_domain() would avoid allocating empty_domain for
identity and unmanaged ARM32 domains.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261110-hantro-rob=
ust-v1-0-6b6269c05bfa@gmail.com?part=3D4
