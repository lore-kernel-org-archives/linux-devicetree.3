Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F311CAA78
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279676; cv=none; b=CxNfT6kfKuOyecU+5QiBgoeeOrLotATXnGDniuIvSsFQxprguEBS7wfmoKU4ftCBHkFlT744Zgh8kUtpaYvWu3F4+oA+YQ85kux9JiKMOA0Z09MauBjCGVGGoI6nqvk6YGxkaR6AVApYpT7bqSl/FHA/ngdHpeAt7TgyCLktrjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279676; c=relaxed/simple;
	bh=c9un7H67LGGcSIgSNjZVuak168nzle0AMygK1ip2OBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QZPdPGuIunygSr2TqwRV5DorQjSC19pAckxmRv6i6SX9v9OwxQFHX9Hvlm/QWd3WocEpx09wQL692AuoYonhi1xL9Wz2VSpARv9/+PnjD+s/2zFBMHpG9UraAqJtohqbbqSQopp1ITqiW9bzldWZnshFX06JiLlp6ssWGAQxK50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kPu+S6aC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kPu+S6aC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CD9D1F000E9;
	Sun,  5 Jul 2026 19:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279675;
	bh=0W7QPVl2xOehqGT/ASXZcSI1JMi72IhhzPAtrJ8b6dk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kPu+S6aCpUYeiqidGG/lF912u7FB14vvQvnQIAO6MZNBnN0k0tJsFs0wlmMmK4vpt
	 n4B552qDWPesa3rqOfQFT0bSY8/SPdpoLOUMvE7p8fr02KVCWqKY04LXxins2JfAtv
	 pO10YIA/WlNHLDSuqNRcdMUx+/OTc8U8jrpL06AokVYOa7CMHlCr7aWqSNuGVcwhzh
	 +nTTD/zU0Es4IuoJIg6pci+WSb5QcE/pQ5rwKPJFUmlogZ31R48cUEWCnDlbPKaMPm
	 Ald/S7Zx4P03r8JdJO4gn+/wLquS/I2Ht5NEPc8KK/I7UqB8RzU+t3HDrWjSrC2MYt
	 I8f/HTAjiruLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 02/13] drm/msm: add support for lpac_domain in
 msm_mmu
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-2-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-2-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:27:54 +0000
Message-Id: <20260705192755.3CD9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Error paths in msm_iommu_new() leak allocated structures and fail =
to detach the primary device.
- [High] Double allocation of iommu->prr_page overwrites the pointer, leaki=
ng memory, and cleanup logic is improperly gated.
- [High] Missing rollback of the primary SMMU TTBR0 configuration when LPAC=
 TTBR0 setup fails.
- [High] msm_iommu_map leaves stale mappings in the primary domain if LPAC =
mapping fails.
- [Medium] The LPAC fault handler fetches fault information from the primar=
y SMMU instead of the LPAC SMMU.
--

commit 2c00819136c6aa733650fd70add5fb287b7ba815
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

drm/msm: add support for lpac_domain in msm_mmu

This commit adds an iommu_domain for LPAC (Low Power Audio Subsystem
context) and attempts to keep it in sync with the main domain. This allows
LPAC to use a separate context bank to update page tables independently.

> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_io=
mmu.c
> index 058c71c82cf54..19bee64adb7ca 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c

[ ... ]

