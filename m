Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ACF1CAA78
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279665; cv=none; b=GfZbAuT0/IZ9k+kDGVW0eym32ZBrlMy6RQ6DjDfaY2ZSftIe+pHPBdcqdK8+4N+W8WuJkk28/zWy2GLUVXA8GNjpvI55eCw3P2zzEg+w+o3h+SoacA8ogUNeMuZNNRbBRMVNu09fkSaRINT/+vantxEDyUH/axKFJMVOA9QGdI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279665; c=relaxed/simple;
	bh=Nu98y5LRhsK6eOcfLB0OznryAI4feLJKewdB4oDMg9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QOgRGR1XugIEU7UHEmKGLJLt889xdwTESgMcLW73JavxR3osdRWZxXOBjllrcnGP9QfyrIt5bueC8qipNzEPZC9Bu9gZcTYqbBfqZ5V7Rghh50raG+Fan2T66NyH7ZIhyp2GrMpZzL+ryxR/sicntSGByCzT7JaGWSXABpEkHWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SZ9b63J3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SZ9b63J3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C601F000E9;
	Sun,  5 Jul 2026 19:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279664;
	bh=5l7TkDtDZByEM0gcU7gMKoUylmhIi3qx8UyaeY6blDY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SZ9b63J3z97mb+MI638PD2x3u0mzvRutsbi6cn40LFuI178Igoiu/R2jQnAyRKMj7
	 J3jDYoH45amMkruNgeH4wfELoKTJq16bGGuRqiezTBMaOK2tY/dnyb5S6HvBqWOfiC
	 ccMMibql9RLPrOzkRyt510XvuuT5FAHKAW3xHLcDfc0o5ESacVifS7gW4gNGnweFmJ
	 HROE2vzSZIDEjz7v8+4tMXlnwx5zM/9bVLlVhBhSn4Xiyc0InGhbeIETvb3RJ0DZLL
	 eDqtUTVq3aLARFGVjCyBY0gOvCaAMezYPnMC0SRbvuIeco9RdUrm0YeCDZgwxrGTey
	 GKJqvV52s+/Jg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 07/13] iommu: arm-smmu-qcom: Fixed mapping between
 sid and cb for gpu and lpac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-7-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-7-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:27:43 +0000
Message-Id: <20260705192743.E8C601F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The context bank allocation logic assigns Context Bank 1 instead o=
f Context Bank 0 to legacy unified GPU devices that declare both SID 0 and =
SID 1, breaking GPU hardware pagetable switching.
--

commit ae389e90eddaec7861c0838f081fce60156d8874
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac

This patch updates the context bank allocation logic for Adreno SMMU device=
s.
It introduces device identification functions and modifies the context bank
allocator to map context bank 0 to SID 0 and context bank 1 to SID 1.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index ae6152bddf8fe..e605a535f328f 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> @@ -225,6 +225,25 @@ static void qcom_adreno_smmu_set_prr_addr(const void=
 *cookie, phys_addr_t page_a
>  #define QCOM_ADRENO_SMMU_GPU_SID 0
>  #define QCOM_ADRENO_SMMU_LPAC_SID 1
> =20
> +static bool qcom_adreno_smmu_is_lpac_device(struct device *dev)
> +{
> +	struct iommu_fwspec *fwspec =3D dev_iommu_fwspec_get(dev);
> +	int i;
> +
> +	/*
> +	 * The GPU will always use SID 0 so that is a handy way to uniquely
> +	 * identify it and configure it for per-instance pagetables
> +	 */
> +	for (i =3D 0; i < fwspec->num_ids; i++) {
> +		u16 sid =3D FIELD_GET(ARM_SMMU_SMR_ID, fwspec->ids[i]);
> +
> +		if (sid =3D=3D QCOM_ADRENO_SMMU_LPAC_SID)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +

[ ... ]

> @@ -312,13 +331,12 @@ static int qcom_adreno_smmu_alloc_context_bank(stru=
ct arm_smmu_domain *smmu_doma
>  	 * switch pagetables
>  	 */
>  	if (qcom_adreno_smmu_is_gpu_device(dev)) {
> -		start =3D 0;
> -		count =3D 2;
> +		start =3D !!qcom_adreno_smmu_is_lpac_device(dev);
> +		count =3D start + 1;

[Severity: High]
Does this break context bank allocation for legacy unified GPU devices?

When probing older supported SoCs where a single unified primary GPU device
node declares both SID 0 and SID 1, qcom_adreno_smmu_is_lpac_device() will
return true because one of the SIDs matches QCOM_ADRENO_SMMU_LPAC_SID.

This calculates start =3D 1 and count =3D 2. The __arm_smmu_alloc_bitmap() =
call
will then search exclusively in the [1, 2) range and allocate Context Bank 1
for the primary GPU domain, completely skipping Context Bank 0.

Since the Adreno GPU hardware natively expects and hardcodes Context Bank 0
for its main pagetable switching via its internal APERTURE, allocating
Context Bank 1 instead of 0 violates hardware constraints. Will this result
in SMMU faults and a frozen GPU on those legacy platforms?

>  	} else {
>  		start =3D 2;
>  		count =3D smmu->num_context_banks;
>  	}
> -
>  	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D7
