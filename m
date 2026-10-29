Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793282997;
	b=tLRDINeC6Cx23VVZU4njo8ZrvrHqdD7z7cXIMNqAgT9nl20CRKJrWggvT+VFKPjKndkb
	 Xdd5pPFaqsAgPqokJnLRMQwMk2qp1Gu+nMT7CEQiZmc1cxwjR5wFyHJXA3nL14FITJMcn
	 K1e30sshuSmnaSlAboKlN+LOrLHcZRwExlImDaHGMRJija/uaUvmdJBPNPb+znZy7ghG5
	 ZCIye/bfzP/CT9ESJponQGVba/Ra2qzp4xk24XBCI5K1kMpo9TYMlhcd2jjr6DpKC9g3s
	 ck9K6azLgVVgW4spbal2+ugnpNaP3qIgH0yY6ZGy5xutBuiEBZ0jgo04ykylXLr7NGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793282997;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=CpMZiadxWz7OvzQoyXRfJdR42EiPHCBdReiB6jpiSKk=;
	b=cc7Gmli0a6r7/xXT4kYls+3uYJWgrvuOJn3iHEE/WqmfUeiKGEW5Kkc1/SGwCJtW/O7S
	 rH5VUzIddASBuKCugjx5Q5lXuiNSPMHvktzYrhrmRz9HGY0/6YLeKKRkxjweuAqVZxhYS
	 H1s9whbREdtAUliNY4pickeljvm3ODs8j/Ouv+jPbTEzlCIX6a8LTX9ghKpOjPlJ2hZw9
	 zXLXvdQKi9/wItwpDzZeJNtbqIq5rO/ZuglVQyBRrXNge55KoMRUE+pf/QM9hNWPjJjZY
	 HzmdVo6cawF15S3/xEqL86Kf5/a3e9Mv5BXfafpSpzUkEB0PY7Lpijz1xKe6/F/aNPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EePgZy2D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1121F606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EePgZy2D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91FD61F01825;
	Thu, 29 Oct 2026 14:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793282996;
	bh=CpMZiadxWz7OvzQoyXRfJdR42EiPHCBdReiB6jpiSKk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EePgZy2DwST3rN6R26e1mTD3ugqz4n2lMC13I7ldsfzrx3gsu/3l8+j2guEisJ0+s
	 fqYUiM1XUU+H5K8YFNDukj3mQVMntGXzVTewGqIel8QdnhcgBSHuUYSTGC71FyFHXr
	 cotkWw4tmeycYSMTuKvMns5heEvyYMzo18HVYX5q0cJlPeSnMapOVYxJX6Oa+GH0iI
	 F1B7tCp3ooStYxPbHM6wLMdam2JmYP3Zshhq2TzfK6x6O2g/aesuXt7QAQj960uXOY
	 x62OdP08r3Tnno5ha3fRCY7SkWdmMrYxUoUvIC94f8wlfN3bUks9TPnNdJsI7Xv92c
	 A2ffq495ZGL7A==
Message-ID: <sashiko-outbox-189482@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 03/14] drm/msm: look for lpac from dts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-3-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-3-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:09:55 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] drm/msm: adreno_gpu_init() links parent as consumer of child lpac_=
pdev
- [High] drm/msm: double put_device() on lpac_pdev when adreno_gpu_init() f=
ails
- [High] drm/msm: adreno_remove() depopulates lpac_pdev before unbinding GPU
- [Medium] drm/msm: adreno_probe() leaks populated child devices on probe f=
ailure
--

commit 50cc2a02be0fe4cc4c62cff78b28bf0d3bb92f45
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

drm/msm: look for lpac from dts

