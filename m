Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283427;
	b=k8wKVQyJxZksYYVUItQM+00UEnga7JUCe47N28Ur5QBuz3IGaPgqj1Re9Ml1MCfMs79S
	 KWQ+cDTujEbe5IP6uQ4cLRfkP/fkmpJdlf42A54UOD2NWfsLCQ/GTEIEs4TxGYBCTQEey
	 q7McTgUOYDsOeI17DNs23tDVUZwjsMmGSDztVfTeI0sMYsxWN6l5icBkBtg8ZtA5767bJ
	 bupe1pLTQUk3vIOOGDYgwjoU2a1c3N+EIz/9/T4YrUfZ2ENVTTsjtCmK1fLublkytnU12
	 /3gGq+VI2+yHFAuw8BRf2Cdi8GOswbQhxOXnMjb0aUYTrxvdyCDw7ZlPWkw/Sr0pR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283427;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=oewRdcq3K6GOXG4M/hJmsO4vl8dTK1Y/LutkPqRNg1U=;
	b=M8KU2N1RpFVF/at7PHYSz+UT6D73TmUxD3alBC5phNNK6zTCioBcC0kDCA9ke3AGbeyK
	 j3YZv6lfL1rixIOve4S3Rgs7j6krDpQIZyA8DCArUYUlU6Z2/9OuzPY1iALovhGvJAClR
	 gDM5OcpNgDuvNpvcar0VeaDnLNEcTDHrdLdoN2/yQDKu4AtI5ucgKmR0qD8kI5u7jFCkN
	 DlkXO30O5MA0B5u0lLPa13QIsrPh/eQIrzR9tV9Pmzrpv50OAcXZkPcJh+3z3qZC3MsOB
	 sykYaiRqBTll1ta/rboFTSu7IY5bJ9zAoXCBsHJPnMjk9oBFzLXXTwguPGEn3AhnwWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKKxvTVh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3917606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SKKxvTVh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F1DE1F01825;
	Thu, 29 Oct 2026 14:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283426;
	bh=oewRdcq3K6GOXG4M/hJmsO4vl8dTK1Y/LutkPqRNg1U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SKKxvTVhqEj+EZ77HNhA+MFtlCBaEzKHx8GfMVG0Lj7Cq9vfw+cpKu7gD/pIsR9QH
	 SGBDkt+5HzPM+bs8gTO6LjMNZxtLcd+VA//niW/rRCcxioELo26+UxyQdgQlEIR2f1
	 qcu3hOS5BiPHBOyj3N0durrjBbanADkiS4B+QiFVxIJa/EyYOJFuR6+sFioWzQ4DoW
	 l8RbDv5QbgHCzTY7ahnqMVQ5G6DFk4Lt4kNXllD1BnOc0cIa3VEIBzo31FeoBOw9cS
	 AMre8V7XRezEevQ74l2BTeZ/x4/wx55hgJQABuBwgULbzycyFIGW0SEgjGTOtvBS1u
	 F7g+RKjb+0H9g==
Message-ID: <sashiko-outbox-189491@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 04/14] arm64: dts: qcom: sm8650: move smmu sid 1
 to new lpac device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-4-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:17:05 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:
- [Critical] drm/msm: parent-child link failure in adreno_gpu_init() skips =
LPAC TLB flush
- [High] arm64: dts: qcom: sm8650: moving SID 1 to lpac breaks older kernels
- [High] drm/msm: double put_device() on lpac_pdev in adreno_gpu_init() err=
or path
- [High] drm/msm: premature of_platform_depopulate() in adreno_remove()
- [High] drm/msm: missing TTBR0 rollback and NULL tlb in msm_iommu_pagetabl=
e_create()
- [High] drm/msm: leaked primary IOMMU mapping on lpac failure in msm_iommu=
_map()
- [Medium] arm64: dts: qcom: sm8650: undocumented lpac child node breaks dt=
bs_check
- [Medium] drm/msm: child platform device leak in adreno_probe() error path
--

commit 6e63347e2bf27a9a295e9b4311c3b2e372545491
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

arm64: dts: qcom: sm8650: move smmu sid 1 to new lpac device

This commit moves stream id 1 out of the main gpu node on sm8650 and places
it into a new lpac child node so that lpac can be attached to a separate
iommu domain.

> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/q=
com/sm8650.dtsi
> index 1604bc8cff373..f47d1dbd06da4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> @@ -4144,8 +4144,7 @@ gpu: gpu@3d00000 {
> =20
>  			interrupts =3D <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH 0>;
> =20
> -			iommus =3D <&adreno_smmu 0 0x0>,
> -				 <&adreno_smmu 1 0x0>;
> +			iommus =3D <&adreno_smmu 0 0x0>;

[Severity: High]
Will removing <&adreno_smmu 1 0x0> from gpu@3d00000 break device tree
backwards compatibility with existing kernels?

As noted in the commit description, gpu firmware accesses memory through
stream id 1 during initialization using the graphics page table even when
lpac is not used. On any kernel without support for the new qcom,lpac child
node, removing <&adreno_smmu 1 0x0> from gpu@3d00000 leaves stream id 1
unattached to the gpu iommu domain, causing translation faults during
firmware initialization.

Also, since lpac is an internal execution pipe of the gpu rather than a
separate hardware block with its own register space, should the second doma=
in
attachment be handled in the driver via iommu apis rather than splitting
stream id 1 into a virtual child node in the device tree?

> =20
>  			operating-points-v2 =3D <&gpu_opp_table>;
> =20
> @@ -4158,6 +4157,12 @@ gpu: gpu@3d00000 {
> =20
>  			status =3D "disabled";
> =20
> +			lpac: lpac {
> +				compatible =3D "qcom,lpac";
> +
> +				iommus =3D <&adreno_smmu 1 0x0>;
> +			};

[Severity: Medium]
Does adding the lpac child node here cause dtbs_check schema validation to
fail on sm8650 device trees?

In Documentation/devicetree/bindings/display/msm/gpu.yaml, the binding for
qcom,adreno specifies:

required:
  - compatible
  - reg
  - interrupts

additionalProperties: false

Neither the lpac child node nor the qcom,lpac compatible string is document=
ed
in Documentation/devicetree/bindings/display/msm/gpu.yaml, so schema
validation rejects the new node.

[Severity: Critical]
When this lpac child node is populated on sm8650, will device_link_add() in
adreno_gpu_init() always fail and cause msm_iommu_tlb_flush_all() and
msm_iommu_tlb_flush_walk() to skip flushing the lpac context bank?

In drivers/gpu/drm/msm/adreno/adreno_device.c, adreno_probe() populates chi=
ld
nodes of gpu@3d00000 with &pdev->dev as their parent:

	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);

Then in drivers/gpu/drm/msm/adreno/adreno_gpu.c, adreno_gpu_init() attempts
to create a runtime pm link with the parent &pdev->dev as consumer and its
child &gpu->lpac_pdev->dev as supplier:

	if (gpu->lpac_pdev) {
		pm_runtime_enable(&gpu->lpac_pdev->dev);
		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
			dev_err(&gpu->lpac_pdev->dev, "failed to link to lpac device\n");
	}

Inside drivers/base/core.c, device_link_add() -> device_is_dependent() chec=
ks
whether the consumer is an ancestor of the supplier:

	if (dev =3D=3D target || device_is_ancestor(dev, target))
		return 1;

Because &pdev->dev is the parent of &gpu->lpac_pdev->dev, device_link_add()
rejects the link as a dependency cycle and returns NULL. In addition,
gpu->lpac_pdev has no driver bound to it, so a managed link would remain in
DL_STATE_DORMANT.

As a result, gpu->lpac_pdev->dev is never runtime-resumed. When per-context
page tables are flushed in drivers/gpu/drm/msm/msm_iommu.c via
msm_iommu_tlb_flush_all() and msm_iommu_tlb_flush_walk():

	if (pagetable->parent->lpac_dev &&
	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
		adreno_smmu =3D dev_get_drvdata(pagetable->parent->lpac_dev);

		pagetable->tlb->tlb_flush_walk(iova, size, granule, (void *)adreno_smmu->=
cookie);

		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
	}

pm_runtime_get_if_in_use(pagetable->parent->lpac_dev) always returns 0, so
tlb invalidations on the lpac context bank are skipped when buffers are
unmapped, leaving stale tlb entries pointing to freed pages.

[Severity: High]
If adreno_gpu_init() fails after acquiring gpu->lpac_pdev on sm8650, can
gpu->lpac_pdev->dev undergo a double put_device()?

In drivers/gpu/drm/msm/adreno/adreno_gpu.c, if devm_kasprintf() or
adreno_get_pwrlevels() fails in adreno_gpu_init(), the error path drops the
reference on gpu->lpac_pdev->dev without disabling runtime pm or clearing
gpu->lpac_pdev:

err_put_lpac_pdev:
	if (gpu->lpac_pdev)
		put_device(&gpu->lpac_pdev->dev);
	return ret;

The caller in drivers/gpu/drm/msm/adreno/a6xx_gpu.c, a6xx_gpu_init(), then
invokes a6xx_destroy() -> adreno_gpu_cleanup():

	ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, info->funcs, nr_rings);
	if (ret) {
		a6xx_destroy(&(a6xx_gpu->base.base));
		return ERR_PTR(ret);
	}

In adreno_gpu_cleanup(), gpu->lpac_pdev is still non-NULL, so it calls
pm_runtime_disable() and put_device() a second time on &gpu->lpac_pdev->dev:

	if (gpu->lpac_pdev) {
		pm_runtime_disable(&gpu->lpac_pdev->dev);
		put_device(&gpu->lpac_pdev->dev);
	}