> @@ -224,6 +226,10 @@ static void msm_iommu_pagetable_destroy(struct msm_m=
mu *mmu)
>  	struct msm_iommu *iommu =3D to_msm_iommu(pagetable->parent);
>  	struct adreno_smmu_priv *adreno_smmu =3D
>  		dev_get_drvdata(pagetable->parent->dev);
> +	struct adreno_smmu_priv *lpac_adreno_smmu =3D NULL;
> +
> +	if (pagetable->parent->lpac_dev)
> +		lpac_adreno_smmu =3D dev_get_drvdata(pagetable->parent->lpac_dev);
> =20
>  	/*
>  	 * If this is the last attached pagetable for the parent,
> @@ -232,9 +238,13 @@ static void msm_iommu_pagetable_destroy(struct msm_m=
mu *mmu)
>  	mutex_lock(&iommu->init_lock);
>  	if (--iommu->pagetables =3D=3D 0) {
>  		adreno_smmu->set_ttbr0_cfg(adreno_smmu->cookie, NULL);
> +		if (lpac_adreno_smmu)
> +			lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, NULL);
> =20
>  		if (adreno_smmu->set_prr_bit) {
>  			adreno_smmu->set_prr_bit(adreno_smmu->cookie, false);
> +			if (lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit)
> +				lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, false);
>  			__free_page(iommu->prr_page);
>  			iommu->prr_page =3D NULL;
>  		}

[Severity: High]
If the primary SMMU does not support PRR (so adreno_smmu->set_prr_bit is
false/NULL) but the LPAC SMMU does, does this logic bypass the LPAC PRR
teardown and leak iommu->prr_page?

[ ... ]

> @@ -588,6 +621,17 @@ struct msm_mmu *msm_iommu_pagetable_create(struct ms=
m_mmu *parent, bool kernel_m
>  			return ERR_PTR(ret);
>  		}
> =20
> +		if (lpac_adreno_smmu) {
> +			ret =3D lpac_adreno_smmu->set_ttbr0_cfg(lpac_adreno_smmu->cookie, &tt=
br0_cfg);
> +			if (ret) {
> +				iommu->pagetables--;
> +				mutex_unlock(&iommu->init_lock);
> +				free_io_pgtable_ops(pagetable->pgtbl_ops);
> +				kfree(pagetable);
> +				return ERR_PTR(ret);
> +			}
> +		}

[Severity: High]
If lpac_adreno_smmu->set_ttbr0_cfg() fails here, does this error path
leave the primary SMMU TTBR0 actively configured to point to page tables
that are about to be freed?

Should there be a rollback for adreno_smmu->set_ttbr0_cfg() before returnin=
g?

> +
>  		BUG_ON(iommu->prr_page);
>  		if (adreno_smmu->set_prr_bit) {
>  			/*
> @@ -606,11 +650,17 @@ struct msm_mmu *msm_iommu_pagetable_create(struct m=
sm_mmu *parent, bool kernel_m
>  						  page_to_phys(iommu->prr_page));
>  			adreno_smmu->set_prr_bit(adreno_smmu->cookie, true);
>  		}
> +
> +		if (lpac_adreno_smmu && lpac_adreno_smmu->set_prr_bit) {
> +			iommu->prr_page =3D alloc_page(GFP_KERNEL | __GFP_ZERO);
> +			lpac_adreno_smmu->set_prr_addr(lpac_adreno_smmu->cookie,
> +						       page_to_phys(iommu->prr_page));
> +			lpac_adreno_smmu->set_prr_bit(lpac_adreno_smmu->cookie, true);
> +		}
>  	}
>  	mutex_unlock(&iommu->init_lock);

[Severity: High]
If both the primary SMMU and the LPAC SMMU have set_prr_bit, will this
second call to alloc_page() unconditionally overwrite iommu->prr_page
and leak the first page allocation?

[ ... ]

> @@ -646,6 +696,26 @@ static int msm_gpu_fault_handler(struct iommu_domain=
 *domain, struct device *dev
>  	return 0;
>  }
> =20
> +static int msm_lpac_fault_handler(struct iommu_domain *domain, struct de=
vice *dev,
> +		unsigned long iova, int flags, void *arg)
> +{
> +	struct msm_iommu *iommu =3D arg;
> +	struct adreno_smmu_priv *adreno_smmu =3D dev_get_drvdata(iommu->base.de=
v);
> +	struct adreno_smmu_fault_info info, *ptr =3D NULL;
> +
> +	if (adreno_smmu->get_fault_info) {
> +		adreno_smmu->get_fault_info(adreno_smmu->cookie, &info);
> +		ptr =3D &info;
> +	}

[Severity: Medium]
Does this fetch the fault information from the primary SMMU instead of the
LPAC SMMU?

Using iommu->base.lpac_dev instead of iommu->base.dev for dev_get_drvdata()
might be needed to read the correct hardware registers.

[ ... ]

> @@ -689,6 +769,11 @@ static int msm_iommu_map(struct msm_mmu *mmu, uint64=
_t iova,
>  	if (ret < 0)
>  		return ret;
> =20
> +	if (iommu->lpac_domain) {
> +		ret =3D iommu_map_sgtable(iommu->lpac_domain, iova, sgt, prot);
> +		WARN_ON(!ret);
> +	}
> +
>  	return (ret =3D=3D len) ? 0 : -EINVAL;
>  }

[Severity: High]
If iommu_map_sgtable() fails for the LPAC domain (e.g. returning a negative
error), does this error path leave stale mappings in the primary domain?

Since the function returns an error without an unmap rollback, the caller
might eventually free the underlying physical pages, potentially leaving a
dangling mapping in the primary domain.

[ ... ]

> @@ -753,6 +843,30 @@ struct msm_mmu *msm_iommu_new(struct device *dev, un=
signed long quirks)
>  		return ERR_PTR(ret);
>  	}
> =20
> +	if (lpac_dev) {
> +		if (!device_iommu_mapped(lpac_dev))
> +			return ERR_PTR(-ENODEV);

[Severity: High]
Can this early return cause a memory leak? It appears to bypass the cleanup
of the iommu struct and the main domain that were allocated earlier in this
function.

> +
> +		lpac_domain =3D iommu_paging_domain_alloc(lpac_dev);
> +		if (IS_ERR(lpac_domain))
> +			return ERR_CAST(lpac_domain);
> +
> +		iommu_set_pgtable_quirks(lpac_domain, quirks);
> +
> +		iommu->lpac_domain =3D lpac_domain;
> +		iommu->base.lpac_dev =3D lpac_dev;
> +	}
> +
> +	if (lpac_domain) {
> +		ret =3D iommu_attach_device(lpac_domain, lpac_dev);
> +		if (ret) {
> +			iommu_domain_free(domain);
> +			iommu_domain_free(lpac_domain);
> +			kfree(iommu);
> +			return ERR_PTR(ret);
> +		}
> +	}

[Severity: High]
If iommu_attach_device() fails for the LPAC domain, does this error path
forget to detach the primary domain?

The primary domain was successfully attached earlier in the function via
iommu_attach_device(iommu->domain, dev), so an iommu_detach_device() call
might be missing before returning.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D2