This commit populates child platform devices from the Adreno GPU device
tree node and looks up the "qcom,lpac" child device during GPU
initialization so its SMMU context bank and IOMMU domain can be wired up.

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm=
/msm/adreno/adreno_device.c
> index 7f20320ef66af..4d22223c3323c 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
[ ... ]
> @@ -271,6 +273,12 @@ static const struct component_ops a3xx_ops =3D {
> =20
>  static int adreno_probe(struct platform_device *pdev)
>  {
> +	int ret =3D 0;
> +
> +	ret =3D of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret)
> +		return ret;
> +
>  	if (of_device_is_compatible(pdev->dev.of_node, "amd,imageon") ||
>  	    msm_gpu_no_components())
>  		return msm_gpu_probe(pdev, &a3xx_ops);

[Severity: Medium]
If msm_gpu_probe() or component_add() fails in adreno_probe() after
of_platform_populate() succeeds, does this leak the populated child
platform_device structures (such as gpu->lpac_pdev) because
of_platform_depopulate(&pdev->dev) is not called on the error path (or via
devm_of_platform_populate())?

> @@ -282,6 +290,8 @@ static void adreno_remove(struct platform_device *pde=
v)
>  {
>  	struct msm_drm_private *priv =3D platform_get_drvdata(pdev);
> =20
> +	of_platform_depopulate(&pdev->dev);
> +
>  	if (priv->kms_init)
>  		component_del(&pdev->dev, &a3xx_ops);
>  	else

[Severity: High]
In adreno_remove(), shouldn't of_platform_depopulate(&pdev->dev) happen
after component_del() / msm_gpu_remove() rather than before?

Calling of_platform_depopulate(&pdev->dev) first unregisters
gpu->lpac_pdev via platform_device_unregister() -> device_del() while the
GPU is still bound and iommu->lpac_domain is still attached to
&gpu->lpac_pdev->dev.

During device_del(&gpu->lpac_pdev->dev), the bus notifier runs:

  iommu_release_device()
    -> __iommu_group_remove_device()
      -> __iommu_group_free_device()

which triggers WARN_ON(group->owner_cnt || group->domain !=3D
group->default_domain) and tears down the LPAC SMMU master state before
component_del() or msm_gpu_remove() runs adreno_unbind() ->
adreno_gpu_cleanup() -> msm_gpu_cleanup() to detach the IOMMU domain and
disable runtime PM on &gpu->lpac_pdev->dev.

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index f3fc7032fadcd..1dedeb19946ec 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
[ ... ]
> @@ -1200,6 +1205,18 @@ int adreno_gpu_init(struct drm_device *drm, struct=
 platform_device *pdev,
>  	gpu->allow_relocs =3D config->info->family < ADRENO_6XX_GEN1;
>  	gpu->pdev =3D pdev;
> =20
> +	lpac_node =3D of_get_compatible_child(pdev->dev.of_node, "qcom,lpac");
> +	if (lpac_node)
> +		gpu->lpac_pdev =3D of_find_device_by_node(lpac_node);
> +	if (gpu->lpac_pdev) {
> +		pm_runtime_enable(&gpu->lpac_pdev->dev);
> +		if (!device_link_add(&pdev->dev, &gpu->lpac_pdev->dev,
> +				     DL_FLAG_PM_RUNTIME | DL_FLAG_AUTOREMOVE_CONSUMER))
> +			dev_err(&gpu->lpac_pdev->dev, "failed to link to lpac device\n");
> +	}
> +	if (lpac_node)
> +		of_node_put(lpac_node);

[Severity: High]
Will device_link_add(&pdev->dev, &gpu->lpac_pdev->dev, ...) always fail and
return NULL here?

In adreno_probe(), of_platform_populate() creates gpu->lpac_pdev with
&pdev->dev as its parent. In adreno_gpu_init(), device_link_add() is called
with &pdev->dev (the parent) as the consumer and &gpu->lpac_pdev->dev (its
child) as the supplier.

Inside drivers/base/core.c:device_link_add():

	if (!device_pm_initialized(supplier)
	    || (!(flags & DL_FLAG_SYNC_STATE_ONLY) &&
		  device_is_dependent(consumer, supplier))) {
		link =3D NULL;
		goto out;
	}

Because consumer (&pdev->dev) is the parent of supplier
(&gpu->lpac_pdev->dev), device_is_dependent(consumer, supplier) returns 1
via device_is_ancestor(consumer, supplier), rejecting the link as a
circular dependency. In addition, gpu->lpac_pdev has no driver bound to it,
so passing DL_FLAG_AUTOREMOVE_CONSUMER without DL_FLAG_STATELESS is not
valid for a driverless device.

As a result, the device link is never created and &gpu->lpac_pdev->dev
remains in RPM_SUSPENDED with usage_count =3D=3D 0, causing
msm_iommu_tlb_flush_all() and msm_iommu_tlb_flush_walk() in
drivers/gpu/drm/msm/msm_iommu.c:

	if (pagetable->parent->lpac_dev &&
	    pm_runtime_get_if_in_use(pagetable->parent->lpac_dev)) {
		adreno_smmu =3D dev_get_drvdata(pagetable->parent->lpac_dev);

		pagetable->tlb->tlb_flush_all((void *)adreno_smmu->cookie);

		pm_runtime_put_autosuspend(pagetable->parent->lpac_dev);
	}

to skip all IOTLB invalidations on the LPAC SMMU context bank when buffers
are unmapped.

[ ... ]
> @@ -1241,6 +1260,10 @@ int adreno_gpu_init(struct drm_device *drm, struct=
 platform_device *pdev,
> =20
>  	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
>  			gpu_name, &adreno_gpu_config);
> +err_put_lpac_pdev:
> +	if (gpu->lpac_pdev)
> +		put_device(&gpu->lpac_pdev->dev);
> +	return ret;
>  }
> =20
>  void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
> @@ -1256,4 +1279,9 @@ void adreno_gpu_cleanup(struct adreno_gpu *adreno_g=
pu)
>  		pm_runtime_disable(&priv->gpu_pdev->dev);
> =20
>  	msm_gpu_cleanup(&adreno_gpu->base);
> +
> +	if (gpu->lpac_pdev) {
> +		pm_runtime_disable(&gpu->lpac_pdev->dev);
> +		put_device(&gpu->lpac_pdev->dev);
> +	}
>  }

[Severity: High]
When adreno_gpu_init() fails via err_put_lpac_pdev (when devm_kasprintf()
or adreno_get_pwrlevels() fails), doesn't this cause a double
put_device(&gpu->lpac_pdev->dev)?

The err_put_lpac_pdev path drops the reference on &gpu->lpac_pdev->dev
without clearing gpu->lpac_pdev (or disabling runtime PM), and the callers
of adreno_gpu_init() (such as a6xx_gpu_init()) then call their destroy
function on failure:

drivers/gpu/drm/msm/adreno/a6xx_gpu.c:a6xx_gpu_init() {
	...
	ret =3D adreno_gpu_init(dev, pdev, adreno_gpu, info->funcs, nr_rings);
	if (ret) {
		a6xx_destroy(&(a6xx_gpu->base.base));
		return ERR_PTR(ret);
	}
	...
}

which calls a6xx_destroy() -> adreno_gpu_cleanup(), seeing gpu->lpac_pdev
still non-NULL and calling put_device(&gpu->lpac_pdev->dev) a second time.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-descriptiv=
e-name-lpac-upstream-v2-0-a21a5c850961@gmail.com?part=3D3