[Severity: High]
In drivers/gpu/drm/msm/adreno/adreno_device.c, does calling
of_platform_depopulate() at the start of adreno_remove() unregister
lpac_pdev while iommu->lpac_domain is still attached to it?

In adreno_remove():

static void adreno_remove(struct platform_device *pdev)
{
	struct msm_drm_private *priv =3D platform_get_drvdata(pdev);

	of_platform_depopulate(&pdev->dev);

	if (priv->kms_init)
		component_del(&pdev->dev, &a3xx_ops);
	else
		msm_gpu_remove(pdev, &a3xx_ops);
}

of_platform_depopulate(&pdev->dev) unregisters the child lpac platform devi=
ce
before component_del() or msm_gpu_remove() runs adreno_unbind() ->
a6xx_destroy() -> adreno_gpu_cleanup() -> msm_gpu_cleanup() ->
msm_iommu_detach().

Because iommu->lpac_domain is still attached when lpac_pdev is unregistered,
__iommu_group_free_device() in drivers/iommu/iommu.c hits:

	if (list_empty(&group->devices))
		WARN_ON(group->owner_cnt ||
			group->domain !=3D group->default_domain);

and msm_iommu_detach() and adreno_gpu_cleanup() subsequently operate on an
already-unregistered device.

[Severity: Medium]
What happens to the populated lpac child platform device if msm_gpu_probe()
or component_add() fails in adreno_probe()?

In drivers/gpu/drm/msm/adreno/adreno_device.c:

	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
	if (ret)
		return ret;

	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
	    msm_gpu_no_components())
		return msm_gpu_probe(pdev, &a3xx_ops);

	return component_add(&pdev->dev, &a3xx_ops);

If msm_gpu_probe() or component_add() returns an error,
of_platform_depopulate(&pdev->dev) is not called, leaking the child platform
device created for lpac.

[Severity: High]
In drivers/gpu/drm/msm/msm_iommu.c, if lpac_adreno_smmu->set_ttbr0_cfg()
fails in msm_iommu_pagetable_create(), does the error path dereference a NU=
LL
pagetable->tlb and leave ttbr0 enabled on the primary context bank with fre=
ed
page tables?

When creating the first pagetable in msm_iommu_pagetable_create(),
adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, &ttbr0_cfg) enables ttbr0 on
 the primary context bank before lpac_adreno_smmu->set_ttbr0_cfg() is calle=
d:

		if (lpac_adreno_smmu) {
			ret =3D lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, &ttbr0=
_cfg);
			if (ret) {
				iommu->pagetables--;
				mutex_unlock(&iommu->init_lock);
				free_io_pgtable_ops(pagetable->pgtbl_ops);
				kfree(pagetable);
				return ERR_PTR(ret);
			}
		}

At this point pagetable->tlb has not been assigned yet, as that happens lat=
er
in msm_iommu_pagetable_create():

	/* Needed later for TLB flush */
	pagetable->tlb =3D ttbr1_cfg->tlb;

Calling free_io_pgtable_ops(pagetable->pgtbl_ops) invokes
msm_iommu_tlb_flush_all(), which dereferences pagetable->tlb if
pagetable->iommu_dev is runtime-active. In addition, because
adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL) is not called to roll
back the primary context bank configuration, context bank 0 retains a ttbr0
register pointing to the freed page table and qcom_adreno_smmu_set_ttbr0_cf=
g()
in drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c will reject subsequent calls
with -EINVAL because ARM_SMMU_TCR_EPD0 is already cleared:

		/* Don't call this again if TTBR0 is already enabled */
		if (!(cb->tcr[0] & ARM_SMMU_TCR_EPD0))
			return -EINVAL;

[Severity: High]
Can msm_iommu_map() in drivers/gpu/drm/msm/msm_iommu.c leak the mapping in
iommu->domain if mapping into iommu->lpac_domain fails?

In msm_iommu_map():

	ret =3D iommu_map_sgtable(iommu->domain, iova, sgt, prot);
	if (ret < 0)
		return ret;

	if (iommu->lpac_domain) {
		ret =3D iommu_map_sgtable(iommu->lpac_domain, iova, sgt, prot);
		if (ret < 0)
			return ret;
	}

	return (ret =3D=3D len) ? 0 : -EINVAL;

If the second iommu_map_sgtable() call on iommu->lpac_domain returns an err=
or
or maps fewer than len bytes after the first iommu_map_sgtable() on
iommu->domain succeeded, msm_iommu_map() returns an error without calling
iommu_unmap(iommu->domain, iova, len). In drivers/gpu/drm/msm/msm_gem_vma.c,
msm_gem_vma_map() then leaves msm_vma->mapped set to false:

	if (ret)
		msm_vma->mapped =3D false;

	return ret;

so msm_gem_vma_unmap() will never clean up the mapping left behind in
iommu->domain.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-descriptiv=
e-name-lpac-upstream-v2-0-a21a5c850961@gmail.com?part=3D4
