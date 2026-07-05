Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A1351C10
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783279208; cv=none; b=l/Vx7zjCpwsoZBW+D8ZqsLOCZXTx6z7aasW2TJyAucZKniaOGoJjYwb3qavb8+psb116GsAA489d03/5Xj/qRxtCPcw6YdRT0moyfvssKha+MNwfre/b6VCIhE2/3bG6oG9xU/lCmm8ovrOPpU7tCFNsGVYvqF7y2ZfwlN5UOSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783279208; c=relaxed/simple;
	bh=9QvN6Bt+1pItVQDwnKLwaawp/uNKrCQMM+twnzFwTaU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=i6UJRrf/8qJvmFV4lLKyTjac31WKIcym6DB2tgt/fAGH6RtXDa0lz+hd28BaT/B7TGJ/0OGJivuZimR7FVKOSNZN466jm8rwBOJW4goLVEaxhfUOyLFL6h4jhcVFQUsWdaY6rpg2TnFZGD+lnHjbe/03nyCUXz/8rvK6RKx/hhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dKpG5/8S; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dKpG5/8S"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550061F000E9;
	Sun,  5 Jul 2026 19:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783279207;
	bh=3UJ2d4NB5D18M+zJ5mvL/oJq4oEJhXCXwxPjzVJzNnA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dKpG5/8SbdEQngc0V6C7oYmCOv6zAPKyPn/J2YMMGh5u8RvvpfkGuganl0RoU6HCg
	 JNEQQvNoKM7MpWPfn0slbfLyZS0dMGN/H3AbUPAHDAWPLopiygWvsvCRyU4AQTbjrj
	 ew5oSNznyJW3epxuDDtfwtsIk0LLntv+fwSryT7j2dthf9pd4gLiMagcnS/xAnvYS2
	 ma1DbfKsiBk5I5XTRHsVcZiTR9Z85EpdnuOIFwdgNxxBH3x5Mba8jyDZafv1eBTHlI
	 QBO0NDn62f6seIWoXmbPo4Xk7kD71JS9J47mM+2qzu3FA7hLyNSzbH00l3Py66asWo
	 UxQCUmD7+W9cw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 05/13] firmware: qcom: scm: Configure LPAC aperture
Reply-To: sashiko-reviews@lists.linux.dev
To: "Anna Maniscalco" <anna.maniscalco2000@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260705-descriptive-name-lpac-upstream-v1-5-01d50c3e0c99@gmail.com>
References: <20260705-descriptive-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com>
 <20260705-descriptive-name-lpac-upstream-v1-5-01d50c3e0c99@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:20:05 +0000
Message-Id: <20260705192006.550061F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unconditional SCM call for LPAC aperture configuration on hardware=
 that does not support it.
- [Medium] Unused mask macro `QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK` and miss=
ing `FIELD_PREP` bounds masking in `qcom_scm_set_gpu_smmu_lpac_aperture`.
--

commit 25a397c9a4153cea4348b027438df84a69f95cee
Author: Anna Maniscalco <anna.maniscalco2000@gmail.com>

firmware: qcom: scm: Configure LPAC aperture

In order to be able to update the SMMU registers from CP for page table
updates we need to configure the LPAC aperture to include the context
bank that will be associated with SID 1.

> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qco=
m_scm.c
> index 9b06a69d3a6d7..92093399f20d9 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -1204,6 +1204,7 @@ int qcom_scm_restore_sec_cfg(u32 device_id, u32 spa=
re)
>  EXPORT_SYMBOL_GPL(qcom_scm_restore_sec_cfg);
> =20
>  #define QCOM_SCM_CP_APERTURE_CONTEXT_MASK	GENMASK(7, 0)
> +#define QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK	GENMASK(7, 1)

[Severity: Medium]
This isn't a bug, but QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK is defined here
but left unused. Also, is GENMASK(7, 1) correct, or should it be
GENMASK(7, 0) like the CP mask above?

[ ... ]

> @@ -1229,6 +1230,23 @@ int qcom_scm_set_gpu_smmu_aperture(unsigned int co=
ntext_bank)
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_aperture);
> =20
> +int qcom_scm_set_gpu_smmu_lpac_aperture(unsigned int context_bank)
> +{
> +	struct qcom_scm_desc desc =3D {
> +		.svc =3D QCOM_SCM_SVC_MP,
> +		.cmd =3D QCOM_SCM_MP_CP_SMMU_APERTURE_ID,
> +		.arginfo =3D QCOM_SCM_ARGS(4),
> +		.args[0] =3D 0xffff0000 | (1 << 8 | context_bank),

[Severity: Medium]
Should this use FIELD_PREP() with the QCOM_SCM_LPAC_APERTURE_CONTEXT_MASK
defined above?

Directly ORing context_bank bypasses bounds checking, which could
potentially allow an out-of-bounds context_bank to corrupt adjacent bits
like the LPAC bit (1 << 8).

> +		.args[1] =3D 0xffffffff,
> +		.args[2] =3D 0xffffffff,
> +		.args[3] =3D 0xffffffff,
> +		.owner =3D ARM_SMCCC_OWNER_SIP
> +	};
> +
> +	return qcom_scm_call(__scm->dev, &desc, NULL);
> +}
> +EXPORT_SYMBOL_GPL(qcom_scm_set_gpu_smmu_lpac_aperture);

[ ... ]

> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 71ce4cbbf27ae..be374cf209f4f 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -668,6 +668,9 @@ int adreno_hw_init(struct msm_gpu *gpu)
>  		ret =3D qcom_scm_set_gpu_smmu_aperture(0);
>  		if (ret)
>  			DRM_DEV_ERROR(gpu->dev->dev, "unable to set SMMU aperture: %d\n", ret=
);
> +		ret =3D qcom_scm_set_gpu_smmu_lpac_aperture(1);
> +		if (ret)
> +			DRM_DEV_ERROR(gpu->dev->dev, "unable to set lpac SMMU aperture: %d\n"=
, ret);

[Severity: High]
Does this unconditionally call qcom_scm_set_gpu_smmu_lpac_aperture() on
hardware that might not support LPAC?

The outer condition only checks qcom_scm_set_gpu_smmu_aperture_is_available=
()
which verifies the existence of QCOM_SCM_MP_CP_SMMU_APERTURE_ID. Older
ADRENO_6XX_GEN1+ devices support this command for the CP aperture, but
may not support LPAC.

If older firmware rejects the LPAC command, could it cause boot failures or
log errors on every boot and resume?

Alternatively, if the older firmware doesn't validate bit 8 and simply
masks the lower 8 bits, could it silently overwrite the primary CP aperture
context bank from 0 to 1, causing SMMU translation faults and rendering the
GPU unusable?

Should this be conditionally guarded by checking if LPAC is available,
such as checking if gpu->lpac_pdev is non-NULL?

>  	}
> =20
>  	for (int i =3D 0; i < gpu->nr_rings; i++) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260705-descriptiv=
e-name-lpac-upstream-v1-0-01d50c3e0c99@gmail.com?part=3D5
