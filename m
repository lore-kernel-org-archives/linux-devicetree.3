Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793283216;
	b=b+UzeZHTUYEjtxsC8ibhbMzsCltRtl/145H0bmSrcy+PFCoqwWjbd2fooVJATFDWaED6
	 C9L6L2MYv9djva7ONVaGmRWNvsgnwb/f0nWaSq1ycQf422fJjFcGPTKthadenoxjDnhWg
	 TlZ1Srb0J47ugeVHl5nzUuTUT8qA4wDOcWxWVjAb+I9e+ANoDpWeh5fD4G6O3zaye5/xv
	 2t+zy+0nrcCR5ccu3bUx4eki9WyxVWdzc3Obx86jNxfAGT5BMMwPDAx3gtFJtgEWAiunl
	 b9bi4gul8mxmnr5UH06Gaxw3I0h1MHMvYeAmcGKfF6BHcv1JsrOJbHHAqCXDaqSJtaQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793283216;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=+pE9WiVmUOYqW50PCKiS/ra/HVGFNnSngvzlVshgGrA=;
	b=M0xTEy+FXspbsLknCkd3Am0C8NlcGftN+vXY5RAOUsfFslH32I3pl9sRmsrbkjI4tGAr
	 xONH/4yy99xcKv0Fx/lJ4YXHVwLQhIVCSI7fcNWAi56HczH3IazrzZogrGyg2QUE4c9kT
	 aqIVl0LPC5yVh5eHhyc++KZS89FFt8vQUzuVJNppuTrgiYg5ZoS3qzYLMbMbtI8WLbXBB
	 wN5O0/zoMPhB3/NQygKRN2oRLIDwG1bP2IcVa/7XeW1Abhot0erpuI46b6Hecq/oXPWLn
	 FjF/pdzbKgwIbSVsidcsHKQl23arGf7YjDg/aVMumMWuRgSNQ8jzueGpyLik38KMLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1i6nC60;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4DB8606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 14:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P1i6nC60
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4BC1F01828;
	Thu, 29 Oct 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793283215;
	bh=+pE9WiVmUOYqW50PCKiS/ra/HVGFNnSngvzlVshgGrA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=P1i6nC60DxADynjhMVLnkCFwX/ExF3rCfE7UVU8GHzCkzsRwr+2hFlbgOjDb+PV7N
	 vT6AGp6S654xehJSDyDGSwMofg04FVzYwXRpMb64iFa2JQ0qoKh0nhiqL2RxE7oVx+
	 7ksDo/iPcjBv3EAETAJeoiApCFPAHy0xb3+Tn+VKvNWb4sGMFCzbcI+nGkjYLIYz3r
	 8kmaWgeIQDcHl/F32dudUTpSOSm6JAduPn311MwLnTeOTYtfpXl7xYGKs3kGYEsX+u
	 r1xO0xaZCwT4rYyRSOTpUmq5GNlmlosHgsILsZRVeV93w+EhWGKR9f1aLbWH9CjmED
	 sKkVoeEIjIeIw==
Message-ID: <sashiko-outbox-189487@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC v2 07/14] iommu: arm-smmu-qcom: Fixed mapping
 between sid and cb for gpu and lpac
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
References: <20261029-descriptive-name-lpac-upstream-v2-0-a21a5c850961@gmail.com>
 <20261029-descriptive-name-lpac-upstream-v2-7-a21a5c850961@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 14:13:34 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iommu/arm-smmu-qcom: unconditional CB 1 reservation for LPAC shift=
s GMU CB
--

commit 51e5e8227679664f11df23a51921048a054a1310
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

iommu: arm-smmu-qcom: Fixed mapping between sid and cb for gpu and lpac

This commit splits context bank allocation and initialization in
arm-smmu-qcom so that the gpu device (stream id 0) is assigned context bank=
 0
and the lpac device (stream id 1) is assigned context bank 1, while other
devices start allocation from context bank 2.

> diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/a=
rm/arm-smmu/arm-smmu-qcom.c
> index ae6152bddf8fe..9413b748e79d1 100644
> --- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
> +++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c

[ ... ]

> @@ -313,12 +330,14 @@ static int qcom_adreno_smmu_alloc_context_bank(stru=
ct arm_smmu_domain *smmu_doma
>  	 */
>  	if (qcom_adreno_smmu_is_gpu_device(dev)) {
>  		start =3D 0;
> -		count =3D 2;
> +		count =3D start + 1;
> +	} else if (qcom_adreno_smmu_is_lpac_device(dev)) {
> +		start =3D 1;
> +		count =3D start + 1;
>  	} else {
>  		start =3D 2;
>  		count =3D smmu->num_context_banks;
>  	}
> -
>  	return __arm_smmu_alloc_bitmap(smmu->context_map, start, count);
>  }

[Severity: High]
Does unconditionally reserving context bank 1 for a separate lpac device and
forcing all other devices into the else branch with start =3D 2 cause a
regression on platforms without a separate qcom,lpac device node?

In drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c,
qcom_adreno_smmu_alloc_context_bank() now assigns only context bank 0 when
qcom_adreno_smmu_is_gpu_device(dev) is true, reserves context bank 1 for a
separate device matching qcom_adreno_smmu_is_lpac_device(dev), and starts a=
ll
other allocations at context bank 2.

On platforms that do not have stream id 1 (such as sdm845, sc7180, sm8150, =
and
sm8250), or on platforms where both stream id 0 and stream id 1 are listed =
on
the main gpu node rather than a separate qcom,lpac child node (such as
sc8280xp, sm8350, sc7280, sm8450, sm8550, x1e80100, or sm8650 with an older
device tree), the main gpu device matches qcom_adreno_smmu_is_gpu_device(de=
v)
first and allocates context bank 0, leaving context bank 1 unallocated.

When a6xx_gmu_memory_probe() -> msm_iommu_new() -> iommu_attach_device() ->
arm_smmu_init_domain_context() -> qcom_adreno_smmu_alloc_context_bank()
subsequently allocates a context bank for the qcom,adreno-gmu device (stream
id 5), it falls into the else branch with start =3D 2 and receives cbndx =
=3D 2
instead of cbndx =3D 1. As noted in commit afc95681c306 ("iommu/arm-smmu-qc=
om:
Add missing GMU entry to match table"), having the gmu on cbndx =3D 2 inste=
ad of
cbndx =3D 1 on sc8280xp causes the smmu to wedge on gpu translation faults.

In addition, on platforms with only two context banks available to Linux,
such as qcom,sdm630-smmu-v2:

drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c:qcom_adreno_smmuv2_cfg_probe() {
	/* TZ protects several last context banks, hide them from Linux */
	if (of_device_is_compatible(smmu->dev->of_node, "qcom,sdm630-smmu-v2") &&
	    smmu->num_context_banks =3D=3D 5)
		smmu->num_context_banks =3D 2;
}

entering the else branch passes start =3D 2 and count =3D 2 to
__arm_smmu_alloc_bitmap(), which immediately fails even though context bank=
 1
is free:

drivers/iommu/arm/arm-smmu/arm-smmu.h:__arm_smmu_alloc_bitmap() {
	do {
		idx =3D find_next_zero_bit(map, end, start);
		if (idx =3D=3D end)
			return -ENOSPC;
	} while (test_and_set_bit(idx, map));
}

Could context bank 1 only be reserved when a separate lpac device is actual=
ly
present, or should the else branch still allow allocating from context bank=
 1
when lpac is not used?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029-descriptiv=
e-name-lpac-upstream-v2-0-a21a5c850961@gmail.com?part=3D7
